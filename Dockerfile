FROM debian:bookworm

# 1. Actualizar repositorios e instalar todas las dependencias
RUN apt-get update && apt-get install -y \
    make cmake git build-essential binutils-mips-linux-gnu \
    python3 python3-pip clang-format-14 clang-tidy clang-tools sudo

# 2. Recibir tu ID de usuario de Fedora
ARG UID=1000
ARG GID=1000

# 3. Crear un usuario en Debian que coincida con tu Fedora y darle permisos
RUN groupadd -g ${GID} devuser && \
    useradd -u ${UID} -g ${GID} -m -s /bin/bash devuser && \
    echo "devuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER devuser
WORKDIR /workspace
