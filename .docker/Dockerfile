FROM openjdk:8-jre-alpine

ENV SERVER_SSL_KEY_STORE_PASSWORD="$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-32})"

ENV COMPRESSEDFILE="securityRAT*.tar.gz"

ENV JHIPSTER_SLEEP 0

RUN addgroup securityrat && \
	adduser -s /bin/sh -h /home/securityrat -G securityrat securityrat -D && \
	# Generating store file
	keytool -genkey -alias tomcat -storetype PKCS12 -keyalg RSA -keysize 2048 -keystore /home/securityrat/keystore.p12 -validity 3650 -storepass "${SERVER_SSL_KEY_STORE_PASSWORD}" -dname "CN=localhost, OU=unknown, O=unknown, L=unknown, S=unknown, C=unknown" -keypass "${SERVER_SSL_KEY_STORE_PASSWORD}"

USER securityrat

COPY securityRAT*.tar.gz /home/securityrat/

WORKDIR /home/securityrat

#Changes the keystore password and mysql root password accordingly in the security rat configuration file
RUN tar -xzf $COMPRESSEDFILE && \
	sed -i "s/^\([[:blank:]]*\)type:.*/\1type: FORM/g" config/application.yml && \
	rm ${COMPRESSEDFILE} && \
	rm -rf .cache/

EXPOSE 9001

CMD echo "The application will start in ${JHIPSTER_SLEEP}s..." && \
	sleep ${JHIPSTER_SLEEP} && \
	java -Djava.security.egd=file:/dev/./urandom -jar $(ls | egrep .*\.war$) --spring.profiles.active=prod