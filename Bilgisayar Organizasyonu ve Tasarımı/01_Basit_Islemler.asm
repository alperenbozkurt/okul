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
  la      $a0, buyukx
syscall
  li      $v0, 5
  la      $a0, buyuky
syscall
  li      $v0, 5
  la      $a0, z
syscall
  li      $v0, 4
  la      $a0, girdi2
syscall
  li      $v0, 5
  la      $a0, kucukx
syscall
  li      $v0, 5
  la      $a0, kucuky
syscall
  li      $v0, 4
  la      $a0, girdi3
syscall
  li      $v0, 5
  la      $a0, yogunluk
syscall
  li      $v0, 4
  la      $a0, girdi4
syscall
  li      $v0, 5
  la      $a0, birimFiyat
syscall
  lw $t0, buyukx
  lw $t1, buyuky
  lw $t2, z
  lw $t3, kucukx
  lw $t4, kucuky
  mul $t5, $t0, $t1
  mul $s0, $t5, $t2

  mul $t6, $t2, $t3
  mul $s1, $t6, $t4

  sub $s2, $s0, $s1

  lw $t7, yogunluk
  mul $s3, $s2, $t7

  lw $t8, birimFiyat
  mul $s4, $s3, $t8

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
