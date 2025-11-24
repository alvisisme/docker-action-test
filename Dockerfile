# 基础镜像
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
# 安装必要工具
RUN apt-get update && apt-get install -y \
    cmake \
    ninja-build \
    git \
    python3 \
    python3-pip \
    wget \
    unzip

# 安装Unreal Engine 4依赖
#RUN pip3 install unreal-engine

# 克隆Unreal Engine 4源码
# RUN git clone https://github.com/EpicGames/UnrealEngine.git /UnrealEngine

# 设置工作目录
WORKDIR /UnrealEngine

# 编译Unreal Engine 4
RUN ./Setup.sh && ./GenerateProjectFiles.sh && make

# 清理缓存
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
