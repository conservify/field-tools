JENKINS_USER ?= nobody
JENKINS_PASSWORD ?= nothing

OSX = build/osx

all: osx

osx:
	rm -rf $(OSX)
	mkdir -p $(OSX)
	cd $(OSX) && wget --auth-no-challenge --http-user=$(JENKINS_USER) --http-password=$(JENKINS_PASSWORD) https://code.conservify.org/jenkins/job/flasher/lastSuccessfulBuild/artifact/darwin-amd64.zip
	cd $(OSX) && wget --auth-no-challenge --http-user=$(JENKINS_USER) --http-password=$(JENKINS_PASSWORD) https://code.conservify.org/jenkins/job/fk/job/core/lastSuccessfulBuild/artifact/build/firmware/core/fk-core-amazon.bin
	cd $(OSX) && unzip darwin-amd64.zip
	cd build && zip -r field-tools-osx.zip osx

distribute: osx
	scp field-tools-osx.zip code:/svr0/distribution

clean:
	rm -rf build
