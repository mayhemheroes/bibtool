FROM fuzzers/afl:2.52 as builder

RUN apt-get update
RUN apt install -y build-essential wget git clang cmake  automake autotools-dev
ADD . /bibtool
WORKDIR /bibtool
RUN ./configure CC=afl-gcc CXX=afl-g++
RUN make
RUN mkdir /bib_corpus
RUN wget http://tug.ctan.org/tex-archive/macros/latex/contrib/aguplus/sample.bib
RUN cp /bibtool/test/bib/*.bib /bib_corpus/
RUN mv sample.bib /bib_corpus/

FROM fuzzers/afl:2.52
COPY --from=builder /bibtool/bibtool /
COPY --from=builder /bib_corpus/* /testsuite/

ENTRYPOINT ["afl-fuzz", "-i", "/testsuite", "-o", "/bibtoolOut"]
CMD ["/bibtool", "@@"]
