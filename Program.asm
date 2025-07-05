; reads up to 100 bytes from user
; echo them back 
; clean exit


section .bss
      buffer resb 100             ; reserve 100 bytes for user input
    
section .text                     ; where the instruction go 
    global _start                 ; tells the linker your program starts at the _start label
    
    
_start:
  ; read(0, buffer, 100)
  mov rax, 0                      ; syscall: read
  mov rdi, 0                      ; file descriptor 1 = stdin
  mov rsi, buffer                 ; buffer to store input
  mov rdx, 100                    ; max numbers of bytes to read 
  syscall                         ; call the kernel 
  mov rbx, rax                    ; length = bytes read
  
  ; Write input back to stdout
  
  mov rax, 1                      ; syscall: write
  mov rdi, 1                      ; stdout
  mov rsi, buffer                 ; buffer to print 
  mov rdx, rbx                    ; length
  syscall 
  
  
  mov rax, 60       ; syscall: exit
  xor rdi, rdi      
  syscall