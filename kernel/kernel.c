void kernel_main() {
    char* vga = (char*)0xb8000;
    vga[0] = 'H';
    vga[1] = 0x07;
    vga[2] = 'i';
    vga[3] = 0x07;
    while (1) {}
}
