# Use the official Node.js image as a base
FROM node:16

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    xvfb \
    x11vnc \
    fluxbox \
    wget \
    supervisor

# Install noVNC
RUN mkdir -p /opt/novnc/utils/websockify \
    && wget -qO- https://github.com/novnc/noVNC/archive/v1.1.0.tar.gz | tar xz --strip 1 -C /opt/novnc \
    && wget -qO- https://github.com/novnc/websockify/archive/v0.9.0.tar.gz | tar xz --strip 1 -C /opt/novnc/utils/websockify

# Install Puppeteer
RUN npm install puppeteer --no-optional --legacy-peer-deps

# Set up the VNC server and noVNC
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY start.sh /opt/start.sh
RUN chmod +x /opt/start.sh

# Copy application code
COPY . /app
WORKDIR /app

# Expose necessary ports
EXPOSE 8080
EXPOSE 5900

CMD ["/opt/start.sh"]
