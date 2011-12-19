class Polynomial
  attr_accessor :coeffs, :powers

  def initialize(coefficients)
    raise ArgumentError, "Need at least 2 coefficients" if coefficients.size < 2
    self.coeffs = coefficients
    self.powers = Array.new(coeffs.size - 2) { |i| "x^#{i+2}"}.reverse << 'x' << nil
  end

  def to_s
    return "0" if coeffs.all?(&:zero?)
    coeffs.zip(powers).map do |co, pow|
      next if co == 0
      "#{(co > 0 ? '+' : '-')}#{(v = co.abs) == 1 && pow ? '' : v}#{pow}"
    end.join.gsub(/^\+/,'')
  end
end

