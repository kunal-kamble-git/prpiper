@Library('piper-lib-os') _

node() {
	stage('init') {
		deleteDir()
		checkout scm
	}
	
	stage('integrationArtifactDownload') {
	
		integrationArtifactDownload script: this
		
	}

	stage('Artifact Repository Upload') {

		sh "chmod +x ./scripts/gitupload.sh"
		sh './scripts/gitupload.sh'
		
	
	}

//	stage('integrationArtifactUpload') {

//	integrationArtifactUpload script: this
//	}

//	stage('IntegrationArtifactDeploy') {
		
//		integrationArtifactDeploy script: this
//	}
}
