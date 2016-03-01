environments {

dev {
		server {
			localHomeDir = '/apache/apache-tomcat-8.0.24-dev'
			containerId = 'tomcat8x'
			hostname = 'localhost'
			port = 8091
			context = appName
			username = 'tomcat'
			password = 's3cret'
		}
}
qa {
		server {
			localHomeDir = '/apache/apache-tomcat-8.0.24-qa'
			containerId = 'tomcat8x'
			hostname = 'localhost'
			port = 8092
			context = appName
			username = 'tomcat'
			password = 's3cret'
		}
	}
perf {
		server {
			localHomeDir = '/apache/apache-tomcat-8.0.24-perf'
			containerId = 'tomcat8x'
			hostname = 'localhost'
			port = 8093
			context = appName
			username = 'tomcat'
			password = 's3cret'
		}
	}
stage {
		server {
			localHomeDir = '/apache/apache-tomcat-8.0.24-stage'
			containerId = 'tomcat8x'
			hostname = 'localhost'
			port = 8094
			context = appName
			username = 'tomcat'
			password = 's3cret'
		}
	}
prod {
		server {
			localHomeDir = '/apache/apache-tomcat-8.0.24-prod'
			containerId = 'tomcat8x'
			hostname = 'localhost'
			port = 8095
			context = appName
			username = 'tomcat'
			password = 's3cret'
		}
	}
}
