def sifrele metin
  str = ""
  uretec = "1011"
  (0..3).each do |e|
    str << metin.upcase.bytes[e].to_s(2).rjust(8,'0')
  end
  metin = str + ""
  str << "000"
  (0..str.length-4).each do |e|
    if str[e] == "1"
      (0..uretec.length-1).each do |u|
        if str[e+u] == uretec[u]
          str[e+u] = "0"
        else
          str[e+u] = "1"
        end
      end
    end
  end
  metin << str[-3..-1]
end

def sifreCoz metin
  uretec = "1011"
  ikilik = metin + ""
  (0..ikilik.length-4).each do |e|
    if ikilik[e] == "1"
      (0..uretec.length-1).each do |u|
        if ikilik[e+u] == uretec[u]
          ikilik[e+u] = "0"
        else
          ikilik[e+u] = "1"
        end
      end
    end
  end
  if (0==ikilik.to_i)
    sonuc = ""
    metin.scan(/......../).each do |i| sonuc << i.to_i(2).chr end
    sonuc
  else
    puts "Hata Oluştu"
  end
end




kablo = sifrele 'tambay'
#(kablo[26].to_i==0) ? kablo[26] = "1" : kablo[26] = "0"
puts sifreCoz kablo
