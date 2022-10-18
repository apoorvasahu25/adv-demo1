pipeline 
{
    agent any
    environment {     
        secret=credentials('Jenkins-docker-login')     
} 
    stages
    {
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
                sh "echo $secret | docker login -u ashjd --password-stdin"
                sh "docker login -u ashjd -p $secret"
                sh 'echo $secret | docker login -u ashjd --password-stdin'
                sh 'docker login -u ashjd -p $secret'
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
