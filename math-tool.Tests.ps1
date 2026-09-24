[CmdletBinding()]
param()

Describe 'Get-Fibonacci' {
    BeforeAll {
        . (Join-Path $PSScriptRoot 'math-tool.ps1')
    }

    It 'returns <Expected> for N=<N>' -ForEach @(
        @{ N = 0; Expected = [bigint]0 }
        @{ N = 1; Expected = [bigint]1 }
        @{ N = 8; Expected = [bigint]21 }
    ) {
        $result = @(Get-Fibonacci -N $N)

        $result | Should -HaveCount 1
        $result[0] | Should -BeOfType [bigint]
        $result[0] | Should -Be $Expected
    }
}

Describe 'Get-Factorial' {
    BeforeAll {
        . (Join-Path $PSScriptRoot 'math-tool.ps1')
    }

    It 'returns <Expected> for N=<N>' -ForEach @(
        @{ N = 0; Expected = [bigint]1 }
        @{ N = 1; Expected = [bigint]1 }
        @{ N = 5; Expected = [bigint]120 }
    ) {
        $result = @(Get-Factorial -N $N)

        $result | Should -HaveCount 1
        $result[0] | Should -BeOfType [bigint]
        $result[0] | Should -Be $Expected
    }
}

Describe 'math-tool CLI' {
    It 'preserves Fibonacci output compatibility for N=<N>' -ForEach @(
        @{ N = 0; Expected = 'Fibonacci(0) = 0' }
        @{ N = 1; Expected = 'Fibonacci(1) = 1' }
        @{ N = 8; Expected = 'Fibonacci(8) = 21' }
    ) {
        $errorPath = Join-Path $TestDrive "math-tool-$N.stderr"
        [string[]]$stdout = & pwsh -NoLogo -NoProfile -File (Join-Path $PSScriptRoot 'math-tool.ps1') -N $N 2> $errorPath
        $exitCode = $LASTEXITCODE

        $exitCode | Should -Be 0
        $stdout | Should -HaveCount 1
        $stdout[0] | Should -BeExactly $Expected
        [System.IO.File]::ReadAllText($errorPath) | Should -BeNullOrEmpty
    }

    It 'preserves positional Fibonacci invocation compatibility' {
        $errorPath = Join-Path $TestDrive 'math-tool-positional.stderr'
        [string[]]$stdout = & pwsh -NoLogo -NoProfile -File (Join-Path $PSScriptRoot 'math-tool.ps1') 8 2> $errorPath
        $exitCode = $LASTEXITCODE

        $exitCode | Should -Be 0
        $stdout | Should -HaveCount 1
        $stdout[0] | Should -BeExactly 'Fibonacci(8) = 21'
        [System.IO.File]::ReadAllText($errorPath) | Should -BeNullOrEmpty
    }

    It 'writes exactly one expected factorial result line for N=<N>' -ForEach @(
        @{ N = 0; Expected = 'Factorial(0) = 1' }
        @{ N = 1; Expected = 'Factorial(1) = 1' }
        @{ N = 5; Expected = 'Factorial(5) = 120' }
    ) {
        $errorPath = Join-Path $TestDrive "math-tool-factorial-$N.stderr"
        [string[]]$stdout = & pwsh -NoLogo -NoProfile -File (Join-Path $PSScriptRoot 'math-tool.ps1') -Operation factorial -N $N 2> $errorPath
        $exitCode = $LASTEXITCODE

        $exitCode | Should -Be 0
        $stdout | Should -HaveCount 1
        $stdout[0] | Should -BeExactly $Expected
        [System.IO.File]::ReadAllText($errorPath) | Should -BeNullOrEmpty
    }

    It 'dispatches Fibonacci and factorial distinctly for the same input' {
        $scriptPath = Join-Path $PSScriptRoot 'math-tool.ps1'
        $fibonacciErrorPath = Join-Path $TestDrive 'math-tool-fibonacci-dispatch.stderr'
        $factorialErrorPath = Join-Path $TestDrive 'math-tool-factorial-dispatch.stderr'

        [string[]]$fibonacciStdout = & pwsh -NoLogo -NoProfile -File $scriptPath -Operation fibonacci -N 3 2> $fibonacciErrorPath
        $fibonacciExitCode = $LASTEXITCODE
        [string[]]$factorialStdout = & pwsh -NoLogo -NoProfile -File $scriptPath -Operation factorial -N 3 2> $factorialErrorPath
        $factorialExitCode = $LASTEXITCODE

        $fibonacciExitCode | Should -Be 0
        $fibonacciStdout | Should -HaveCount 1
        $fibonacciStdout[0] | Should -BeExactly 'Fibonacci(3) = 2'
        [System.IO.File]::ReadAllText($fibonacciErrorPath) | Should -BeNullOrEmpty

        $factorialExitCode | Should -Be 0
        $factorialStdout | Should -HaveCount 1
        $factorialStdout[0] | Should -BeExactly 'Factorial(3) = 6'
        [System.IO.File]::ReadAllText($factorialErrorPath) | Should -BeNullOrEmpty
    }

    It 'rejects unsupported operations through parameter validation' {
        $errorPath = Join-Path $TestDrive 'math-tool-unknown-operation.stderr'
        [string[]]$stdout = & pwsh -NoLogo -NoProfile -File (Join-Path $PSScriptRoot 'math-tool.ps1') -Operation unknown -N 3 2> $errorPath
        $exitCode = $LASTEXITCODE

        $exitCode | Should -Not -Be 0
        $stdout | Should -BeNullOrEmpty
        [System.IO.File]::ReadAllText($errorPath) | Should -Not -BeNullOrEmpty
    }
}
