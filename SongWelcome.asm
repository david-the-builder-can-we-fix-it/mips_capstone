#loop A song

	#OFFICIAL BPM DOESNT TRANSLATE WELL TO THIS TYPE OF DELAED PROGRAM
	#SO I HAVE MODIFIED IT.
	
	#On my computer between every note there is a brief pause about .15 seconds long.
	#I have worked around it best I can in many ways. The program does include chords.
	#however depending on the speed of your computer it may not sound like it.
	#Because every note has a .15 second delay before playing, and each note is pressed
	#for .35 seconds. (three in a row sounds like you are pressing them indevidualy)
	
	#I changed my program so C and other keys are just referances to the number in data
	
	#I am proud of what I was able to create, although due to the delay issue it doesnt sound
	#as close to the original as I would like. The original is linked below, the chorus is from
	#23 seconds in to 53 seconds in.
	#https://www.youtube.com/watch?v=qWabVF0oIC8&ab_channel=TutorialsByHugo
	
	


.text

				#REPEAT 5 TIMES

li $s1, 4		# Amount of times the loop will run
li $s0, 0		# Initialize count
li $s2, 0

start_loop:
        sle $t1, $s0, $s1		# while $s0 <= N
        beqz $t1, transition1		# False case
        
        # True case: run this code block
	
	#LD		#These represent what notes are played
	la $t0, LD
	jal fnote	#fnote is a call to syscall 31 with a slight delay (it is to ofset the automatic delay between note presses)
	
	#LA, D, F	#when multiple notes are played at the same time, it can sound like they are played in sequence
	la $t0, LA	#on my computer it takes .150 seconds to start playing a note, and these notes are pressed for .35 seconds.
	jal Note	#Note is a call to syscall 31 with no delay
	la $t0, D
	jal Note	#These notes have been aranged to sound more pleasing dispite the automatic delay
	la $t0, F
	jal fnote
	
	#LLA
	la $t0, LLA
	jal fnote
	
	#LA, D, F
	la $t0, LA
	jal Note
	la $t0, D
	jal Note
	la $t0, F
	jal FNote	#FNote is the final note pressed in a loop, and has the shortest delay to comphensate for 
			#the time it takes to start the loop again. (.2) seconds
        
        addi $s0, $s0, 1	#increment the miniloop
        b start_loop		#Start miniloop again

transition1:	
				#transition. This is where transitions between loops are put if there are any.	
	li $v0, 32
	li $a0, 2500		#delay To alow computer to catch up
	syscall
	
	#li $t1, 0
	li $s1, 3		
	li $s0, 0		# Initialize count
	li $s2, 0
	
	j loop2
	
	
loop2:							#all loops after this point use the same type of method as the first
				#REPEAT 4 TIMES
	sle $t1, $s0, $s1		# while $s0 <= N
        beqz $t1, transition2		# False 
        
	#LD
	la $t0, LD
	jal fnote
	
	#D, G, LBb
	la $t0, D
	jal Note
	la $t0, G
	jal Note
	la $t0, LBb
	jal fnote
	
	#LLG
	la $t0, LLG
	jal fnote
	
	#D, G, LBb
	la $t0, D
	jal Note
	la $t0, G
	jal Note
	la $t0, LBb
	jal FNote
	
	addi $s0, $s0, 1
        b loop2
	
transition2:
				#transition
        li $v0, 32
	li $a0, 2000
	syscall
	
	li $s1, 3		
	li $s0, 0		# Initialize count
	li $s2, 0
	
	j loop3
	
	
loop3:
				#REPEAT 4 TIMES
	sle $t1, $s0, $s1		# while $s0 <= N
        beqz $t1, transition3		# False 
        
	#LC
	la $t0, LC
	jal fnote
	
	#LA, C, F
	la $t0, LA
	jal Note
	la $t0, C
	jal Note
	la $t0, F
	jal fnote
	
	#LLA
	la $t0, LLA
	jal fnote
	
	#LA, C, F
	la $t0, LA
	jal Note
	la $t0, C
	jal Note
	la $t0, F
	jal FNote
	
	
	addi $s0, $s0, 1
        b loop3
	
