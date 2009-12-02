=begin
  Define the following class without class MaskedString, def trvowel and def self.trvowel

  class MaskedString < String
    def tr_vowel
      tr 'aeiou', '*'
    end
    def self.tr_vowel str
      str.tr 'aeiou', '*'
    end
  end
=end

# create class as subclass of String
MaskedString = Class.new(String)

# add the instance method
MaskedString.class_eval do
  define_method :tr_vowel do
    tr 'aeiou', '*'
  end
end

# add the class method
MaskedString.instance_eval do   
  def tr_vowel(str)
    str.tr 'aeiou', '*'
  end
end

=begin
Alternative way to define the class method
class MaskedString
  (class << self; self; end).module_eval do
    define_method :tr_vowel do |str|
      str.tr 'aeiou', '*'
    end
  end
end
=end

# test code
o = MaskedString.new("Hello RubyLearning")
o.class # => MaskedString
o.tr_vowel # => "H*ll* R*byL**rn*ng"
MaskedString.tr_vowel("Goodbye RubyLearning") # => "G**dby* R*byL**rn*ng"
