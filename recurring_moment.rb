require 'active_support'
require 'active_support/time'
require 'active_support/core_ext'
require 'pry'

class RecurringMoment

  def initialize(start:, interval:, period:)
    @start    = start
    @interval = interval
    @period   = period
  end

  #match will try to check if given date  matches the @start date if not the date will be added in months,
  #weeks, or days depending on the value of @period then it will be evaluated again until it matches or if
  #the value is greater after adding days, months or weeks then it will  return value of  false

  def match(date)
    current = @start
    while current < date

      # if current == date
      #   return true
      # end
  
      if @period == 'weekly' #HA HA changing weekly to monthly @im-so-mad-right-now 
        current = current.advance(weeks: @interval)
        if current < date 
          @interval += 1
          current = @start
        end
   
      elsif @period == 'monthly'#equal sign was setting not comparing
        current = current.advance(months: @interval)
        if current < date 
          @interval += 1
          current = @start
        end

      elsif @period == 'daily'
        current = current.advance(days: @interval)
        if current < date 
          @interval += 1
          current = @start
        end
      end
    end
   #loop meeting criteria doesnt go back to evaluate again so if match is found
   #the true value wasn't being returned

    if current == date
      return true
    else  return false

    end

   

  end


end
