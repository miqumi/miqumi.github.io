# This was produced by (@eimikadabra on discord) and is worth 2 hours of work. Please respect the code and Do not steal.

Add-Type -AssemblyName System.Windows.Forms
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class WinAPI {
    [DllImport("user32.dll")]
    public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);

    public const int SW_HIDE = 0;
    public const int SW_SHOW = 5;
}
"@

# Hide the console window
$consolePtr = [System.Diagnostics.Process]::GetCurrentProcess().MainWindowHandle
[WinAPI]::ShowWindow($consolePtr, [WinAPI]::SW_HIDE)

# Define the Minecraft folders
$minecraftPath = [System.Environment]::GetFolderPath('LocalApplicationData') + '\Packages\Microsoft.MinecraftUWP_8wekyb3d8bbwe\LocalState'
$minecraftWorldsPath = Join-Path $minecraftPath 'games\com.mojang\minecraftWorlds'
$resourcePacksPath = Join-Path $minecraftPath 'games\com.mojang\resource_packs'
$developmentResourcePacksPath = Join-Path $minecraftPath 'games\com.mojang\development_resource_packs'
$behaviorPacksPath = Join-Path $minecraftPath 'games\com.mojang\behavior_packs'
$developmentBehaviorPacksPath = Join-Path $minecraftPath 'games\com.mojang\development_behavior_packs'
$worldTemplatesPath = Join-Path $minecraftPath 'games\com.mojang\world_templates'
$skinPacksPath = Join-Path $minecraftPath 'games\com.mojang\skin_packs'
$developmentSkinPacksPath = Join-Path $minecraftPath 'games\com.mojang\development_skin_packs'

# Define the backup folder path on the user's desktop
$backupPath = [System.Environment]::GetFolderPath('Desktop') + '\EiMCBackups'

# Create the backup folder on the desktop if it doesn't exist
if (-not (Test-Path -Path $backupPath)) {
    New-Item -Path $backupPath -ItemType Directory
}

# Create a simple GUI
$form = New-Object System.Windows.Forms.Form
$form.Text = "Minecraft Backup"
$form.Size = New-Object System.Drawing.Size(400, 400)
$form.BackColor = [System.Drawing.Color]::FromArgb(30, 30, 30)  # Dark mode background color

# Checkbox for Minecraft World
$checkBoxWorlds = New-Object System.Windows.Forms.CheckBox
$checkBoxWorlds.Location = New-Object System.Drawing.Point(50, 50)
$checkBoxWorlds.Text = "Minecraft Worlds"
$checkBoxWorlds.Checked = $false
$checkBoxWorlds.ForeColor = [System.Drawing.Color]::White  # White text color in dark mode

# Checkbox for Resource Packs
$checkBoxResourcePacks = New-Object System.Windows.Forms.CheckBox
$checkBoxResourcePacks.Location = New-Object System.Drawing.Point(50, 80)
$checkBoxResourcePacks.Text = "Resource Packs"
$checkBoxResourcePacks.Checked = $false
$checkBoxResourcePacks.ForeColor = [System.Drawing.Color]::White

# Checkbox for Development Resource Packs
$checkBoxDevelopmentResourcePacks = New-Object System.Windows.Forms.CheckBox
$checkBoxDevelopmentResourcePacks.Location = New-Object System.Drawing.Point(50, 110)
$checkBoxDevelopmentResourcePacks.Text = "Development Resource Packs"
$checkBoxDevelopmentResourcePacks.Checked = $false
$checkBoxDevelopmentResourcePacks.ForeColor = [System.Drawing.Color]::White

# Checkbox for Behavior Packs
$checkBoxBehaviorPacks = New-Object System.Windows.Forms.CheckBox
$checkBoxBehaviorPacks.Location = New-Object System.Drawing.Point(50, 140)
$checkBoxBehaviorPacks.Text = "Behavior Packs"
$checkBoxBehaviorPacks.Checked = $false
$checkBoxBehaviorPacks.ForeColor = [System.Drawing.Color]::White

# Checkbox for Development Behavior Packs
$checkBoxDevelopmentBehaviorPacks = New-Object System.Windows.Forms.CheckBox
$checkBoxDevelopmentBehaviorPacks.Location = New-Object System.Drawing.Point(50, 170)
$checkBoxDevelopmentBehaviorPacks.Text = "Development Behavior Packs"
$checkBoxDevelopmentBehaviorPacks.Checked = $false
$checkBoxDevelopmentBehaviorPacks.ForeColor = [System.Drawing.Color]::White

