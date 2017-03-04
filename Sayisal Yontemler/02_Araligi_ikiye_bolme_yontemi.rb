def araligi_ikiye_bolme x1, x2, hata, formul
  sayac = 0
  h = (x1 - x2).abs
  x = x1*1.0
  y1 = eval(formul)
  x = x2*1.0
  y2 = eval(formul)
  if (y1*y2) < 0
    while h > hata
      x3 = (x1 + x2)/2.0
      x = x3
      y3 = eval(formul)
      (y1*y3)>0 ? x1 = x3 : x2 = x3
      h = (x1-x2).abs
    end
  end
  x2
end


puts araligi_ikiye_bolme 3, 4, 0.001, "Math::E**(-x)*(3.2*Math.sin(x)-0.5*Math.cos(x))"
