Time::DATE_FORMATS[:month_and_year] = "%B %Y"
Time::DATE_FORMATS[:pretty] = lambda { |time| time.in_time_zone.strftime("%b %e, %Y at %l:%M") + time.in_time_zone.strftime("%p").downcase }