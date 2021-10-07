projectName=vishalb
scriptName=$projectName.jmx
time=$(date "+%Y.%m.%d-%H.%M")
results=PerfTest_Results_$time
mkdir ./$results
mkdir ./HTMLReport_$time
nohup sh apache-jmeter-5.5-SNAPSHOT/bin/jmeter.sh -Jjmeter.save.saveservice.output_format=csv -n -t ./$scriptName -f -l ./$projectName.jtl -e -o ./HTMLReport_$time > ./$results/nohup.txt 2>&1
sh apache-jmeter-5.5-SNAPSHOT/bin/JMeterPluginsCMD.sh --generate-csv ./Aggregate_$time.csv --input-jtl ./$projectName.jtl --plugin-type AggregateReport
mv ./HTMLReport_$time ./$results
mv ./$projectName.jtl ./$results
mv ./jmeter.log ./$results
mv ./GrafanaResults.txt ./$results
mv ./Aggregate_$time.csv ./$results
mv ./$projectName.properties ./$results
echo "Test Finished. Find test results in folder $results"