FROM python:3.10.13-slim-buster

RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
        gcc \
        libffi-dev \
        musl-dev \
        ffmpeg \
        aria2 \
        wget \
        python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY . /app/
WORKDIR /app/

# ✅ Fixed: requirements.txt use karo (Installer nahi)
RUN pip3 install --no-cache-dir --upgrade pip \
    && pip3 install --no-cache-dir -r requirements.txt

RUN mkdir -p /tmp/bot

# ✅ Fixed: bash start.sh use karo
CMD ["bash", "start.sh"]
