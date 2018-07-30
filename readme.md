# Oraq
An oracle driver for q.  _effbiae@gmail.com_

## Overview

If you can connect to your oracle server via sqlplus, oraq will too.
Oraq is currently targeted at linux 64bit users:

As a prerequisite, sqlplus must be installed and connect to your
oracle server.  Sqlplus can be installed by installing the Oracle Instant Client

## Linking

ora.so is produced by linking oraq.o  with oracle's clntsh and nnz12.  eg:

    ld -shared oraq.o -oora.so -L/home/jack/o/instantclient_12_2 -l:libclntsh.so.12.1 -lnnz12

You can find the ```-L``` directory and the libclntsh.so version using ```ldd``` on sqlplus: 

    $ ldd `which sqlplus`
        ...
        libclntsh.so.12.1 => /home/jack/o/instantclient_12_2/libclntsh.so.12.1 (0x00007fa119ee2000)
        ...
        libnnz12.so => /home/jack/o/instantclient_12_2/libnnz12.so (0x00007fa118b21000)
        ...

## Running

If necessary, check the connection to oracle using sqlplus. eg

    $ sqlplus scott/tiger@localhost/XE
    > Ctrl-D

replacing ```scott```, ```tiger``` and ```localhost/XE``` with your authorization and dblink.

Run ```test.q```:

    $ q test.q -user scott -pass tiger -link localhost/XE
    KDB+ 3.5 2017.11.08 Copyright (C) 1993-2017 Kx Systems
    l64/ 4(16)core 6935MB ...
    
    a b   c      d                            
    ------------------------------------------
    0 3.1 a      2018.07.01D00:00:00.000000000
    1 3.2
    2 3.3 symbol 2018.07.01D12:00:20.000000000

### test.q
- creates and populates the table ```x``` in oracle using .ora.p
- retrieves ```x``` from oracle using .ora.t and compares with the original
- drops the table to tidy up

## Tuning

- set .ora.fz to the number of rows to fetch at a time.  (it's set at a low value initially)
