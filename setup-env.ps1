Set-ExecutionPolicy unrestricted;
#[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
#iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

$script_path = Split-Path -parent $PSCommandPath
#choco install git -y
#choco install cmder -y
echo Split-Path $MyInvocation.MyCommand.Path -Parent
cp $script_path/ConEmu.xml C:\tools\Cmder\vendor\conemu-maximus5\

choco install -y neovim
wr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni $HOME/vimfiles/autoload/plug.vim -Force
cp $script_path/init.vim ~/AppData/Local/nvim/
cp $script_path/coc-settings.json ~/AppData/Local/nvim/
Set-Alias vim nvim
nvim -es -c ':PlugInstall'
