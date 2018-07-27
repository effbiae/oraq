if[not all `user`pass`link in key o:.Q.opt .z.x;-2"usage q -user <user> -pass <password> -link <dblink>";exit 1]
\l ora.q
v:.ora.ini`
h:.ora.ope[first o`user;first o`pass;first o`link]

x:([]a:0 1 2;b:3.1 3.2 3.3;c:`a``symbol;d:2018.07.01D 0N 2018.07.01D12:00:20)
.ora.p[h;`x]
show got:.ora.t[h;`x]
$[x~got;;'bad]
.ora.exe[h;"drop table x"]
