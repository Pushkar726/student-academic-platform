pipeline {
    agent any

    stages {
        stage('Checkout SCM') {
            steps {
                echo 'Source code checked out from GitHub.'
            }
        }

        stage('Verify Environment') {
            steps {
                sh 'echo "Student Academic Platform CI/CD Pipeline"'
                sh 'java -version'
                sh 'git --version'
                sh 'cat /etc/os-release'
            }
        }
    }

    post {
        success {
            echo 'Jenkins pipeline completed successfully.'
        }
        failure {
            echo 'Pipeline failed. Review the stage logs.'
        }
    }
}