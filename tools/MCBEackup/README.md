# MCBEackup
Simple as white; Powershell based Windows 10+ utility for backing up natural Minecraft: Windows 10 Edition Data.  

## Usage
Two ways to do such.  
1. [Download and run the file manually](###download-manually-to-run)  
2. [`iwr` in powershell](###run-through-iwr)  

### Download manually to run
You can download the file and run it manually, but it comes with it's cons:  
- If I update the script, you won't be notified.  
- You will need to redownload the script every update.  
How to:
1. [Click here to download the script](https://miqumi.github.io/backup.ps1)
2. Right click the newly downloaded `backup.ps1` and click `Run in Powershell`

### Run through iwr
This is the better way to do it.
1. Press Windows Key on your keyboard, type `powershell` and Press **Enter**.  
  \(_**OR**_ Press Windows Key + R, type `powershell` and Press **Enter**.
2. In the new window that pops up, type:
  ```powershell
  iex(iwr https://miqumi.github.io/backup.ps1)
  ```
  _**OR**_
  ```powershell
  iwr https://miqumi.github.io/backup.ps1 | iex
  ```
