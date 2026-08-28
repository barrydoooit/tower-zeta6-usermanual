import os

import torch
import torch.distributed as dist


dist.init_process_group(backend="nccl")
local_rank = int(os.environ["LOCAL_RANK"])
torch.cuda.set_device(local_rank)
value = torch.tensor([float(dist.get_rank() + 1)], device="cuda")
dist.all_reduce(value)
print(
    f"rank={dist.get_rank()} local_rank={local_rank} "
    f"device={torch.cuda.get_device_name(local_rank)} sum={value.item()}"
)
dist.destroy_process_group()
