class A
  @@a = 1
  @a = 2
  a = 3
 
  $binding = binding
  
end
 
p eval('[@@a, @a, a]', $binding)