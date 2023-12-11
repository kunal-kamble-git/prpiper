@Library('piper-lib-os') _

node() {
	stage('Initialize') {
		deleteDir()
		checkout scm
	}


	stage('Modify Piper Libs') {

		
		
	}
	
	stage('integrationArtifactDownload') {
	
		integrationArtifactDownload script: this
		
	}



	stage('integrationArtifactUpload') {

	integrationArtifactUpload script: this
	}

	stage('IntegrationArtifactDeploy') {
		
		integrationArtifactDeploy script: this
	}
}
