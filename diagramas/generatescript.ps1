function TruncateId($name)
{
    $palabras = $name.Split('_id')
    $palabras = $palabras[0..($palabras.length - 2)]

    $palabras -join '_'
}

function Titelize($name)
{
    $palabras = $name.Split('_') | ForEach-Object { (Get-Culture).TextInfo.ToTitleCase($_)}

    $palabras -join ''
}

Remove-Item "PignusAppScaffold.sh" -Force -ErrorAction SilentlyContinue

$Json = Get-Content "PignusApp.mdj" | ConvertFrom-Json

$Entidades = $Json.ownedElements[1].ownedElements.name

$Entidades = $Entidades[1..($Entidades.length - 1)]

$comandos = @()

foreach($Entidad in $Entidades)
{
    $Columnas = $($Json.ownedElements[1].ownedElements | Where-Object { $_.name -eq $Entidad }).columns

    $Atributos = @()

    foreach($Columna in $Columnas)
    {
        if ($Columna.name -eq "id") {
            continue
        }
        elseif($Columna.type -eq "VARCHAR")
        {
            $Atributo = "$($Columna.name):string"
        }
        elseif ($Columna.type -eq "DOUBLE") {
            $Atributo = "$($Columna.name):float"
        }
        elseif ($Columna.name.Endswith('_id')) {
            $Atributo = "$(TruncateId($Columna.name)):references"
        }
        else
        {
            if($Columna.type)
            {
                $Atributo = "$($Columna.name):$($Columna.type.ToLower())"
            }
            else {
                $Atributo = "$($Columna.name):string"
            }

        }

        if($Columna.unique){
            $Atributo = $Atributo + ":uniq"
        }

        $Atributos += $Atributo
    }

    $comandos += "rails g scaffold $Entidad $($Atributos -join ' ')"

}

$comandosWithoutReferences = $comandos | Where-Object {$_ -notlike "*references*"}

$comandosWithReferences = $comandos | Where-Object {$_ -like "*references*"}

$entidadesConReferences = $comandosWithReferences | ForEach-Object {$_.Split(' ')[3]}

$referencesordenado = @()

$listaDeEspera = @()

foreach($comando in $comandosWithReferences){

    #$comando = "rails g scaffold Community name:string:uniq address:string phone:string admin_address:string email:string:uniq webSite:string attendant:string notes:string postal_code:string community:references community_type:references"

    $comandoReferences = $comando.Split(' ') | Where-Object {$_ -like "*:references"} | ForEach-Object {Titelize($_.Split(':')[0])}

    $IsInParents = $true
    foreach($reference in $comandoReferences)
    {
        if($reference -in $entidadesConReferences){
            $IsInParents = $false
        }
    }

    if($IsInParents)
    {
        $referencesordenado += ($comando)
    } else {
        $listaDeEspera += ($comando)
    }
}

$listaDeEsperaOrdenada = @()
foreach($comando in $listaDeEspera) {

    $comandoReferences = $comando.Split(' ') | Where-Object {$_ -like "*:references"} | ForEach-Object {Titelize($_.Split(':')[0])}

    foreach($reference in $comandoReferences)
    {

        $entidadParent = $listaDeEspera | Select-String -SimpleMatch -Pattern " $reference " -CaseSensitive
        if($entidadParent)
        {
            $listaDeEsperaOrdenada += $entidadParent.line
        }
    }

    $listaDeEsperaOrdenada += $comando
}

$listaDeEsperaOrdenada  = $listaDeEsperaOrdenada | Select-Object -Unique



Add-Content -Path "PignusAppScaffold.sh" -Value $comandosWithoutReferences -Force

Add-Content -Path "PignusAppScaffold.sh" -Value $referencesordenado

Add-Content -Path "PignusAppScaffold.sh" -Value $listaDeEsperaOrdenada