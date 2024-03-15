FROM debian:bullseye

RUN apt-get -y update && apt-get -y upgrade
# tini 옵션을 사용해야, 종료 시그널 처리, 초기화 프로세스 사용, 자식 프로세스 생성 및 관리 등을 위해
# nginx도 부모 자식 프로세스에 관련되었기 떄문
RUN apt-get install nginx -y && apt-get install openssl -y

COPY ./conf/nginx.conf /etc/nginx/http.d

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 \
    # req : X.509 certificate requests를 생성하고 처리하는 명령어
    # x509 : 새로운 self-signed X.509 인증서를 생성하는 옵션
        -nodes \
    # nodes : 인증서으 private key를 암호화 하지 않는 옵션
        -days 365 \
        -newkey rsa:2048 \
        -keyout /etc/ssl/private/hunpark.42.fr.key \
        -out /etc/ssl/certs/hunpark.42.fr.crt \
        -subj "/C=KR/ST=Seoul/L=Gaepo/O=42Seoul/OU=Develop/CN=suhwpark"
    # 국가(C): 대한민국 (KR)
    # 도시(ST): 서울 (Seoul)
    # 지역(L): Gaepo
    # 조직(O): 42Seoul
    # 조직 단위(OU): Develop
    # 일반 이름(CN): suhwpark

EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
