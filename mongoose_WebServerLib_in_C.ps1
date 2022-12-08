$path = "mongoose"

Function Check-Role
{
  Param( [Security.Principal.WindowsBuiltinRole]$Role )

  $CurrentUser = [Security.Principal.WindowsPrincipal]([Security.Principal.WindowsIdentity]::GetCurrent())

  $CurrentUser.IsInRole($Role)
}

if ( Check-Role "Administrator" )
{
	echo "Setup start..."
	echo "Files will be installed under './$path/'"
	mkdir mgs
	wget -Uri https://raw.githubusercontent.com/cesanta/mongoose/master/mongoose.c -OutFile ./$path/mongoose.c
	wget -Uri https://raw.githubusercontent.com/cesanta/mongoose/master/mongoose.h -OutFile ./$path/mongoose.h
	ls $path
}
else
{
	echo "Try again with Administrator Auth..."
}

Write-Host -NoNewLine 'Press any key to continue...';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
