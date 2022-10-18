pipeline 
{
    agent any
    stages
    {
        stage('credes')
        {
            steps 
            {
                script
                {
                    withCredentials([usernamePassword(credentialsId: 'docker-login', passwordVariable: 'ashPSW', usernameVariable: 'ashUSR')]) {
                    sh '''
                            echo "The username is: ${ashPSW}"
                            echo "The password is : ${ashUSR}"
                        '''}
                }
            }            
        }
        stage('Build Docker Image')
        {
           steps
           {
                script
                {
                    sh 'docker build -t ashjd/ashu-jenkins1 .'
                }
            }
        }
        stage('docker login')
        {
            steps
            {   
                script
                {
                    withCredentials([usernamePassword(credentialsId: 'docker-login', passwordVariable: 'ashPSW', usernameVariable: 'ashUSR')]) {
                        sh 'docker login -u ${ashUSR} -p ${ashPSW}'         
                    }
                }
            }   
        }
        stage('Push image to Hub')
        {
            steps
            {     
                sh 'docker push ashjd/ashu-jenkins1'
            }          
        }
        stage('Pull image from hub')
        {
            steps
            {
                script
                {
     
                    sh 'docker pull ashjd/ashu-jenkins1'
                }
            }
        }
        
        stage('start container')
        {
            steps
            {
                script
                {
                   sh 'docker run -p 8082:80 --name jenkins1 ashjd/ashu-jenkins1'
                    sh 'docker rm jenkins1'
                }
            }
        }
    }
}
