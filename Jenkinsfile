pipeline {
    agent any
    stages {
        stage('Cloning') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: 'main']], userRemoteConfigs: [[url: 'https://github.com/Shahryartariq/Hello_World_rust']]])
                sh 'ls'
                sh 'pwd'

            }
        }
        stage('Building') {
            steps {
                sh 'docker build -t my-rust-app .'
                sh 'docker run -v $(pwd)/target:/app/target my-rust-app cargo build --release'
                archiveArtifacts artifacts: 'target/release/YOUR_BINARY_NAME.exe', allowEmptyArchive: true
            }
        }
        stage('Testing') {
            steps {
                sh 'cp target/release/YOUR_BINARY_NAME.exe .'
                // Run your tests here (e.g., using cargo test or custom test scripts)
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker build -t my-rust-app-deploy .'
                sh 'docker run -d -p 8080:8080 my-rust-app-deploy'
            }
        }
    }
}
