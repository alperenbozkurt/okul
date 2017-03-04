def turev denklem
  a = Array.new
  denklem.each_with_index do |e, i|
    a << e*i unless i == 0
  end
  a
end

def polinom denklem
  str = "("
  denklem.each_with_index do |e, i|
    str << e.to_s + "*x**" + i.to_s + ")"
    str << "+(" unless i == denklem.length-1
  end
  str
end
