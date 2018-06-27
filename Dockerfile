FROM debian:stretch

RUN apt-get update && \
	apt-get install -y cmake git g++ python && \
	apt-get autoclean && \
	rm -rf /var/lib/apt/cache

RUN git clone https://github.com/justinmeza/lci /lci-src
RUN cd /lci-src && python install.py --prefix="/lci"

FROM debian:stretch
COPY --from=0 /lci/bin/lci /lci
ADD LOLCODE-Snake.lol /LOLCODE-Snake.lol
ENTRYPOINT ["/lci", "/LOLCODE-Snake.lol"]
