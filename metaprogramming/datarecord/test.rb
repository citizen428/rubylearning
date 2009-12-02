require 'datarecord'

klass = Datarecord.make 'customers.txt'
p klass
klass.read.each{|people| p people}