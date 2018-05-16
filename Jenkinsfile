#!groovy

node {
	//agent any
	//options {
    //    // Keep the 10 most recent builds
    //    buildDiscarder(logRotator(numToKeepStr:'10'))
    //}
    def buildNumber    = env.BUILD_NUMBER
    def buildWorkspace = env.WORKSPACE
    environment {
        def buildImage     = "blm_build"
        def gitRepo        = "ssh://10.40.236.198:7997/da/bloomberg.git"
        def buildBranch    = "develop"
        def phpmd          = "${buildWorkspace}/vendor/bin/phpmd ${buildWorkspace}/app xml codesize,unusedcoderules.xml --reportfile ${buildWorkspace}/build/logs/pmd.xml"
        def phpcs          = "${buildWorkspace}/vendor/bin/phpcs -s --report=xml --report-file=${buildWorkspace}/logs/checkstyle.xml --report=checkstyle --standard=PSR2 --extensions=php --ignore='*/database/*, */migrations/*, */views/*, autoload.php' ${buildWorkspace}/app"
        def phpcpd         = "${buildWorkspace}/vendor/bin/phpcpd ${buildWorkspace}/app --log-pmd ${buildWorkspace}/build/logs/pmd-cpd.xml"
        def lint           = "php -l ${buildWorkspace}/app */*.php"
        //def runInDocker    = { cmd ->
        //                        docker.image("${buildImage}")
        //                           .inside { c -> 
        //                                    cmd.each { cmdToken -> sh "docker exec ${c.id} ${cmdToken}"}                               
        //                            }
        //                        }
        
    }
	stage ('ALL') {
		stage('Checkout branch') {
        	    step {
        	            sh 'uname -a'
                        //git branch: "${buildBranch}", credentialsId: '15ffcf7b-fc95-47cc-8451-5bf71565f550', url: "${gitRepo}" 
        	            //checkout scm
        	    }
        	}

        	//stage('Clean and prepare report directories, prepare environment file') {
        	//    step {
        	//	      sh '/opt/bin/db.sh start "${buildNumber}" "${buildWorkspace}"'
        	//    }
        	//}

        	//stage('Start containers, install/update dependencies') {
        	    //def c = docker.image("${buildImage}").run
                //step {
                    //docker.image("${buildImage}").inside {
                        //sh 'docker exec ${c.id} mkdir -p "${buildWorkspace}"/build/api'
                        //stage("test action"){
                        //    sh "pwd"
                        //}
                        //stage("2nd test"){
                        //    sh "uname -a"
                        //}
                    //}

                    // runInDocker  ['mkdir -p ${buildWorkspace}/build/api',
                    //  'mkdir -p ${buildWorkspace}/build/coverage',
                    //  'mkdir -p ${buildWorkspace}/build/logs',
                    //  'php composer self-update --quiet',
                    // ]

                    // parallel (
                    //     "phpmd"  : {
                    //                 runInDocker "${phpmd}"
                    //                 }
                    //     "phpcs"  : {
                    //                 runInDocker "${phpcs}"
                    //                 }
                    //     "phpcpd" : {
                    //                 runInDocker "${phpcpd}"
                    //                 }
                    //     "lint"   : {
                    //                 runInDocker "${lint}"
                    //                 }
                    // )
        	    //}
        	//}
	}

	post {
	 	//always {
	// 	  sh 'make сhmod'
	// 	  sh 'make stop-ci'
	// 	  step([$class: 'CheckStylePublisher', canComputeNew: false, canRunOnFailed: true, defaultEncoding: '', healthy: '', pattern: 'reports/checkstyle.xml', unHealthy: ''])
 //          step([$class: 'PmdPublisher', canComputeNew: false, canRunOnFailed: true, defaultEncoding: '', healthy: '', pattern: 'reports/pmd.xml', unHealthy: ''])
 //          step([$class: 'DryPublisher', canComputeNew: false, canRunOnFailed: true, defaultEncoding: '', healthy: '', pattern: 'reports/cpd.xml', unHealthy: ''])
 //          junit allowEmptyResults: true, testResults: 'reports/phpunit.xml'
 //          publishHTML([allowMissing: true, alwaysLinkToLastBuild: false, keepAll: true, reportDir: 'reports/coverage', reportFiles: 'index.html', reportName: 'Coverage Report'])
 //        }

         success {
             script {
                 currentBuild.result = 'SUCCESS'
             }
         }

         failure {
             script {
                 currentBuild.result = 'FAILED'
             }
         }

         unstable {
             script {
                 currentBuild.result = 'FAILED'
             }
         }
	 }
}