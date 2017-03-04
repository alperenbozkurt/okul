def kiris_yontemi denklem ,x1 ,x2 ,hata ,y1=0 ,y2=0 ,fark = 5
  while fark > hata
    x = x1
    y1 = eval(denklem)
    x = x2
    y2 = eval(denklem)

    xYeni = x2-((y2*(x1-x2))/(y1-y2))
    fark = (xYeni - x2).abs
    x1 = x2
    x2 = xYeni
  end
  x1
end
puts kiris_yontemi "Math::E**(-x)-x" ,0.0 ,1.0 ,0.000001
