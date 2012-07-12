# This class is deprecated. This is just being kept around
# for legacy data
class ErDate < ActiveRecord::Base
  
  validates :cap,           presence: true
  validates :session_time,  presence: true,
                            uniqueness: true
  
end
