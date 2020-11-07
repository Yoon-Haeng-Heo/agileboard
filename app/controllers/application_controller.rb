class ApplicationController < ActionController::Base
  helper_method :pretty_date
  
  def pretty_date(time = nil)
    time.methods.include?(:strftime) ? time.strftime('%Y-%m-%d') : ''
  end
end
