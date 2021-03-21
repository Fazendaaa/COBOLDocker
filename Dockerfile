FROM alpine:3.12.4 as BUILDER

RUN [ "apk", "add", "--no-cache", \
  "autoconf=2.69-r2", \
  "automake=1.16.2-r0", \
  "clang=10.0.0-r2", \
  "bison=3.6.2-r0", \
  "db=5.3.28-r1", \
  "db-dev=5.3.28-r1", \
  "flex=2.6.4-r2", \
  "file=5.38-r0", \
  "gcc=9.3.0-r2", \
  "gmp-dev=6.2.0-r0", \
  "help2man=1.47.15-r0", \
  "make=4.3-r0", \
  "musl-dev=1.1.24-r10", \
  "subversion=1.13.0-r3", \
  "texinfo=6.7-r0" \
]

RUN [ "svn", "checkout", "https://svn.code.sf.net/p/gnucobol/code/tags/gnucobol-3.1-rc1", "gnucobol-code" ]

WORKDIR /gnucobol-code

ARG CC=clang

RUN [ "./autogen.sh" ]
RUN [ "./configure" ]
RUN [ "make" ]
# RUN [ "make", "check" ]
RUN [ "make", "install" ]

# ==============================================================================

FROM alpine:3.12.4 as SYSTEM
LABEL author="fazenda"
LABEL author="cobol"

RUN [ "apk", "add", "--no-cache", \
  "db-dev=5.3.28-r1", \
  "gmp-dev=6.2.0-r0" \
]

COPY --from=BUILDER /usr/local/lib /usr/local/lib
COPY --from=BUILDER /usr/local/bin /usr/local/bin
COPY --from=BUILDER /usr/local/share /usr/local/share/
COPY --from=BUILDER /usr/local/include /usr/local/include

ENTRYPOINT [ "cobc" ]
