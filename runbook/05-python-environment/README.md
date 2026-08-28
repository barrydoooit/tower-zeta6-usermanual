# Runbook 05 — Create a Python environment

## Current Z6 software model

Z6 currently exposes the `2026` site entry module and system Python 3.12.3. A
central Python/CUDA/cuDNN module stack has not yet been published. Create the
environment on `z6-login`; your home is shared with the compute node.

## Create and activate a virtual environment

```bash
source /etc/profile.d/lmod.sh
module purge
module load 2026

mkdir -p ~/venvs
python3 -m venv ~/venvs/z6-pytorch
source ~/venvs/z6-pytorch/bin/activate
python -m pip install --upgrade pip setuptools wheel
python --version
```

For a project that supplies a reviewed lock or requirements file, prefer it:

```bash
python -m pip install -r requirements.txt
```

For a new PyTorch environment, the currently documented Z6 baseline is the
official CUDA 12.8 wheel set:

```bash
python -m pip install \
  torch==2.11.0 torchvision==0.26.0 torchaudio==2.11.0 \
  --index-url https://download.pytorch.org/whl/cu128
```

The version pair and index come from the official
[PyTorch version matrix](https://pytorch.org/get-started/previous-versions/).
Do not mix independently chosen `torch`, `torchvision` and `torchaudio`
versions.

## Verify on an allocated GPU

The login VM has no GPU, so `torch.cuda.is_available()` is expected to be false
there. Verify through Slurm:

```bash
srun --partition=gpu --time=00:05:00 --gpus=1 --ntasks=1 \
  --cpus-per-task=2 --mem=4G \
  bash -lc 'source ~/venvs/z6-pytorch/bin/activate && python - <<"PY"
import torch
print("torch:", torch.__version__)
print("wheel CUDA:", torch.version.cuda)
print("CUDA available:", torch.cuda.is_available())
assert torch.cuda.is_available()
print("device:", torch.cuda.get_device_name(0))
PY'
```

Record dependencies after a successful setup:

```bash
python -m pip freeze > requirements-lock.txt
```

Next: [Runbook 06](../06-interactive-allocation/README.md).
