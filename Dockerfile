FROM mingc/android-build-box:1.28.0

ENV JAVA_HOME "/usr/lib/jvm/java-17-openjdk-amd64/"

ENV GRADLE_VERSION 8.7
ENV GRADLE_HOME /opt/gradle-${GRADLE_VERSION}
RUN wget -q https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-all.zip \
    && unzip -d /opt -q gradle-${GRADLE_VERSION}-all.zip \
    && pwd \
    && ls -al \
    && ls -al /opt \
    && ls -al ${GRADLE_HOME}/ \
    && ls -al ${GRADLE_HOME}/bin \
    && chmod a+x ${GRADLE_HOME}/bin/gradle \
    && rm gradle-${GRADLE_VERSION}-all.zip
ENV PATH ${GRADLE_HOME}/bin:$PATH

RUN npm i -g cordova@12.0.0 \
    && cordova telemetry off \
    && cordova create myApp org.apache.cordova.myApp myApp \
    && cd myApp \
    && cordova platform add git+https://github.com/apache/cordova-android.git@13.0.0 --save --verbose \
    && cordova plugin add cordova-plugin-camera --save \
    && cordova build android
