FROM microsoft/windowsservercore

LABEL maintainer="tom@thingamajig.net"
LABEL description="InfluxDB on Windows Server Core"

ENV influxDBVersion influxdb-1.2.2_windows_amd64

RUN powershell -executionpolicy bypass -command \
      # Download influxdb ;\
      Invoke-WebRequest "https://dl.influxdata.com/influxdb/releases/$($env:influxDBVersion).zip" -Outfile "$($env:influxDBVersion).zip" -UseBasicParsing)

RUN powershell -executionpolicy bypass -command \
	# Extract archive ;\
	mkdir "c:\influxdb" ;\
	Expand-Archive "$version.zip" -DestinationPath "c:\influxdb"
	
ENTRYPOINT ["C:\\influxdb\\influxd.exe"]	
