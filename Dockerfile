FROM ubuntu:xenial

RUN apt update && apt install -y python3-lxml python3-pip python3-requests
RUN pip install -y prometheus-client

COPY msa_exporter.py /bin/msa_exporter
RUN chmod +x /bin/msa_exporter

EXPOSE 8000
CMD /bin/msa_exporter "$HOST" "$LOGIN" "$PASSWORD"
