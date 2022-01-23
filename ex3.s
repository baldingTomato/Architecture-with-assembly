#Program for finding the number of digits smaller then 5 in the given string

.intel_syntax noprefix
.text
.globl main

main:
    mov eax , offset messg
    push eax
    call policz
    add esp, 4
    push eax
    mov eax , offset printf_arg1
    push eax
    call printf
    add esp, 8

exit:
    mov eax , 0
    ret

policz:
    push ebx
    mov ebx, 0
    push ecx
    mov ecx, 0

search:
    mov eax, [esp+12]
    add eax, ebx
    mov eax, [eax]

    cmp al, 0
    je finish
    cmp al, '0'
    je found
    cmp al, '1'
    je found
    cmp al, '2'
    je found
    cmp al, '3'
    je found
    cmp al, '4'
    je found

    inc ebx
    jmp search

whitespace:
    inc ebx
    jmp search
    
found:
    inc ecx
    inc ebx
    jmp search

finish:
    mov eax, ecx
    mov ecx, [esp]
    mov ebx, [esp+4]
    add esp, 8
    ret

.data
printf_arg1:
    .asciz "%i\n"
messg:
    .asciz  "PRZYk/ladowy123 teKst 71117 4567 zAdaniA"
