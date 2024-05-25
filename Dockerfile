FROM debian:bookworm-slim

RUN apt-get update                    \
    && DEBIAN_FRONTEND=noninteractive \
        apt-get install -y            \
            build-essential           \
            git                       \
            python3-pip               \
            scons                     \
            sudo                      \
            unzip                     \
            valgrind                  \
            yasm                      \
            zip

# Allow password-less sudo
RUN echo 'ALL ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers

# Install pip dependencies
COPY ./requirements.txt ./
RUN pip3 install --break-system-packages -r requirements.txt && rm requirements.txt
