
function hello {
    param (
        [string]$name
    )
    if($name){
        Write-Host "hello $name funcitioning works"
    }
    else{
        Write-Host "please enter a name"
    }
    
}

$n = Read-Host "enter your name"

hello($n)