cd /workspace/$1
VERSION_NAME=$(git describe)
VERSION_CODE=$(git rev-list --count master)
flutter build apk --build-name=$VERSION_NAME --build-number=$VERSION_CODE