# How to give yourself L55 in the 2007 Steam version of COD4

Clone this repository:

```
git clone https://github.com/jsmrcina/iwmtool.git
cd iwmtool
git submodule update --init --recursive
```

Build the iwmtool via CMake (make sure to install CMake and that it is in your PATH)

```
mkdir build
cd build
CMake ..
CMake --build .
```

Install the game and run it. If you get a PunkBuster pop up, let it run. If it fails, you can just kill pbsetup.exe from the Task Manager and everything will still work fine (PB hasn't been supported for a while).

Once the game has run, Steam Client Service, running as SYSTEM, will put your Steam COD4 cd key into the registry under `HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Activision\Call of Duty 4 : codkey (REG_SZ)`. Make sure to give your profile a Name, which you will use below before exiting the game.

Close the game and then run `give_l55.ps1` from an elevated PowerShell prompt at the root of the git repository.

Here is what the script does:

1) Read the codkey from the registry
2) Decrypt the Level 55 mpdata file under `l55_mpdata\mpdata` with the key it was originally encrypted with (it was sourced from this forum: https://gamers-underground.com/forum/games/action-fps/29619-how-to-unlock-all-cod4-guns-and-perks-level-55-crack)
3) Encrypt the mpdata with your codkey

Once this is done, the root of the repository will have a file named "mpdata" that is encrypted with your CD-key. Copy this file over the existing mpdata file in your steam library profile folder. It will be something like:

`<Drive>\SteamLibrary\steamapps\common\Call of Duty 4\players\profiles\<Name>\mpdata`

Re-launch the game.

Profit.

# iwmtool
Tool for manipulating mpdata files for CoD4

### Quick info:
CoD4 stores multiplayer stats in an encrypted file. This tool is able to encrypt and decrypt the stats file, and is also able to edit stats.

### Supported operations:
* convert vanilla `iwm0` format to CoD4X `ice0` format and vice-versa (basically: encryption and decryption)
* simple stats manipulation

### Example:
* Decryption:
```console
$ iwmtool --mode=decrypt --input=mpdata --output=mpdata_decrypted --key=YOUR_CD_KEY
```

* Encryption:
```console
$ iwmtool --mode=encrypt --input=mpdata --output=mpdata_encrypted --key=YOUR_CD_KEY
```

* Edit stats: (set total kills to 123)
```console
$ iwmtool --mode=stats --input=mpdata --output=mpdata_edited --index=2303 --set=123
```

*Note:* Most stats indices can be found in string tables and game scripts extracted from `*_mp.ff` files.

*Note:* You can omit CD-key if you run Windows and CoD4 is properly installed on your PC or if you edit a decrypted mpdata file.
