class Polynomial
  def initialize(coefficients)
    raise ArgumentError, "Need at least 2 coefficients" if coefficients.size < 2 
    @co = coefficients
    @powers = Array.new(@co.size - 2) { |i| "x^#{i+2}"}.reverse << 'x' << nil
  end

  def to_s
    return "0" if @co.all? { |c| c.zero? } # not much to do in this case
    @co.zip(@powers).map do |el| 
      next if el[0] == 0 
      # #{sign}#{value or empty string}#{x^y}
      "#{(el[0] > 0 ? '+' : '-')}#{(v = el[0].abs) == 1 && el[1] ? '' : v}#{el[1]}"
    end.join.gsub(/^\+/,'') # remove eventual leading '+'
  end
end

