load '99_turev_alma.rb'
def newton_rapshon_yontemi denklem, hata, x
  x = x * 1.0
  y = eval polinom denklem * 1.0
  dy = eval polinom turev denklem * 1.0
  x2 = 1
  h = (x2 - x).abs
  while h >= hata
    x2 = (x - (y/dy)) * 1.0
    h = (x2 - x).abs
    x = x2
    y = eval polinom denklem
    dy = eval polinom turev denklem
  end
  x2
end
puts newton_rapshon_yontemi [-16,0,6,-3,1], 0.05, 4
