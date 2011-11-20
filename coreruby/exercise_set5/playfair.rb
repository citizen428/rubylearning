class PlayfairCipher    
  def initialize(key, remove='J')
    letters = [*'A'..'Z'] - [remove.upcase]
    keyletters = key.upcase.scan(/[A-Z]/).uniq
    @square = (keyletters + (letters - keyletters))[0..24].each_slice(5).to_a
  end
  
  def encrypt(msg)
    pairs = msg.upcase.scan(/[A-Z]/).join.gsub(/(\w)\1/, "\\1X\\1").scan(/(.)(.)/)
    pairs[-1] << 'X' if pairs[-1].size == 1
    crypt(pairs) 
  end
  
  def decrypt(msg)
    crypt(msg.gsub(/(\w)\1/,"\\1").scan(/(.)(.)/), true)
  end
  
  def crypt(pairs, decrypt=false)
    op = decrypt ? :- : :+
    
    pairs.map do |p|
      if row = (@square.select { |a| (a & p).size == 2})[0]
        "#{row[(row.index(p[0]).send(op,1)) % 5]}#{row[(row.index(p[1]).send(op,1)) % 5]}"
      elsif col = (@square.transpose.select { |a| (a & p).size == 2})[0]
        "#{col[(col.index(p[0]).send(op,1)) % 5]}#{col[(col.index(p[1]).send(op,1)) % 5]}"
      else
        idx = p.inject([]) do |i, l|
          pos = @square.flatten.index(l)
          i << pos / 5 << pos % 5
        end
        "#{@square[idx[0]][idx[3]]}#{@square[idx[2]][idx[1]]}"
      end
    end.join
  end
  
  attr_accessor :square
  private :crypt
end

# test code from the forums
key = 'Playfair Example.'
input_message = 'Hide the gold in the treee stump'
pc = PlayfairCipher.new key

p estr = pc.encrypt(input_message)
p pc.decrypt estr

require 'pp'
pp pc.square
