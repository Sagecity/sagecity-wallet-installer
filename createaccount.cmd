
@echo off
set subkey1=%random%%random%%random%%random%%random%%random%
set subkey2=%random%%random%%random%%random%%random%%random%
set subkey3=%random%%random%%random%%random%%random%%random%


ECHO %subkey1:0=a%
ECHO %subkey1:1=b%
ECHO %subkey1:2=c%
ECHO %subkey1:3=d%
ECHO %subkey1:4=e%
ECHO %subkey1:5=f%
ECHO %subkey1:6=g%
ECHO %subkey1:7=h%
ECHO %subkey1:8=i%
ECHO %subkey1:9=j%

ECHO %subkey2:0=k%
ECHO %subkey2:1=l%
ECHO %subkey2:2=m%
ECHO %subkey2:3=n%
ECHO %subkey2:4=o%
ECHO %subkey2:5=p%
ECHO %subkey2:6=q%
ECHO %subkey2:7=r%
ECHO %subkey2:8=s%
ECHO %subkey2:9=t%

ECHO %subkey3:0=u%
ECHO %subkey3:1=v%
ECHO %subkey3:2=w%
ECHO %subkey3:3=x%
ECHO %subkey3:4=y%
ECHO %subkey3:5=z%
REM after going through all the letters, we just pick random ones
ECHO %subkey3:6=a%
ECHO %subkey3:7=g%
ECHO %subkey3:8=k%
ECHO %subkey3:9=o%

set key=%subkey1%%subkey2%%subkey3%

geth --exec "personal.newAccount('%key%')" attach >tmp.txt

SET /p address= <tmp.txt

set address=%address:"='%

geth --exec "personal.unlockAccount(%address%,'%key%',0)" attach

echo cd %~dp0 & geth --exec "personal.unlockAccount(%address%,'%key%',0)" attach >unlock.cmd


set address=%address:'=%

echo %key%>password_%address%.txt


