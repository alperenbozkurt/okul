Yönetmeni Alperen olan filmlerdeki oyuncuların isimlerini getiren sql Sorgusu
```sql
	SELECT DISTINCT Oyuncular.Adi as 'Oyuncu Adı', Oyuncular.Soyadi as 'Oyuncu Soyadı' FROM Oyuncular, Oyuncular_has_Filmler, Filmler, Yonetmenler WHERE 

	Oyuncular_has_Filmler.Oyuncular_idOyuncular = Oyuncular.idOyuncular AND
	Oyuncular_has_Filmler.Film_idFilmler = Filmler.idFilmler AND
	Filmler.Yonetmen_id = Yonetmenler.idYonetmenler AND
	Yonetmenler.adi = 'alp eren'
```

Adı mahmut olan kullanıcının, satın aldığı filmlerde oynayan oyuncuların  adını ve soyadını getiren sql sogusu

```sql 
SELECT DISTINCT Oyuncular.Adi , Oyuncular.Soyadi FROM Oyuncular, Oyuncular_has_Filmler, Filmler, Satin_almalar, Kullanicilar WHERE 

Oyuncular.idOyuncular = Oyuncular_has_Filmler.Oyuncular_idOyuncular AND
Oyuncular_has_Filmler.Film_idFilmler = Filmler.idFilmler AND
Filmler.idFilmler = Satin_almalar.Filmler_id AND
Kullanicilar.idKullanicilar = Satin_almalar.Kullanicilar_id AND
Kullanicilar.adi = 'Mahmut'
```
