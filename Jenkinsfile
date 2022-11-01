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
                sh 'docker tag gcc apoorvasahu34/jenkins:gcc'
            }
        }
        stage('Docker login')
        {
            steps
            {
                withCredentials([usernamePassword(credentialsId: 'apoorva_git_login', usernameVariable: 'apooUSR', passwordVariable: 'apooPSW')]) 
                {
                    sh 'echo ${apooPSW} | docker login -u ${apooUSR} --password-stdin'

                }
            }   
        }
        stage('Push image to DockerHub')
        {
            steps
            {     
                sh 'docker push apoorvasahu34/jenkins'
            }          
        }
        stage('Pull image from DockerHub')
        {
            steps
            {     
                sh 'docker pull apoorvasahu34/jenkins'
            }
        }
    }
}
