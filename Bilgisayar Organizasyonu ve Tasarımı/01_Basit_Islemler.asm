.data
  buyukx: .word 50
  buyuky: .word 102
  z: .word 200
  kucukx: .word 30
  kucuky: .word 90
  cevap: .word 0
.text
.globl main
main:
  lw $t0, kucukx
  lw $t1, kucuky
  lw $t3, z
  mul $t4, $t0, $t1
  mul $t4, $t4, $t3
  lw $t0, buyuky
  lw $t1, buyukx
  mul $t5, $t0, $t1
  mul $t5, $t5, $t3
  sub $t6, $t5, $t4
  mul $t7, $t6, 8
  mul $t7, $t7, 5
  sw $t7, cevap

  li $v0,10
syscall
.end main
