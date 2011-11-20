require 'time'

# the second parameter is the optional "reference time"
def average_time_of_day(ts, d="10:00pm")
  ts << d
  times = ts.map { |t| Time.parse(t).strftime("%H %M").split} # [hours, minutes]
  times.map! { |t| t[0].to_i*60 + t[1].to_i } # convert times to minutes since midnight
  new_day = times.pop
  deviations = times.map { |t| (t > new_day ? t : t+24*60) - new_day }
  avg = new_day + deviations.inject(&:+).to_f/deviations.length # reference time + average of deviations
  Time.parse("%02d:%02d" % [(avg/60)%24, avg%60]).strftime("%I:%M%p")
end

=begin
doctest: Simple example
>> average_time_of_day(["11:51pm", "11:56pm"])
=> "11:53PM"
doctest: Complex example
>> average_time_of_day(["11:51pm", "11:56pm", "12:01am", "12:06am", "12:11am"])
=> "12:01AM"
doctest: Changing reference time
>> average_time_of_day(%w{19:05 02:05}, "7:00pm")
=> "10:35PM"
=end
