FROM base/arch:latest
MAINTAINER: Michel Tu <orphee@gmail.com>

RUN pacman -Syu --noconfirm
RUN pacman -S znc --noconfirm

# ZNC should load the conf for /root/znc instead of ~/.znc
RUN sed -i 's/ExecStart.*/ExecStart=\/usr\/bin\/znc -f --allow-root -d \/root\/znc/' /usr/lib/systemd/system/znc.service

# Start ZNC
RUN systemctl start znc

EXPOSE 5500
