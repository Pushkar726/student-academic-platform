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
                sh 'java -version'
                sh 'git --version'
                sh 'python3 --version'
                sh 'python3 -m pip --version || true'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh '''
                    python3 -m venv .venv-ci
                    .venv-ci/bin/python -m pip install --upgrade pip
                    .venv-ci/bin/python -m pip install -r requirements.txt pytest-cov
                '''
            }
        }

        stage('Run Automated Tests') {
            steps {
                sh '''
                    .venv-ci/bin/python -m pytest -v \
                        --junitxml=reports/jenkins-test-results.xml \
                        -o addopts=""
                '''
            }
            post {
                always {
                    junit allowEmptyResults: true,
                          testResults: 'reports/jenkins-test-results.xml'
                }
            }
        }
    }

    post {
        success {
            echo 'All Jenkins pipeline stages completed successfully.'
        }
        failure {
            echo 'Pipeline failed. Review the stage logs.'
        }
    }
}