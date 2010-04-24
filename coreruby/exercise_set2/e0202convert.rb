=begin
  Function to convert temperatures from Fahreheit to Celsius.
  Dies if temp_in_fahrenheit is not a number.
=end
def convert(temp_in_fahrenheit)
  (temp_in_fahrenheit - 32) * 5 / 9
end
