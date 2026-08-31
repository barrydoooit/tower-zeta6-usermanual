# Runbook 10 — Monitor, cancel and troubleshoot jobs

## Inspect and cancel

```bash
squeue -u "$USER"
scontrol show job JOB_ID
tail -f logs/JOB_NAME-JOB_ID.out
scancel JOB_ID
```

Cancel only your own job and only when it is broken or no longer needed.
Completed jobs disappear from `squeue`. Inspect a historical record with:

```bash
sacct -j JOB_ID --format=JobID,State,Elapsed,AllocTRES
```

Keep `%j` output and error logs as the durable experiment record.

## Common pending reasons

```bash
squeue -j JOB_ID -o "%.18i %.9P %.8T %.30R"
```

- `Resources`: another job holds a requested GPU, CPU or memory resource.
- `Priority`: the job is queued normally behind other work.
- `AssocGrpGRES`: your running jobs currently use your approved concurrent GPU
  allocation; the pending job starts after they release enough GPUs.
- An unrealistic request can prevent a job from fitting; compare it with the
  documented Z6 limits before reducing it.

## Common failures

- **CUDA unavailable:** confirm the script contains `--gpus=1` or `--gpus=2`,
  activates the intended environment and runs through Slurm.
- **GPU request denied with an account limit:** compare `--gpus`/`--gres` with
  **Maximum concurrent GPUs** on the Portal Account page. A two-GPU job requires
  an administrator-approved limit of two.
- **Host out of memory:** increase `--mem` within reason. This does not increase
  GPU memory.
- **CUDA out of memory:** reduce the batch/model size or use an appropriate
  distributed strategy.
- **Disk quota exceeded:** inspect `du` and the Portal storage display, then
  remove disposable caches, checkpoints or duplicate data.
- **Permission denied (publickey):** check the SSH username, selected private
  key and non-revoked Portal public key; allow about one minute for key sync.

When contacting `b.y.ding@tudelft.nl`, include the job ID and relevant log path,
but never a password, private key or token.
