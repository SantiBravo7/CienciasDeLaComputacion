.text:

# inicializar programa
    la a0, arr #dirreciono a la posicion de mi array de numeros
    li a1, 12  #le doy kla cantidad de datos que tiene mi array
enmascarar:
    mv s0, a0
    mv s1, a1
    mv t4, x0 # este es el resutado q voy a devolver al final y lo inicializo en 0
    li s2, 0x55555555 #fijo el valor a enmascarar en un registro 

# recorrer arreglo y acumular

loop: #while (s1 > 0)    
    beqz s1, return
    addi s1, s1, -1
    #Cargo el valor iesimo de la lista y la enmascaro
    lw a0, 0(s0)
    call enmascarar_aux
    #incremento la direccion al siguiente elementon
    addi s0, s0, 4
    # a midida que pasan los ciclos, voy sumando el valor q tengo en mi variable 
    # resultado con el nuevo valor de la iteracion enmascarado
    add t4, ,t4, a0
    j loop

enmascarar_aux:
    and a0, a0, s2
    ret 


return:
    # Imprime la suma
    mv a0, t4
    li a7, 34
    ecall

    # Termina el programa.
    li a0, 0
    li a7, 93
    ecall



.data:
arr:
.word 0xffffffff, 0x55555555, 0x44444444, 0x11111111
.word 0xffffff00, 0x55005555, 0x55444444, 0x11113311
.word 0xff00ffff, 0x55550055, 0x44444433, 0x11551111
