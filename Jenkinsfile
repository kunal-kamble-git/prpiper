@Library('piper-lib-os') _

node() {
	stage('init') {
		deleteDir()
		checkout scm
	}
	
	stage('integrationArtifactDownload Command') {
	
		integrationArtifactDownload script: this
		integrationArtifactDeploy script: this
 	        integrationArtifactGetMplStatus script: this
	}
}
