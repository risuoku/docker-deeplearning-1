FROM nvidia/cuda:8.0-cudnn5-devel-ubuntu14.04
WORKDIR /dockerwork

RUN set -x && apt-get update && apt-get install -y\
    python3\
    python3-pip\
    vim\
    && pip3 install chainer==1.22.0\

    # clean 
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY chainer_1.22.0_examples/ examples/
