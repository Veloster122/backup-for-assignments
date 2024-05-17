@echo off
setlocal enabledelayedexpansion

rem Input and output file names
set "input_fasta=algnFirstTreeRAG-2.fasta"
set "output_fasta=algnFirstTreeRAG-2Processed.fasta"

rem Clear the output file if it exists
if exist "%output_fasta%" del "%output_fasta%"

rem Process each line in the input FASTA file
for /f "usebackq tokens=*" %%A in ("%input_fasta%") do (
    set "line=%%A"
    rem Check if the line starts with '>'
    if "!line!" neq "" (
        if "!line:~0,1!" == ">" (
            rem Remove the first 11 characters after '>'
            set "line=>!line:~12!"
        )
    )
    rem Append the processed line to the output file
    echo !line!>>"%output_fasta%"
)

endlocal
