[CmdletBinding()]
param(
    [ValidateRange(0, [int]::MaxValue)]
    [int]$N
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

if ($MyInvocation.InvocationName -ne '.') {
    if (-not $PSBoundParameters.ContainsKey('N')) {
        throw 'The N parameter is required.'
    }

    Write-Output "Fibonacci($N) = $(Get-Fibonacci -N $N)"
}
