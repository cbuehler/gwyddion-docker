FROM buildpack-deps
RUN apt-get update
RUN apt-get install -y python-gtk2-dev
ENV GWYDDION_VERSION 2.47
RUN curl http://gwyddion.net/download/$GWYDDION_VERSION/gwyddion-$GWYDDION_VERSION.tar.xz | tar --extract --xz && \
    cd gwyddion-$GWYDDION_VERSION && \
    ./configure --prefix=/usr && \
    make install && \
    cd .. && \
    rm -r gwyddion-$GWYDDION_VERSION
CMD gwyddion
