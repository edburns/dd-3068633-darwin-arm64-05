[CmdletBinding()]
param(
    [ValidateRange(0, [int]::MaxValue)]
    [int]$N,

    [ValidateSet('fibonacci', 'factorial')]
    [string]$Operation = 'fibonacci'
)

Set-StrictMode -Version Latest

function Get-Fibonacci {
    [CmdletBinding()]
    param(
        [ValidateRange(0, [int]::MaxValue)]
        [int]$N
    )

    [bigint]$previous = 0
    [bigint]$current = 1

    for ($index = 2; $index -le $N; $index++) {
        [bigint]$next = $previous + $current
        $previous = $current
        $current = $next
    }

    if ($N -eq 0) {
        return $previous
    }

    return $current
}

function Get-Factorial {
    [CmdletBinding()]
    param(
        [ValidateRange(0, [int]::MaxValue)]
        [int]$N
    )

    [bigint]$result = 1
    for ($factor = 2; $factor -le $N; $factor++) {
        $result *= $factor
    }

    return $result
}

if ($MyInvocation.InvocationName -ne '.') {
    if (-not $PSBoundParameters.ContainsKey('N')) {
        throw 'The N parameter is required.'
    }

    switch ($Operation) {
        'fibonacci' {
            Write-Output "Fibonacci($N) = $(Get-Fibonacci -N $N)"
        }
        'factorial' {
            Write-Output "Factorial($N) = $(Get-Factorial -N $N)"
        }
        default {
            throw "Unsupported operation: $Operation"
        }
    }
}
