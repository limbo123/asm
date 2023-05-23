section .text
  global _start

_start:
  mov cl, 65            ; char count
  mov ch, 0             ; prev char
  loop:
      cmp cl, 91
      je finish
      cmp ch, cl
      jb printLowerCase
      jmp printUpperCase 
        
  printLowerCase:
      mov ch, 0
      add ch, cl
      add ch, 32
      add cl, 1
      jmp print
	    
  printUpperCase:
      mov ch, cl
      add cl, 1
      
  print:
      push cx
      mov eax, 4           
      mov ebx, 1           
      mov [hello], ch
      mov edx, 1
      mov ecx, hello
      int 80h
      pop cx
      jmp loop
      
  finish:
      int 80h              
      mov eax,1            
      mov ebx,0
      int 80h;
  	
section .data
  hello: db 'a', 1

