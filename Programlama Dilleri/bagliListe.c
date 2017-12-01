#include "stdio.h"
#include "string.h"
#include "stdlib.h"

typedef struct Veri{
  char adi[20];
	int notu;
	struct Veri *next;
}Veri;

Veri *kok;
Veri *sonraki,*temp;

void yazdir(void);
void ekle(char adi[20],int notu);

int main()
{
	ekle("Alperen",100);
	ekle("Hasan",70);
	ekle("Mahmut",30);

  yazdir();
	return 0;
}

void ekle(char adi[20], int notu){
  Veri *yeni = (Veri *)malloc(sizeof(Veri));

  strcpy(yeni->adi, adi);
  yeni->notu = notu;
  yeni->next = NULL;

  if (kok == NULL) {
    kok = yeni;
    temp = yeni;
  }
  else{
    temp->next = yeni;
    temp = yeni;
  }
}
void yazdir(){
  printf("Veriler Yazdırılıyor..\n" );
  temp = kok;
  int devam = 1;
  while (devam) {
    printf("%s\t", temp->adi);
    printf("%d\n", temp->notu);
    temp = temp->next;
    if (temp == NULL) {
      devam = 0;
    }
  }
  return;
}
