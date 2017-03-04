def turev denklem
  a = Array.new
  denklem.each_with_index do |e, i|
    a << e*i unless i == 0
  end
  str = "("
  a.each_with_index do |e, i|
    str << e.to_s + "x**" + i.to_s + ")"
    str << "+(" unless i == a.length-1
  end
  str
end
puts turev [-16,0,6,-3,1]
