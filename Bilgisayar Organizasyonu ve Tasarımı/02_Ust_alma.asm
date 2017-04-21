.data
  taban: .word 0
  ust: .word 0
  cevap: .word 0
  tabanMetni: .asciiz "Lütfen Tabanı Giriniz:"
  ustMetni: .asciiz "Lütfen Ustu Giriniz:"
  sonucMetni: .asciiz "Sonuc :"
.text
.globl main
main:
  li      $v0, 4
  la      $a0, tabanMetni
  syscall

  li      $v0, 5
  syscall
  move $t0, $v0

  li      $v0, 4
  la      $a0, ustMetni
  syscall

  li      $v0, 5
  syscall
  move $t1, $v0

  move   $a0, $t0
  move   $a1, $t1

  jal    UstAlma

  sw $t1, cevap

  li      $v0, 4
  la      $a0, sonucMetni
  syscall

  li      $v0, 1
  lw      $a0, cevap
  syscall

  li $v0,10
  syscall

.end main


.globl UstAlma
.ent UstAlma
UstAlma:
  li $s0, 0
  li $s1, 1
dongu:
  mul $s1, $s1, $a0
  add $s0, $s0, 1
  blt $s0, $a1, dongu
  move $t1, $s1
	jr $ra
.end UstAlma
