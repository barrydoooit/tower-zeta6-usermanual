# Tower Zeta6 acceptable-use policy

Status: interim policy for the controlled pilot, 28 August 2026.

## Accounts and security

- Access is personal and limited to the approved research purpose.
- Do not share Portal accounts, private SSH keys or Tailscale invitations.
- Register only public keys and revoke a lost or retired key immediately.
- Do not bypass Tailscale, expose services, scan networks or attempt to gain
  additional privileges.
- Stop and contact the administrator after an unexpected SSH host-key change.

## Compute

- Run substantial CPU, memory or GPU work through Slurm. The login VM is for
  editing, environment setup, transfers and job management.
- Request wall time, GPUs, CPUs and memory honestly. A GPU must be requested
  with `--gpus=N` or `--gres=gpu:N`.
- Do not request `--exclusive` unless it is technically needed and agreed.
- Checkpoint long work and discuss jobs expected to exceed 24 hours.
- Cancel broken, idle or unnecessary jobs promptly.
- Never interfere with another user's processes, files or jobs.

## Storage and data

- Keep code, environments and small active files in `/home/<user>`.
- Keep approved datasets, checkpoints and outputs in `/projects/<project>`.
- Observe quotas and remove disposable duplicates and caches first.
- Neither filesystem is a backup; maintain an approved off-host copy.
- Never put credentials, private keys or tokens in repositories, batch scripts
  or world-readable files.
- Sensitive, personal, licensed or export-controlled data requires prior
  approval and applicable TU Delft/project controls.

## Fair use and enforcement

Z6 has one compute node and two GPUs. Avoid speculative queue flooding and
follow administrator scheduling decisions. The administrator may cancel jobs,
drain the node or suspend access to protect the service, data or other users.
Suspension does not by itself authorize data deletion.

Report incidents to `b.y.ding@tudelft.nl` with the relevant job ID and log path,
never with secrets.
