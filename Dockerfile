# Use Satijalab's Seurat image as base
FROM satijalab/seurat:latest

# Switch to root to install packages
USER root

# Install OpenSSL 3 and other dependencies
RUN apt-get update && apt-get install -y \
    wget \
    psmisc \
    libclang-dev \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*

# Try to install libssl3 (if available)
RUN apt-get update && \
    (apt-get install -y libssl3 || apt-get install -y libssl1.1) && \
    rm -rf /var/lib/apt/lists/*

# Download and install RStudio Server (older compatible version)
RUN wget https://download2.rstudio.org/server/bionic/amd64/rstudio-server-2022.07.2-576-amd64.deb \
    && apt-get update \
    && apt-get install -y --fix-broken ./rstudio-server-2022.07.2-576-amd64.deb \
    && rm rstudio-server-2022.07.2-576-amd64.deb \
    && rm -rf /var/lib/apt/lists/*

# Create rstudio user with sudo privileges
RUN useradd -m -s /bin/bash -G sudo rstudio \
    && echo "rstudio:rstudio" | chpasswd

# Expose RStudio Server port
EXPOSE 8787

# Start RStudio Server
CMD ["/usr/lib/rstudio-server/bin/rserver", "--server-daemonize=0"]