transition3:
	
				#transition (34)
	li $v0, 32
	li $a0, 2300
	syscall
	
	li $s1, 2		
	li $s0, 0		# Initialize count
	li $s2, 0
	
	j loop4
	
loop4:				#REPEATE 3 TIMES (34)
	sle $t1, $s0, $s1		# while $s0 <= N
        beqz $t1, transition4		# False 
        
	#LDb
	la $t0, LDb
	jal fnote
	
	#LA, Db, E
	la $t0, LA
	jal Note
	la $t0, Db
	jal Note
	la $t0, E
	jal fnote
	
	#LLA
	la $t0, LLA
	jal fnote
	
	#LA, Db, E
	la $t0, LA
	jal Note
	la $t0, Db
	jal Note
	la $t0, E
	jal FNote
	
	
	addi $s0, $s0, 1
        b loop4
	
transition4:
				#Transition (37)
	li $v0, 32
	li $a0, 2000
	syscall
	
	#LDb, Db
	la $t0, Db
	jal Note
	la $t0, LDb
	jal fnote
	
	#LLA, LA
	la $t0, LA
	jal Note
	la $t0, LLA
	jal fnote
	
	#LLB, LB
	la $t0, LLB
	jal Note
	la $t0, LB
	jal fnote
	
	#LDb, Db
	la $t0, LDb
	jal Note
	la $t0, Db
	jal FNote
	
	
	li $s1, 3		
	li $s0, 0		# Initialize count
	li $s2, 0
	
	j loop5
	
loop5:
				#LOOP 4 TIMES (38)
	sle $t1, $s0, $s1		# while $s0 <= N
        beqz $t1, transition5		# False 
        
	#LLD, LD
	la $t0, LLD
	jal Note
	la $t0, LD
	jal fnote
	
	#LA, D, F
	la $t0, LA
	jal Note
	la $t0, D
	jal Note
	la $t0, F
	jal fnote
	
	#LLLA, LLA
	la $t0, LLA
	jal Note
	la $t0, LLLA
	jal fnote
	
	#LA, D, F
	la $t0, LA
	jal Note
	la $t0, D
	jal Note
	la $t0, F
	jal FNote
	
	
	#LoopIt
	addi $s0, $s0, 1
        b loop5

transition5:
				#TRANSITION (41)
	li $v0, 32
	li $a0, 4200
	syscall
	
	#initialise
	li $s1, 3		
	li $s0, 0		# Initialize count
	li $s2, 0
	#loop
	j loop6
	
	
loop6:
				#LOOP 4 TIMES (42)
	sle $t1, $s0, $s1		# while $s0 <= N
        beqz $t1, transition6		# False 
        
	#LD, LLD
	la $t0, LD
	jal Note
	la $t0, LLD
	jal fnote
	
	#LBb, D, G
	la $t0, LBb
	jal Note
	la $t0, D
	jal Note
	la $t0, G
	jal fnote
	
	#LLG, LLLG
	la $t0, LLG
	jal Note
	la $t0, LLLG
	jal fnote
	
	#LBb, D, G
	la $t0, LBb
	jal Note
	la $t0, D
	jal Note
	la $t0, G
	jal FNote
	
	
	#loopIt
	addi $s0, $s0, 1
        b loop6
	
transition6:
				#TRANSITION (45)
	li $v0, 32
	li $a0, 4300
	syscall
	
	#initialise
	li $s1, 3		
	li $s0, 0		# Initialize count
	li $s2, 0
	#loop
	j loop7
	
	
loop7:
				#LOOP 4 TIMES
	sle $t1, $s0, $s1		# while $s0 <= N
        beqz $t1, transition7		# False 

	#LC, LLC
	la $t0, LC
	jal Note
	la $t0, LLC
	jal fnote
	
	#LA, C, F
	la $t0, LA
	jal Note
	la $t0, C
	jal Note
	la $t0, F
	jal fnote
	
	#LLA, LLLA
	la $t0, LLA
	jal Note
	la $t0, LLLA
	jal fnote
	
	#LA, C, F
	la $t0, LA
	jal Note
	la $t0, C
	jal Note
	la $t0, F
	jal FNote
	
	
	#loopIt
	addi $s0, $s0, 1
        b loop7
	
	
