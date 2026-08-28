import torch


device = torch.device("cuda")
left = torch.randn((2048, 2048), device=device)
right = torch.randn((2048, 2048), device=device)
result = left @ right
torch.cuda.synchronize()
print(f"device={torch.cuda.get_device_name(0)} result_mean={result.mean().item():.6f}")
