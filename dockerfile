FROM ubuntu:latest

RUN apt-get update && apt-get install unzip -y && apt-get install -y ocl-icd-opencl-dev && apt-get install -y git wget

WORKDIR /app

RUN wget https://nossd.com/nossd-1.4.zip &&
unzip nossd-1.4.zip &&
cd nossd-1.4/linux &&
mkdir plots
COPY cpu.sh /app/cpu.sh
RUN chmod +x /app/cpu.sh

CMD ["/app/cpu.sh"]
