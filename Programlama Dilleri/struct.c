#include "stdio.h"
#include "string.h"

struct Ogrenci {
  char adi[20];
  char soyadi[20];
  int notu;
};

int main() {
  printf("Merhaba\n\n");
  struct Ogrenci Ogrenciler[10];

  for(int i = 0; i<2; i++){
    printf("%d. Öğrenciyi Giriniz.\n", (i+1));
    char adi[20];
    printf("Adını Giriniz:\n" );
    scanf("%s", adi);

    char soyadi[20];
    printf("Soyadını Giriniz:\n" );
    scanf("%s", soyadi);

    int not;
    printf("Notunu Giriniz:\n");
    scanf("%d", &not);

    strcpy(Ogrenciler[i].adi, adi);
    strcpy(Ogrenciler[i].soyadi, soyadi);
    Ogrenciler[i].notu  = not;

    printf("-------------------------\n");
  }


  printf("Öğrenciler Yazdırılıyor...\n");
  for (int i = 0; i < 2; i++) {
    printf("Adı     : %s\n",Ogrenciler[i].adi);
    printf("Soyadi  : %s\n",Ogrenciler[i].soyadi);
    printf("Notu    : %d\n",Ogrenciler[i].notu);
    printf("--------------------\n");
  }


  return 0;
}
