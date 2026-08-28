# Tower Zeta6 Quick Start Guide

Use this guide after the administrator has shared the `z6-login` Tailscale
machine with you. The [complete PDF manual](manual/Tower-Zeta6-User-Manual.pdf)
explains policies and alternatives; the linked runbooks provide copyable files.

## 1. Apply and activate

1. Follow [Runbook 01: apply for an account](runbook/01-account-application/README.md).
2. Follow [Runbook 02: activate the Portal account](runbook/02-portal-activation/README.md).
3. Wait until the Portal reports **Provisioned**.

## 2. Register a key and connect

Follow [Runbook 03: SSH key and access](runbook/03-ssh-key-and-access/README.md).
Create a dedicated Ed25519 key, add only its `.pub` content to the Portal and
connect with:

```bash
ssh z6
```

You should land on `z6-login`. It intentionally has no GPU.

## 3. Prepare storage and Python

1. Locate your project directory using
   [Runbook 04](runbook/04-storage-and-transfer/README.md).
2. Create a virtual environment using
   [Runbook 05](runbook/05-python-environment/README.md).

Keep environments and code in your home directory. Keep datasets, checkpoints
and large outputs in your project directory.

## 4. Verify Slurm, then run on a GPU

Run the short allocation in [Runbook 06](runbook/06-interactive-allocation/README.md),
then clone these public examples and submit the
[single-GPU template](runbook/07-single-gpu-job/single-gpu.sbatch):

```bash
git clone https://github.com/barrydoooit/tower-zeta6-usermanual.git ~/tower-zeta6-usermanual
cd ~/tower-zeta6-usermanual
mkdir -p jobs logs
cp runbook/07-single-gpu-job/single-gpu.sbatch jobs/
cp runbook/07-single-gpu-job/gpu-smoke.py .
sbatch jobs/single-gpu.sbatch
```

For distributed PyTorch, use
[Runbook 08 and its two-GPU template](runbook/08-two-gpu-job/README.md).

## 5. Watch or cancel the job

Follow [Runbook 10](runbook/10-monitor-and-troubleshoot/README.md):

```bash
squeue -u "$USER"
tail -f logs/JOB_NAME-JOB_ID.out
scancel JOB_ID
```

All substantial CPU, memory and GPU work must run through Slurm.
