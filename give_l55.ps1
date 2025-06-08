# Make sure to run COD4 once before doing this so that your key will be in the registry
$myKey = (Get-ItemProperty "hklm:SOFTWARE\WOW6432Node\Activision\Call of Duty 4").codkey

# Decrypt the L55 file with the original key
.\build\iwmtool\Debug\iwmtool.exe -i ".\mpdata_l55" -o ".\mpdata_dec" -m decrypt -k DL2J8PY44Q22GE4888D2 

# Re-encrypt it with our key
.\build\iwmtool\Debug\iwmtool.exe -i ".\mpdata_dec" -o ".\mpdata" -m encrypt -k $myKey

# Delete the temporary decrypted file
del .\mpdata_dec