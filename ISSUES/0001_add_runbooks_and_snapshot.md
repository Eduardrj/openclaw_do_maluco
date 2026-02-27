Title: Add runbooks and automatic snapshot script

Description:
We added an initial runbook and an automatic snapshot script to capture OpenClaw operational context between shifts.

What was added:
- scripts/openclaw-snapshot.sh : automatic snapshot generator (saves snapshots and state hashes)
- runbooks/gogcli-oauth.md : runbook for gogcli OAuth/keyring handling
- README.md : repository description and quickstart
- .github/pull_request_template.md : PR checklist for handovers

Why:
Automate session/context capture to reduce time-to-recovery and ensure handovers between operators/models preserve necessary operational state.

Next steps:
- Review the runbook and script
- Install the snapshot script in ~/.local/bin and add trap to ~/.bashrc
- (Optional) Create a remote GitHub repository 'openclaw_do_maluco' and push these files
- Create a GitHub Actions workflow to run snapshot on schedule or on session end

Acceptance criteria:
- Snapshot files appear in openclaw_do_maluco/snapshots when triggered
- current.json is generated and contains hashes of key config files
- Runbook includes steps to handle gogcli keyring and re-import tokens

Notes:
- This is a draft issue created locally. I can open it on GitHub if you authorize me to push/create issues in your repo; otherwise, run:
  gh repo create <your-username>/openclaw_do_maluco --public --source=./openclaw_do_maluco --remote=origin
  gh issue create --title "Add runbooks and automatic snapshot script" --body-file ISSUES/0001_add_runbooks_and_snapshot.md

Recorded by: Maluco (OpenClaw agent)
Date: 2026-02-27
