# User Guide: Updating Templates (Visual Workflow)

**Simple, step-by-step guide with pictures in words**

---

## 🎯 The Whole Process in One Picture

```
START
  ↓
[Open VS Code]
  ↓
[Open COPilot_Template Workspace]
  ↓
[Find & Click File to Edit]
  ↓
[Make Changes]
  ↓
[Save with Ctrl+S]
  ↓
[Press Ctrl+Shift+B]
  ↓
[Select "Template: Full Update Workflow"]
  ↓
[Type What You Changed]
  ↓
[Press Enter]
  ↓
[Wait for ✓ Green Checkmark]
  ↓
[DONE! ✓ GitHub is Updated]
  ↓
[Other workspaces will get update automatically]
END
```

---

## 📱 Step-by-Step Visual Guide

### Step 1: Open VS Code

```
Your Computer
    ↓
Find VS Code icon
    ↓
Click it
    ↓
VS Code opens
```

### Step 2: Open the Template Workspace

```
VS Code menu bar
    ↓
Click "File"
    ↓
Click "Open Folder"
    ↓
Navigate to:
D:\COPilot Workspaces\COPilot_Template
    ↓
Click "Open"
    ↓
Workspace loads (sidebar shows files)
```

### Step 3: Open File You Want to Edit

```
Left Sidebar
    ↓
You see folders:
  📁 agents/
  📁 instructions/
    ↓
Click the folder you need
    ↓
Click the file name
    ↓
File opens in editor (center of screen)
```

### Step 4: Make Your Changes

```
File is now open in editor
    ↓
Read the current content
    ↓
Add new text
  OR
Delete old text
  OR
Change existing text
    ↓
You can edit like in Word or Notepad
```

### Step 5: Save Your Work

```
After editing, press: Ctrl+S
    ↓
OR
    ↓
Look for white dot next to filename (means unsaved)
    ↓
White dot disappears = File saved ✓
```

### Step 6: Upload to GitHub

```
Press: Ctrl+Shift+B
    ↓
Menu appears with options
    ↓
Select: "Template: Full Update Workflow"
    ↓
Terminal window opens at bottom of screen
    ↓
Wait for message asking: "Enter commit message"
    ↓
Type what you changed
  Example: "Add new SQL best practices"
    ↓
Press: Enter
    ↓
Terminal shows progress
    ↓
Look for: ✓ Success message
    ↓
DONE!
```

### Step 7: Verify (Optional)

```
Open web browser
    ↓
Go to: https://github.com/YOUR-USERNAME/Workspace-Templates
    ↓
You'll see your changes listed
    ↓
Timestamp shows when you uploaded
    ↓
Confirmation: It worked!
```

---

## 📂 Where Are the Files?

### Folder Layout

```
COPilot_Template Workspace
│
├── 📁 agents/
│   ├── SQL-Server-admin.agent.md          ← Edit these
│   ├── powershell-dev.agent.md            ← Edit these
│   ├── windows-server-admin.agent.md      ← Edit these
│   └── communications-recruiter.agent.md  ← Edit these
│
├── 📁 instructions/
│   ├── SQL-Server-admin.instructions.md        ← Edit these
│   ├── powershell-dev.instructions.md          ← Edit these
│   ├── windows-server-admin.instructions.md    ← Edit these
│   ├── communications-recruiter.instructions.md ← Edit these
│   └── T-SQL-Coding-Style-Guide.md             ← Edit these
│
├── 📁 .vscode/                                ← Don't edit
│   ├── settings.json                          ← Don't edit
│   ├── tasks.json                             ← Don't edit
│   ├── git-commit.ps1                         ← Don't edit
│   └── update-and-push.ps1                    ← Don't edit
│
├── 📁 docs/                                   ← Optional: Add docs here
│
├── .workspace-config.json                     ← Don't edit
├── CHANGELOG.md                               ← Update when done
├── QUICK-START-GUIDE.md                       ← You're reading related to this
├── QUICK-REFERENCE-CARD.md                    ← Quick lookup
└── WORKSPACE-README.md                        ← Technical details
```

**The files you'll edit 99% of the time:**
- `agents/SQL-Server-admin.agent.md`
- `agents/powershell-dev.agent.md`
- `instructions/SQL-Server-admin.instructions.md`
- `instructions/powershell-dev.instructions.md`
- And others in `agents/` and `instructions/` folders

---

## 🎬 Example: Real Workflow

### Scenario: Adding a new SQL best practice

**1. Open the workspace**
```
File → Open Folder → D:\COPilot Workspaces\COPilot_Template
```

**2. Find the right file**
```
Left sidebar → instructions/ → SQL-Server-admin.instructions.md
```

**3. Click to open**
```
File appears in center of screen
Look for section called "Best Practices"
```

**4. Make your change**
```
Position cursor at the end of existing best practices
Type your new practice:
  - "Always validate query plans before production deployment"
```

