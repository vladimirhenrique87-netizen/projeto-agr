@echo off
cls
echo [!] Iniciando Limpeza Bruta para Gaming...

:: 1. Mata processos que roubam RAM em segundo plano
taskkill /f /im OneDrive.exe
taskkill /f /im msedge.exe
taskkill /f /im mscorsvw.exe

:: 2. Limpeza de Cache de Sistema e Usuário
del /s /f /q %userprofile%\AppData\Local\Temp\.
del /s /f /q C:\Windows\Temp\.
del /s /f /q C:\Windows\Prefetch\.
rd /s /q %userprofile%\AppData\Local\Microsoft\Windows\Explorer\thumbcache*

:: 3. Limpa o Cache de DNS e Flush de Memória de Standby
ipconfig /flushdns
echo off | clip

:: 4. O "Pulo do Gato": Reiniciar o Explorer para limpar vazamentos de memória
taskkill /f /im explorer.exe
start explorer.exe

:: 5. Ativa o plano de Alto Desempenho (se disponível)
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

echo [!] Limpeza concluída. RAM desafogada!
pause