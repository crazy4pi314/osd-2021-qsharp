FROM mcr.microsoft.com/quantum/iqsharp-base:0.18.2106148911

# Mark that this Dockerfile is used with the samples repository.
ENV IQSHARP_HOSTING_ENV=crazy4pi314/osd-2021-qsharp
USER root
# Install additional system packages from apt.
RUN apt-get -y update && \
    apt-get -y install \
               # For the Python interoperability sample, we require QuTiP,
               # which in turn requires gcc's C++ support.
               g++ && \
    apt-get clean && rm -rf /var/lib/apt/lists/
RUN pip install cython \
                numpy \
                scipy && \
    pip install qutip RISE matplotlib

USER ${USER}
