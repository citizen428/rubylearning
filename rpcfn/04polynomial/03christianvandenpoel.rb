
class Polynomial
  def initialize(arg)
    raise ArgumentError.new('We expect an array at least') unless arg.is_a? Array
    raise ArgumentError.new('Need at least 2 coefficients') if arg.length < 2
    @exponents = []
    arg.reverse.inject(0) do |index,item| 
      @exponents.push( { "factor" => item, "exponent" => index }) unless item == 0
      index + 1
    end
  end

  def to_s
    return "0=0" if @exponents.length == 0
    @exponents.reverse.inject("") do |result, exp|
      f = exp["factor"]
      e  = exp["exponent"]
      # show only the '+' when positive and not the first item,
      # when negative, the '-' should always be shown
      result << "+" if f > 0 && !result.empty?
      result << "-" if f < 0
      # show the factor only when the absolute value is greater than 1
      result << f.abs.to_s if f.abs > 1
      # only show the x when the exponent is different from '0'
      result << "x" unless e == 0
      # only show the exponent when it is not in the range (0..1)
      result << "^#{e}" unless (0..1).include?(e)
      result
    end
  end
end