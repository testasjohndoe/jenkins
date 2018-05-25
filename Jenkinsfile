#!groovy

node {
    def buildNumber    = env.BUILD_NUMBER
    def buildWorkspace = env.WORKSPACE
    environment {
        def phpmd          = "${buildWorkspace}/vendor/bin/phpmd ${buildWorkspace}/app xml codesize,unusedcoderules.xml --reportfile ${buildWorkspace}/build/logs/pmd.xml"
        def phpcs          = "${buildWorkspace}/vendor/bin/phpcs -s --report=xml --report-file=${buildWorkspace}/logs/checkstyle.xml --report=checkstyle --standard=PSR2 --extensions=php --ignore='*/database/*, */migrations/*, */views/*, autoload.php' ${buildWorkspace}/app"
        def phpcpd         = "${buildWorkspace}/vendor/bin/phpcpd ${buildWorkspace}/app --log-pmd ${buildWorkspace}/build/logs/pmd-cpd.xml"
        def lint           = "php -l ${buildWorkspace}/app */*.php"
    }
	stage ('ALL') {
		stage('Checkout branch') {
            step {
                    sh 'uname -a'
            }
        }
	}

	post {
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