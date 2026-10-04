# Quick Start Guide: Updating Templates & Uploading to GitHub

**For non-technical users who want to keep templates current**

---

## 📋 What This Workspace Does

The **COPilot_Template** workspace is your central place to:
- ✏️ Update agent and instruction files
- 📤 Upload changes to GitHub 
- 📊 Track what changed and when
- 🔄 Sync updates to all your workspaces

**Think of it like a master control panel for all your templates.**

---

## 🚀 Getting Started

### Open the Workspace

1. Open **VS Code**
2. Click **File → Open Folder**
3. Choose: `D:\COPilot Workspaces\COPilot_Template`
4. Click **Open**

VS Code will load with all the template files ready to edit.

---

## 📝 How to Update Files

### Step 1: Find the File to Edit

In the left sidebar, you'll see folders:
- **agents/** — The 4 agent files
- **instructions/** — The 5 instruction files

Click on any file to open it in the editor.

**Example files:**
- `agents/SQL-Server-admin.agent.md` — SQL Server expert configuration
- `instructions/SQL-Server-admin.instructions.md` — SQL Server detailed guidelines
- `instructions/T-SQL-Coding-Style-Guide.md` — SQL coding standards

### Step 2: Make Your Changes

1. Click the file in the left sidebar to open it
2. Edit the text like you would in any document
3. Make your changes (add, delete, rewrite sections)
4. The file will show a white dot when unsaved

**Example changes:**
- Add new best practices
- Update links or references
- Fix typos or formatting
- Add code examples

### Step 3: Save Your Changes

- Press `Ctrl+S` to save
- The white dot disappears when saved
- Or you can press `Ctrl+Shift+S` to save all files at once

---

## 📤 How to Upload to GitHub

### The Easy Way: One-Click Upload (Recommended)

1. At the top of VS Code, press `Ctrl+Shift+B` 
   - A menu will appear with options
2. Select **"Template: Full Update Workflow"**
3. A terminal window opens at the bottom
4. Type a brief description of what you changed:
   ```
   Example: "Update SQL Server Admin agent with new best practices"
   ```
5. Press **Enter**
6. Wait for the green checkmark ✓
7. **Done!** Your changes are now on GitHub

**That's it. No other steps needed.**

---

### The Manual Way: Step-by-Step (If You Prefer)

If you want to see what's happening at each step:

**Step 1: Check What Changed**
- Press `Ctrl+Shift+B`
- Select **"Git: Status"**
- Terminal shows all modified files

**Step 2: Stage Changes**
- Press `Ctrl+Shift+B`
- Select **"Git: Add All Changes"**
- Terminal confirms changes are ready

**Step 3: Create a Commit (Save Point)**
- Press `Ctrl+Shift+B`
- Select **"Git: Commit Changes"**
- Type your message (description of changes)
- Press Enter

**Step 4: Upload to GitHub**
- Press `Ctrl+Shift+B`
- Select **"Git: Push to GitHub"**
- Terminal shows "Everything up-to-date" or similar
- **Done!**

---

## 💡 Tips for Writing Good Update Messages

When you upload, you'll be asked: **"What did you change?"**

Write a brief, clear message:

**✓ Good examples:**
- "Add new best practices for performance tuning"
- "Update PowerShell script guidelines with v7.4 improvements"
- "Fix formatting in T-SQL Coding Style Guide"
- "Add Windows Server 2022 security hardening tips"

**✗ Avoid:**
- "stuff" (too vague)
- "fix" (doesn't say what)
- Just pressing Enter with no message

---

## 📊 How to Track Changes

### View Your Upload History

1. Press `Ctrl+Shift+B`
2. Select **"Git: Status"**
3. Terminal shows recent uploads and what changed

### View on GitHub

1. Open your web browser
2. Go to: `https://github.com/YOUR-USERNAME/Workspace-Templates`
3. You'll see a list of all uploads with dates and descriptions
4. Click on any upload to see exactly what changed

---

## 🔄 How Updates Flow to Your Other Workspaces

Once you upload to GitHub, here's how it spreads:

```
You edit in COPilot_Template
         ↓
You upload to GitHub
         ↓
Other workspaces pull the updates
         ↓
Everyone gets the latest version
```

**To pull updates into another workspace:**

1. Open the workspace (e.g., "SQL Queries")
2. Open PowerShell in that folder
3. Run: `.\Check-WorkspaceUpdates.ps1 -AutoUpdate -BackupFiles`
4. Files are updated automatically

---

## ⚠️ Before You Start: Important Notes

### What Files You CAN Edit
✓ Agent files (`.agent.md`)
✓ Instruction files (`.instructions.md`)
✓ Configuration files (`.copilot-instructions.md`, `README.md`)
✓ CHANGELOG.md

### What Files You Should NOT Edit
✗ `.git/` folder (system folder)
✗ `.vscode/` folder (only if you know what you're doing)
✗ Backup files (`.backup.md`)

### Before Making Changes
- You should already have a GitHub account
- Your workspace should already be connected to GitHub
- If not, ask your administrator first

---

## 🆘 Common Questions

### Q: I edited a file but it's not showing my changes
**A:** Make sure you saved it. Press `Ctrl+S` or look for the white dot next to the filename (means unsaved).

### Q: I messed up an edit, how do I undo?
**A:** 
- Single action: Press `Ctrl+Z` to undo
- Multiple actions: Keep pressing `Ctrl+Z` until it's fixed
- Before uploading: Click the file in Source Control and select "Discard Changes"

### Q: What if I upload something wrong?
**A:** Don't worry. Your changes are saved with history. You can:
- Edit the file again and upload a correction
- Or ask your administrator to revert (go back to previous version)

### Q: How often should I check for updates?
**A:** 
- Weekly recommended (automatically done for you)
- Or when you know someone made changes
- The system will notify you if updates are available

### Q: Can I edit multiple files at once?
**A:** Yes! Open multiple files in tabs, edit them all, then upload everything together. The system handles it.

### Q: Do I need to understand Git?
**A:** No. The "Template: Full Update Workflow" button does everything for you. You just need to:
1. Edit files
2. Click the button
3. Type what you changed
4. Done

---

## 📋 Quick Checklist: My First Update

```
☐ Open VS Code
☐ Open folder: D:\COPilot Workspaces\COPilot_Template
☐ Click a file to edit (e.g., agents/SQL-Server-admin.agent.md)
☐ Make your changes
☐ Save: Press Ctrl+S
☐ Upload: Press Ctrl+Shift+B → Select "Template: Full Update Workflow"
☐ Type a message (e.g., "Add new best practices")
☐ Press Enter
☐ Wait for green checkmark ✓
☐ Check GitHub to see your changes (optional)
☐ Done!
```

---

## 🎯 Typical Update Workflow

**Time needed: 5-10 minutes for a typical update**

1. **Identify what changed** (2 min)
   - Note down updates needed
   - Know which files need changes

2. **Make the edits** (3-5 min)
   - Open file
   - Add/update content
   - Save

3. **Upload to GitHub** (1 min)
   - Press `Ctrl+Shift+B`
   - Select "Template: Full Update Workflow"
   - Type message
   - Done

4. **Optional: Verify** (1 min)
   - Check GitHub website to confirm
   - Tell others updates are available

---

## 📞 Need Help?

If something doesn't work:

1. **Check the file was saved** — `Ctrl+S`
2. **Try the simple workflow again** — `Ctrl+Shift+B` → "Template: Full Update Workflow"
3. **Check your internet** — GitHub needs connection
4. **Look at the error message** — It usually tells you what's wrong
5. **Contact administrator** — If still stuck

---

## 🎓 What Happens Behind the Scenes (Optional Reading)

If you're curious how this works:

- **Your edits** are saved to files
- **Upload button** sends them to GitHub (the internet storage)
- **GitHub** keeps a history of every change
- **Check-WorkspaceUpdates.ps1** in other workspaces pulls the latest from GitHub
- **Every workspace** stays in sync automatically

**But you don't need to understand this to use it. Just:**
- Edit → Upload → Done ✓

---

## 📚 Related Guides

- **WORKSPACE-README.md** — More technical details about the workspace
- **CHANGELOG.md** — History of all template updates
- **MAINTENANCE.md** — How templates are kept current across workspaces

---

**Last Updated: 2026-10-04**

*This guide is for users who just want to update templates. No technical knowledge required.*
