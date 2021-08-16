FROM nginx:alpine

ENV PORT=80
ENV TRANSMISSION_URL=http://transmission.local:9091

WORKDIR /usr/share/transmission-webui

RUN wget https://github.com/Secretmapper/combustion/archive/release.zip && \
  wget https://github.com/johman10/flood-for-transmission/releases/download/latest/flood-for-transmission.zip && \
  wget https://github.com/endor/kettu/archive/refs/heads/master.zip && \
  wget https://github.com/ronggang/transmission-web-control/archive/refs/tags/v1.6.1-update1.zip && \
  unzip release.zip &&  mv combustion-release combustion && \
  unzip flood-for-transmission.zip && mv flood-for-transmission flood && \
  unzip master.zip && mv kettu-master kettu && \
  unzip v1.6.1-update1.zip && mv transmission-web-control-1.6.1-update1/src twc && rm -rf transmission-web-control-1.6.1-update1 && \
  rm *.zip

COPY *.template /etc/nginx/templates/
