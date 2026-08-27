#!/bin/bash
nvidia-smi
python -c "import torch; print('PyTorch GPU disponible:', torch.cuda.is_available())"
