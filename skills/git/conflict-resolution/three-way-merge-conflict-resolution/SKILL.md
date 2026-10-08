---
name: "three-way-merge-conflict-resolution"
description: "Systematic resolution of Git merge and rebase conflicts utilizing the three-way merge model (diff3 / zdiff3), base ancestor inspection, and conflict markers."
category: "git"
subcategory: "conflict-resolution"
language: "bash"
framework: "none"
technology: "git-conflicts"
difficulty: "intermediate"
tags: ["git", "merge-conflicts", "diff3", "zdiff3", "three-way-merge", "resolution"]
---

# Git Three-Way Merge Conflict Resolution and Diff3 Mechanics

## Purpose
Provide AI agents with a deterministic methodology for dissecting and resolving complex Git merge conflicts by understanding the common ancestor and both competing change branches.

## When to Use
Use when encountering merge or rebase conflicts, cherry-pick collisions, or resolving cross-branch code divergences.

## Inputs / Context
Conflicted files, conflict markers (`<<<<<<<`, `=======`, `>>>>>>>`), base commit, current branch, and incoming branch.

## Instructions
1. Enable Enhanced Three-Way Conflict Display (`zdiff3`):
   - By default, Git shows only two versions: YOURS (`HEAD`) and THEIRS (`branch`). It hides the common ancestor, making it impossible to know what originally changed.
   - Configure modern `zdiff3` conflict style globally:
     `git config --global merge.conflictStyle zdiff3`
   - `zdiff3` displays three sections:
     * `<<<<<<< HEAD`: Your current local changes.
     * `||||||| base`: The common ancestor code before either branch touched it.
     * `=======`: Separator.
     * `>>>>>>> incoming`: The competing changes from the incoming branch.
2. The 4-Step Resolution Algorithm:
   - Step 1 (Inspect Base): Look at the `||||||| base` section to see what the code looked like originally.
   - Step 2 (Inspect Ours): Look at `<<<<<<< HEAD` to understand what intent YOUR branch introduced relative to base.
   - Step 3 (Inspect Theirs): Look at `>>>>>>> incoming` to understand what intent THEIR branch introduced relative to base.
   - Step 4 (Synthesize): Merge the intentionality of BOTH changes into a unified, non-conflicting implementation.
3. Clean Up Conflict Markers Completely:
   - Ensure every `<<<<<<<`, `|||||||`, `=======`, and `>>>>>>>` marker is removed from all files before staging.
4. Verify Compilation and Test Suite:
   - Never mark a conflict resolved (`git add`) without compiling the code and running the unit test suite; syntactic conflicts may be resolved while semantic logic is broken.
5. Conclude the Conflict Resolution:
   - For rebase: `git add <resolved-files> && git rebase --continue`.
   - For merge: `git add <resolved-files> && git commit`.

## Constraints / Rules
- Never blindly choose `--ours` or `--theirs` across entire files without inspecting line-by-line intent.
- Never leave dangling Git conflict markers in source code.
- Do not run `git rebase --skip` unless you intentionally wish to discard all commits from your branch.

## Workflow
1. Identify conflicted files using `git status`.
2. Inspect each file under `zdiff3` style comparing Base, Ours, and Theirs.
3. Synthesize the unified code preserving both functional intents.
4. Run compiler and unit test suite to verify correctness.
5. Stage resolved files: `git add <files>`.
6. Resume operation: `git rebase --continue` or `git commit`.

## Expected Output
Properly resolved source code files with zero conflict markers, verified passing test suite, and completed rebase/merge.

## Validation Checklist
- [ ] Is `merge.conflictStyle zdiff3` utilized for ancestor inspection?
- [ ] Are all conflict marker strings completely deleted?
- [ ] Does the synthesized code preserve the valid intent of both branches?
- [ ] Does the test suite pass with zero syntax or assertion errors?
- [ ] Is the rebase/merge operation cleanly concluded?

## Common Mistakes & Antipatterns
- Blindly running `git checkout --ours .`, silently throwing away 3 days of a colleague's work.
- Accidentally leaving `<<<<<<< HEAD` in a file, which slips past code review and crashes the production build.
- Resolving syntax conflicts so the file parses, but introducing a logic bug because two variables were renamed differently in the two branches.

## Concrete Real-World Example
Scenario: A rebase conflict occurs on `package.json` where branch A added `zod` and branch B added `pydantic`, resulting in conflict markers.
Prompt: Resolve this merge conflict using three-way merge analysis.
Application: The AI inspects the base, sees neither dependency was present originally, recognizes that both dependencies are required by their respective new modules, keeps both dependencies in the merged JSON, removes conflict markers, runs `npm install`, and continues the rebase cleanly.
