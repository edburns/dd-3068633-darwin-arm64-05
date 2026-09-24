## Campaign context and required reading

On the `experiment/shepherd-control` branch, the directory `1-math-control-remove-before-merge` contains the plan (`math-tool-ignorance-reduction-plan.md`) and supporting resources (diagrams, decision records). Spike subdirectories are research artifacts — read the plan's Resolution sections for findings, not the spike source code.

Before changing code, read the entire plan. Then carefully re-read these exact sections:

- `## Ignorance reduction`
- `### Repository-owned validation`
- `### Output and ordering contracts`
- `## Implementation`
- `### 1. Implement Fibonacci with unit and isolated CLI coverage`
- `### 2. Add factorial and operation dispatch`

The resolved acceptance environment is the committed command `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`. The repository workflow `.github/workflows/shepherd-task-math-tool.yml` installs exactly Pester 5.7.1 and invokes that repository-owned runner; do not replace, bypass, or weaken either mechanism.

The resolved behavior and ordering contract is:

- Direct CLI execution writes exactly one result line to stdout: `Fibonacci(N) = value` or `Factorial(N) = value`, matching the selected operation.
- Functions return only their numeric value, with no incidental pipeline or host output.
- Inputs are non-negative integers.
- Task 2 starts from the merged task-1 implementation and preserves its Fibonacci behavior.
- The production and test files remain repository-root `math-tool.ps1` and `math-tool.Tests.ps1`.

No separate spike-specific implementation finding is recorded in the plan. Implement from the resolutions and production repository conventions; do not read, copy, or adapt spike source code.

## Branch and execution order

Base all work on `experiment/shepherd-control` from remote `origin`, and target the pull request to that branch.

This is implementation task 2 of 2. Tasks are assigned, completed, and merged serially in plan order. Do not begin until this issue is assigned and task 1 has been merged into `experiment/shepherd-control`; begin from that merged state rather than reimplementing task 1.

Leave campaign planning and prompt artifacts unchanged.

## Implement

Extend the existing task-1 `math-tool.ps1` and `math-tool.Tests.ps1`; do not replace their established Fibonacci contract.

In `math-tool.ps1`:

- Add a pure `Get-Factorial` function for non-negative integer inputs. It must return only the numeric factorial value.
- Return `1` for both factorial edge cases `N=0` and `N=1`, and compute the correct value for representative larger small integers.
- Add an `Operation` parameter that dispatches between `fibonacci` and `factorial` while retaining the existing `N` parameter.
- Preserve the task-1 Fibonacci CLI behavior, including existing Fibonacci invocation compatibility and the exact `Fibonacci(N) = value` stdout format.
- For factorial CLI execution, write exactly one stdout line formatted as `Factorial(N) = value`.
- Keep dot-sourcing suitable for unit tests: loading the file to call either function must not emit a direct-CLI result line.
- Constrain dispatch to the two operations required by the plan using clear PowerShell parameter validation or equally explicit behavior; do not silently treat an unknown operation as a valid one.

Extend `math-tool.Tests.ps1` with production-focused Pester 5.7.1 coverage:

- Dot-sourced unit tests for `Get-Factorial` at `N=0`, `N=1`, and at least one representative small value.
- Isolated child-`pwsh` process tests for factorial dispatch that assert successful exit and exact single-line stdout.
- Regression tests for the previously merged Fibonacci unit and direct-CLI behavior after operation dispatch is added.
- Dispatch tests that distinguish Fibonacci from factorial for an input whose results differ, so swapped or ignored operation selection cannot pass.
- Assertions strict enough to fail on incidental function output, debug messages, extra blank/output lines, or duplicate numeric output.

Keep the interface and tests objective and small. Invoke the repository-root production script in CLI tests; do not reproduce either algorithm in test-only code.

## Completion gates

- `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1` exits zero for the combined regression suite.
- Factorial unit tests prove numeric-only results for 0, 1, and a representative small input.
- Isolated child-process tests prove factorial dispatch exits zero and emits exactly one correctly formatted `Factorial(N) = value` line.
- Existing Fibonacci unit and CLI tests continue to pass unchanged in observable behavior.
- A discriminating dispatch test proves both operation paths select the correct algorithm.
- The pinned pull-request workflow passes with Pester 5.7.1.
- The pull request targets `experiment/shepherd-control`.

## Out of scope

- Rewriting or weakening the task-1 Fibonacci contract and coverage.
- Replacing the repository-owned runner, changing the pinned Pester version, or bypassing the existing workflow.
- Operations other than Fibonacci and factorial, generalized command frameworks, UI, persistence, networking, or unrelated refactors.
- Copying or adapting any spike implementation or test helper.
