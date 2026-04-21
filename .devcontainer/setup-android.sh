#!/usr/bin/env bash
set -e

echo "=== Installing Gradle 8.2 ==="
wget https://services.gradle.org/distributions/gradle-8.2-bin.zip -O gradle.zip
unzip gradle.zip
rm gradle.zip
sudo mv gradle-8.2 /opt/gradle
echo 'export PATH=/opt/gradle/bin:$PATH' >> ~/.bashrc

echo "=== Installing Android SDK CLI tools ==="
mkdir -p $HOME/android-sdk/cmdline-tools
cd $HOME/android-sdk
wget https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip -O tools.zip
unzip tools.zip -d cmdline-tools
mv cmdline-tools/cmdline-tools cmdline-tools/latest
rm tools.zip

echo "export ANDROID_HOME=$HOME/android-sdk" >> ~/.bashrc
echo "export PATH=\$PATH:\$ANDROID_HOME/cmdline-tools/latest/bin:\$ANDROID_HOME/platform-tools" >> ~/.bashrc
echo "export PATH=\$PATH:\$ANDROID_HOME/build-tools/34.0.0" >> ~/.bashrc

source ~/.bashrc

echo "=== Installing SDK components ==="
yes | sdkmanager --licenses
sdkmanager "platform-tools" "build-tools;34.0.0" "platforms;android-34"

echo "=== Devcontainer setup complete ==="
