# Copilot CLI Session

> [!NOTE]
> - **Session ID:** `5305e5a7-e7ba-4a63-aa5a-29b08210051d`  
> - **Started:** 9/24/2026, 4:38:38 PM  
> - **Duration:** 2m 3s  
> - **Exported:** 9/24/2026, 4:40:41 PM  

---

<sub>4s</sub>

### User

Invoke skill `shepherd-task-20-create-issues-from-plan` with these inputs:

- CAMPAIGN_ID: c6942015-9929-4e71-8cdb-3fd61f5639e9
- LESSON_PROPAGATION: off
- REPO: edburns/dd-3068633-darwin-arm64-05
- BASE_BRANCH: experiment/shepherd-control
- PARENT_ISSUE: 1
- PLAN_DIRECTORY: 1-math-control-remove-before-merge
- PLAN_FILE_NAME: math-tool-ignorance-reduction-plan.md
- QUESTIONS_SECTION: ## Ignorance reduction
- IMPLEMENTATION_SECTION: ## Implementation
- EXPECTED_TASK_COUNT: 2
- BASE_REMOTE: origin
- LOG_DIRECTORY: /Users/edburns/workareas/dd-3068633-darwin-arm64-05-shepherd-control/1-math-control-remove-before-merge/prompts/shepherd-task-20-20260924-1638
- DRAFT_VALIDATOR: /Users/edburns/.copilot/plugins/shepherd-task/scripts/validate-stage20-drafts.sh
- ISSUE_BODY_VERIFIER: /Users/edburns/.copilot/plugins/shepherd-task/scripts/verify-github-issue-body.sh
- CHILD_LINK_VERIFIER: /Users/edburns/.copilot/plugins/shepherd-task/scripts/verify-stage20-child-links.sh

Fixture pagination response contract (mandatory):

- `gh api ... --paginate --slurp` returns a JSON array of page payloads, so a
  one-page response has the shape `[[{...}]]`, not `[{...}]`.
- Before indexing child issue fields such as `.id`, normalize the response to
  one flat issue array exactly once.
- In Bash, use:
  `jq 'if length == 0 then [] elif all(.[]; type == "array") then add else . end'`.
- In PowerShell, capture the `gh` output and `$LASTEXITCODE` first, then pass
  the complete JSON through the same `jq` normalization before
  `ConvertFrom-Json`.
- Use the normalized flat array for the pre-creation baseline, final child
  count/order checks, and failure reconciliation. Do not apply `add` a second
  time to an already-flat array.

---

<sub>8s</sub>

### `skill`

**shepherd-task-20-create-issues-from-plan**

<details>
<summary>Arguments</summary>

```json
{
  "skill": "shepherd-task-20-create-issues-from-plan"
}
```

</details>

```
Skill "shepherd-task-20-create-issues-from-plan" loaded successfully. Follow the instructions in the skill context.
```


---

<sub>13s</sub>

### Copilot

I’ll validate the campaign inputs, inspect the complete plan and issue-writing examples, then draft and validate both issue bodies before making any GitHub mutation.

---

<sub>23s</sub>

### `view`

**view the file at /Users/edburns/.copilot/skills/shepherd-task-20-create-issues-from-plan/examples/01-1682-java-tool-ergonomics.md.**

/Users/edburns/.copilot/skills/shepherd-task-20-create-issues-from-plan/examples/01-1682-java-tool-ergonomics.md

<details>
<summary>15 lines</summary>

```
# Example 01: 1682-java-tool-ergonomics-prompts-remove-before-merge

Read `copilot-sdk/1682-java-tool-ergonomics-prompts-remove-before-merge/dd-3018003-ignorance-reduction-for-implementation-plan.md` (the plan) to get the context.

✅✅Pay very close attention to each **Resolution:** to the questions in `Phase 3 — Ignorance reduction: questions to answer before writing code`.

In this session, we are creating issues of type **Task** as children of Epic https://github.com/github/copilot-sdk/issues/1682 . These issues correspond to the sub-sections in `## Phase 4 — Implementation (the build order)`.

I want you to use `gh` to create issues as sub-issues of 1682.

- I will dispatch these issues by assigning them to an agent. Leave them unassigned for now.

- The description you put in the issues you create is the specification for the work the agent assigned to the issue must do. Therefore, you need to be very specific and targeted when writing the description.

- Set the type to **Task**.

- Each issue will be worked on and resolved in serial. You can assume:
  - All issues will operate in this topic branch of `upstream`: `edburns/1682-java-tool-ergonomics`.

  - The assignee agent has access to the topic branch and, most importantly, to the prompts in the directory `1682-java-tool-ergonomics-prompts-remove-before-merge`, which includes the plan. Therefore, you can instruct the agent to access the plan by reference, you don't need to reference it by value directly in the issue.

- The sub-sections of `## Phase 4 — Implementation (the build order)` have essential details for each corresponding **Task**.

- Instruct the agent to read the entire plan before working.

- Instruct the agent to carefully re-read the relevant sections of the plan. ❌❌You can't just say, "read the relevant sections of the plan". ✅✅In the description of the issue, list exactly what sections of the plan apply to this particular issue.
- Though the sub-sections of `## Phase 4 — Implementation (the build order)` have essential details for each corresponding **Task**, I want you to carefully consider if there are additional gating tests you can add so that as the agent proceeds from one task to the next, the likelihood of rework is reduced.
```

</details>


---

<sub>23s</sub>

### `view`

**view the file at /Users/edburns/.copilot/skills/shepherd-task-20-create-issues-from-plan/examples/02-1810-java-tool-as-lambda.md.**

/Users/edburns/.copilot/skills/shepherd-task-20-create-issues-from-plan/examples/02-1810-java-tool-as-lambda.md

<details>
<summary>12 lines</summary>

```
# Example 02: 1810-java-tool-ergonomics-tool-as-lambda-remove-before-merge

Carefully read the plan `copilot-sdk/1810-java-tool-ergonomics-tool-as-lambda-remove-before-merge/1810-ignorance-reduction-for-implementation-plan.md`.

We have completed Phases 1 - 3. We are now on Phase 4.

For each sub item in Phase 4, file a child issue of Feature #1810.

Use `gh` to look at Epic #1682 and its child issues for the standard of verbosity and concreteness for issue descriptions.

The issue should be assignable to a coding agent and there must be sufficient detail in the description for the agent to proceed to completion.

Pull out the specific relevant content from Phase 3 as it applies to this current issue in Phase 4.

