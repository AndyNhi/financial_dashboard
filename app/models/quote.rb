require 'yahoo_finance'

class Quote < ActiveRecord::Base

  belongs_to :user

end
