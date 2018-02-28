node {
   stage('Build') {
         git 'https://github.com/appranix-demo/front-end.git'
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

  // stage ("Approve To QA") {
  //        input message: "Proceed?"
  //  }

   stage('Deploy to QA') {
      sh "echo deploy to QA"
   }

  // stage ("Approve To PROD") {
  //        input message: "Proceed?"
  //  }

   stage('Deploy to PROD') {
     withCredentials([string(credentialsId: 'devuserkey', variable: 'AUTHKEY')]) {
                 //available as an env variable, but will be masked if you try to print it out any which way
          sh "echo deploy to PROD"
          sh 'prana auth logout'
          sh 'echo successfully logged out'

          sh "prana auth set_token ${env.AUTHKEY}"
          sh 'echo successfully logged in'

          sh "prana config set organization=demo-inc -g"
          sh 'echo organization is set as demo-inc'

          sh "prana config set assembly=sockshop -g"
          sh 'echo assembly is set as sockshop'

          sh "prana design load front-end.yml"
          sh 'echo design is uploaded'

          sh "prana design variable update -a sockshop --platform=front-end version=${env.BUILD_ID}"

          sh "prana design commit init-commit"
          sh 'echo new design in committed with message init-commit'

          sh "prana configure pull -e production"
          sh 'echo design pull to production appspace'

          sh 'sleep 20'

          sh "prana configure commit init-commit -e production"

          sh "prana configure deployment create -e production"
          sh 'echo deployement is started'
       }
   }
}
