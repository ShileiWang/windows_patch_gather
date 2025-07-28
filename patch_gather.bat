@echo off
setlocal enabledelayedexpansion
chcp 936

PowerShell -ExecutionPolicy Bypass -File ".\patch_gather.ps1"
pause