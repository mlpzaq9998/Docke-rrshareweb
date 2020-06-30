FROM centos:7
ENV TZ=Asia/Shanghai

ADD http://appdown.rrys.tv/rrshareweb_centos7.tar.gz /rrshareweb.tar.gz

RUN set -ex && \
tar -xzf /rrshareweb.tar.gz && rm /rrshareweb.tar.gz && \
sed -i "s/file.zmzfile.com/file.apicvn.com/g" `grep file.zmzfile.com -rl /rrshareweb/web/build/static/js` && \
ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && \
echo ${TZ} > /etc/timezone

VOLUME ["/下载"]
EXPOSE 3001

ENTRYPOINT [ "/rrshareweb/rrshareweb" ]
