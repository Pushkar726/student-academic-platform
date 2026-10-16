pipeline {
    agent any

    environment {
        IMAGE = 'student-academic-platform:v1.0.0'
        PYTHONUNBUFFERED = '1'
    }

    stages {
        stage('Checkout SCM') {
            steps {
                echo 'Source code is available in the workspace.'
            }
        }

        stage('Install Dependencies') {
            steps {
                echo 'Checking Python and installing dependencies'
                bat 'python --version'
                bat 'python -m pip install -r requirements.txt'
                bat 'python -m pip install pytest-cov flake8'
            }
        }

        stage('Lint') {
            steps {
                bat 'python -m flake8 app tests run.py wsgi.py'
            }
        }

        stage('Test') {
            steps {
                bat 'python -m pytest -v --junitxml=reports\\junit.xml --cov=app --cov-report=xml:reports\\coverage.xml --cov-report=term'
            }
            post {
                always {
                    junit testResults: 'reports/junit.xml', allowEmptyResults: true
                    archiveArtifacts artifacts: 'reports/coverage.xml', allowEmptyArchive: true
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t %IMAGE% .'
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully.'
        }
        failure {
            echo 'Pipeline failed. Review the stage logs.'
        }
    }
}
