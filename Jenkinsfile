node {
   stage('Build') {
         sh "echo build docker"
         sh "ls"
         sh "pwd"
         sh "GROUP=veeresh27/front-end COMMIT=${env.BUILD_ID} ./scripts/push.sh"
   }

   stage('Publish docker') {
       withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'veeresh-docker',
                            usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
            sh "ehco push docker"
            sh "docker login -u ${env.USERNAME} -p ${env.PASSWORD}"
        }
   }

   stage('Deploy to CI') {
      sh "echo deploy to CI"
   }

   stage('Deploy to QA') {
      sh "echo deploy to QA"
   }

   stage('Deploy to PROD') {
      sh "echo deploy to PROD"
   }
}
