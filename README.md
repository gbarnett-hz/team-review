# team-review

An agent skill for rigorous, multi-persona code review of a PR, branch, diff, or specific code.

A team of reviewer subagents attacks the change from different angles (correctness, an adversary, a devil's advocate, tests, plus others the change warrants). An arbiter rules on which positions have merit. Team members can appeal or contest rulings with new evidence; the arbiter can consult the team and has the final say.

**No citation, no statement.** Every assertion from every agent must cite a `path:line`, commit, PR/issue, URL, or command output. Uncited statements are dropped.

The output is a table of strong positions only:

| # | Position | Location | Severity | Angle | Raised by | Evidence | Fix |
|---|---|---|---|---|---|---|---|

## Install

```sh
npx skills add gbarnett-hz/team-review -g
```

Uses the [skills](https://skills.sh) CLI. Drop `-g` to install into the current project instead. Add `-a claude-code` (or another agent) to skip the agent prompt.

## Use

In Claude Code:

```
/team-review 1234
/team-review https://github.com/owner/repo/pull/1234
/team-review main...my-branch
/team-review src/cache/Segment.java
```

Or ask in prose: "team review this PR", "rigorous review of this branch".

The decision is written to `team-review-<run-id>.md` in the working directory and printed inline. For a PR, it then asks whether to post the in-scope strong positions as inline review comments; nothing is posted without your yes.

Requires `gh` (authenticated) for PR targets, and an agent with subagent, shell, and web tools.
