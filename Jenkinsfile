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

		cd ./iflows
//		git init
		git clone -b artifacts --single-branch https://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@github.com/kunal-kamble-git/prpiper.git
		cp *.zip ./prpiper
		cd prpiper
		git add -A
		git commit -m "artifact upload"
		git push origin artifacts
		cd ../
		rm -rf prpiper
	}

//	stage('integrationArtifactUpload') {

//	integrationArtifactUpload script: this
//	}

//	stage('IntegrationArtifactDeploy') {
		
//		integrationArtifactDeploy script: this
//	}
}
