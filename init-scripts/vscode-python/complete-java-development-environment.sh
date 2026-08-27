#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: Complete Java development environment
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
mkdir -p "${WORK_DIR}/src/main/java"

# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/pom.xml")"
cat > "${WORK_DIR}/pom.xml" <<'ONYXIA_FILE_d7ca025a1fc0'
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <groupId>com.example</groupId>
  <artifactId>java-project</artifactId>
  <version>1.0-SNAPSHOT</version>
  <properties>
    <maven.compiler.source>17</maven.compiler.source>
    <maven.compiler.target>17</maven.compiler.target>
  </properties>
</project>
ONYXIA_FILE_d7ca025a1fc0
mkdir -p "$(dirname "${WORK_DIR}/src/main/java/App.java")"
cat > "${WORK_DIR}/src/main/java/App.java" <<'ONYXIA_FILE_fe4a390305a8'
public class App {
    public static void main(String[] args) {
        System.out.println("Hello, Java on Onyxia!");
    }
}
ONYXIA_FILE_fe4a390305a8

# Install missing language runtimes.
APT_GET="apt-get"
if [ "$(id -u)" -ne 0 ] && command -v sudo >/dev/null 2>&1; then
  APT_GET="sudo apt-get"
fi
if ! command -v javac >/dev/null 2>&1 || ! command -v java >/dev/null 2>&1; then
  echo "Installing Java JDK"
  ${APT_GET} update
  ${APT_GET} install -y default-jdk
fi
if ! command -v mvn >/dev/null 2>&1; then
  echo "Installing Maven"
  ${APT_GET} update
  ${APT_GET} install -y maven
fi

# Install VSCode/code-server extensions.
code-server --install-extension vscjava.vscode-java-pack

