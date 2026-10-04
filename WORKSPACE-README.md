# COPilot_Template Workspace

**Central management workspace for Copilot agent and instruction templates**

A complete workspace for managing, updating, and deploying Copilot agent and instruction files to GitHub. This workspace provides everything needed to keep your specialized AI agents current across all your work environments.

---

## 📖 Documentation Quick Links

**Start here if you're new:**
- [DOCUMENTATION-INDEX.md](DOCUMENTATION-INDEX.md) — Choose the right guide for your learning style
- [QUICK-START-GUIDE.md](QUICK-START-GUIDE.md) — Complete step-by-step tutorial (5-10 minutes)

**Quick reference:**
- [QUICK-REFERENCE-CARD.md](QUICK-REFERENCE-CARD.md) — Fast lookup (2 minutes)

**Visual learners:**
- [VISUAL-WORKFLOW-GUIDE.md](VISUAL-WORKFLOW-GUIDE.md) — Flowcharts and diagrams (5-10 minutes)

---

## 🎯 Purpose

This workspace centralizes management of:

- ✏️ **Agent Definitions** — Copilot agent configurations (.agent.md files)
- 📋 **Instructions** — Detailed expertise guidelines (.instructions.md files)
- 📤 **Version Control** — Track changes and history via GitHub
- 🔄 **Distribution** — Sync templates across all your workspaces
- 📊 **Change Tracking** — CHANGELOG documenting all updates

---

## 📁 File Structure

```
COPilot_Template/
│
├── 📁 agents/                          ← Edit agent configurations
│   ├── SQL-Server-admin.agent.md
│   ├── powershell-dev.agent.md
│   ├── windows-server-admin.agent.md
│   └── communications-recruiter.agent.md
│
├── 📁 instructions/                    ← Edit instruction files
│   ├── SQL-Server-admin.instructions.md
│   ├── powershell-dev.instructions.md
│   ├── windows-server-admin.instructions.md
│   ├── communications-recruiter.instructions.md
│   └── T-SQL-Coding-Style-Guide.md
│
├── 📁 .vscode/                         ← VS Code configuration
│   ├── settings.json                   (Editor settings)
│   ├── tasks.json                      (Git automation tasks)
│   ├── git-commit.ps1                  (Commit script)
│   └── update-and-push.ps1             (Upload workflow)
│
├── 📁 docs/                            ← Optional: Additional documentation
│
├── .workspace-config.json              (Configuration manifest)
├── CHANGELOG.md                        (Version history)
├── WORKSPACE-README.md                 (This file)
│
├── DOCUMENTATION-INDEX.md              (Guide selector)
├── QUICK-START-GUIDE.md                (Detailed tutorial)
├── QUICK-REFERENCE-CARD.md             (Quick lookup)
└── VISUAL-WORKFLOW-GUIDE.md            (Diagram guide)
```

---

## 🚀 Quick Start

### First Time Using This Workspace?

1. **Open this workspace** in VS Code
2. **Read** [QUICK-START-GUIDE.md](QUICK-START-GUIDE.md) (takes 5-10 minutes)
3. **Edit a file** (e.g., agents/SQL-Server-admin.agent.md)
4. **Save** (Ctrl+S)
5. **Upload** (Ctrl+Shift+B → "Template: Full Update Workflow")
6. **Done!** Changes are on GitHub

### Experienced Users?

Just use [QUICK-REFERENCE-CARD.md](QUICK-REFERENCE-CARD.md) — it's a quick reference you can print and keep handy.

---

## 📝 What You Can Edit

**✓ Safe to edit:**
- All files in `agents/` folder
- All files in `instructions/` folder
- CHANGELOG.md
- Documentation files

