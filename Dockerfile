FROM mingc/android-build-box:1.28.0

RUN npm i -g cordova@12.0.0 \
    && cordova telemetry off \
    && cordova create myApp org.apache.cordova.myApp myApp \
    && cd myApp \
    && cordova platform add android --save \
    && cordova plugin add cordova-plugin-camera --save \
    && cordova build android
