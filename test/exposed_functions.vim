" Exposed functions
set runtimepath+=..
set nocompatible
call randomnumber#splitmix64([0])
call randomnumber#xorshift128plus([0, 0])