transition7:
				#TRANSITION (49)
	li $v0, 32
	li $a0, 3800		#delay To alow computer to catch up
	syscall
	
	#initialise
	li $s1, 2		
	li $s0, 0		# Initialize count
	li $s2, 0
	#loop
	j loop8
	
	
	
loop8:
				#LOOP 3 TIMES (49)
	sle $t1, $s0, $s1		# while $s0 <= N
        beqz $t1, transition8		# False 

	#LDb, LLDb
	la $t0, LDb
	jal Note
	la $t0, LLDb
	jal fnote
	
	#LA, Db, E
	la $t0, LA
	jal Note
	la $t0, Db
	jal Note
	la $t0, E
	jal fnote
	
	#LLA, LLLA
	la $t0, LLA
	jal Note
	la $t0, LLLA
	jal fnote
	
	#LA, Db, E
	la $t0, LA
	jal Note
	la $t0, Db
	jal Note
	la $t0, E
	jal FNote
	
	
	#loopIt
	addi $s0, $s0, 1
        b loop8

transition8:
				#TRANSITION (51)							#DOND DONE DONE
	
	li $v0, 32
	li $a0, 3000		#delay To alow computer to catch up
	syscall
	
	#LDb, LLDb
	la $t0, LLDb
	jal Note
	la $t0, LDb
	jal fnote
	
	#A, LA
	la $t0, A
	jal Note
	la $t0, LA
	jal fnote
	
	#G, LG
	la $t0, LG
	jal Note
	la $t0, G
	jal fnote
	
	#F, LF
	la $t0, LF
	jal Note
	la $t0, F
	jal FNote
	
	li $v0, 32		#delay To alow computer to catch up
	li $a0, 3000
	syscall
	
	#initialise
	li $s1, 4		# set loops iteration amount
	li $s0, 0		# Initialize count
	li $s2, 0
	j start_loop
	
	
#DONE		#DONE		#DONE		#DONE		#DONE
	
	
	
	
	
	
	
				#NOTE:
		#These subprograms have reasons for being in the main file.
		#Primarily that when loading a word or other datatype into a variable
		#If it is in a long program with a slow commputer (mine) it wont
		#save it. So I worked around the issue by puting those sub programs
		#in the main file so I could send it the note's address instead.
		#Also I was going to use a wait function, and I know how to make one, but it
		#just wasn't triggering for some reason. I encorperated wait into note calls
		#as a work around.
		#Finaly the loops are all included in the main program so they can have access
		#to the labels for each note. In some programs for running mips you can acses the labels globaly
		#but eiher mars doesn't suport it, or there is somthing wrong with my version of it.
		#I am inclined to believe the latter because I have acsidently messed up mars to the point of 
		#needing to reinstall two times now.
	
	
	
Note: 		# recieves the address of a value and gets that value as the frequency of a note.
	li $a1, 300	#speed/length control
	li $v0, 31
	li $a2, 3
	lw $a0, ($t0)	#get value
	li $a3, 70
	syscall
	
	jr $ra
	
fnote:		#FOR LAST NOTE IN SEQUENCE
	li $a1, 300	#speed/length control
	li $v0, 31
	li $a2, 3
	lw $a0, ($t0)	#get value
	li $a3, 70
	syscall
	
	li $v0, 32
	li $a0, 290	#delay is here because it wont work otherwise if it is in a function.
	syscall

	jr $ra
	
FNote: 		#FOR LAST NOTE IN LOOP	
	li $a1, 300	#speed/length control
	li $v0, 31
	li $a2, 3
	lw $a0, ($t0)	#get value
	li $a3, 70
	syscall
	
	li $v0, 32
	li $a0, 200	#delay is shorter to compensate for time nessisary to call loop again
	syscall
	
	jr $ra

	
	
.data
	A: .word 69
	G: .word 67
	F: .word 65
	E: .word 64
	D: .word 62
	Db: .word 61
	C: .word 60
	LB: .word 59
	LBb: .word 58
	LA: .word 57
	LG: .word 55
	LF: .word 53
	LD: .word 50
	LDb: .word 49
	LC: .word 48
	LLB: .word 47
	LLA: .word 45
	LLG: .word 43
	LLD: .word 38
	LLDb: .word 37
	LLC: .word 36
	LLLA: .word 33
	LLLG: .word 31



.include "SongUtility.asm"
