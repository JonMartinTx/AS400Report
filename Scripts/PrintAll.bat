:@echo off
:Batch file to download spooled files from the AS/400
cd "C:\AS400Report\Scripts"

: Backup previous files
del prtq\*.* > Nul

: Download spooled files
ftp -i -s:prtq.dat

: Download overlay file
ftp -s:getstmt.txt

: Run the AS400Report tool
cd "C:\AS400Report\AS400Report\bin\Debug"
start AS400Report Reports
start AS400Report Statements

echo Processing complete.