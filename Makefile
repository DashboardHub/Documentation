all: reset assets html

reset:
	rm -fr build/*

assets:
	(cd build; wget https://raw.githubusercontent.com/DashboardHub/Assets/master/favicon.ico)

html:
	asciidoctor src/index.adoc -D build/ -r asciidoctor-diagram

pipeline.version.startBuild:
	curl -XPOST -H "Content-Type: application/json"  -d '{"release":"v0.1.${TRAVIS_BUILD_NUMBER}"}' https://api-pipeline.dashboardhub.io/environments/c872c990-e00e-11e8-8edd-3b4a3fbd64f7/deployed/${DH_TOKEN}/startBuild

pipeline.version.finishBuild:
	curl -XPOST -H "Content-Type: application/json"  -d '{"release":"v0.1.${TRAVIS_BUILD_NUMBER}"}' https://api-pipeline.dashboardhub.io/environments/c872c990-e00e-11e8-8edd-3b4a3fbd64f7/deployed/${DH_TOKEN}/finishBuild

pipeline.version.failBuild:
	curl -XPOST -H "Content-Type: application/json"  -d '{"release":"v0.1.${TRAVIS_BUILD_NUMBER}"}' https://api-pipeline.dashboardhub.io/environments/c872c990-e00e-11e8-8edd-3b4a3fbd64f7/deployed/${DH_TOKEN}/failBuild

pipeline.version.startDeploy:
	curl -XPOST -H "Content-Type: application/json"  -d '{"release":"v0.1.${TRAVIS_BUILD_NUMBER}"}' https://api-pipeline.dashboardhub.io/environments/c872c990-e00e-11e8-8edd-3b4a3fbd64f7/deployed/${DH_TOKEN}/startDeploy

pipeline.version.finishDeploy:
	curl -XPOST -H "Content-Type: application/json"  -d '{"release":"v0.1.${TRAVIS_BUILD_NUMBER}"}' https://api-pipeline.dashboardhub.io/environments/c872c990-e00e-11e8-8edd-3b4a3fbd64f7/deployed/${DH_TOKEN}/finishDeploy

pipeline.version.failDeploy:
	curl -XPOST -H "Content-Type: application/json"  -d '{"release":"v0.1.${TRAVIS_BUILD_NUMBER}"}' https://api-pipeline.dashboardhub.io/environments/c872c990-e00e-11e8-8edd-3b4a3fbd64f7/deployed/${DH_TOKEN}/failDeploy
