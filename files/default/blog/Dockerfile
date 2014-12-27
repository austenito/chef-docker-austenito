FROM austenito/ruby:2.1.2

RUN mkdir /apps

ADD run.sh /tmp/blog/run.sh
RUN chmod +x /tmp/blog/run.sh

VOLUME ["/apps"]

CMD /tmp/blog/run.sh
