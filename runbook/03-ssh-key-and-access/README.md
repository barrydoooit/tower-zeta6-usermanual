# Runbook 03 — Configure an SSH key and connect

Create a dedicated, passphrase-protected Ed25519 key.

Windows PowerShell:

```powershell
ssh-keygen -t ed25519 -a 64 -f "$env:USERPROFILE\.ssh\z6_ed25519" -C "your.name@z6"
Get-Content "$env:USERPROFILE\.ssh\z6_ed25519.pub"
```

macOS or Linux:

```bash
ssh-keygen -t ed25519 -a 64 -f ~/.ssh/z6_ed25519 -C "your.name@z6"
cat ~/.ssh/z6_ed25519.pub
```

In the Portal, open **Account**, select **Add key**, name the device and paste
the complete one-line public key. Never upload the file without `.pub`.

Copy [`ssh-config.example`](ssh-config.example) into your SSH configuration,
replace `YOUR_LINUX_USERNAME`, then run `ssh z6`. Verify the first-contact
ED25519 fingerprint with the administrator:

```text
SHA256:RPjy+qUOX/92xw55a8WmcaY2cXV4x1gbtUcs6mqILH0
```

Stop and contact the administrator if SSH later reports a changed host key.

Next: [Runbook 04](../04-storage-and-transfer/README.md).
