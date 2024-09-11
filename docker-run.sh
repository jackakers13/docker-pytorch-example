docker run \
    -it \
    --rm \
    --mount type=bind,src="$(pwd)",dst=/root/host_fs \
    --gpus all \
    my-special-pytorch

# # Explanation
# docker run \
#     # Interactive (bash shell instead of running in the backgroud)
#     -it \
#     # Remove (container and it's contents are destroyed when closed)
#     --rm \
#     # Mount the current directory on the host file system so we can save data outside container
#     --mount type=bind,src="$(pwd)",dst=/root/host_fs \
#     # Give the container access to the GPU
#     --gpus all
#     # Name of the image to use
#     my-special-pytorch
