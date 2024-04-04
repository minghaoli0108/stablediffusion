# 基于官方的PyTorch镜像
FROM pytorch/pytorch:latest

# 安装所需的包
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# 将工作目录设置为/app
WORKDIR /app

# 将当前目录下的文件复制到镜像中
COPY requirements.txt /app/
COPY setup.py /app/

# 安装依赖项
RUN pip3 install --no-cache-dir -r requirements.txt

# 暴露端口
EXPOSE 5000

# 运行命令
CMD ["python3", "setup.py"]
