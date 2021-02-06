@echo off
set location=%1
set videospath=%2

ffmpeg -report -user_agent "Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.146 Safari/537.36" -protocol_whitelist "file,http,https,tcp,tls,crypto,data" -allowed_extensions ALL -i "http://link/to/m3u8/%location%.m3u8" -c copy "%videospath%%location%.ts"
