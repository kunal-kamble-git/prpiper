@Library('piper-lib-os') _

node() {
	stage('Initialize') {
		deleteDir()
		checkout scm
	}


	stage('Set Piper Lib') {

		sh '''sed -e "s,DWNENV,${SourceEnv},g" \\
    			  -e "s,FLWID,${FlowId},g" \\
    			  -e "s,FLWV,${FlowVersion},g" \\
    			  -e "s,DPLENV,${DeployEnv},g" \\
    			  -e "s,FLWNM,${FlowName},g" \\
    			  -e "s,PKGID,${PackageID},g" \\
			  scripts/config_tmp.yml > .pipeline/config.yml'''
		
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
