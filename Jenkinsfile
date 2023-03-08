pipeline{
    agent any

    environment {
        GIT_CLASS= 'GitSCM'
        GIT_BRANCH_NAME= '*/master' //Adicione o nome da branch a ser buscada.

    }

    stages{
        stage('Cloning repository stage') {
            steps {
                sh 'echo --> INFO: 1 - Cloning repository'
                checkout([
                    $class: 'GitSCM',
                    branches: [
                        [
                            name: '*/master' //Adicione o nome da branch a ser buscada. Deve ser exatamente igual a da seção environment.
                        ]
                    ],
                    doGenerateSubmoduleConfigurations: false,
                    extensions: [],
                    submoduleCfg: [],
                    userRemoteConfigs: [
                        [
                            credentialsId: 'github-account',  
                            url: 'https://github.com/willferal/test-app-ruby' //URL do repositório para o source.
                        ]
                    ]
                ])
            }
        }

        /*stage('Package aplication stage'){
            steps{
                sh 'echo --> INFO: 2 - Package backend'
                sh 'mvn clean package'
            }
        }*/
        
        stage('Compose container stage'){
            steps {
                sh 'echo --> INFO: 3 - Build backend'
                sh 'docker-compose down'
                sh 'cp .env.example .env'
                sh 'docker compose build'
                sh 'docker compose run --rm web bundle install'
                sh 'docker compose run --rm web rails db:migrate'
                sh 'docker compose run --rm web yarn install'
                sh 'docker compose run --rm web rails tailwindcss:build'
                //sh 'docker build -t X .' //Substitua o X pelo nome da imagem correspondente no docker-compose.yml
                sh 'docker-compose up -d'
                
            }
        }

        stage('Wainting for logs stage'){
            steps{
                sh 'echo --> INFO: 4 - Wainting for logs !!'
                sleep(60)
            }
        }
        stage('Logs stage'){
            steps{
                sh 'echo --> INFO: 5 - Generating logs...'
                sh 'docker-compose logs'
            }
        }
    }
}
