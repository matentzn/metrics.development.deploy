SET pipelineconfig=D:\metric.pipeline\
SET results=%pipelineconfig%out
SET harvestresults=%pipelineconfig%pushresults\

:: Process the results (add them to the server, etc)

cd %harvestresults%

for /r %%i in (*.jar) do (
	cd %results%
	for /r %%j in (*.rdf) do java -Xms2G -Xmx10G -jar %%i %%j "http://localhost:8080/metrics.server/rest/add/metrics?format=rdfxml"
)

cd %pipelineconfig%