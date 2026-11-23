@rem Gradle startup script for Windows
@echo off
set DIR=%~dp0
if not exist "%DIR%gradle\wrapper\gradle-wrapper.jar" (
    echo Bootstrapping Gradle wrapper...
    call gradle wrapper --gradle-version 8.10.2 || call gradle wrapper
)
if exist "%DIR%gradle\wrapper\gradle-wrapper.jar" (
    java -jar "%DIR%gradle\wrapper\gradle-wrapper.jar" %*
) else (
    gradle %*
)
