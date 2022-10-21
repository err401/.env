Import-Module PSWriteColor

class logging {
    appInstall([String]$pf,[String]$name) {
        Write-Color -Text "installing $pf $name...","[ok]" -Color White,Green
    }
    appConfig([String]$name) {
        Write-Color -Text "linking $name ...","[ok]" -Color White,Green
    }
    appPreReq([String]$msg){
        Write-Color -Text "[pre-req]"," $msg...","[ok]" -Color Yellow,White,Green
    }
    appErr([String]$msg){
        Write-Color -Text "$msg...","[error]" -Color White,Red
    }
}
