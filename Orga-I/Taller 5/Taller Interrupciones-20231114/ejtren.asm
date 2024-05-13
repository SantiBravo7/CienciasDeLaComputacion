main:
SET R0, 0x00		
SET R1, 0x0F		
SET R2, 0x02		
SET R3, 0x20		
STR [0xF0], R1   
STR [0xF1], R2    


while:
MOV R4, R0  		

curvas_exitosas:
CMP R4, R3 		
JZ bocina		
JN while		
JMP curvas_exitosas

bocina:		
LOAD R2, [0xF1] 	
INC R2		
STR [0xF1], R2	
JMP while		


rai: 
LOAD R1, [0xF0]	
SET R5, 0x0F 	   
CMP R1, R5		
JZ curva 		
SET R1, 0x0F		
STR [0xF0], R1	
INC R0		
IRET



curva: 		
SET R1, 0x0C 	
STR [0xF0], R1 	
IRET
