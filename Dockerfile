FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    git \
    curl \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev

# Create a directory for the application
WORKDIR /app

# Create a virtual environment
RUN python3 -m venv /opt/venv

# Activate the virtual environment and install the required packages
RUN --mount=type=bind,source=/app/requirements.txt,target=/app/requirements.txt \ 
    --mount=type=cache,target=/root/.cache/pip \
    /bin/bash -c "source /opt/venv/bin/activate && \
    pip install --upgrade pip && \
    pip install -r requirements.txt"
