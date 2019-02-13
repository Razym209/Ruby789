fibonah = []
fibonah[0] = 0
fibonah[1] = 1
z = 0
while fibonah[z] < 100 - fibonah[z - 1]
  z += 1
  fibonah[z] = fibonah[z - 2] + fibonah[z - 1]
end
print fibonah
