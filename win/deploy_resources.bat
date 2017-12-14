@echo off

SET pipelineconfig=D:\metric.pipeline\
SET metricsserverdeploy=%pipelineconfig%metrics.server.deploy\
SET metricsharvestdeploy=%pipelineconfig%metrics.harvest.deploy\
SET evowlowl=%pipelineconfig%ev.owl\ev.owl

SET harvestpipeline=%metricsharvestdeploy%harvest\
SET harvestjars=%metricsharvestdeploy%jars\
SET harvestpipelineurl=%harvestpipeline%url
SET harvestpipelinefile=%harvestpipeline%file

SET harvestresults=%pipelineconfig%pushresults\
::SET harvestjar=%harvestresults%metrics.exampleclient-0.0.1-jar-with-dependencies.jar

SET deploywebapps=%metricsserverdeploy%webapps
SET deployjars=%metricsserverdeploy%jars
SET tomcat=D:\tools\tomcat\bin\
SET tomcatwebapps=%tomcat%webapps\
SET workspace="D:\Dropbox (Personal)\workspaces\owl2badge\"
SET wsmetricsserver=%workspace%metrics.server\target\metrics.server.war
SET wsowlbadge=%workspace%evowl.ws\target\evowl.ws.war
SET wsevowlui=%workspace%evowl.ui\target\evowl.ui-1.0.0.war

:: JAR locations in Workspace
SET wsmetricsharvestoa3=%workspace%metrics.harvest.oa3\target\metrics.harvest.oa3-0.0.1-jar-with-dependencies.jar
SET wsmetricsharvestoa4=%workspace%metrics.harvest.oa4\target\metrics.harvest.oa4-0.0.1-jar-with-dependencies.jar
SET wsmetricsharvestoa5=%workspace%metrics.harvest.oa5\target\metrics.harvest.oa5-0.0.1-jar-with-dependencies.jar
SET wsmetricsharvesthermit=%workspace%metrics.harvest.hermit\target\metrics.harvest.hermit-0.0.1-jar-with-dependencies.jar
SET wsmetricsserverurl=%workspace%metrics.harvest.url\target\metrics.harvest.url-0.0.1-jar-with-dependencies.jar
SET wsmetricspostresult=%workspace%metrics.exampleclient\target\evowl-post-metrics.jar
SET wsmetricsgetoids=%workspace%metrics.exampleclient\target\evowl-get-oids.jar

:: Update jars in pipeline directory
@RD /S /Q %harvestpipeline%
mkdir %harvestpipeline%
mkdir %harvestpipelineurl%
mkdir %harvestpipelinefile%
xcopy %wsmetricsserverurl% %harvestpipelineurl%
xcopy %wsmetricsharvestoa3% %harvestpipelinefile%
xcopy %wsmetricsharvestoa4% %harvestpipelinefile%
xcopy %wsmetricsharvestoa5% %harvestpipelinefile%
xcopy %wsmetricsharvesthermit% %harvestpipelinefile%


:: Clear pushresults directory and add updated jar (OBSOLETE)


:: Update webapps in deployment webapp directory
xcopy /y %evowlowl% %metricsserverdeploy%
xcopy /y %wsmetricspostresult% %deployjars%
xcopy /y %wsmetricspostresult% %harvestjars%
xcopy /y %wsmetricsgetoids% %harvestjars%
xcopy /y %wsmetricsserver% %deploywebapps%
xcopy /y %wsowlbadge% %deploywebapps%
xcopy /y %wsevowlui% %deploywebapps%