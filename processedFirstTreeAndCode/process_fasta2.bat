@echo off
setlocal enabledelayedexpansion

rem Input and output file names
set "input_fasta=algnFirstTreeRAG-2Processed.fasta"
set "output_fasta=algnFirstTreeRAG-2Processed2.fasta"

rem Clear the output file if it exists
if exist "%output_fasta%" del "%output_fasta%"

rem Process each line in the input FASTA file
for /f "usebackq tokens=*" %%A in ("%input_fasta%") do (
    set "line=%%A"
    rem Check if the line starts with '>'
    if "!line!" neq "" (
        if "!line:~0,1!" == ">" (
            rem Extract the species name (first two words after '>')
            set "header=!line:~1!"
            for /f "tokens=1,2" %%B in ("!header!") do (
                set "line=>%%B %%C"
            )
        )
    )
    rem Append the processed line to the output file
    echo !line!>>"%output_fasta%"
)

endlocal