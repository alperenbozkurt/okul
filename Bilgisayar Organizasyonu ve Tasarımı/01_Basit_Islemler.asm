.data
  buyukx: .word 50
  buyuky: .word 102
  z: .word 200
  kucukx: .word 30
  kucuky: .word 90
  yogunluk: .word 8
  birimFiyat: .word 5
  cevap: .word 0
  girdi1: .asciiz "Lütfen sırasıyla büyük prizmanın enini boyunu ve yüksekliğini giriniz:"
  girdi2: .asciiz "Lütfen sırasıyla küçük prizmanın enini ve boyunu giriniz:"
  girdi3: .asciiz "Lütfen yoğunluğu giriniz:"
  girdi4: .asciiz "Lütfen birim fiyatını giriniz:"
  girdi5: .asciiz "Ürünün tanesini şu fiyattan satabilirsiniz:"
.text
.globl main
main:
  li      $v0, 4
  la      $a0, girdi1
syscall
  li      $v0, 5
  sw      $a0, buyukx
  syscall
  move $t0, $v0

  li      $v0, 5
  la      $a0, buyuky
  syscall
  move $t1, $v0

  li      $v0, 5
  la      $a0, z
  syscall
  move $t2, $v0

  li      $v0, 4
  la      $a0, girdi2
  syscall

  li      $v0, 5
  la      $a0, kucukx
  syscall
  move $t3, $v0

  li      $v0, 5
  la      $a0, kucuky
  syscall
  move $t4, $v0

  li      $v0, 4
  la      $a0, girdi3
  syscall

  li      $v0, 5
  la      $a0, yogunluk
  syscall
  move $t5, $v0

  li      $v0, 4
  la      $a0, girdi4
  syscall

  li      $v0, 5
  la      $a0, birimFiyat
  syscall
  move $t6, $v0

  mul $t1, $t0, $t1
  mul $s0, $t1, $t2

  mul $t3, $t2, $t3
  mul $s1, $t3, $t4

  sub $s2, $s0, $s1

  mul $s3, $s2, $t5

  mul $s4, $s3, $t6

  sw $s4, cevap

  li      $v0, 4
  la      $a0, girdi5
syscall
  li      $v0, 1
  lw      $a0, cevap
syscall
  li $v0,10
syscall
.end main
