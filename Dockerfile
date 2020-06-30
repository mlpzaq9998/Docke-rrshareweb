FROM centos:7

ADD http://appdown.rrys.tv/rrshareweb_centos7.tar.gz /rrshareweb.tar.gz

RUN tar -xzf /rrshareweb.tar.gz && rm /rrshareweb.tar.gz

RUN sed -i "s/file.zmzfile.com:6100/file.apicvn.com/g" `grep file.zmzfile.com:6100 -rl /rrshareweb/web/build/static/js`

VOLUME ["/下载"]
EXPOSE 3001

ENTRYPOINT [ "/rrshareweb/rrshareweb" ]
