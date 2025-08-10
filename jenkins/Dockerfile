FROM jenkins/jenkins:lts

ENV JENKINS_USER=gdiaz
ENV JENKINS_PASS=admin123

ENV JAVA_OPTS=-Djenkins.install.runSetupWizard=false

COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/plugins.txt

USER root

# Instalar Docker CLI (sin daemon)
RUN apt-get update && apt-get install -y ca-certificates curl \
  && install -m 0755 -d /etc/apt/keyrings \
  && curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc \
  && chmod a+r /etc/apt/keyrings/docker.asc \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian $(. /etc/os-release && echo \"$VERSION_CODENAME\") stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null \
  && apt-get update \
  && apt-get install -y docker-ce-cli \
  && apt-get clean

# Agregar jenkins al grupo docker (no siempre funciona bien en Windows, pero está bien)
RUN groupadd docker || true
RUN usermod -aG docker jenkins || true

USER jenkins
