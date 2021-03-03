FROM centos
COPY s.sh .
RUN cgmod ugo+x s.sh
CMD ./s.sh
