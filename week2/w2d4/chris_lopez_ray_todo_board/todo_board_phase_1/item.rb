require 'byebug'
class Item
    attr_reader :title, :deadline,:description
    def self.valid_date?(string) #YYYY/MM/DD
        #debugger
        date = string.split("-")  #['####', '##', '##']

        #year
        year_range = (0..9999).to_a
        year = date[0] 
            if !year_range.include?(year.to_i)
                return false
                raise "#{year} range is invalid"
            end  
        #month
        month_range = (1..12).to_a
        #debugger
        month = date[1]
            if !month_range.include?(month.to_i)
                return false
                raise "#{month} range is invalid"
            end  

        #day
        day_range = (1..31).to_a
        day = date[2]
            if !day_range.include?(day.to_i) 
                return false
                raise "#{day} range is invalid"
            end  
        true
    end

    def initialize(title, deadline, description)
        if Item.valid_date?(deadline)
            @title = title
            @deadline = deadline
            @description = description
        else
            raise "#{deadline} is invalid"
        end
    end

    def title=(new_title)
        @title = new_title
    end
    
    def deadline=(new_deadline)
        if Item.valid_date?(new_deadline) 
            @deadline = new_deadline
        else
            raise "#{new_deadline} is an invalid date"
        end
    end

    def description=(new_description)
        @description = new_description
    end

end

# p my_item = Item.new('Fix login page', '2054-10-42', 'It loads slow.')

