\d .ora
a:`ini`ope`clo`qry`met`fch`ins`ido`exe`rel`fin`lev`version
b:   1   3   1   2   1   3   2   3   2   1   1   1   1
v:a{x set `ora 2:(x;y)}'b
fz:3 /fetch size
mt:{[x]w:(flip`c`t`z`p`s`n`a!x){y x}/
            ({update k:10h from x where t in 1 9i};
             {update k:9h,p:22h,s:0x11 from x where t in 2 6i,not p or s};
             {update k:15h from x where t=12i};
             {update k:12h from x where t in 187 188 232i});
   value flip w {[x;y]
           update t:y[2],z:y[0],k:y[4] from x
           where t in 2 3 6 21 22i,p<y[1], .[y[3];(n;s)]}/
            flip (8 4 8 4 2i;39 9 39 11 5i;22 21 6 3 3i;({x;y;1b},{y;not x},(3#{not y}));9 8 7 6 5h)}
f:{m:mt met x;rs:(count m 0)#();while[count first got:fch[fz;m;x];rs[::],:got[::]];rel x;flip(lower m 0)!rs}
q:{f qry[x;y]}
t:{f[qry[x;"select * from ",string y]]}
i:{h:ins[x;y];r:ido[x;h;z];rel h;r}
p:{ c:(!/)flip((0h;{$[10h~type first x;"varchar(",(string max count each x),")";'nyi]});
   (1h;{"number(1)"});(2h;{'nyi});(4h;{"number(3)"});(5h;{"number(5)"});(6h;{"number(10)"});(7h;{"number(38)"});
   (8h;{"number(38,9)"});(9h;{"number(38,9)"});
   (10h;{"varchar(1)"});(11h;{"varchar(",(string max count each string x),")"});(12h;{"timestamp(6)"});(13h;{'nyi});
   (14h;{"date"});(15h;{"date"});(16h;{'nyi});(17h;{'nyi});(18h;{'nyi});(19h;{'nyi}));
   $[98h=type t:value y;;'`type];
   exe[x;"create table ",string[y],"(",(","sv " "sv'flip(string key flip t;c[type each v]@'v:value flip t)),")"]; /put
   i[x;"insert into ",string[y]," values(",(","sv(":",)each string 1+til count v),")";value flip t]}
c:{exe[x;"commit"]}
