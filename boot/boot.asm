[org 0x7c00]

; Print "Booting MyOS..."
mov si, msg
call print_string

; Jump to kernel (simplified demo)
jmp 0x0000:0x7e00

print_string:
    mov ah, 0x0E
.next:
    lodsb
    or al, al
    jz .done
    int 0x10
    jmp .next
.done:
    ret

msg db 'Booting MyOS...', 0

times 510-($-$$) db 0
dw 0xAA55
