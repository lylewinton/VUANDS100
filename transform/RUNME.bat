@echo off
echo #### Starting XML transform...
@echo on
java -jar saxon9he.jar -s:wp_frm_fields.xml -xsl:transform.xsl -o:rifcs.xml  || goto :error
@echo off
echo.
echo #### SUCCESS!
pause
goto :EOF


:error
@echo off
echo.
echo #### Failed with error #%errorlevel%
pause
exit %errorlevel%