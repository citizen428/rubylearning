class Dog
  attr_reader :name
 
  MSGS = { :dance => lambda { "#{name} is dancing" },
           :poo   => lambda { "#{name} is a smelly dog!" },
           :laugh => lambda { "#{name} finds this hilarious!" } }             
 
  def initialize(name)
    @name = name
  end
 
  def can(*actions, &block)
    meta = (class << self; self; end)
    actions.each do |action|
      if block_given?  
        meta.send(:define_method, action, &block) 
      else
        meta.send(:define_method, action, MSGS[action]) if MSGS.has_key?(action)
      end
    end
  end
 
  def method_missing(sym)
    "#{name} doesn't understand #{sym}"
  end
end