@Library('piper-lib-os') _

node() {
	stage('init') {
		deleteDir()
		checkout scm
	}
	
	stage('integrationArtifactDownload') {
	
		integrationArtifactDownload script: this
		
 	       // integrationArtifactGetMplStatus script: this
	}
	stage('Integration Artifact Deploy'){
		integrationArtifactDeploy script: this
	}
}
