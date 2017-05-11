FROM microsoft/windowsservercore

LABEL maintainer="tom@thingamajig.net"
LABEL description="InfluxDB on Windows Server Core"

ENV influxDBVersion influxdb-1.2.2_windows_amd64

RUN powershell -executionpolicy bypass -command \
	# Make directory
	mkdir "c:\influxdb" ;\
	cd "c:\influxdb" ;\
      # Download influxdb ;\
      $url = "https://dl.influxdata.com/influxdb/releases/influxdb-1.2.2_windows_amd64.zip" ;\
      $outputFile = "$PSScriptRoot\influxdb.zip" ;\
      (New-Object System.Net.WebClient).DownloadFile($url, $outputFile)

RUN powershell -executionpolicy bypass -command \
	# Extract archive ;\
	Expand-Archive "influxdb.zip" -DestinationPath "c:\influxdb"
	
ENTRYPOINT ["C:\\influxdb\\influxd.exe"]	
