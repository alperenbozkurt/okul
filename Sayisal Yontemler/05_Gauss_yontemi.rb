def gauss katsayilar, sonuclar
  (0..katsayilar.length-1).each do |i|
    bir = katsayilar[i][i]
    (i..katsayilar.length-1).each do |j|
      katsayilar[i][j] /= bir
    end
    sonuclar[i] /= bir
    ((i+1)..katsayilar.length-1).each do |j|
      t = katsayilar[j][i]
      (0..katsayilar.length-1).each do |k|
        katsayilar[j][k] = t * katsayilar[i][k] - katsayilar[j][k]
      end
      sonuclar[j] = sonuclar[i].to_f * t - sonuclar[j]
    end
  end
  (0..katsayilar.length-1).each do |i|
    (0..katsayilar.length-1).each do |j|
      print katsayilar[i][j].to_s + " "
    end
    puts "\t" + sonuclar[i].to_s
  end
  x = Array.new(sonuclar.length,0)
  (0..katsayilar.length-1).reverse_each do |i|
    t = sonuclar[i]
    (i..katsayilar.length-1).reverse_each do |j|
      t = t - katsayilar[i][j] * sonuclar[j] if i != j
    end
    x[i] = t
    puts x[i]
  end
end


gauss [[-7.0,-3.0,3.0],[2.0,2.0,2.0],[-1.0,-4.0,3.0]], [12.0,0.0,-9.0]
