class Feedback < ActiveRecord::Base
    validates :opinion, presence: true
end