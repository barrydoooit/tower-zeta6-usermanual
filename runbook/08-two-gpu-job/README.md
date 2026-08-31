# Runbook 08 — Submit a two-GPU PyTorch job

Use this runbook only when the Portal Account page shows **Maximum concurrent
GPUs: 2**. The default allocation is one; Slurm immediately rejects a two-GPU
job from a one-GPU account with an explicit limit message.

This template uses one Slurm task to start two local `torchrun` workers. Copy
[`two-gpu-torchrun.sbatch`](two-gpu-torchrun.sbatch) and
[`ddp-smoke.py`](ddp-smoke.py) into the same project directory:

```bash
mkdir -p jobs logs
cp two-gpu-torchrun.sbatch jobs/
cp ddp-smoke.py .
sbatch jobs/two-gpu-torchrun.sbatch
```

The template requests both Z6 GPUs, 16 CPUs and 96 GiB. It does not request
exclusive ownership of all CPU and memory resources. Add `--exclusive` only if
the workload genuinely requires node-wide isolation and the administrator has
agreed.

Replace `ddp-smoke.py` with a training entry point that supports PyTorch
Distributed. Framework-specific launchers may require different Slurm task
layouts; do not copy a Snellius partition or launcher convention blindly.

Next: [Runbook 09](../09-job-arrays/README.md).
