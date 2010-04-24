require 'e0602shapes'

describe Shape do
  
  before do
    @shapes = { :square => Square.new, :circle => Circle.new, 
      :triangle => Triangle.new, :amoeba => Amoeba.new}
  end

  it "should be able to create squares, circles, triangle and amoebae" do
    @shapes.length.should == 4
    @shapes.each { |k, v| v.class.to_s.should == k.to_s.capitalize }
  end

  it "should react to a click method" do
    @shapes.each { |k, v| v.click.should =~ /A #{v.class.to_s} object was clicked/ }
  end

  it "should rotate the shape 360 degrees clockwise when clicked" do
    deg = -360
    @shapes.each { |k, v| v.rotate(deg).should =~ /Rotating #{deg}/ }
  end

  it "should play a shape-specific AIF sound file when rotating a shape" do
    @shapes.each { |k, v| v.play_sound.should  =~ /#{v.class.to_s}/ }
  end

  it "should except instance-specific AIF files" do
    s = Square.new('funkysquare')
    s.play_sound.should =~ /funky/ 
  end

  it "should rotate Amoeba objects around edge points" do
    a = Amoeba.new
    a.rotate.should =~ /edge point/
  end
end
