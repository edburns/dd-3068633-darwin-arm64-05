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

    [long]$previous = 0
    [long]$current = 1

    for ($index = 2; $index -le $N; $index++) {
        [long]$next = $previous + $current
        $previous = $current
        $current = $next
    }

    if ($N -eq 0) {
        return $previous
    }

    return $current
}

if ($MyInvocation.InvocationName -ne '.') {
    Write-Output "Fibonacci($N) = $(Get-Fibonacci -N $N)"
}
