#!/bin/bash

# The MIT License (MIT)
#
# Copyright (c) 2020 NVIDIA CORPORATION. All rights reserved.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
# the Software, and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
# FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
# COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
# IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#we need to step out to expand the build context
cd ..

#training container
#nvidia-docker build -t tkurth/pytorch-bias_gan:latest .
nvidia-docker build -t gitlab-master.nvidia.com:5005/tkurth/mlperf-deepcam:debug -f docker/Dockerfile.train .
docker push gitlab-master.nvidia.com:5005/tkurth/mlperf-deepcam:debug

##tag for NERSC registry
#docker tag gitlab-master.nvidia.com:5005/tkurth/mlperf-deepcam:debug registry.services.nersc.gov/tkurth/mlperf-deepcam:debug
#docker push registry.services.nersc.gov/tkurth/mlperf-deepcam:debug

##profiling container (public)
#nvidia-docker build -t registry.services.nersc.gov/tkurth/mlperf-deepcam:profile -f docker/Dockerfile.profile.public .
#docker push registry.services.nersc.gov/tkurth/mlperf-deepcam:profile

##profiling container (internal)
#nvidia-docker build -t gitlab-master.nvidia.com:5005/tkurth/mlperf-deepcam:profile_internal -f docker/Dockerfile.profile.internal .
#docker push gitlab-master.nvidia.com:5005/tkurth/mlperf-deepcam:profile_internal