Tell the agent to take `edburns/1810-java-tool-ergonomics-tool-as-lambda` as the base branch. When I assign the issue to the coding agent, I will set this as the base branch.

Tell the agent to read `1810-java-tool-ergonomics-tool-as-lambda-remove-before-merge/1810-ignorance-reduction-for-implementation-plan.md`, which is present on the branch, for context.

Tell the agent which sub-item within Phase 4 they are solving.

Tell the agent that each issue will be assigned, resolved and merged to the base branch in the order in which they appear in the plan.

No work is to start until I assign each issue to the coding agent, in turn.
```

</details>


---

<sub>23s</sub>

### `view`

**view the file at /Users/edburns/.copilot/skills/shepherd-task-20-create-issues-from-plan/examples/03-dd-3017826-java-real-estate-demo.md.**

/Users/edburns/.copilot/skills/shepherd-task-20-create-issues-from-plan/examples/03-dd-3017826-java-real-estate-demo.md

<details>
<summary>14 lines</summary>

```
# Example 03: dd-3017826-java-real-estate-demo-remove-before-merge

Read `dd-3017826-java-real-estate-demo-remove-before-merge\dd-3017826-java-real-estate-demo-ignorance-reduction-plan.md` (the plan) to get the context.

✅✅Pay very close attention to each **Resolution:** to the questions in `Phase 2 — Ignorance reduction: questions to answer before writing code`.

In this session, we are creating sub-issues as children of https://github.com/edburns/Build26-BRK206-your-agent-anywhere-multiclient-multidevice-with-github-copilot-sdk/issues/2 . These issues correspond to the sub-sections in `## Phase 3 — Implementation (build order)`.

I want you to use `gh` to create issues as sub-issues of #2.

- I will dispatch these issues by assigning them to an agent. Leave them unassigned for now.

- The description you put in the issues you create is the specification for the work the agent assigned to the issue must do. Therefore, you need to be very specific and targeted when writing the description.

- Each issue will be worked on and resolved in serial. You can assume:
  - All issues will operate in this topic branch of `origin`: `edburns/2-build-out-demo`.

  - The assignee agent has access to the topic branch and, most importantly, to the prompts in the directory `dd-3017826-java-real-estate-demo-remove-before-merge`, which includes the plan. Therefore, you can instruct the agent to access the plan by reference, you don't need to reference it by value directly in the issue.

- The sub-sections of `## Phase 3 — Implementation (build order)` have essential details for each corresponding sub-issue.

- Instruct the agent to read the entire plan before working.

- Instruct the agent to carefully re-read the relevant sections of the plan. ❌❌You can't just say, "read the relevant sections of the plan". ✅✅In the description of the issue, list exactly what sections of the plan apply to this particular issue.
- Though the sub-sections of `## Phase 3 — Implementation (build order)` have essential details for each corresponding sub-issue, I want you to carefully consider if there are additional gating tests you can add so that as the agent proceeds from one task to the next, the likelihood of rework is reduced.
```

</details>


---

<sub>23s</sub>

### `view`

**view the file at /Users/edburns/.copilot/skills/shepherd-task-20-create-issues-from-plan/examples/04-28-python-agent-demo.md.**

/Users/edburns/.copilot/skills/shepherd-task-20-create-issues-from-plan/examples/04-28-python-agent-demo.md

<details>
<summary>16 lines</summary>

```
# Example 04: 28-python-agent-demo-remove-before-merge

Read `28-python-agent-demo-remove-before-merge/28-python-agent-demo-ignorance-reduction-plan.md` (the plan) to get the context.

✅✅Pay very close attention to each **Resolution:** to the questions in `Phase 2 — Ignorance reduction: questions to answer before writing code`. These pertain to the implementation tasks in Phase 3. ✅✅✅ Include relevant spike findings as self-contained prose in the issue description; do not direct the agent to spike directories or source files.

In this session, we are creating sub-issues as children of https://github.com/edburns/Build26-BRK206-your-agent-anywhere-multiclient-multidevice-with-github-copilot-sdk/issues/28 . These issues correspond to the sub-sections in `## Phase 3 — Implementation (build order)`.

I want you to use `gh` to create issues as sub-issues of #28

- I will dispatch these issues by assigning them to an agent. Leave them unassigned for now.

- The description you put in the issues you create is the specification for the work the agent assigned to the issue must do. Therefore, you need to be very specific and targeted when writing the description.

- Again, ✅✅For each **Resolution:** to the questions in `Phase 2 — Ignorance reduction: questions to answer before writing code`, include the relevant Resolution values in the issue description. These pertain to the implementation tasks in Phase 3. ✅✅✅ State relevant spike findings directly in the issue body with enough detail to implement them without reading spike code.

- For tasks dealing with the UI, make sure to refer to the relevant screengrabs, but only ones within `28-python-agent-demo-remove-before-merge/`.

- Each issue will be worked on and resolved in serial. You can assume:
  - All issues will operate in this topic branch of `origin`: `edburns/28-python-agent-demo`.

  - The assignee agent has access to the topic branch and, most importantly, to the prompts in the directory `28-python-agent-demo-remove-before-merge/`, which includes the plan. Therefore, you can instruct the agent to access the plan by reference, you don't need to reference it by value directly in the issue.

- The sub-sections of `## Phase 3 — Implementation (build order)` have essential details for each corresponding sub-issue.

- Instruct the agent to read the entire plan before working.

