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
        stage('start container')
        {
            steps
            {
                sh 'docker run gcc'
            }
        }
        stage('Docker login')
        {
            steps
            {
                withCredentials([usernamePassword(credentialsId: 'docker-login', passwordVariable: 'ashPSW', usernameVariable: 'ashUSR')]) 
                {
                    sh 'docker login -u ${ashUSR} -p ${ashPSW}'         
                }
            }   
        }
        stage('Giving tag')
        {
            sreps
            {
                sh 'docekr tag gcc ashjd/ashu-jenkins1:gcc'
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
        
        stage('Remove container')
        {
            steps
            {
                sh 'docker rm ashjd/ashu-jenkins1:gcc'
            }
        }
    }
}
