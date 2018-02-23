node {
   stage('Build') {
         git 'https://github.com/veereshwaran/front-end/'
         sh "echo build docker"
         sh "docker build -t veeresh27/front-end:${env.BUILD_ID} ."
   }

   stage('Publish docker') {
       withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'veeresh-docker',
                            usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
            sh "echo push docker"
            sh "docker login -u ${env.USERNAME} -p ${env.PASSWORD}"
            sh "docker push veeresh27/front-end:${env.BUILD_ID}"
            sh "docker rmi veeresh27/front-end:${env.BUILD_ID}"
        }
   }

   stage('Deploy to CI') {
      sh "echo deploy to CI"
   }

   stage ("Approve To QA") {
          input message: "Proceed?"
    }

   stage('Deploy to QA') {
      sh "echo deploy to QA"
   }

   stage ("Approve To PROD") {
          input message: "Proceed?"
    }

   stage('Deploy to PROD') {
      sh "echo deploy to PROD"
   }
}