**✗ Don't edit:**
- Files in `.vscode/` folder (system configuration)
- Files in `.git/` folder (version control)
- `.workspace-config.json` (unless you know what you're doing)

---

## 🔄 Available VS Code Tasks

Press `Ctrl+Shift+B` to see all available tasks:

| Task | Use When |
|------|----------|
| **Template: Full Update Workflow** | ⭐ **Use this** — Automatically handles everything |
| Git: Status | You want to see what changed |
| Git: Add All Changes | You want to manually stage files |
| Git: Commit Changes | You want to manually create a save point |
| Git: Push to GitHub | You want to manually upload |

**Recommendation:** Use "Template: Full Update Workflow" — it handles all steps automatically.

---

## 📤 How to Upload Changes

### Automatic (Recommended)

1. Edit files
2. Save (Ctrl+S)
3. Press `Ctrl+Shift+B`
4. Select **"Template: Full Update Workflow"**
5. Type what you changed
6. Press Enter
7. **Done!** ✓

### Manual (If You Prefer)

1. `Ctrl+Shift+B` → Git: Status
2. `Ctrl+Shift+B` → Git: Add All Changes
3. `Ctrl+Shift+B` → Git: Commit Changes
4. `Ctrl+Shift+B` → Git: Push to GitHub

---

## 🔗 GitHub Repository

Your templates are stored in GitHub at:
```
https://github.com/YOUR-USERNAME/Workspace-Templates
```

**To verify changes:**
1. Open browser
2. Go to above URL
3. Look for your changes with timestamp
4. Click commit to see what changed

---

## 🎯 Common Workflows

### "I want to add a new best practice"

1. Open `instructions/SQL-Server-admin.instructions.md` (or relevant file)
2. Find the section
3. Add your text
4. Save (Ctrl+S)
5. Upload: Ctrl+Shift+B → "Template: Full Update Workflow"
6. Type message: "Add new best practice: [description]"
7. Press Enter

### "I want to fix a typo"

1. Open the file with the typo
2. Fix it
3. Save (Ctrl+S)
4. Upload: Ctrl+Shift+B → "Template: Full Update Workflow"
5. Type message: "Fix typo in [filename]"
6. Press Enter

### "I want to update an agent configuration"

1. Open `agents/[agent-name].agent.md`
2. Update the content
3. Save (Ctrl+S)
4. Upload: Ctrl+Shift+B → "Template: Full Update Workflow"
5. Type message: "Update: [agent name] - [what changed]"
6. Press Enter

---

## ⚙️ Technical Details

### How Updates Flow

```
You edit in COPilot_Template
         ↓
You upload to GitHub (Ctrl+Shift+B → Full Update Workflow)
         ↓
GitHub stores your changes with timestamp
         ↓
Other workspaces pull updates:
  .\Check-WorkspaceUpdates.ps1 -AutoUpdate
         ↓
All workspaces stay synchronized automatically
```

### Configuration

The `.workspace-config.json` file tracks:
- **Version** — Current template version (e.g., 1.0.0)
- **Files** — Which files are managed by the system
- **UpdateStrategy** — How updates are handled (auto or manual)
- **CheckInterval** — How often to check for updates (days)
- **SourceRepository** — GitHub repo URL for pulling updates

### Workspace Tasks

The `.vscode/tasks.json` defines:
- Git operations (status, add, commit, push)
- "Template: Full Update Workflow" — Automated workflow
- Each task runs PowerShell scripts

### PowerShell Scripts

- `git-commit.ps1` — Interactive commit with status display
- `update-and-push.ps1` — Complete workflow (add → commit → push)

---

## 📞 Troubleshooting

### Upload failed?

✓ **Check #1:** Is file saved? (Ctrl+S)  
✓ **Check #2:** Do you have internet?  
✓ **Check #3:** Is VS Code showing a terminal at the bottom?  
✓ **Check #4:** Did you enter a commit message when prompted?

### Changes not appearing on GitHub?

1. Reload VS Code: `Ctrl+K Ctrl+R`
2. Check the terminal output for errors
3. Try the manual workflow (Ctrl+Shift+B → Git: Push to GitHub)

### Files look wrong after opening?

1. Press `F5` to refresh
2. Close file and reopen it
3. Make sure you're in the right workspace

---

## 🎓 For Administrators

### Setting Up a New Workspace

```powershell
# Run this script to create a new workspace from template
.\scripts\New-WorkspaceFromTemplate.ps1 -WorkspaceName "YourWorkspaceName"
```

### Updating All Workspaces

```powershell
# All workspaces automatically sync when running:
.\Check-WorkspaceUpdates.ps1 -AutoUpdate
```

### Connecting to GitHub

Make sure you have:
1. GitHub account
2. Git installed on your computer
3. SSH keys configured (or use HTTPS credentials)
4. Permission to push to the repository

---

## 📚 Related Documentation

- [DOCUMENTATION-INDEX.md](DOCUMENTATION-INDEX.md) — Guide selector
- [QUICK-START-GUIDE.md](QUICK-START-GUIDE.md) — Complete tutorial
- [QUICK-REFERENCE-CARD.md](QUICK-REFERENCE-CARD.md) — Quick lookup
- [VISUAL-WORKFLOW-GUIDE.md](VISUAL-WORKFLOW-GUIDE.md) — Diagram guide
- [CHANGELOG.md](CHANGELOG.md) — Version history
- [.workspace-config.json](.workspace-config.json) — Configuration file

---

## ✅ Checklist: First Time Setup

```
☐ Read DOCUMENTATION-INDEX.md
☐ Read QUICK-START-GUIDE.md
☐ Make a small test edit to a file
☐ Save with Ctrl+S
☐ Upload with Ctrl+Shift+B → "Template: Full Update Workflow"
☐ Type a test message
☐ Check GitHub to confirm upload
☐ Open another workspace and run update check
☐ Verify new files are synced
☐ You're ready to use the system!
```

---

**Version:** 1.0.0  
**Last Updated:** 2026-10-04  
**Repository:** [GitHub: Workspace-Templates](https://github.com/YOUR-USERNAME/Workspace-Templates)
