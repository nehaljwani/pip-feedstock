:: remove all the things that pip vendors - use our own
::    this is only important on windows, where we bump into path length limits.
pushd pip\_vendor
rd /s /q cachecontrol colorama distlib html5lib packaging lockfile pkg_resources progress requests webencodings
del six.py
popd

python setup.py install --single-version-externally-managed --record record.txt
if errorlevel 1 exit 1

cd %SCRIPTS%
del *.exe
del *.exe.manifest
del pip2*
del pip3*
REM del %SP_DIR%\__pycache__\pkg_res*
