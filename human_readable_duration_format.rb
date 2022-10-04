# Human readable duration format
# https://www.codewars.com/kata/52742f58faf5485cae000b9a

# Write a function which formats a duration, given as a number of seconds, in a human-friendly way

def format_duration(seconds)
  years = seconds.divmod(31536000)[0]
  days = (seconds-(years*31536000)).divmod(86400)[0]
  hours = (seconds-(years*31536000+days*86400)).divmod(3600)[0]
  minutes = (seconds-(years*31536000+days*86400+hours*3600)).divmod(60)[0]
  seconds = (seconds-(years*31536000+days*86400+hours*3600+minutes*60))
  years_string = (years == 0 ? "" : (years == 1 ? "#{years} year" : "#{years} years"))
  days_string = (days == 0 ? "" : (days == 1 ? "#{days} day" : "#{days} days"))
  hours_string = (hours == 0 ? "" : (hours == 1 ? "#{hours} hour" : "#{hours} hours"))
  minutes_string = (minutes == 0 ? "" : (minutes == 1 ? "#{minutes} minute" : "#{minutes} minutes"))
  seconds_string = (seconds == 0 ? "" : (seconds == 1 ? "#{seconds} second" : "#{seconds} seconds"))
  m_s_and = ((minutes!=0 && seconds!=0)  ? " and " : "")
  h_m_and = ((hours!=0 && (minutes!=0 || seconds!=0))  ? (m_s_and.empty? ? " and " : ", ") : "")
  d_h_and = ((days!=0 && (hours!=0 || minutes!=0 || seconds!=0))  ? (m_s_and.empty? && h_m_and.empty? ? " and " : ", ") : "")
  y_d_and = ((years!=0 && (days!=0 || hours!=0 || minutes!=0 || seconds!=0))  ? (m_s_and.empty? && h_m_and.empty? && d_h_and.empty? ? " and " : ", ") : "")
  result = years_string + y_d_and + days_string + d_h_and + hours_string + h_m_and + minutes_string + m_s_and + seconds_string
  if result.empty?
    result = "now"
  end

  return result
end
