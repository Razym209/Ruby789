mas = (10..100).to_a
mas.delete_if { |shag| shag % 5 != 0 }
print mas