FROM nvidia/cuda:8.0-cudnn5-devel-ubuntu16.04
WORKDIR /dockerwork

RUN set -x && apt-get update && apt-get install -y\
    python3\
    python3-pip\
    && pip3 install chainer==1.21.0\

    # clean 
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY chainer_1.21.0_examples/ examples/
