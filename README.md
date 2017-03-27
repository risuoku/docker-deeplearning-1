## docker host

```
sudo docker version

Client:
 Version:      17.03.0-ce
 API version:  1.26
 Go version:   go1.7.5
 Git commit:   3a232c8
 Built:        Tue Feb 28 08:01:32 2017
 OS/Arch:      linux/amd64

Server:
 Version:      17.03.0-ce
 API version:  1.26 (minimum version 1.12)
 Go version:   go1.7.5
 Git commit:   3a232c8
 Built:        Tue Feb 28 08:01:32 2017
 OS/Arch:      linux/amd64
 Experimental: false
```

---

```
cat /etc/issue

Ubuntu 16.04.1 LTS \n \l
```

---

```
dpkg -l | grep nvidia-375

ii  nvidia-375                            375.39-0ubuntu0.16.04.1                  amd64        NVIDIA binary driver - version 375.39
ii  nvidia-375-dev                        375.39-0ubuntu0.16.04.1                  amd64        NVIDIA binary Xorg driver development files
```

---

## build image

```
sudo nvidia-docker build -t docker-deeplearning-1 ./
```

---

```
sudo nvidia-docker run --rm -it docker-deeplearning-1 /bin/bash
```

---

```
root@35effefa305b:/dockerwork/examples/mnist# python3 train_mnist.py --gpu 0
GPU: 0
# unit: 1000
# Minibatch-size: 100
# epoch: 20

Downloading from http://yann.lecun.com/exdb/mnist/train-images-idx3-ubyte.gz...
Downloading from http://yann.lecun.com/exdb/mnist/train-labels-idx1-ubyte.gz...
Downloading from http://yann.lecun.com/exdb/mnist/t10k-images-idx3-ubyte.gz...
Downloading from http://yann.lecun.com/exdb/mnist/t10k-labels-idx1-ubyte.gz...
/usr/local/lib/python3.5/dist-packages/chainer/training/extensions/plot_report.py:27: UserWarning: matplotlib is not installed on your environment, so nothing will be plotted at this time. Please install matplotlib to plot figures.

  $ pip install matplotlib

  warnings.warn('matplotlib is not installed on your environment, '
epoch       main/loss   validation/main/loss  main/accuracy  validation/main/accuracy  elapsed_time
1           0.191641    0.120916              0.941517       0.9621                    13.9702
2           0.074958    0.0723105             0.97695        0.9783                    15.6003
3           0.0474702   0.0717087             0.985349       0.9766                    17.2205
4           0.0365444   0.0682153             0.987865       0.9791                    18.8402
5           0.0289749   0.0752582             0.990282       0.9771                    20.4554
6           0.0235478   0.0806959             0.992099       0.9777                    22.0745
7           0.0215248   0.0882671             0.993065       0.9766                    23.7096
8           0.0196049   0.0666875             0.993899       0.9831                    25.3426
9           0.013136    0.0812477             0.995649       0.981                     26.981
10          0.0165871   0.100921              0.994949       0.9761                    28.6176
11          0.0134581   0.0849932             0.995815       0.9826                    30.2509
12          0.0158475   0.0818357             0.994866       0.983                     31.8953
13          0.010235    0.0856885             0.996665       0.9816                    33.5416
14          0.00861371  0.0888905             0.997232       0.9808                    35.177
15          0.0150217   0.0915132             0.995432       0.9828                    36.8172
16          0.00698952  0.0973377             0.997832       0.9827                    38.4517
17          0.0103111   0.106917              0.997099       0.9797                    40.0846
18          0.00902928  0.103123              0.997265       0.9806                    41.7092
19          0.0108525   0.0906507             0.996932       0.9845                    43.331
20          0.00991476  0.100309              0.997182       0.9829                    44.9577
```

---

```
<< processed on docker host >>

nvidia-smi
Tue Mar 28 02:10:34 2017
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 375.39                 Driver Version: 375.39                    |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|===============================+======================+======================|
|   0  GeForce GTX 1070    Off  | 0000:01:00.0     Off |                  N/A |
|  0%   46C    P2    73W / 200W |    255MiB /  8113MiB |     42%      Default |
+-------------------------------+----------------------+----------------------+
|   1  GeForce GTX 1070    Off  | 0000:02:00.0     Off |                  N/A |
|  0%   28C    P8     7W / 200W |      2MiB /  8114MiB |      0%      Default |
+-------------------------------+----------------------+----------------------+

+-----------------------------------------------------------------------------+
| Processes:                                                       GPU Memory |
|  GPU       PID  Type  Process name                               Usage      |
|=============================================================================|
|    0      9940    C   python3                                        253MiB |
+-----------------------------------------------------------------------------+
```
