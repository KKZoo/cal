# frozen_string_literal: true

require 'date'

class Cal
  def main
    today = Date.today
    date_start = Date.new(today.year, today.month, 1)
    date_end = Date.new(today.year, today.month, -1)
    create_cal_top(date_start, today)
    create_cal_content(date_start, date_end)
  end

  def create_space_time(date)
    return space_time = 1 if date.strftime('%a') == 'Man'
    return space_time = 2 if date.strftime('%a') == 'Tue'
    return space_time = 3 if date.strftime('%a') == 'Wed'
    return space_time = 4 if date.strftime('%a') == 'Thu'
    return space_time = 5 if date.strftime('%a') == 'Fri'
    return space_time = 6 if date.strftime('%a') == 'Sat'
  end

  def create_output_day(day, cnt)
    if day < 10 && cnt == 0
      "\s#{day}"
    elsif day < 10 && cnt != 0
      "\s\s#{day}"
    elsif day >= 10 && cnt == 0
      day.to_s
    elsif day >= 10 && cnt != 0
      "\s#{day}"
    end
  end

  def create_cal_top(date_start, today)
    puts "\s\s\s\s\s\s#{today.month}月\s#{today.year}"
    puts '日 月 火 水 木 金 土'
    create_space_time(date_start).times do |space_time|
      if space_time == 1
        print "\s\s"
      else
        print "\s\s\s"
      end
    end
  end

  def create_cal_content(date_start, date_end)
    cnt = create_space_time(date_start)
    (1..date_end.day).each do |day|
      if cnt < 6
        print create_output_day(day, cnt)
        cnt += 1
      else
        puts create_output_day(day, cnt)
        cnt = 0
      end
    end
    puts "\n"
  end
end

cal = Cal.new
cal.main
