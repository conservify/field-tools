JENKINS_USER ?= nobody
JENKINS_PASSWORD ?= nothing

all: osx

osx:
	mkdir -p osx
	cd osx && wget --auth-no-challenge --http-user=$(JENKINS_USER) --http-password=$(JENKINS_PASSWORD) https://code.conservify.org/jenkins/job/flasher/lastSuccessfulBuild/artifact/darwin-amd64.zip
	cd osx && wget --auth-no-challenge --http-user=$(JENKINS_USER) --http-password=$(JENKINS_PASSWORD) https://code.conservify.org/jenkins/job/fk/job/core/lastSuccessfulBuild/artifact/build/firmware/core/fk-core-amazon.bin
	cd osx && unzip darwin-amd64.zip
	rm osx/*.zip
	zip -r field-tools-osx.zip osx

distribute: osx
	scp field-tools-osx.zip code:/svr0/distribution

clean:
	rm -rf osx
