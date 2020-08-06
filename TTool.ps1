Add-Type -AssemblyName PresentationFramework, System.Drawing, System.Windows.Forms, WindowsFormsIntegration

Remove-Variable * -ErrorAction SilentlyContinue

$powershellType = Get-Host | Select-Object PrivateData

if([string]$powershelltype.privatedata -eq "Microsoft.PowerShell.ConsoleHost+ConsoleColorProxy"){

    #hides the scary console window

    $windowcode = '[DllImport("user32.dll")]  public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);'
    $asyncwindow = Add-Type -MemberDefinition $windowCode -name Win32ShowWindowAsync =namespace Win32Functions -PassThru
    $null = $asyncwindow::ShowWindowAsync((Get-Process -PID $pid).MainWindowHandle, 0);
    [System.Windows.Forms.Integration.ElementHost]::EnableModelessKeyboardInterop($form)
}

function readJson{
    Param ($filePath)

    $temp = @();
    $temp = Get-Content -Path ($filePath) -Raw | ConvertFrom-Json
    return $temp
}

function readXaml{
    Param ($filePath)
    
    [xml]$xaml = Get-Content -Path ($filePath);
    $reader = (New-Object System.Xml.XmlNodeReader $xaml)

    return $reader

}

function writeJson{
    Param ($psObject, $filePath)

    [string]$temp = ConvertTo-Json $psObject -Depth 100
    $temp | Out-File $filePath
}

[xml]$xaml = Get-Content -Path ([string]$PSScriptRoot + "\MainWindow.xaml");
$reader = readXaml ([string]$PSScriptRoot + "\MainWindow.xaml");
$window = [Windows.Markup.XamlReader]::Load($reader);

. ([string]$PSScriptRoot + "\libs\windowsfunctions.ps1");

#init


$window.showDialog()