**5. Save**
```
Press Ctrl+S
(File is now saved)
```

**6. Upload**
```
Press Ctrl+Shift+B
Click "Template: Full Update Workflow"
Terminal asks for message
Type: "Add query validation best practice"
Press Enter
```

**7. Done!**
```
Terminal shows: ✓ Success
Your change is now on GitHub
```

---

## ❌ What NOT to Do

```
❌ Edit files in .vscode/ folder
❌ Edit .git folder
❌ Create new agent files without asking
❌ Delete .workspace-config.json
❌ Upload without saving first
❌ Try to upload with no internet
❌ Edit files and forget to save before uploading
```

---

## ✅ Common Tasks

### "I want to add a new best practice"
```
1. Open instructions file
2. Find the section
3. Add your text
4. Save (Ctrl+S)
5. Upload (Ctrl+Shift+B → Template: Full Update Workflow)
```

### "I found a typo and need to fix it"
```
1. Open the file
2. Find the typo
3. Fix it
4. Save (Ctrl+S)
5. Upload (Ctrl+Shift+B → Template: Full Update Workflow)
   Message: "Fix typo in [filename]"
```

### "I want to update an agent configuration"
```
1. Open agents/ folder
2. Click the agent file
3. Update the content
4. Save (Ctrl+S)
5. Upload (Ctrl+Shift+B → Template: Full Update Workflow)
   Message: "Update [agent name] with [what changed]"
```

### "I made a mistake and need to undo"
```
BEFORE uploading:
  1. Press Ctrl+Z multiple times to undo
  2. Save again (Ctrl+S)
  3. Then upload
  
AFTER uploading:
  1. Edit the file again with correct info
  2. Save (Ctrl+S)
  3. Upload with message: "Fix: [what was wrong]"
```

---

## 📊 What Happens After You Upload

```
You upload to GitHub
         ↓
GitHub stores your changes
         ↓
Change is recorded with date and time
         ↓
Other people can see what changed
         ↓
When other workspaces run update check:
   Check-WorkspaceUpdates.ps1
         ↓
They automatically get your latest files
         ↓
Everyone stays in sync!
```

---

## 🔔 When to Update Templates

**Update templates when:**
- You discover a new best practice
- You find an error that needs fixing
- Your team agrees on new standards
- A new tool or version requires documentation
- You want to share knowledge with the team

**Timing:**
- No rush — update when you find things to improve
- Can batch multiple changes into one upload
- Weekly reviews recommended

---

## 💭 Before You Start

### Questions to Ask Yourself

```
1. Do I have edit permission for this file?
   → If not, ask your administrator first
   
2. Do I have internet connection?
   → You need it to upload to GitHub
   
3. Have I saved my changes?
   → Always save (Ctrl+S) before uploading
   
4. Do I know what I changed?
   → You'll need to write a message about it
```

---

## 🆘 Troubleshooting

### Upload failed or didn't work?

```
Check #1: Is file saved?
  → Press Ctrl+S

Check #2: Do you have internet?
  → Open browser, try visiting a website

Check #3: Is VS Code still showing terminal?
  → Terminal appears at bottom when running task
  → Look for green ✓ checkmark

Check #4: Did you enter a commit message?
  → If prompted "Enter commit message"
  → Type something and press Enter

If still stuck:
  → Ask your administrator for help
```

### File looks wrong after opening?

```
Solution #1: Refresh
  → Press F5

Solution #2: Close and reopen
  → Right-click file in sidebar
  → Click "Close"
  → Click file again to reopen

Solution #3: Check you're in right workspace
  → Top of window should show: "COPilot_Template"
```

---

## 📞 Getting Help

### If something doesn't work:

1. **Read error message** — Usually tells you what's wrong
2. **Check QUICK-REFERENCE-CARD.md** — Faster lookup
3. **Read QUICK-START-GUIDE.md** — Full detailed guide
4. **Contact administrator** — If truly stuck

### Common error messages:

| Error | Meaning | Fix |
|-------|---------|-----|
| "No changes to commit" | Nothing was edited | Make sure file is saved |
| "Permission denied" | Can't write to GitHub | Check GitHub credentials |
| "Not a git repository" | Workspace not connected | Ask administrator |
| "Connection timeout" | No internet | Check WiFi/connection |

---

## 🎓 Key Takeaways

```
✓ Edit files in VS Code like normal
✓ Save with Ctrl+S
✓ Upload with Ctrl+Shift+B (choose "Full Update Workflow")
✓ Type message about changes
✓ Press Enter
✓ Look for green ✓ checkmark
✓ Done!

NO git knowledge required.
NO command line needed.
NO technical background needed.

Just: Edit → Save → Upload
```

---

**Summary: It's as simple as editing a Word document and saving to the cloud.**

*Questions? See QUICK-START-GUIDE.md or contact your administrator.*
