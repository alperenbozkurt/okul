Assemblyde Syscall fonksiyonları
===

|  Servis | Çağırma Kodu | Argümanlar | Sonuç |
|---|---|---|---|
| print_int    | 1 | $a0=integer |  |
| print_float  | 2 | $f12=float  |  |
| print_double  | 3 | $f12=double |  |
| print_string | 4 | $a0=string |  |
| read_int  | 5 |   | integer (in $v0) |
| read_float  | 6 | | float (in $f0) |
| read_double  | 7 |   | double (in $f0) |
| read_string  | 8 | \$a0=buffer, $a1=length |  |
| sbrk      | 9  | $a0=amount  |  |
| exit      | 10 |  |  |

Örnek Kod
---

Aşağıdaki kodda sayi değişkenini 5. syscall işlevini yerine getiriyor. Yani print_int fonksiyonu ile sayı değişkenini consol'a yazdırıyor.

```assembly
.data
  sayi: .word 37
main:
  li      $v0, 1
  lw      $a0, sayi # la
  syscall
.end main
```
