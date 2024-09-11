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

# Moving to Nautilus/Kubernetes

### Install
- `snap install kubectl --classic`
  - For other installation options: https://kubernetes.io/docs/tasks/tools/

### Build Docker Image on Nautilus GitLab
- Make an account or sign in to https://gitlab.nrp-nautilus.io/
- For normal use:
    - Make a new repo
    - Git push this to there
- For just this example:
    - I already have this available at https://gitlab.nrp-nautilus.io/jdapm8/docker-pytorch-example

### Run Kubernetes Job
- Get config from https://portal.nrp-nautilus.io/
  - Save as `~/.kube/config`
- Edit `kubernetes_idle.yml`, `kubernetes_job.yml`, and `kubernetes_private_volume.yml` to have unique names where required
- Edit `kubernetes_job.yml` to use your own Docker image, if desired
- `kublectl apply -f kubernetes_private_volume.yml`
- `kublectl apply -f kubernetes_job.yml`
- To monitor its output
  - `kubectl get pods --selector=job-name=<job-name>` to find pod name
  - `kubectl logs -f <pod-name>`

### Download the trained model
- `kubectl apply -f kublectl apply -f kubernetes_idle.yml`
- `kubectl cp <idle-pod-name>:/mnt/trained_model.pth trained_model.pth`

### Cleanup
- `kubectl delete --grace-period=0 -f kubernetes_idle.yml`
- `kubectl delete -f kubernetes_private_volume.yml`
    - **ONLY DO THIS IF YOU WANT TO DELETE THE DATA!!!!**
- `kubectl delete -f kubernetes_job.yml`
