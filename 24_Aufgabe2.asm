.data
rot:	.asciiz "Rot"
grün:	.asciiz "Grün"
gelb:	.asciiz "Gelb"

.text
	li $7, 1000	#Taktzyklusdauer in ms
	li $6, 1	#Setze die Phasennummer auf 1
main:
	#Rufe Funktion für jeweilige Phase auf
	beq $6, 1, phase1
	beq $6, 2, phase2
	beq $6, 3, phase3
	beq $6, 4, phase4
	beq $6, 5, phase5
	beq $6, 6, phase6
	beq $6, 7, phase7
	beq $6, 8, phase8
	#Endlosschleife
	j main
	
wait:
	#Speichere Register auf Stack
	addi $sp, $sp, -8	#Reserviere Speicherplatz
	sw $a0, 0($sp)
	sw $v0, 4($sp)
	li $v0, 32
	mul $a0, $a0, $7	#Multipliziere Anzahl Taktzyklen mit Taktzyklusdauer in ms
	syscall			#Warte
	#Lade veränderte Register aus dem Stack
	lw $a0, 0($sp)
	lw $v0, 4($sp)
	addi $sp, $sp, 8	#Gib Speicherplatz frei
	jr $ra			#Geh zurück
	
phase1:
	addi $s6, $s6, 1		#Nächste Phase
	#Setze Werte
	la $s0, rot
	la $s1, grün
	la $s2, grün
	la $s3, rot
	li $a0, 12		#Lege Anzahl Zeitzyklen fest
	jal wait
	j main
	
phase2:
	addi $s6, $s6, 1		#Nächste Phase
	#Setze Werte
	la $s0, rot
	la $s1, rot
	la $s2, gelb
	la $s3, rot
	li $a0, 3		#Lege Anzahl Zeitzyklen fest
	jal wait
	j main
	
phase3:
	addi $s6, $s6, 1		#Nächste Phase
	#Setze Werte
	la $s0, rot
	la $s1, rot
	la $s2, rot
	la $s3, rot
	li $a0, 2		#Lege Anzahl Zeitzyklen fest
	jal wait
	j main
	
phase4:				#Für NSA Gelb gewählt
	addi $s6, $s6, 1		#Nächste Phase
	#Setze Werte
	la $s0, gelb
	la $s1, rot
	la $s2, rot
	la $s3, rot
	li $a0, 3		#Lege Anzahl Zeitzyklen fest
	jal wait
	j main
	
phase5:
	addi $s6, $s6, 1		#Nächste Phase
	#Setze Werte
	la $s0, grün
	la $s1, rot
	la $s2, rot
	la $s3, grün
	li $a0, 12		#Lege Anzahl Zeitzyklen fest
	jal wait
	j main
	
phase6:
	addi $s6, $s6, 1		#Nächste Phase
	#Setze Werte
	la $s0, gelb
	la $s1, rot
	la $s2, rot
	la $s3, rot
	li $a0, 3		#Lege Anzahl Zeitzyklen fest
	jal wait
	j main
	
phase7:
	addi $s6, $s6, 1		#Nächste Phase
	#Setze Werte
	la $s0, rot
	la $s1, rot
	la $s2, rot
	la $s3, rot
	li $a0, 2		#Lege Anzahl Zeitzyklen fest
	jal wait
	#j main
	
phase8:				#Für WOA Gelb gewählt
	li $s6, 1		#Nächste Phase
	#Setze Werte
	la $s0, rot
	la $s1, rot
	la $s2, gelb
	la $s3, rot
	li $a0, 3		#Lege Anzahl Zeitzyklen fest
	jal wait
	j main
