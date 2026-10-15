# Wybieramy proces i zdalny port
# Set the target process ID and remote port
$ProcessId = Read-Host "Enter process ID"
$TargetPort = Read-Host "Enter remote port"

# Pobieramy aktualne nawiązane połączenie TCP
# Retrieving current established TCP connections
$Connections = @(Get-NetTCPConnection -State Established)

# Zerujemy licznik
# Reset the main counter
$MatchCount = 0

# Zliczamy pasujące połączenia
#Count connections matching both criteria
foreach ($Connection in $Connections) {
    if ($Connection.OwningProcess -eq $ProcessId -and
        $Connection.RemotePort -eq $TargetPort) {
        $MatchCount++
    }
}

# Wyświetlamy wynik
# Display the result
"Process ID: $ProcessId"
"Remote port: $TargetPort"

if ($MatchCount -eq 0) {
    "No matching connections"
} else {
    "Matching connections: $MatchCount"
}

