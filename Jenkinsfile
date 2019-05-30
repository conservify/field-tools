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
                withEnv(["PATH+GOLANG=${tool 'golang-amd64'}/bin"]) {
                    sh "make clean all"
                }
            }
        }

        stage ('archive') {
            dir ("build/distribute") {
                archiveArtifacts "*.zip"
            }
        }
    }
}
