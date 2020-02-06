pause for %%G in (*.sql) do sqlcmd /S "C5994\SQLEXPRSS" /d "master" -E -i"%%G"
pause