class Datarecord
  def self.make file
    unless File.exists? file
      raise Errno::ENOENT
    end
    
    klass_name = File.basename(file, '.txt').capitalize
    klass = Object.const_set(klass_name, Class.new)

    lines = File.readlines(file).map(&:chomp)
    fields = lines[0].split(', ') 
    
    klass.class_eval do
      attr_reader *fields
      
      define_method(:initialize) do |*params|
        fields.each_with_index do |param, i|
          instance_variable_set("@#{param}", params[i])
        end
      end
      
      meth = lambda do 
        lines[1..-1].map { |line| klass.new(*line.split(', ')) }
      end
      (class << self; self; end).send(:define_method, :read, &meth)
    end
    klass
  end
end