- Instruct the agent to carefully re-read the relevant sections of the plan. ❌❌You can't just say, "read the relevant sections of the plan". ✅✅In the description of the issue, list exactly what sections of the plan apply to this particular issue.
- Though the sub-sections of `## Phase 3 — Implementation (build order)` have essential details for each corresponding sub-issue, I want you to carefully consider if there are additional gating tests you can add so that as the agent proceeds from one task to the next, the likelihood of rework is reduced.
```

</details>


---

<sub>23s</sub>

### `bash`

**Validate inputs and read campaign plan**

$ set -eu
LOG_DIRECTORY='/Users/edburns/workareas/dd-3068633-darwin-arm64-05-shepherd-control/1-math-control-remove-before-merge/prompts/shepherd-task-20-20260924-1638'
PLAN='1-math-control-remove-before-merge/math-tool-ignorance-reduction-plan.md'
MANIFEST='1-math-control-remove-before-merge/shepherd-campaign.json'
printf '%s\n' '== filesystem =='
test -d "$LOG_DIRECTORY" && test -w "$LOG_DIRECTORY"
mkdir -p "$LOG_DIRECTORY/issue-bodies"
for script in \
  '/Users/edburns/.copilot/plugins/shepherd-task/scripts/validate-stage20-drafts.sh' \
  '/Users/edburns/.copilot/plugins/shepherd-task/scripts/verify-github-issue-body.sh' \
  '/Users/edburns/.copilot/plugins/shepherd-task/scripts/verify-stage20-child-links.sh'; do
  test -x "$script" && printf 'executable: %s\n' "$script"
done
printf '%s\n' '== git =='
git remote -v
git branch --list 'experiment/shepherd-control'
git symbolic-ref --short refs/remotes/origin/HEAD 2>/dev/null || true
git show 'experiment/shepherd-control:'"$PLAN"
printf '\n%s\n' '== manifest =='
git show 'experiment/shepherd-control:'"$MANIFEST"
printf '\n%s\n' '== campaign lessons exists =='
git cat-file -e 'experiment/shepherd-control:1-math-control-remove-before-merge/campaign-lessons.md' && echo yes

<details>
<summary>67 lines</summary>

```
== filesystem ==
executable: /Users/edburns/.copilot/plugins/shepherd-task/scripts/validate-stage20-drafts.sh
executable: /Users/edburns/.copilot/plugins/shepherd-task/scripts/verify-github-issue-body.sh
executable: /Users/edburns/.copilot/plugins/shepherd-task/scripts/verify-stage20-child-links.sh
== git ==
origin	git@github.com:edburns/dd-3068633-darwin-arm64-05.git (fetch)
origin	git@github.com:edburns/dd-3068633-darwin-arm64-05.git (push)
* experiment/shepherd-control
origin/main
# PowerShell math-tool control campaign

Build the fixture in two cheap, serial tasks. The repository already contains
deterministic CI pinned to Pester 5.7.1. The acceptance command for every task
is `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`. Task 2 starts only after task 1 is merged.

## Ignorance reduction

### Repository-owned validation

**Question:** What command and environment define acceptance?

**Resolution:** The committed canonical command is
`pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`. The baseline workflow
`.github/workflows/shepherd-task-math-tool.yml` installs exactly Pester
5.7.1 and invokes that repository-owned runner. Do not replace or bypass it.

### Output and ordering contracts

**Question:** What externally observable behavior and dependency order are required?

**Resolution:** Direct CLI execution writes exactly one result line to stdout:
`Fibonacci(N) = value` or `Factorial(N) = value`. Functions return the
numeric value without incidental output. Inputs are non-negative integers.
Implementation is serial: task 2 depends on merged task 1. The implementation
and test files are repository-root `math-tool.ps1` and
`math-tool.Tests.ps1`.

## Implementation

### 1. Implement Fibonacci with unit and isolated CLI coverage

Create `math-tool.ps1` with parameter `N` and a pure `Get-Fibonacci`
function. Direct execution must print exactly `Fibonacci(N) = value`.
Create `math-tool.Tests.ps1` containing dot-sourced unit tests for the
function and isolated child-`pwsh` process tests for direct CLI behavior.
Cover N=0, N=1, and a small representative value. Keep changes limited to the
math tool and its tests.

Acceptance: `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1` exits zero and the pinned pull-request CI
passes.

### 2. Add factorial and operation dispatch

After task 1 is merged, extend the same script with a pure `Get-Factorial`
function and an `Operation` parameter that dispatches between `fibonacci`
and `factorial` while retaining `N`. Preserve Fibonacci behavior. Cover
factorial edge cases 0 and 1 plus a small representative value. Keep the
interface and tests objective and small; the issue does not prescribe how to
extend the tests.

Acceptance: `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1` exits zero for the combined regression suite
and the pinned pull-request CI passes.

== manifest ==
{
  "schemaVersion": 1,
  "campaignId": "c6942015-9929-4e71-8cdb-3fd61f5639e9",
  "campaignIssueNumber": 1,
  "campaignShortname": "math-control",
  "repository": "edburns/dd-3068633-darwin-arm64-05",
  "baseBranch": "experiment/shepherd-control",
  "lessonPropagation": "off",
  "campaignMetadataDirectory": "1-math-control-remove-before-merge",
  "lessonsFile": "campaign-lessons.md",
  "createdBy": {
    "shepherdTaskVersion": "1.0.4",
    "stageOutcomeProtocolVersion": 1
  },
  "createdAt": "2026-09-24T20:38:31Z"
}

