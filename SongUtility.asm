
		#This program is curently useless due to issues explained on line 484 of the main program.



# $a0 = time

.text
Exit: #32
	li $v0, 10
	syscall
.data




#$a0 = pitch
#$a1 = duration

#$a2 = instrument
#$a3 = volume
.text
Chord: #31
	li $v0, 31
	li $a2, 16
	li $a3, 120
	syscall
	
	jr $ra
.data


.text
P1:
	li $v0, 31
	li $a2, 16
	li $a3, 100
	syscall
	
	jr $ra
.data









# there were 6 more of these but I removed them in favor of labels, this is just one unused relic
.text
a1G:
	li $a0, 55
	
	li $v0, 31
	li $a2, 0
	li $a3, 90
	syscall
	
	#subtract x miliseconds
	sub $a0, $a1, $t1
	
	#wait
	li $v0, 32
	#move $a0, $a1
	syscall
	
	jr $ra
.data
