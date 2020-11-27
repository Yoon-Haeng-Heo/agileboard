class ApplicationController < ActionController::Base
  helper_method :pretty_date, :pretty_time
  
  def pretty_date(time = nil)
    time.methods.include?(:strftime) ? time.strftime('%Y-%m-%d') : ''
  end

  def pretty_time(time = nil)
    time.methods.include?(:strftime) ? time.strftime('%Y-%m-%d %H:%M') : ''
  end
end
