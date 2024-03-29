+++
title = "Powershell"
categories = ["Coding"]
+++

## Custom Powershell (5.1) Prompt

Create the following file:

```powershell
C:\Users\$env:USERNAME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
```

With the following contents:

```powershell
function Write-BranchName () {
    try {
        $branch = git rev-parse --abbrev-ref HEAD

        if ($branch -eq "HEAD") {
            $branch = git rev-parse --short HEAD
            Write-Host " ($branch)" -NoNewline -ForegroundColor "red"
        }
        else {
            if ($branch) {
                Write-Host " ($branch)" -NoNewline -ForegroundColor "yellow"
            }
        }
    } catch {
        Write-Host " (no branches yet)" -NoNewline -ForegroundColor "yellow"
    }
}

function Test-Administrator {
    $user = [Security.Principal.WindowsIdentity]::GetCurrent();
    (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

function prompt {
    $realLASTEXITCODE = $LASTEXITCODE

    Write-Host

    if (Test-Administrator) {
        Write-Host "Administrator" -NoNewline -ForegroundColor White
    } else {
        Write-Host "$ENV:USERNAME" -NoNewline -ForegroundColor Green
    }

    if ($s -ne $null) {
        Write-Host " (`$s: " -NoNewline -ForegroundColor DarkGray
        Write-Host "$($s.Name)" -NoNewline -ForegroundColor Yellow
        Write-Host ") " -NoNewline -ForegroundColor DarkGray
    }

    Write-Host ":" -NoNewline -ForegroundColor White
    Write-Host $($(Get-Location) -replace ($env:USERPROFILE).Replace('\','\\'), "~") -NoNewline -ForegroundColor Blue
    Write-BranchName
    Write-Host " PS>" -NoNewline -ForegroundColor DarkGray

    $global:LASTEXITCODE = $realLASTEXITCODE

    Write-Host ""
    return "> "
}

Set-Alias ll ls
```

Start powershell or run the below command to update the prompt

```powershell
. $profile
```

and it should appear like so (but with actual colors):

```powershell
Username:~\git\some_project (git-branch-name) PS>
> |
```
