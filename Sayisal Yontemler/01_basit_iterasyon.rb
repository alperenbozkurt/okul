def basit_Iterasyon denklem ,hata ,x
  fark = 1
  while fark > hata
    y = eval(denklem)
    fark = (y-x).abs
    x = y
  end
  x
end

puts basit_Iterasyon "4*Math::E**(-0.5*x)", 0.05, 3