# Checkbox for World Templates
$checkBoxWorldTemplates = New-Object System.Windows.Forms.CheckBox
$checkBoxWorldTemplates.Location = New-Object System.Drawing.Point(50, 200)
$checkBoxWorldTemplates.Text = "World Templates"
$checkBoxWorldTemplates.Checked = $false
$checkBoxWorldTemplates.ForeColor = [System.Drawing.Color]::White

# Checkbox for Skin Packs
$checkBoxSkinPacks = New-Object System.Windows.Forms.CheckBox
$checkBoxSkinPacks.Location = New-Object System.Drawing.Point(50, 230)
$checkBoxSkinPacks.Text = "Skin Packs"
$checkBoxSkinPacks.Checked = $false
$checkBoxSkinPacks.ForeColor = [System.Drawing.Color]::White

# Checkbox for Development Skin Packs
$checkBoxDevelopmentSkinPacks = New-Object System.Windows.Forms.CheckBox
$checkBoxDevelopmentSkinPacks.Location = New-Object System.Drawing.Point(50, 260)
$checkBoxDevelopmentSkinPacks.Text = "Development Skin Packs"
$checkBoxDevelopmentSkinPacks.Checked = $false
$checkBoxDevelopmentSkinPacks.ForeColor = [System.Drawing.Color]::White

# Create a label for the watermark
$labelWatermark = New-Object System.Windows.Forms.Label
$labelWatermark.Location = New-Object System.Drawing.Point(10, 10)  # Shift to the top left (10, 10)
$labelWatermark.Size = New-Object System.Drawing.Size(140, 20)
$labelWatermark.Text = "by @eimikadabra on Discord"
$labelWatermark.ForeColor = [System.Drawing.Color]::Cyan  # Set font color to cyan

$buttonBackup = New-Object System.Windows.Forms.Button
$buttonBackup.Location = New-Object System.Drawing.Point(50, 330)
$buttonBackup.Size = New-Object System.Drawing.Size(200, 30)
$buttonBackup.Text = "Backup Minecraft Files"
$buttonBackup.BackColor = [System.Drawing.Color]::Green  # Green button background color
$buttonBackup.ForeColor = [System.Drawing.Color]::White  # White text color

$buttonBackup.Add_Click({
    $timestamp = Get-Date -Format "yyyyMMddHHmmss"
    $backupFolder = Join-Path $backupPath $timestamp
    New-Item -Path $backupFolder -ItemType Directory

    if ($checkBoxWorlds.Checked) {
        Copy-Item -Path $minecraftWorldsPath -Destination $backupFolder -Recurse
    }

    if ($checkBoxResourcePacks.Checked) {
        Copy-Item -Path $resourcePacksPath -Destination $backupFolder -Recurse
    }

    if ($checkBoxDevelopmentResourcePacks.Checked) {
        Copy-Item -Path $developmentResourcePacksPath -Destination $backupFolder -Recurse
    }

    if ($checkBoxBehaviorPacks.Checked) {
        Copy-Item -Path $behaviorPacksPath -Destination $backupFolder -Recurse
    }

    if ($checkBoxDevelopmentBehaviorPacks.Checked) {
        Copy-Item -Path $developmentBehaviorPacksPath -Destination $backupFolder -Recurse
    }

    if ($checkBoxWorldTemplates.Checked) {
        Copy-Item -Path $worldTemplatesPath -Destination $backupFolder -Recurse
    }

    if ($checkBoxSkinPacks.Checked) {
        Copy-Item -Path $skinPacksPath -Destination $backupFolder -Recurse
    }

    if ($checkBoxDevelopmentSkinPacks.Checked) {
        Copy-Item -Path $developmentSkinPacksPath -Destination $backupFolder -Recurse
    }

    [System.Windows.Forms.MessageBox]::Show("Backup completed!", "Minecraft Backup", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
})

$form.Controls.Add($checkBoxWorlds)
$form.Controls.Add($checkBoxResourcePacks)
$form.Controls.Add($checkBoxDevelopmentResourcePacks)
$form.Controls.Add($checkBoxBehaviorPacks)
$form.Controls.Add($checkBoxDevelopmentBehaviorPacks)
$form.Controls.Add($checkBoxWorldTemplates)
$form.Controls.Add($checkBoxSkinPacks)
$form.Controls.Add($checkBoxDevelopmentSkinPacks)
$form.Controls.Add($labelWatermark)
$form.Controls.Add($buttonBackup)

# Event handler for the form's FormClosed event
$form.add_FormClosed({
    # Get the list of backup folders in the backup directory
    $backupFolders = Get-ChildItem -Path $backupPath -Directory | Sort-Object -Property Name -Descending

    if ($backupFolders.Count -gt 0) {
        $latestBackupFolder = $backupFolders[0].FullName
        Invoke-Item $latestBackupFolder
    }
})

[void]$form.ShowDialog()