== campaign lessons exists ==
yes
<shellId: 1 completed with exit code 0>
```

</details>


---

<sub>23s</sub>

### `bash`

**Validate GitHub repository state**

$ set -eu
REPO='edburns/dd-3068633-darwin-arm64-05'
PARENT=1
printf '%s\n' '== repository =='
gh api "repos/$REPO" --jq '{default_branch,owner:{login:.owner.login,type:.owner.type}}'
printf '%s\n' '== parent =='
gh api "repos/$REPO/issues/$PARENT" --jq '{number,state,repository_url,title}'
printf '%s\n' '== remote branch =='
gh api "repos/$REPO/branches/experiment/shepherd-control" --jq '{name}'
printf '%s\n' '== current children normalized =='
gh api "repos/$REPO/issues/$PARENT/sub_issues" --paginate --slurp | jq 'if length == 0 then [] elif all(.[]; type == "array") then add else . end'

<details>
<summary>9 lines</summary>

```
== repository ==
{"default_branch":"main","owner":{"login":"edburns","type":"User"}}
== parent ==
{"number":1,"repository_url":"https://api.github.com/repos/edburns/dd-3068633-darwin-arm64-05","state":"open","title":"[Campaign][off] shepherd-task simple-math control"}
== remote branch ==
{"name":"experiment/shepherd-control"}
== current children normalized ==
[]
<shellId: 0 completed with exit code 0>
```

</details>


---

<sub>26s</sub>

### Copilot

Validation passed: the parent is open, the non-default base branch and campaign manifest match, both implementation decisions have substantive resolutions, and the repository owner is a user, so the two children will be created **without an issue type**. I’m now grounding the drafts in the repository-owned runner and workflow, then persisting the pre-creation snapshot and draft artifacts.

---

<sub>30s</sub>

### `view`

**view the file at /Users/edburns/workareas/dd-3068633-darwin-arm64-05-shepherd-control/eng/test-math-tool.ps1.**

/Users/edburns/workareas/dd-3068633-darwin-arm64-05-shepherd-control/eng/test-math-tool.ps1

<details>
<summary>31 lines</summary>

```
[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$requiredVersion = '5.7.1'
$repositoryRoot = Split-Path -Parent $PSScriptRoot
$implementationPath = Join-Path $repositoryRoot 'math-tool.ps1'
$testPath = Join-Path $repositoryRoot 'math-tool.Tests.ps1'

$implementationExists = Test-Path -LiteralPath $implementationPath -PathType Leaf
$testsExist = Test-Path -LiteralPath $testPath -PathType Leaf
if (-not $implementationExists -and -not $testsExist) {
    Write-Host 'Math-tool implementation has not been introduced yet; baseline validation passed.'
    exit 0
}
if (-not $implementationExists -or -not $testsExist) {
    throw 'math-tool.ps1 and math-tool.Tests.ps1 must be introduced together.'
}

$available = Get-Module -ListAvailable Pester |
    Where-Object { $_.Version.ToString() -eq $requiredVersion } |
    Select-Object -First 1
if (-not $available) {
    Write-Host "Installing Pester $requiredVersion in CurrentUser scope..."
    Install-Module Pester -RequiredVersion $requiredVersion -Scope CurrentUser -Force
}

Import-Module Pester -RequiredVersion $requiredVersion -Force
$result = Invoke-Pester -Path $testPath -PassThru
if ($result.FailedCount -gt 0) {
    Write-Error "Pester reported $($result.FailedCount) failed test(s)."
    exit 1
}
exit 0
```

</details>


---

<sub>30s</sub>

### `view`

**view the file at /Users/edburns/workareas/dd-3068633-darwin-arm64-05-shepherd-control/.github/workflows/shepherd-task-math-tool.yml.**

/Users/edburns/workareas/dd-3068633-darwin-arm64-05-shepherd-control/.github/workflows/shepherd-task-math-tool.yml

<details>
<summary>19 lines</summary>

```
name: Shepherd task math tool

on:
  pull_request:
  push:
  workflow_dispatch:

permissions:
  contents: read

jobs:
  test:
    name: Shepherd task math tool
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Install Pester 5.7.1
        shell: pwsh
        run: Install-Module Pester -RequiredVersion 5.7.1 -Scope CurrentUser -Force
      - name: Test math tool
        shell: pwsh
        run: ./eng/test-math-tool.ps1
```

</details>


---

<sub>30s</sub>

### `bash`

**Persist pre-creation child snapshot**

$ set -euo pipefail
REPO='edburns/dd-3068633-darwin-arm64-05'
PARENT=1
OUT='/Users/edburns/workareas/dd-3068633-darwin-arm64-05-shepherd-control/1-math-control-remove-before-merge/prompts/shepherd-task-20-20260924-1638/pre-creation-children.json'
tmp="${OUT}.tmp.$$"
gh api "repos/$REPO/issues/$PARENT/sub_issues" --paginate --slurp | jq 'if length == 0 then [] elif all(.[]; type == "array") then add else . end' > "$tmp"
jq -e 'type == "array"' "$tmp" >/dev/null
mv "$tmp" "$OUT"
printf 'Persisted normalized pre-creation children: '
jq -c '.' "$OUT"

```
Persisted normalized pre-creation children: []
<shellId: 2 completed with exit code 0>
```


---

<sub>33s</sub>

### `view`

**view the file at /Users/edburns/.copilot/plugins/shepherd-task/scripts/validate-stage20-drafts.sh.**

/Users/edburns/.copilot/plugins/shepherd-task/scripts/validate-stage20-drafts.sh

<details>
<summary>65 lines</summary>

```
#!/usr/bin/env bash
# shepherd-task-version: 1.0.4

set -euo pipefail

[[ $# -eq 3 ]] || {
    echo "Usage: $0 <body-directory> <expected-count> <off|campaign>" >&2
    exit 1
}

body_directory="$1"
expected_count="$2"
lesson_propagation="$3"

[[ -d "$body_directory" ]] || {
    echo "Stage-20 body directory does not exist: $body_directory" >&2
    exit 1
}
[[ "$expected_count" =~ ^[1-9][0-9]*$ ]] || {
    echo "Expected count must be a positive integer." >&2
    exit 1
}
[[ "$lesson_propagation" == "off" || "$lesson_propagation" == "campaign" ]] || {
    echo "Lesson propagation must be off or campaign." >&2
    exit 1
}

body_files=()
for body_file in "$body_directory"/*-body.md; do
    [[ -f "$body_file" ]] || continue
    [[ "$body_file" != *-observed-body.md ]] || continue
    body_files+=("$body_file")
done
[[ ${#body_files[@]} -eq $expected_count ]] || {
    echo "Expected $expected_count persisted stage-20 body files; found ${#body_files[@]}." >&2
    exit 1
}

required_headings=(
    '## Campaign context and required reading'
    '## Branch and execution order'
    '## Implement'
    '## Completion gates'
    '## Out of scope'
)

for body_file in "${body_files[@]}"; do
    [[ -s "$body_file" && "$(awk 'END { print NR }' "$body_file")" -gt 1 ]] || {
        echo "Persisted issue body must contain physical Markdown lines: $body_file" >&2
        exit 1
    }
    first_nonblank="$(awk 'NF { print; exit }' "$body_file")"
    [[ "$first_nonblank" =~ ^##[[:space:]]+[^[:space:]] ]] || {
        echo "Persisted issue body must begin with a level-two heading: $body_file" >&2
        exit 1
    }
    for heading in "${required_headings[@]}"; do
        grep -Fqx -- "$heading" "$body_file" || {
            echo "Persisted issue body is missing the physical heading '$heading': $body_file" >&2
            exit 1
        }
    done
    if [[ "$lesson_propagation" == "campaign" ]]; then
        grep -Fqx -- '## Campaign lessons (REQUIRED)' "$body_file" || {
            echo "Treatment issue body is missing its campaign-lessons heading: $body_file" >&2
            exit 1
        }
    elif grep -Fqx -- '## Campaign lessons (REQUIRED)' "$body_file"; then
        echo "Control issue body unexpectedly contains a campaign-lessons heading: $body_file" >&2
        exit 1
    fi
done
```

</details>


---

<sub>1m 4s</sub>

### `apply_patch`

<details>
<summary>Arguments</summary>

```json
"*** Begin Patch\n*** Add File: /Users/edburns/workareas/dd-3068633-darwin-arm64-05-shepherd-control/1-math-control-remove-before-merge/prompts/shepherd-task-20-20260924-1638/issue-bodies/01-1-implement-fibonacci-body.md\n+## Campaign context and required reading\n+\n+On the `experiment/shepherd-control` branch, the directory `1-math-control-remove-before-merge` contains the plan (`math-tool-ignorance-reduction-plan.md`) and supporting resources (diagrams, decision records). Spike subdirectories are research artifacts — read the plan's Resolution sections for findings, not the spike source code.\n+\n+Before changing code, read the entire plan. Then carefully re-read these exact sections:\n+\n+- `## Ignorance reduction`\n+- `### Repository-owned validation`\n+- `### Output and ordering contracts`\n+- `## Implementation`\n+- `### 1. Implement Fibonacci with unit and isolated CLI coverage`\n+\n+The resolved acceptance environment is the committed command `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`. The repository workflow `.github/workflows/shepherd-task-math-tool.yml` installs exactly Pester 5.7.1 and invokes that repository-owned runner; do not replace, bypass, or weaken either mechanism.\n+\n+The resolved behavior contract is:\n+\n+- Direct CLI execution writes exactly one result line to stdout in the form `Fibonacci(N) = value`.\n+- `Get-Fibonacci` returns only the numeric value, with no incidental pipeline or host output.\n+- Inputs are non-negative integers.\n+- The production and test files are repository-root `math-tool.ps1` and `math-tool.Tests.ps1`.\n+\n+No separate spike-specific implementation finding is recorded in the plan. Implement from the resolutions and production repository conventions; do not read, copy, or adapt spike source code.\n+\n+## Branch and execution order\n+\n+Base all work on `experiment/shepherd-control` from remote `origin`, and target the pull request to that branch.\n+\n+This is implementation task 1 of 2. Tasks are assigned, completed, and merged serially in plan order. Do not begin until this issue is assigned. Task 2 must not begin until this task is merged.\n+\n+Leave campaign planning and prompt artifacts unchanged.\n+\n+## Implement\n+\n+Create `math-tool.ps1` and `math-tool.Tests.ps1` together.\n+\n+In `math-tool.ps1`:\n+\n+- Declare a script parameter named `N` that accepts the non-negative integer input required by the plan.\n+- Implement a pure `Get-Fibonacci` function. Its observable function output must be the numeric Fibonacci value and nothing else.\n+- Support the edge cases `N=0` and `N=1` and a representative larger small integer.\n+- When the file is run directly as a CLI, write exactly one stdout line formatted as `Fibonacci(N) = value`, substituting the input and result.\n+- Keep dot-sourcing suitable for unit tests: loading the file to call the function must not emit the direct-CLI result line.\n+\n+In `math-tool.Tests.ps1`, use production code and Pester 5.7.1 to add:\n+\n+- Dot-sourced unit coverage for `Get-Fibonacci` at `N=0`, `N=1`, and at least one representative small value.\n+- Isolated child-`pwsh` process coverage for direct invocation of `math-tool.ps1` at the same contract boundaries.\n+- Assertions that child-process stdout is exactly the required single line and that the process exits successfully.\n+- Assertions strict enough to fail on labels, debug messages, extra blank/output lines, or a numeric result emitted in addition to the formatted CLI line.\n+\n+Use an objective, small implementation. The tests must invoke the repository-root production script and must not recreate the Fibonacci algorithm as a second implementation.\n+\n+## Completion gates\n+\n+- `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1` exits zero using the committed runner.\n+- Unit tests prove `Get-Fibonacci` returns numeric values for 0, 1, and a representative small input without incidental output.\n+- Isolated child-process tests prove direct execution exits zero and emits exactly one correctly formatted stdout line.\n+- `math-tool.ps1` and `math-tool.Tests.ps1` are introduced together.\n+- The pinned pull-request workflow passes with Pester 5.7.1.\n+- The pull request targets `experiment/shepherd-control` and contains no assignment or work for task 2.\n+\n+## Out of scope\n+\n+- Factorial support, an `Operation` parameter, or operation dispatch; those belong to task 2.\n+- Replacing the repository-owned runner, changing the pinned Pester version, or bypassing the existing workflow.\n+- Adding modules, packages, UI, persistence, networking, generalized math operations, or unrelated refactors.\n+- Copying or adapting any spike implementation or test helper.\n*** Add File: /Users/edburns/workareas/dd-3068633-darwin-arm64-05-shepherd-control/1-math-control-remove-before-merge/prompts/shepherd-task-20-20260924-1638/issue-bodies/02-2-add-factorial-dispatch-body.md\n+## Campaign context and required reading\n+\n+On the `experiment/shepherd-control` branch, the directory `1-math-control-remove-before-merge` contains the plan (`math-tool-ignorance-reduction-plan.md`) and supporting resources (diagrams, decision records). Spike subdirectories are research artifacts — read the plan's Resolution sections for findings, not the spike source code.\n+\n+Before changing code, read the entire plan. Then carefully re-read these exact sections:\n+\n+- `## Ignorance reduction`\n+- `### Repository-owned validation`\n+- `### Output and ordering contracts`\n+- `## Implementation`\n+- `### 1. Implement Fibonacci with unit and isolated CLI coverage`\n+- `### 2. Add factorial and operation dispatch`\n+\n+The resolved acceptance environment is the committed command `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`. The repository workflow `.github/workflows/shepherd-task-math-tool.yml` installs exactly Pester 5.7.1 and invokes that repository-owned runner; do not replace, bypass, or weaken either mechanism.\n+\n+The resolved behavior and ordering contract is:\n+\n+- Direct CLI execution writes exactly one result line to stdout: `Fibonacci(N) = value` or `Factorial(N) = value`, matching the selected operation.\n+- Functions return only their numeric value, with no incidental pipeline or host output.\n+- Inputs are non-negative integers.\n+- Task 2 starts from the merged task-1 implementation and preserves its Fibonacci behavior.\n+- The production and test files remain repository-root `math-tool.ps1` and `math-tool.Tests.ps1`.\n+\n+No separate spike-specific implementation finding is recorded in the plan. Implement from the resolutions and production repository conventions; do not read, copy, or adapt spike source code.\n+\n+## Branch and execution order\n+\n+Base all work on `experiment/shepherd-control` from remote `origin`, and target the pull request to that branch.\n+\n+This is implementation task 2 of 2. Tasks are assigned, completed, and merged serially in plan order. Do not begin until this issue is assigned and task 1 has been merged into `experiment/shepherd-control`; begin from that merged state rather than reimplementing task 1.\n+\n+Leave campaign planning and prompt artifacts unchanged.\n+\n+## Implement\n+\n+Extend the existing task-1 `math-tool.ps1` and `math-tool.Tests.ps1`; do not replace their established Fibonacci contract.\n+\n+In `math-tool.ps1`:\n+\n+- Add a pure `Get-Factorial` function for non-negative integer inputs. It must return only the numeric factorial value.\n+- Return `1` for both factorial edge cases `N=0` and `N=1`, and compute the correct value for representative larger small integers.\n+- Add an `Operation` parameter that dispatches between `fibonacci` and `factorial` while retaining the existing `N` parameter.\n+- Preserve the task-1 Fibonacci CLI behavior, including existing Fibonacci invocation compatibility and the exact `Fibonacci(N) = value` stdout format.\n+- For factorial CLI execution, write exactly one stdout line formatted as `Factorial(N) = value`.\n+- Keep dot-sourcing suitable for unit tests: loading the file to call either function must not emit a direct-CLI result line.\n+- Constrain dispatch to the two operations required by the plan using clear PowerShell parameter validation or equally explicit behavior; do not silently treat an unknown operation as a valid one.\n+\n+Extend `math-tool.Tests.ps1` with production-focused Pester 5.7.1 coverage:\n+\n+- Dot-sourced unit tests for `Get-Factorial` at `N=0`, `N=1`, and at least one representative small value.\n+- Isolated child-`pwsh` process tests for factorial dispatch that assert successful exit and exact single-line stdout.\n+- Regression tests for the previously merged Fibonacci unit and direct-CLI behavior after operation dispatch is added.\n+- Dispatch tests that distinguish Fibonacci from factorial for an input whose results differ, so swapped or ignored operation selection cannot pass.\n+- Assertions strict enough to fail on incidental function output, debug messages, extra blank/output lines, or duplicate numeric output.\n+\n+Keep the interface and tests objective and small. Invoke the repository-root production script in CLI tests; do not reproduce either algorithm in test-only code.\n+\n+## Completion gates\n+\n+- `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1` exits zero for the combined regression suite.\n+- Factorial unit tests prove numeric-only results for 0, 1, and a representative small input.\n+- Isolated child-process tests prove factorial dispatch exits zero and emits exactly one correctly formatted `Factorial(N) = value` line.\n+- Existing Fibonacci unit and CLI tests continue to pass unchanged in observable behavior.\n+- A discriminating dispatch test proves both operation paths select the correct algorithm.\n+- The pinned pull-request workflow passes with Pester 5.7.1.\n+- The pull request targets `experiment/shepherd-control`.\n+\n+## Out of scope\n+\n+- Rewriting or weakening the task-1 Fibonacci contract and coverage.\n+- Replacing the repository-owned runner, changing the pinned Pester version, or bypassing the existing workflow.\n+- Operations other than Fibonacci and factorial, generalized command frameworks, UI, persistence, networking, or unrelated refactors.\n+- Copying or adapting any spike implementation or test helper.\n*** End Patch\n"
```

</details>

```
Added 2 file(s): /Users/edburns/workareas/dd-3068633-darwin-arm64-05-shepherd-control/1-math-control-remove-before-merge/prompts/shepherd-task-20-20260924-1638/issue-bodies/01-1-implement-fibonacci-body.md, /Users/edburns/workareas/dd-3068633-darwin-arm64-05-shepherd-control/1-math-control-remove-before-merge/prompts/shepherd-task-20-20260924-1638/issue-bodies/02-2-add-factorial-dispatch-body.md
```


---

<sub>1m 11s</sub>

### Copilot

Both bodies are now persisted with the exact required reading, concrete resolution values, serial dependencies, spike firewall, implementation boundaries, and discriminating gates. I’m validating the on-disk Markdown and initializing the durable ledger/result state before creating the first child.

---

<sub>1m 14s</sub>

### `bash`

**Validate drafts and initialize ledger**

$ set -euo pipefail
LOG_DIRECTORY='/Users/edburns/workareas/dd-3068633-darwin-arm64-05-shepherd-control/1-math-control-remove-before-merge/prompts/shepherd-task-20-20260924-1638'
DRAFT_VALIDATOR='/Users/edburns/.copilot/plugins/shepherd-task/scripts/validate-stage20-drafts.sh'
"$DRAFT_VALIDATOR" "$LOG_DIRECTORY/issue-bodies" 2 off
atomic_file() {
  local target="$1" content="$2" tmp="${target}.tmp.$$"
  printf '%s\n' "$content" > "$tmp"
  mv "$tmp" "$target"
}
atomic_file "$LOG_DIRECTORY/creation-ledger.json" '[]'
atomic_file "$LOG_DIRECTORY/stage-20-result.json" '{
  "schemaVersion": 1,
  "status": "in_progress",
  "ledgerFile": "creation-ledger.json",
  "operationError": null
}'
printf 'Draft validation passed; initialized ledger and stage result.\n'

```
/bin/bash: line 5: target: unbound variable
<shellId: 3 completed with exit code 1>
```


---

<sub>1m 18s</sub>

### `bash`

**Initialize durable stage state**

$ set -euo pipefail
LOG_DIRECTORY='/Users/edburns/workareas/dd-3068633-darwin-arm64-05-shepherd-control/1-math-control-remove-before-merge/prompts/shepherd-task-20-20260924-1638'
DRAFT_VALIDATOR='/Users/edburns/.copilot/plugins/shepherd-task/scripts/validate-stage20-drafts.sh'
"$DRAFT_VALIDATOR" "$LOG_DIRECTORY/issue-bodies" 2 off
atomic_file() {
  local target="$1" content="$2" tmp
  tmp="${target}.tmp.$$"
  printf '%s\n' "$content" > "$tmp"
  mv "$tmp" "$target"
}
atomic_file "$LOG_DIRECTORY/creation-ledger.json" '[]'
atomic_file "$LOG_DIRECTORY/stage-20-result.json" '{
  "schemaVersion": 1,
  "status": "in_progress",
  "ledgerFile": "creation-ledger.json",
  "operationError": null
}'
printf 'Draft validation passed; initialized ledger and stage result.\n'

```
Draft validation passed; initialized ledger and stage result.
<shellId: 4 completed with exit code 0>
```


---

<sub>1m 32s</sub>

### `bash`

**Create and link first task issue**

$ set -euo pipefail
REPO='edburns/dd-3068633-darwin-arm64-05'
PARENT_ISSUE=1
LOG_DIRECTORY='/Users/edburns/workareas/dd-3068633-darwin-arm64-05-shepherd-control/1-math-control-remove-before-merge/prompts/shepherd-task-20-20260924-1638'
LEDGER="$LOG_DIRECTORY/creation-ledger.json"
BODY_FILE="$LOG_DIRECTORY/issue-bodies/01-1-implement-fibonacci-body.md"
BODY_RELATIVE='issue-bodies/01-1-implement-fibonacci-body.md'
SUBSECTION='1. Implement Fibonacci with unit and isolated CLI coverage'
TITLE='1. Implement Fibonacci with unit and isolated CLI coverage'
ISSUE_BODY_VERIFIER='/Users/edburns/.copilot/plugins/shepherd-task/scripts/verify-github-issue-body.sh'
atomic_write() {
  local target="$1" content="$2" tmp
  tmp="${target}.tmp.$$"
  printf '%s\n' "$content" > "$tmp"
  mv "$tmp" "$target"
}
update_ledger_flag() {
  local number="$1" field="$2" value="$3" updated
  updated="$(
    jq \
      --argjson number "$number" \
      --arg field "$field" \
      --argjson value "$value" \
      'map(if .number == $number then .[$field] = $value else . end)' \
      "$LEDGER"
  )" || return 1
  atomic_write "$LEDGER" "$updated"
}
created="$(gh api "repos/$REPO/issues" -X POST -f title="$TITLE" -F "body=@$BODY_FILE" --jq '{id,number,node_id,html_url,title}')"
id="$(jq -r '.id' <<<"$created")"
number="$(jq -r '.number' <<<"$created")"
url="$(jq -r '.html_url' <<<"$created")"
updated="$(jq \
  --arg subsection "$SUBSECTION" \
  --arg bodyFile "$BODY_RELATIVE" \
  --argjson id "$id" \
  --argjson number "$number" \
  --arg title "$TITLE" \
  --arg url "$url" \
  '. + [{implementationSubsection:$subsection,bodyFile:$bodyFile,id:$id,number:$number,title:$title,url:$url,body_verified:false,linked:false}]' \
  "$LEDGER")"
atomic_write "$LEDGER" "$updated"
issue_json="$(
  "$ISSUE_BODY_VERIFIER" \
    "$REPO" \
    "$number" \
    "$BODY_FILE" \
    6 \
    5 \
    "$LOG_DIRECTORY/issue-$number-body-verification-failure.json"
)"
update_ledger_flag "$number" body_verified true
linked=false
link_error=''
for attempt in 1 2 3; do
  if link_output="$(printf '{"sub_issue_id": %s}' "$id" | gh api "repos/$REPO/issues/$PARENT_ISSUE/sub_issues" -X POST --input - 2>&1)"; then
    linked=true
    break
  fi
  link_error="$link_output"
done
if [[ "$linked" != true ]]; then
  printf 'Linking issue #%s failed after 3 attempts: %s\n' "$number" "$link_error" >&2
  exit 1
fi
update_ledger_flag "$number" linked true
printf '%s\n' "$created"

```
{"html_url":"https://github.com/edburns/dd-3068633-darwin-arm64-05/issues/2","id":5574288099,"node_id":"I_kwDOUqFBRc8AAAABTEDi4w","number":2,"title":"1. Implement Fibonacci with unit and isolated CLI coverage"}
<shellId: 5 completed with exit code 0>
```


---

<sub>1m 42s</sub>

### `bash`

**Create and link second task issue**

$ set -euo pipefail
REPO='edburns/dd-3068633-darwin-arm64-05'
PARENT_ISSUE=1
LOG_DIRECTORY='/Users/edburns/workareas/dd-3068633-darwin-arm64-05-shepherd-control/1-math-control-remove-before-merge/prompts/shepherd-task-20-20260924-1638'
LEDGER="$LOG_DIRECTORY/creation-ledger.json"
BODY_FILE="$LOG_DIRECTORY/issue-bodies/02-2-add-factorial-dispatch-body.md"
BODY_RELATIVE='issue-bodies/02-2-add-factorial-dispatch-body.md'
SUBSECTION='2. Add factorial and operation dispatch'
TITLE='2. Add factorial and operation dispatch'
ISSUE_BODY_VERIFIER='/Users/edburns/.copilot/plugins/shepherd-task/scripts/verify-github-issue-body.sh'
atomic_write() {
  local target="$1" content="$2" tmp
  tmp="${target}.tmp.$$"
  printf '%s\n' "$content" > "$tmp"
  mv "$tmp" "$target"
}
update_ledger_flag() {
  local number="$1" field="$2" value="$3" updated
  updated="$(
    jq \
      --argjson number "$number" \
      --arg field "$field" \
      --argjson value "$value" \
      'map(if .number == $number then .[$field] = $value else . end)' \
      "$LEDGER"
  )" || return 1
  atomic_write "$LEDGER" "$updated"
}
created="$(gh api "repos/$REPO/issues" -X POST -f title="$TITLE" -F "body=@$BODY_FILE" --jq '{id,number,node_id,html_url,title}')"
id="$(jq -r '.id' <<<"$created")"
number="$(jq -r '.number' <<<"$created")"
url="$(jq -r '.html_url' <<<"$created")"
updated="$(jq \
  --arg subsection "$SUBSECTION" \
  --arg bodyFile "$BODY_RELATIVE" \
  --argjson id "$id" \
  --argjson number "$number" \
  --arg title "$TITLE" \
  --arg url "$url" \
  '. + [{implementationSubsection:$subsection,bodyFile:$bodyFile,id:$id,number:$number,title:$title,url:$url,body_verified:false,linked:false}]' \
  "$LEDGER")"
atomic_write "$LEDGER" "$updated"
issue_json="$(
  "$ISSUE_BODY_VERIFIER" \
    "$REPO" \
    "$number" \
    "$BODY_FILE" \
    6 \
    5 \
    "$LOG_DIRECTORY/issue-$number-body-verification-failure.json"
)"
update_ledger_flag "$number" body_verified true
linked=false
link_error=''
for attempt in 1 2 3; do
  if link_output="$(printf '{"sub_issue_id": %s}' "$id" | gh api "repos/$REPO/issues/$PARENT_ISSUE/sub_issues" -X POST --input - 2>&1)"; then
    linked=true
    break
  fi
  link_error="$link_output"
done
if [[ "$linked" != true ]]; then
  printf 'Linking issue #%s failed after 3 attempts: %s\n' "$number" "$link_error" >&2
  exit 1
fi
update_ledger_flag "$number" linked true
printf '%s\n' "$created"

```
{"html_url":"https://github.com/edburns/dd-3068633-darwin-arm64-05/issues/3","id":5574289896,"node_id":"I_kwDOUqFBRc8AAAABTEDp6A","number":3,"title":"2. Add factorial and operation dispatch"}
<shellId: 6 completed with exit code 0>
```


---

<sub>1m 48s</sub>

### Copilot

Both issues were created, body-verified, linked in plan order, and recorded immediately in the ledger. I’m taking the normalized final child snapshot and running the authoritative linkage plus final body/open/unassigned postconditions before marking the stage complete.

---

<sub>1m 55s</sub>

### `bash`

**Verify all issue postconditions**

$ set -euo pipefail
REPO='edburns/dd-3068633-darwin-arm64-05'
PARENT_ISSUE=1
LOG_DIRECTORY='/Users/edburns/workareas/dd-3068633-darwin-arm64-05-shepherd-control/1-math-control-remove-before-merge/prompts/shepherd-task-20-20260924-1638'
LEDGER="$LOG_DIRECTORY/creation-ledger.json"
PRE="$LOG_DIRECTORY/pre-creation-children.json"
FINAL="$LOG_DIRECTORY/final-children.json"
RESULT="$LOG_DIRECTORY/stage-20-result.json"
ISSUE_BODY_VERIFIER='/Users/edburns/.copilot/plugins/shepherd-task/scripts/verify-github-issue-body.sh'
CHILD_LINK_VERIFIER='/Users/edburns/.copilot/plugins/shepherd-task/scripts/verify-stage20-child-links.sh'
tmp="${FINAL}.tmp.$$"
gh api "repos/$REPO/issues/$PARENT_ISSUE/sub_issues" --paginate --slurp | jq 'if length == 0 then [] elif all(.[]; type == "array") then add else . end' > "$tmp"
jq -e 'type == "array"' "$tmp" >/dev/null
mv "$tmp" "$FINAL"
"$CHILD_LINK_VERIFIER" "$PRE" "$FINAL" "$LEDGER"
while IFS=$'\t' read -r number body_relative; do
  body_file="$LOG_DIRECTORY/$body_relative"
  issue_json="$(
    "$ISSUE_BODY_VERIFIER" \
      "$REPO" \
      "$number" \
      "$body_file" \
      6 \
      5 \
      "$LOG_DIRECTORY/issue-$number-final-body-verification-failure.json"
  )"
  jq -e '.state == "open" and ((.assignees // []) | length == 0)' <<<"$issue_json" >/dev/null
  printf 'Final body/open/unassigned verification passed for issue #%s.\n' "$number"
done < <(jq -r '.[] | [.number,.bodyFile] | @tsv' "$LEDGER")
tmp="${RESULT}.tmp.$$"
printf '%s\n' '{
  "schemaVersion": 1,
  "status": "complete",
  "ledgerFile": "creation-ledger.json",
  "operationError": null
}' > "$tmp"
mv "$tmp" "$RESULT"
printf '%s\n' '== final children =='
jq -c '[.[] | {id,number,title}]' "$FINAL"
printf '%s\n' '== ledger =='
jq '.' "$LEDGER"
printf '%s\n' '== stage result =='
jq '.' "$RESULT"

<details>
<summary>44 lines</summary>

```
{
  "baselineCount": 0,
  "ledgerCount": 2,
  "finalCount": 2,
  "newIssueIds": [
    5574288099,
    5574289896
  ]
}
Final body/open/unassigned verification passed for issue #2.
Final body/open/unassigned verification passed for issue #3.
== final children ==
[{"id":5574288099,"number":2,"title":"1. Implement Fibonacci with unit and isolated CLI coverage"},{"id":5574289896,"number":3,"title":"2. Add factorial and operation dispatch"}]
== ledger ==
[
  {
    "implementationSubsection": "1. Implement Fibonacci with unit and isolated CLI coverage",
    "bodyFile": "issue-bodies/01-1-implement-fibonacci-body.md",
    "id": 5574288099,
    "number": 2,
    "title": "1. Implement Fibonacci with unit and isolated CLI coverage",
    "url": "https://github.com/edburns/dd-3068633-darwin-arm64-05/issues/2",
    "body_verified": true,
    "linked": true
  },
  {
    "implementationSubsection": "2. Add factorial and operation dispatch",
    "bodyFile": "issue-bodies/02-2-add-factorial-dispatch-body.md",
    "id": 5574289896,
    "number": 3,
    "title": "2. Add factorial and operation dispatch",
    "url": "https://github.com/edburns/dd-3068633-darwin-arm64-05/issues/3",
    "body_verified": true,
    "linked": true
  }
]
== stage result ==
{
  "schemaVersion": 1,
  "status": "complete",
  "ledgerFile": "creation-ledger.json",
  "operationError": null
}
<shellId: 7 completed with exit code 0>
```

</details>


---

<sub>2m 1s</sub>

### Copilot

Created and verified two ordered child issues under #1. Both are open, unassigned, linked exactly once, and created **without an issue type**.

| Implementation subsection | Issue | Title | URL |
|---|---:|---|---|
| 1. Implement Fibonacci with unit and isolated CLI coverage | #2 | 1. Implement Fibonacci with unit and isolated CLI coverage | https://github.com/edburns/dd-3068633-darwin-arm64-05/issues/2 |
| 2. Add factorial and operation dispatch | #3 | 2. Add factorial and operation dispatch | https://github.com/edburns/dd-3068633-darwin-arm64-05/issues/3 |

**Ordered child issue numbers:** `2,3`

**Suggested stage-25 invocation:**

```text
Invoke skill shepherd-task-25-given-list with:
REPO: edburns/dd-3068633-darwin-arm64-05
BASE_BRANCH: experiment/shepherd-control
ISSUE_NUMBERS: 2,3
PLAN_DIRECTORY: 1-math-control-remove-before-merge
```

Stage 25 will derive `LESSON_PROPAGATION=off` from the campaign manifest.

---

<sub>Generated by [GitHub Copilot CLI](https://github.com/features/copilot/cli)</sub>
