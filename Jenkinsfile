pipeline 
{
    agent any
    environment {
        credes=credentials( 'Jenkins-docker-login' )
        
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
        stage('Push image to Hub')
        {
            steps
            {
               script
               {
                   sh 'echo $credes_PSW | docekr login -u $credes_USR --password-stdin'
                   sh 'docker push ashjd/ashu-jenkins1'
               }
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
