# Runbook 06 — Test an interactive allocation

Use a short allocation for diagnostics, never an unallocated login-shell
process.

CPU-only shell:

```bash
srun --partition=gpu --time=00:30:00 --ntasks=1 \
  --cpus-per-task=4 --mem=16G --pty bash
```

One-GPU shell:

```bash
srun --partition=gpu --time=00:30:00 --gpus=1 --ntasks=1 \
  --cpus-per-task=4 --mem=16G --pty bash
```

Inside the GPU allocation:

```bash
echo "$SLURM_JOB_ID"
echo "$CUDA_VISIBLE_DEVICES"
nvidia-smi -L
```

Only the allocated GPU should be visible. Exit promptly when testing is done.
For long work, use `sbatch` instead of keeping an interactive terminal open.

Next: [Runbook 07](../07-single-gpu-job/README.md).
