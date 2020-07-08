rd c:\streaming-tools /s /q
"C:\Program Files\Git\bin\git.exe" clone -b windows-vm https://github.com/cloud-platforms-streaming/streaming-tools c:\streaming-tools
rd C:\Users\streamer\AppData\Roaming\obs-studio\ /S /Q
mkdir C:\Users\streamer\AppData\Roaming\obs-studio\
xcopy /E c:\streaming-tools\obs\openshift_streaming\* c:\Users\streamer\AppData\Roaming\obs-studio\
copy c:\streaming-tools\obs\global.ini c:\Users\streamer\AppData\Roaming\obs-studio\