FROM debian:bookworm-slim

# Install Debian packages
RUN apt-get update                    \
    && DEBIAN_FRONTEND=noninteractive \
        apt-get install -y            \
            build-essential           \
            git                       \
            pipx                      \
            ruby-full                 \
            scons                     \
            sudo                      \
            unzip                     \
            valgrind                  \
            wget                      \
            yasm                      \
            zip

# Allow password-less sudo
RUN echo 'ALL ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers

# Install Python packages
RUN pipx install   \
        gitlab-art

# Install Unity for unit tests
RUN wget https://github.com/ThrowTheSwitch/Unity/archive/refs/tags/v2.6.0.tar.gz && \
    echo "aa4c9fb1ae5fc5242f914c65f3557e817e40cb37f04a31e5ff76d1ab89dbf674  v2.6.0.tar.gz" | sha256sum -c && \
    tar -xvzf v2.6.0.tar.gz -C /opt/
ENV THROW_THE_SWITCH_UNITY_FILEPATH /opt/Unity-2.6.0
