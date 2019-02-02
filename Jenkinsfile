@Library('conservify') _

conservifyProperties([
    pipelineTriggers([])
])

timestamps {
    node {
        stage ('git') {
            checkout scm
        }

        stage ('build') {
            withCredentials([usernamePassword(credentialsId: 'jenkins', usernameVariable: 'JENKINS_USER', passwordVariable: 'JENKINS_PASSWORD')]) {
                sh "make clean all"
            }
        }

        stage ('archive') {
            dir ("build") {
                archiveArtifacts "*.zip"
            }
        }
    }
}
