@echo off

:: tranform.bat - transforms a file by doing string substitution using a 
:: substitution table from an .ini file.
::
:: usage: transform.bat infile outfile config
:: 	  infile  - file to transform
::        outfile - file to store output
::        config  - ini file containing name/value pairs

echo ===============================================================================
echo Updating %~1 with values from %~3
echo -------------------------------------------------------------------------------

copy %~1 in.tmp > NUL


for /f "tokens=1,2 delims==" %%a in (%~3) do (
  echo Replacing "%%a" with "%%b"... 

 call BatchSubstitute.bat "${%%a}" "%%b" in.tmp > out.tmp

  copy out.tmp in.tmp > NUL
)

@copy out.tmp %~2 > NUL
echo -------------------------------------------------------------------------------
echo Cleaning up.
echo All done. The transformed file is %~2
del out.tmp
del in.tmp
echo ===============================================================================
