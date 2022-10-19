pipeline 
{
    agent any
    stages
    {
        stage('Build Dockerfile')
        {
           steps
           {              
                sh 'docker build -t gcc .'
           }
        }
        stage('Run container')
        {
            steps
            {
                sh 'docker run gcc'
            }
        }
        stage('Giving tag')
        {
            steps
            {
                sh 'docker tag gcc ashjd/ashu-jenkins1:gcc'
            }
        }
        stage('Docker login')
        {
            steps
            {
                withCredentials([usernamePassword(credentialsId: 'docker-login', usernameVariable: 'ashUSR', passwordVariable: 'ashPSW')]) 
                {
                    sh 'echo ${ashPSW} | docker login -u ${ashUSR} --password-stdin'

                }
            }   
        }
        stage('Push image to DockerHub')
        {
            steps
            {     
                sh 'docker push ashjd/ashu-jenkins1:gcc'
            }          
        }
        stage('Pull image from DockerHub')
        {
            steps
            {     
                sh 'docker pull ashjd/ashu-jenkins1:gcc'
            }
        }
    }
}
