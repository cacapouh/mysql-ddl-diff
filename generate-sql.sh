liquibase --classpath=./mysql-connector-j-9.0.0.jar \
          --url=jdbc:mysql://0.0.0.0:3306/db \
          --username=user \
          --password=password \
          --changelog-file=example-changelog.xml \
          update-sql 
