#This program is supposed to count number of vowels in a string. It uses only EAX register and stack.

.intel_syntax noprefix
.text
.global main

main:
    mov eax, offset messg
    push eax
    call policz
    add esp, 4
    push eax
    mov eax , offset printf_arg1
    push eax
    call printf
    add esp, 8

exit:
    mov eax, 0
    ret

policz:
    mov eax, 0  ;#esp+4 counter for vowels
    push eax
    mov eax, 0  ;#esp counter for letters
    push eax
    jmp search

finish:
    mov eax, [esp+4]
    add esp, 8
    ret

search:
    mov eax, [esp+12]   ;#messg
    add eax, [esp]      ;#moving to the next letter
    mov eax, [eax]      ;#getting single character

    cmp eax, 0
    je finish

    cmp al, 'a'
    je vow
    cmp al, 'e'
    je vow
    cmp al, 'i'
    je vow
    cmp al, 'o'
    je vow
    cmp al, 'u'
    je vow
    cmp al, 'y'
    je vow
    cmp al, 'A'
    je vow
    cmp al, 'E'
    je vow
    cmp al, 'I'
    je vow
    cmp al, 'O'
    je vow
    cmp al, 'U'
    je vow
    cmp al, 'Y'
    je vow

    pop eax     ;#increasing letters counter
    inc eax     ;#
    push eax    ;#

    jmp search

vow:
    mov eax, [esp+4]    ;#increasing vowels counter
    inc eax             ;#
    mov [esp+4], eax    ;#

    pop eax     ;#increasing letters counter
    inc eax     ;#
    push eax    ;#

    jmp search

.data
printf_arg1:
    .asciz "%i\n"

messg:
    .asciz "PRZYkladowy teKst zAdaniA"
