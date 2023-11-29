@Library('piper-lib-os') _

node() {
	stage('init') {
		deleteDir()
		checkout scm
	}
	
	stage('integration Artifact Download') {
	
		integrationArtifactDownload script: this
		
 	       // integrationArtifactGetMplStatus script: this
	}

	stage('Integration Artifact Repository Upload ') {
		
	}
	stage('Integration Artifact Deploy'){
		integrationArtifactDeploy script: this
	}
}
