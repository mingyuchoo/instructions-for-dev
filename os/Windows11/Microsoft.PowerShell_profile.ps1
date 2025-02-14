# make error messages readable
$host.privatedata.ErrorBackgroundColor = 'DarkRed'
$host.privatedata.ErrorForegroundColor = 'White'

# make strings readable
$colors = @{}
$colors['String'] = [System.ConsoleColor]::Cyan
$colors['Comment'] = [System.ConsoleColor]::Gray


# emacs key
Set-PSReadLineOption -EditMode Emacs -Colors $colors


# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}


# #############################################################################
# Azure CLI
# #############################################################################
Register-ArgumentCompleter -Native -CommandName az -ScriptBlock {
  param($commandName, $wordToComplete, $cursorPosition)
  $completion_file = New-TemporaryFile
  $env:ARGCOMPLETE_USE_TEMPFILES = 1
  $env:_ARGCOMPLETE_STDOUT_FILENAME = $completion_file
  $env:COMP_LINE = $wordToComplete
  $env:COMP_POINT = $cursorPosition
  $env:_ARGCOMPLETE = 1
  $env:_ARGCOMPLETE_SUPPRESS_SPACE = 0
  $env:_ARGCOMPLETE_IFS = "`n"
  $env:_ARGCOMPLETE_SHELL = 'powershell'
  az 2>&1 | Out-Null
  Get-Content $completion_file | Sort-Object | ForEach-Object {
    [System.Management.Automation.CompletionResult]::new($_, $_, "ParameterValue", $_)
  }
  Remove-Item $completion_file, Env:\_ARGCOMPLETE_STDOUT_FILENAME, Env:\ARGCOMPLETE_USE_TEMPFILES, Env:\COMP_LINE, Env:\COMP_POINT, Env:\_ARGCOMPLETE, Env:\_ARGCOMPLETE_SUPPRESS_SPACE, Env:\_ARGCOMPLETE_IFS, Env:\_ARGCOMPLETE_SHELL
}

## for OCaml
#(& opam env) -split '\r?\n' | ForEach-Object { Invoke-Expression $_ }


# #############################################################################
# cargo install cargo-audit
# cargo install cargo-binstall
# cargo install cargo-dist
# cargo install cargo-expand
# cargo install cargo-lambda
# cargo install cargo-make --force
# cargo install cargo-modules
# cargo install cargo-udeps
# cargo install cargo-deps
# cargo install cargo-tree
# cargo install cargo-watch
# cargo install bat
# cargo install bottom
# cargo install evcxr_repl
# cargo install evcxr_jupyter
# cargo install eza
# cargo install fd
# cargo install fnm
# cargo install mdbook
# cargo install ripgrep
# cargo install starship --locked
# cargo install yazi-fm yazi-cli
# cargo install zellij --locked
# cargo install zoxide
# cargo install --git https://github.com/astral-sh/uv uv
# #############################################################################


### for Zoxide
#Invoke-Expression (& { (zoxide init powershell | Out-String) })


### for Starship
Invoke-Expression (&starship init powershell)


## for Yazi
function y {
  $tmp = [System.IO.Path]::GetTempFileName()
  yazi $args --cwd-file="$tmp"
  $cwd = Get-Content -Path $tmp
  if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
    Set-Location -LiteralPath $cwd
  }
  Remove-Item -Path $tmp
}


### for alias for PowerShell
Set-Alias -Name ll -Value Get-ChildItem -Option AllScope -Scope Global -Force

### for alias for Rust tools
#Set-Alias -Name cd -Value __zoxide_z -Option AllScope -Scope Global -Force
#Set-Alias -Name cdi -Value __zoxide_zi -Option AllScope -Scope Global -Force
#Set-Alias -Name ls -Value eza -Option AllScope -Force
#Set-Alias -Name cat -Value bat -Option AllScope -Force
#Set-Alias -Name find -Value fd -Option AllScope -Force


### for Eza
#function ll { eza -l $args }
#function la { eza -la $args }
#function lt { eza --tree $args }


### for direnv
## #############################################################################
## WinGet Install direnv
## #############################################################################
#Invoke-Expression "$(direnv hook pwsh)"


### for Python
## #############################################################################
## cargo install --git https://github.com/astral-sh/uv uv
## uv python install 3.11 3.12 3.13
## cd
## uv venv --python 3.13
## .venv\Scripts\activate
## #############################################################################
#if (Test-Path $Env:HOME\.venv\Scripts\activate) {
#  .venv\Scripts\activate
#}


## for Environment
$Env:HOME = $HOME
