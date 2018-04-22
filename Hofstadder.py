#!/usr/bin/python3.5

def hofstadder(nval):

    if nval == 1 or nval == 2:
        return 1
    else:
        print("VALOR DE nval", nval)
        return hofstadder(hofstadder(nval-1))+hofstadder(nval-hofstadder(nval-1))

def hofstadder1(nval):

    if nval == 1 or nval == 2:
        return 1
    else:
        print("valor de Nval hof1", nval)
        return hofstadder1(hofstadder1(nval-1))

def hofstadder2(nval):

    if nval == 1 or nval == 2:
        return 1
    else:
        print("valor de Nval hof2", nval)
        return hofstadder2(nval-hofstadder2(nval-1))

print("Sequencia de Hofstadder")
n = int(input("Valor para n, buscamos -- a(n) = a(a(n-1)) + a(n-a(n-1)) --"))

val = hofstadder(n)
prim = hofstadder1(n)
seg = hofstadder2(n)

asd = prim + seg
#val2 = prim+seg
print ("NUMERO QUERIDO : ",val)
print ("PRIMEIRO", prim)
print ("SEGUNDO", seg)
print ("asd",asd)
#print ("SOMA DOS DOIS : ",val2)