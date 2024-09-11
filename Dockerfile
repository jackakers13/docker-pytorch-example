FROM pytorch/pytorch:2.4.1-cuda11.8-cudnn9-devel

# This will bake a copy of the program into the image. We could
# also just read the program from the host file system at runtime.
# This approach is simpler, but less flexible. The choice is yours.
COPY pytorch_example.py /root/pytorch_example.py

WORKDIR /root

RUN echo "echo \"HELLO MOM I'M SPECIAL!\"" >> ~/.bashrc
RUN echo "echo \"HELLO MOM I'M SPECIAL!\"" >> ~/.bashrc
RUN echo "echo \"HELLO MOM I'M SPECIAL!\"" >> ~/.bashrc
RUN echo "echo \"HELLO MOM I'M SPECIAL!\"" >> ~/.bashrc
RUN echo "echo \"HELLO MOM I'M SPECIAL!\"" >> ~/.bashrc
