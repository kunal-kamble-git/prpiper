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

	stage('integrationArtifactUpload') {

		integrationArtifactUpload script: this
	}
	stage('IntegrationArtifactDeploy') {
		
		integrationArtifactDeploy script: this
	}
}
