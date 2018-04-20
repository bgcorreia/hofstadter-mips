#!/usr/bin/python3.5

def hofstadder(nval):

    if nval == 1 or nval == 2:
        return 1
    else:
        return hofstadder(hofstadder(nval-1))+hofstadder(nval-hofstadder(nval-1))



print("Sequencia de Hofstadder")
n = int(input("Valor para n, buscamos -- a(n) = a(a(n-1)) + a(n-a(n-1)) --"))

prim = hofstadder(n)
print ("NUMERO QUERIDO : ",prim)