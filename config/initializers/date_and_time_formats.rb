Time::DATE_FORMATS[:month_and_year] = "%B %Y"
Time::DATE_FORMATS[:pretty] = lambda { |time| time.strftime("%b %e, %Y at %l:%M") + time.strftime("%p").downcase }