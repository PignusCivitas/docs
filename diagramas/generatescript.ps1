
Remove-Item "PignusAppScaffold.sh" -Force -ErrorAction SilentlyContinue

$Json = Get-Content "PignusApp.mdj" | ConvertFrom-Json

$Entidades = $Json.ownedElements[1].ownedElements.name

$Entidades = $Entidades[1..($Entidades.length - 1)]

foreach($Entidad in $Entidades)
{
    $Columnas = $($Json.ownedElements[1].ownedElements | Where-Object { $_.name -eq $Entidad }).columns

    $Atributos = @()

    foreach($Columna in $Columnas)
    {
        $Atributos += @("$($Columna.name):$($Columna.type)")
    }

    Add-Content "PignusAppScaffold.sh" -Force -Value "rails g scaffold $Entidad $($Atributos -join ' ')"

}