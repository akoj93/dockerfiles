FROM java:8-jre

MAINTAINER Tummy

# Updating container
RUN apt-get update && \
	apt-get upgrade --yes --force-yes && \
	apt-get install -y nano && \
	apt-get clean && \ 
	rm -rf /var/lib/apt/lists/* 

# Setting workdir
WORKDIR /minecraft

#This is the different ENV variables you will soon be able to modify some settings.
ENV motd="Welcome to the testserver"
ENV levelname="test"

#This is the format that an admin need to work... This is Notch.
ENV adminuuid=069a79f4-44e9-4726-a5be-fca90e38aaf5
ENV adminname=Notch
ENV adminlevel=4

#backup settings
ENV backuptimer =2.0
ENV backupstokeep =12
ENV backupfolder =./backups/

# Changing user to root
USER root

# Creating user and downloading files
RUN useradd -m -U minecraft && \
	mkdir -p /minecraft/world && \
	wget http://addons-origin.cursecdn.com/files/2484/486/FTBInfinityServer_3.0.2.zip && \
	unzip -n FTBInfinityServer_3.0.2.zip && \
	rm FTBInfinityServer_3.0.2.zip && \
	chmod u+x FTBInstall.sh ServerStart.sh && \
	echo "#By changing the setting below to TRUE you are indicating your agreement to our EULA (https://account.mojang.com/documents/minecraft_eula)." > eula.txt && \
	echo "$(date)" >> eula.txt && \
	echo "eula=TRUE" >> eula.txt && \
	chown -R minecraft:minecraft /minecraft && \
#This is stuff i added
	wget https://raw.githubusercontent.com/akoj93/dockerfiles/master/ftb-infinity/3.0.2/server.properties && \
	sed "s/motd=.*/motd=$motd/g" server.properties && \
	sed "s/level-name=.*/level-name=$levelname/g" server.properties
# USER minecraft

# Running install
RUN /minecraft/FTBInstall.sh

# Expose port 25565
EXPOSE 25565

# Expose volume
# VOLUME ["/minecraft/world"]
VOLUME ["/minecraft"]

# Start server
CMD ["/bin/bash", "/minecraft/ServerStart.sh"]
