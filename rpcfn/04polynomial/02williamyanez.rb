=begin
RPCFN: Ruby**Fun (#4) 
William Yanez (wyanez@gmail.com) 
26/11/2009
=end

class Polynomial

  def initialize(arr_coeficients)
    raise ArgumentError,"Need at least 2 coefficients"  if arr_coeficients.size<2
    @arr_coeficients=arr_coeficients
    process
  end  
  
  def to_s
    @poly
  end  
  
  private
  def process
    degree=@arr_coeficients.size-1
    @poly=""
    @arr_coeficients.each  do |coef|
         unless coef.zero?
           @poly<<"+" if coef>0 and !@poly.empty?
           @poly<<"-" if coef<0
           @poly<<coef.abs.to_s if coef.abs !=1 or degree.zero?
           if degree>0
              @poly<<"x" 
              @poly<<"^"<<degree.to_s if degree>1
           end
         end
         degree=degree-1 
    end
    @poly="0=0" if @poly.empty?
  end  
end
