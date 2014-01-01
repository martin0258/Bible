#!/usr/bin/env ruby

require 'date'

class IssueCreater
  attr_accessor :month
  attr_accessor :fixed_part

  # Create the object
  def initialize(month, fixed_part)
    @month = month
    @fixed_part = fixed_part
  end

  # Create issues based on pattern specified
  def create_issue
    month_dates = get_dates(month)
    for date in month_dates
      issue_title = "#{date} #{fixed_part}"
      puts issue_title
    end
  end

  # Get a list of dates within a month
  def get_dates(month)
    month_start = Date.parse(month + "-01")
    month_end = month_start.next_month.prev_day
    month_dates = month_start.upto(month_end)
    return month_dates
  end

end


if __FILE__ == $0
  ic = IssueCreater.new("2014-01", "QT")
  ic.create_issue
end
