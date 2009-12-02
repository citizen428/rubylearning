require 'time'

# the second parameter is the optional "reference time"
def average_time_of_day(ts, d="10:00pm")
  ts << d 
  times = ts.map { |t| Time.parse(t).strftime("%H %M").split} # [hours, minutes]
  times.map! { |t| t[0].to_i*60 + t[1].to_i} # convert times to minutes since midnight
  new_day = times.pop 
  deviations = times.map { |t| (t > new_day ? t : t+24*60) - new_day }
  avg = new_day + deviations.inject(&:+).to_f/deviations.length # reference time + average of deviations
  Time.parse("%02d:%02d" % [(avg/60)%24, avg%60]).strftime("%I:%M%p")
end

average_time_of_day(["11:51pm", "11:56pm"]) # => "11:53PM"
average_time_of_day(["11:51pm", "11:56pm", "12:01am", "12:06am", "12:11am"], "10:00pm") # => "12:01AM"
average_time_of_day(%w{22:05 02:05}) # => "12:05PM"
average_time_of_day(%w{02:05 22:05}) # => "12:05PM"
average_time_of_day(["6:41am", "6:51am", "7:01am"]) # => "06:51AM"
