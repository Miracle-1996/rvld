FROM golang:bullseye
LABEL authors="miracle"

# 设置 go 环境变量
RUN go env -w GOFLAGS=-buildvcs=false
# 设置 go 代理
RUN go env -w GOPROXY=https://goproxy.io,direct
# 安装 Delve 调试器
RUN go install github.com/go-delve/delve/cmd/dlv@latest
# 替换/etc/apt/source.list
COPY sources.list /etc/apt/sources.list
# 更新包列表
RUN apt-get update
# 安装工具链
RUN apt-get install -y gcc-10-riscv64-linux-gnu qemu-user
# 创建软链接
RUN ln -sf /usr/bin/riscv64-linux-gnu-gcc-10 /usr/bin/riscv64-linux-gnu-gcc
# 设置工作目录
WORKDIR /project/rvld