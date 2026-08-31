# Runbook 02 — Activate the Portal account

1. Open the one-time activation link from the approval email.
2. Set a unique Portal password.
3. Sign in and confirm the request status is **Provisioned**.
4. Record the approved project path, storage quotas and maximum concurrent GPU
   count shown on the Account page.

The Portal password is only for the website. Linux password authentication is
disabled; SSH uses your registered public key.

Password management:

- Change a known password: `https://z6-login.tail8da8d4.ts.net/password/change/`
- Reset a forgotten password: `https://z6-login.tail8da8d4.ts.net/password/reset/`

If the message is absent, check spam before asking the administrator to resend
it. Never ask for or expect a plaintext Linux password.

Next: [Runbook 03](../03-ssh-key-and-access/README.md).
