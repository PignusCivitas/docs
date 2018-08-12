function TruncateId($name)
{
    $palabras = $name.Split('_id')
    $palabras = $palabras[0..($palabras.length - 2)]

    $palabras -join '_'
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
        if($Columna.type -eq "VARCHAR")
        {
            $Atributo = "$($Columna.name):string"
        }
        elseif ($Columna.name.Endswith('_id')) {
            $Atributo = "$(TruncateId($Columna.name)):references"
        }
        elseif ($Columna.name -eq "id") {
            continue
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

Add-Content -Path "PignusAppScaffold.sh" -Value $comandosWithoutReferences -Force