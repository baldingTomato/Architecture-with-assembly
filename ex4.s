#Program for counting substring 'ad' in a given string

.intel_syntax noprefix
.text
.globl main

main:
    mov eax, offset messg
    push eax
    call policz
    add esp, 4
    push eax
    mov eax, offset printf_arg1
    push eax
    call printf
    add esp, 8

exit:
    mov eax, 0
    ret

policz:
    push ebx
    push ecx
    mov ecx, -1
    push edx
    mov edx, 0

search:
    inc ecx
    mov eax, [esp+16]
    add eax, ecx
    mov ebx, [eax+1]
    mov eax, [eax]

    cmp bl, 0
    je finish
    cmp al, 'a'
    jne search
    cmp bl, 'd'
    jne search

    inc edx
    jmp search

finish:
    mov eax, edx
    pop edx
    pop ecx
    pop ebx
    ret  
    
.data
messg:
    .asciz "Przykladow ady tekst zadania"
printf_arg1:
    .asciz "%i\n"
