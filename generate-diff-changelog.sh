liquibase --classpath=./mysql-connector-j-9.0.0.jar \
          --url=jdbc:mysql://0.0.0.0:3306/db \
          --username=user \
          --password=password \
          --referenceUrl=jdbc:mysql://0.0.0.0:3307/db \
          --referenceUsername=user \
          --referencePassword=password \
          --referenceDriver=com.mysql.jdbc.Driver \
          --changelog-file=example-changelog.xml \
          diff-changelog
