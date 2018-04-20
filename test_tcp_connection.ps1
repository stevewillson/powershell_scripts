$ip = Read-Host -Prompt "Enter an IP address"
$port = Read-Host -Prompt "Enter a port"

$tcpConn = New-Object System.Net.Sockets.TcpClient
try {
    $tcpConn.Connect($ip, $port)
}
catch {
    Write-Host "[!] Could not connect to $ip on port $port"
}

if ($tcpConn.Connected) {
    Write-Host "[+] Successfully connected to $ip on port $port"
}
