# Oraq
An oracle driver for q.  Get [oraq.tgz](./oraq.tgz)

Support: effbiae@gmail.com.

## Overview

If you can connect to your oracle server via sqlplus, oraq will too.

Oraq is currently targeted at linux 64bit users:

 - with sqlplus installed on their system

or

 - who can download the Oracle instant client (which includes sqlplus)

## Installing

_sqlplus_

If you don't have a working sqlplus on your system, go to the oracle _Instant Client Downloads_ page and follow the installation instructions.  If you can't connect to your Oracle server with sqlplus, you might need to ask your database admin for a tnsnames.ora file.  

_Extract the tarball_

    $ mkdir oraq
    $ cd oraq
    $ tar xvf oraq.tgz 
    oraq.o
    ora.q
    test.q
    readme.md

_Link_

Find the link path directory and the libclntsh.so version using ```ldd``` on sqlplus: 

    $ ldd `which sqlplus`
        ...
        libclntsh.so.12.1 => /home/jack/o/instantclient_12_2/libclntsh.so.12.1 (0x00007fa119ee2000)
        ...
        libnnz12.so => /home/jack/o/instantclient_12_2/libnnz12.so (0x00007fa118b21000)
        ...

_Link to produce ora.so_

You will need to link oraq.o (from tarball) with libclntsh and libnnz12 to produce ora.so, the kdb shared library.  eg:

    $ ld -shared oraq.o -oora.so -L/home/jack/o/instantclient_12_2 -l:libclntsh.so.12.1 -lnnz12

_Note_ the corresponding -L directory and libclntsh version from the ldd command

Make sure ora.so will get loaded by adding its directory to ```LD_LIBRARY_PATH``` or other method.

## Running

Run ```test.q```:

    $ q test.q -user scott -pass tiger -link localhost/XE
    KDB+ 3.5 2017.11.08 Copyright (C) 1993-2017 Kx Systems
    l64/ 4(16)core 6935MB ...
    
    a b   c      d                            
    ------------------------------------------
    0 3.1 a      2018.07.01D00:00:00.000000000
    1 3.2                                     
    2 3.3 symbol 2018.07.01D12:00:20.000000000

replacing ```scott```, ```tiger``` and ```localhost/XE``` with your credentials and dblink.
### test.q
- creates and populates the table ```x``` in oracle using .ora.p
- retrieves ```x``` from oracle using .ora.t and compares with the original
- drops the table to tidy up

## Tuning

- set .ora.fz to the number of rows to fetch at a time.  (it's set at a low value initially)

