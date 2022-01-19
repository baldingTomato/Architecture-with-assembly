#This program computes the value of a function wylicz(n, m) which equals 2m, if n = 0 and equals wylicz(n - 1, m + 3) + 1, if n > 0

.intel_syntax noprefix
.text
.global main

main:
    mov ecx, 4
    push ecx
    call wylicz
    add esp, 4
    push eax
    mov eax, offset printf_arg1
    push eax
    call printf
    add esp, 8

exit:
    mov eax, 0
    ret

wylicz:
    mov eax, [esp+4]
    cmp ecx, 0
    ja rek
    add eax, eax
    ret

rek:
    dec ecx
    add eax, 3
    push eax
    call wylicz
    add esp, 4
    inc eax
    ret


    .data
printf_arg1:
    .asciz "%i\n"
