class Polynomial
  def initialize(coeffs)
    raise ArgumentError.new("Need at least 2 coefficients") if coeffs.size < 2
    power = coeffs.size - 1
    @pretty = ""
    coeffs.each_with_index do |coeff, index|
      addition = stringify(coeff, power) 
      next_coeff = coeffs[index + 1] || -1
      joiner = "+" unless next_coeff <= 0
      @pretty << "#{addition}#{joiner}"
      power -= 1
    end  
    #the formatting rules mean that a polynomial with all coefficients
    #equal to 0 would be represented as "". We always want to show *something*,
    #so cater for this special case.
    @pretty = "0" if @pretty.empty?
  end

  def to_s
    @pretty
  end

  private
  def stringify(coeff, power)
    if coeff == 0
      ""
    elsif power == 0
      coeff.to_s
    else
      "#{format_coeff(coeff)}#{format_power(power)}"
    end
  end
  
  def format_power(power)
    format power, {:prefix => "^"}
  end

  def format_coeff(coeff)
    format coeff, {:postfix => "x",
		   :replacements => {-1 => "-"}}
  end

  def format(num, opts = {})
    prefix = opts[:prefix] || ""
    postfix = opts[:postfix] || ""
    replacements = opts[:replacements] || {}
    defaults = {0 => "", 1 => ""}
    replacements = replacements.merge(defaults)
    result = ""
    result << prefix unless num <= 1
    result << (replacements[num] || num.to_s)
    result << postfix unless num == 0
  end

end