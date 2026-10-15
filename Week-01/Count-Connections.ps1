# Pobieramy aktualne nawiązane połączenie TCP
$Connections = @(Get-NetTCPConnection -State Established)

# Wybieramy proces i zdalny port
$ProcessId = 7968
$TargetPort = 443

# Zerujemy licznik
$MatchCount = 0
# Zliczamy pasujące połączenia
foreach ($Connection in $Connections) {
    if ($Connection.OwningProcess -eq $ProcessId -and
        $Connection.RemotePort -eq $TargetPort) {
        $MatchCount++
    }
}

# Wyświetlamy wynik
"Process ID: $ProcessId"
"Remote port: $TargetPort"

if ($MatchCount -eq 0) {
    "No matching connections"
} else {
    "Matching connections: $MatchCount"
}

