FROM ubuntu:22.04 AS builder

RUN apt-get update && apt-get install -y \
    gcc \
    make \
    autoconf \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /build
COPY . .

RUN ./configure && make -j$(nproc)

FROM ubuntu:22.04
RUN apt-get update && apt-get install -y --no-install-recommends \
    libstdc++6 \
    && rm -rf /var/lib/apt/lists/*

COPY --from=builder /build/bibtool /bibtool

ENTRYPOINT ["/bibtool"]
