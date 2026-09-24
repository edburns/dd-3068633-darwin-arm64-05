## Campaign context and required reading

On the `experiment/shepherd-control` branch, the directory `1-math-control-remove-before-merge` contains the plan (`math-tool-ignorance-reduction-plan.md`) and supporting resources (diagrams, decision records). Spike subdirectories are research artifacts — read the plan's Resolution sections for findings, not the spike source code.

Before changing code, read the entire plan. Then carefully re-read these exact sections:

- `## Ignorance reduction`
- `### Repository-owned validation`
- `### Output and ordering contracts`
- `## Implementation`
- `### 1. Implement Fibonacci with unit and isolated CLI coverage`

The resolved acceptance environment is the committed command `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`. The repository workflow `.github/workflows/shepherd-task-math-tool.yml` installs exactly Pester 5.7.1 and invokes that repository-owned runner; do not replace, bypass, or weaken either mechanism.

The resolved behavior contract is:

- Direct CLI execution writes exactly one result line to stdout in the form `Fibonacci(N) = value`.
- `Get-Fibonacci` returns only the numeric value, with no incidental pipeline or host output.
- Inputs are non-negative integers.
- The production and test files are repository-root `math-tool.ps1` and `math-tool.Tests.ps1`.

No separate spike-specific implementation finding is recorded in the plan. Implement from the resolutions and production repository conventions; do not read, copy, or adapt spike source code.

## Branch and execution order

Base all work on `experiment/shepherd-control` from remote `origin`, and target the pull request to that branch.

This is implementation task 1 of 2. Tasks are assigned, completed, and merged serially in plan order. Do not begin until this issue is assigned. Task 2 must not begin until this task is merged.

Leave campaign planning and prompt artifacts unchanged.

## Implement

Create `math-tool.ps1` and `math-tool.Tests.ps1` together.

In `math-tool.ps1`:

- Declare a script parameter named `N` that accepts the non-negative integer input required by the plan.
- Implement a pure `Get-Fibonacci` function. Its observable function output must be the numeric Fibonacci value and nothing else.
- Support the edge cases `N=0` and `N=1` and a representative larger small integer.
- When the file is run directly as a CLI, write exactly one stdout line formatted as `Fibonacci(N) = value`, substituting the input and result.
- Keep dot-sourcing suitable for unit tests: loading the file to call the function must not emit the direct-CLI result line.

In `math-tool.Tests.ps1`, use production code and Pester 5.7.1 to add:

- Dot-sourced unit coverage for `Get-Fibonacci` at `N=0`, `N=1`, and at least one representative small value.
- Isolated child-`pwsh` process coverage for direct invocation of `math-tool.ps1` at the same contract boundaries.
- Assertions that child-process stdout is exactly the required single line and that the process exits successfully.
- Assertions strict enough to fail on labels, debug messages, extra blank/output lines, or a numeric result emitted in addition to the formatted CLI line.

Use an objective, small implementation. The tests must invoke the repository-root production script and must not recreate the Fibonacci algorithm as a second implementation.

## Completion gates

- `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1` exits zero using the committed runner.
- Unit tests prove `Get-Fibonacci` returns numeric values for 0, 1, and a representative small input without incidental output.
- Isolated child-process tests prove direct execution exits zero and emits exactly one correctly formatted stdout line.
- `math-tool.ps1` and `math-tool.Tests.ps1` are introduced together.
- The pinned pull-request workflow passes with Pester 5.7.1.
- The pull request targets `experiment/shepherd-control` and contains no assignment or work for task 2.

## Out of scope

- Factorial support, an `Operation` parameter, or operation dispatch; those belong to task 2.
- Replacing the repository-owned runner, changing the pinned Pester version, or bypassing the existing workflow.
- Adding modules, packages, UI, persistence, networking, generalized math operations, or unrelated refactors.
- Copying or adapting any spike implementation or test helper.
