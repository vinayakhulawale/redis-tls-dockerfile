FROM redis

RUN apt-get update --fix-missing && \
    apt-get install -y stunnel python3-pip && \
    rm -rf /var/lib/apt/lists/*
RUN pip3 install honcho

ADD stunnel.conf /stunnel.conf
ADD Procfile /Procfile

ADD certs/cert.pem /certs/cert.pem
ADD certs/cert-key.pem /certs/cert-key.pem

WORKDIR /
ENV PYTHONUNBUFFERED=1
CMD ["honcho", "start"]