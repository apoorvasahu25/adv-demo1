pipeline 
{
    agent any
    environment{
        crides=credentials('a16fb47f-e48c-409e-baf7-c1c8e3ffcf6e')
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
                   sh 'docker login -u crides_USR -p crides_PSW'
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
                    sh 'docker login -u ashjd -p ashjd@1122000'
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
