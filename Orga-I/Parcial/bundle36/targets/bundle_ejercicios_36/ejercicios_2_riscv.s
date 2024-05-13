.text:

# inicializar programa
    la a0, dst
    la s1, src
    li t3, 12
# recorrer arreglo y mover
ciclo:
    #mv s0, a0
    beqz t3 imprimir
	addi t3 t3 -1
	lw s2 0(s1) # me guardo los valores del arreglo fuente en s2
	lw s3 0(a0) # me guardo los valores del arreglo destino en s3
    or t4 s2 s3
    sw t4 0(a0) # cargo el valor de t4 en espacio de memeoria a0
    addi s1, s1 4 # avanzo al siguiente valor del arreglo fuente
    addi a0 a0 4 # avanzo al siguiente valor del arreglo destino
    
    j ciclo

imprimir:
    la t2, dst
    # Cantidad de datos.
    li t3, 12
loop_imprimir:
    beqz t3, exit
    addi t3, t3, -1
    lw t4, 0(t2)
    # Imprime el resultado
    mv a0, t4
    li a7, 34
    ecall 
    addi t2, t2, 4

    j loop_imprimir
exit:
    # Termina el programa.
    li a0, 0
    li a7, 93
    ecall

.data:
src:
.word 0xffffffff, 0x95555555, 0xf4444444, 0xf1111111
.word 0xffffff00, 0xf5005555, 0x95444444, 0xf1113311
.word 0xff00ffff, 0xf5550055, 0xa4444433, 0xa1551111      
dst:
.word 0xf5005555, 0x95444444, 0xf1113311, 0xffffff00
.word 0xf1111111, 0xffffffff, 0x95555555, 0xf4444444
.word 0xa1551111, 0xff00ffff, 0xf5550055, 0xa4444433
