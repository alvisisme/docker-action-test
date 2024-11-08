FROM mingc/android-build-box:1.28.0

ENV JAVA_HOME="/usr/lib/jvm/java-17-openjdk-amd64/"

ENV GRADLE_VERSION=5.6.4
ENV GRADLE_HOME /gradle-${GRADLE_VERSION}
RUN wget -q https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-all.zip \
    && unzip -q gradle-${GRADLE_VERSION}-all.zip \
    && rm gradle-${GRADLE_VERSION}-all.zip
ENV PATH ${GRADLE_HOME}/bin:$PATH

RUN npm i -g cordova@12.0.0 \
    && cordova telemetry off \
    && cordova create myApp org.apache.cordova.myApp myApp \
    && cd myApp \
    && cordova platform add android --save \
    && cordova plugin add cordova-plugin-camera --save \
    && cordova build android
