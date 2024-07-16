@echo off

:: Create a VBScript file to run the batch script hidden
echo Set WshShell = CreateObject("WScript.Shell") > "%temp%\HiddenScript.vbs"
echo WshShell.Run chr(34) & "%~f0" & chr(34) & ", 0, False" >> "%temp%\HiddenScript.vbs"

:: Start the VBScript and delete it immediately
start "" "%temp%\HiddenScript.vbs"
del "%temp%\HiddenScript.vbs"
exit

:: The rest of your batch script below

:: Wait for DHCP for 2 minutes
ping -n 120 127.0.0.1 >nul

:: Run the curl command
curl "https://portal.it.kmitl.ac.th:4081/internal/dologin.php" ^
  -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7" ^
  -H "Accept-Language: en-US,en;q=0.9" ^
  -H "Cache-Control: max-age=0" ^
  -H "Connection: keep-alive" ^
  -H "Content-Type: application/x-www-form-urlencoded" ^
  -H "Cookie: _ga_V7RFDM8MGT=GS1.1.1714779644.1.1.1714779678.0.0.0; _ga=GA1.1.230204708.1714779644; _ga_TL3VFMQSSB=GS1.1.1714779721.1.0.1714779733.0.0.0; SESSION_CONTROL_WEBIFACE=b0a380b464fd5241987ec0446bfe1316a0c215d52f23b5bbc4000961040eaa1a; TOKEN_CONTROL_WEBIFACE=45525ebd19895f8d2394bf8ecbeb0fc7aea140e89c0a628cd7aa23255c7a274a" ^
  -H "Origin: https://portal.it.kmitl.ac.th:4081" ^
  -H "Referer: https://portal.it.kmitl.ac.th:4081/login/" ^
  -H "Sec-Fetch-Dest: document" ^
  -H "Sec-Fetch-Mode: navigate" ^
  -H "Sec-Fetch-Site: same-origin" ^
  -H "Sec-Fetch-User: ?1" ^
  -H "Upgrade-Insecure-Requests: 1" ^
  -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0" ^
  -H ^"sec-ch-ua: ^\^"Not/A)Brand^\^";v=^\^"8^\^", ^\^"Chromium^\^";v=^\^"126^\^", ^\^"Microsoft Edge^\^";v=^\^"126^\^"^" ^
  -H "sec-ch-ua-mobile: ?0" ^
  -H ^"sec-ch-ua-platform: ^\^"Windows^\^"^" ^
  --data-raw "kerio_username=Maxhub+Peer+Tutor2&kerio_password="

exit