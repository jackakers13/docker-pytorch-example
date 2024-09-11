# Docker Example with PyTorch

### Install
- https://docs.docker.com/engine/install/
- https://docs.docker.com/engine/install/linux-postinstall/
- `docker run hello-world`

### Install NVIDIA Container Toolkit
- https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html
- `sudo nvidia-ctk runtime configure --runtime=docker`
- `sudo systemctl restart docker`

### (Optional - this is how you would do it if you weren't using a custom image)
- `docker pull pytorch/pytorch:2.4.1-cuda11.8-cudnn9-devel`
### Required - build and run custom image derived from official
- `./docker-build.sh`
- `./docker-run.sh`
- `python3 ./pytorch_example.py`
