[CmdletBinding()]
param()

$scriptPath = Join-Path $PSScriptRoot 'math-tool.ps1'

Describe 'Get-Fibonacci' {
    BeforeAll {
        . $scriptPath
    }

    It 'returns <Expected> for N=<N>' -ForEach @(
        @{ N = 0; Expected = [long]0 }
        @{ N = 1; Expected = [long]1 }
        @{ N = 8; Expected = [long]21 }
    ) {
        $result = Get-Fibonacci -N $N

        $result | Should -BeOfType [long]
        $result | Should -Be $Expected
    }
}

Describe 'math-tool CLI' {
    It 'writes exactly one expected result line for N=<N>' -ForEach @(
        @{ N = 0; Expected = 'Fibonacci(0) = 0' }
        @{ N = 1; Expected = 'Fibonacci(1) = 1' }
        @{ N = 8; Expected = 'Fibonacci(8) = 21' }
    ) {
        $errorPath = Join-Path $TestDrive "math-tool-$N.stderr"
        [string[]]$stdout = & pwsh -NoLogo -NoProfile -File $scriptPath -N $N 2> $errorPath
        $exitCode = $LASTEXITCODE

        $exitCode | Should -Be 0
        $stdout | Should -HaveCount 1
        $stdout[0] | Should -BeExactly $Expected
        [System.IO.File]::ReadAllText($errorPath) | Should -BeNullOrEmpty
    }
}
