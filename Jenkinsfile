pipeline 
{
    agent any
    environment {     
        secret=credentials('a16fb47f-e48c-409e-baf7-c1c8e3ffcf6e')     
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
                sh "echo $secret_PSW | docker login -u $secret_USR --password-stdin"
                sh "docker login -u $secret_USR -p $secret_PSW"
                sh 'echo $secret_PSW | docker login -u $secret_USR --password-stdin'
                sh 'docker login -u $secret_USR -p $secret_PSW'
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
