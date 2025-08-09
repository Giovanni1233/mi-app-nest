FROM jenkins/jenkins:lts

USER root

# Instalar Docker CE y Docker Compose
RUN apt-get update \
  && apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release \
  && install -m 0755 -d /etc/apt/keyrings \
  && curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg \
  && chmod a+r /etc/apt/keyrings/docker.gpg \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list \
  && apt-get update \
  && apt-get install -y docker-ce docker-compose \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Instalar Node.js 22
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - \
  && apt-get install -y nodejs \
  && npm install -g npm@latest \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Dar permisos al usuario jenkins para usar Docker
RUN groupadd -for docker && usermod -aG docker jenkins

USER jenkins
