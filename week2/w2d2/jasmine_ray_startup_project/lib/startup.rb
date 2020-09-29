require "employee"
require 'byebug'
class Startup
    attr_reader :name, :funding, :salaries, :employees
    def initialize(name, funding, salaries) 
        @name = name
        @funding = funding
        @salaries = salaries #'title` => `salary'
        @employees = []
    end

    def valid_title?(title)
        @salaries.each {|k, v| return true if title == k }
        false 
    end

    def >(startup)
        self.funding > startup.funding
    end

    def hire(employee_n, title)
        if !valid_title?(title)
            raise "ERROR" 
        else
            employee_n = Employee.new(employee_n, title)
            @employees << employee_n
        end
    end 

    def size
        @employees.length
    end 
    
    # def pay_employee(employee)
    #     if self.funding >= @salaries[employee.title]
    #         employee_pay = @salaries[employee.title]
    #         @funding -= employee_pay
    #     else
    #         raise "we broke"
    #     end
    # end

    def pay_employee(employee)
        if @funding >= @salaries[employee.title]
            employee.pay(@salaries[employee.title])
            @funding -= @salaries[employee.title]
        else
            raise "ERROR"
        end 
    end

    def payday
        @employees.each {|employee| pay_employee(employee)}
    end

    def average_salary
        total = []
        @employees.each do |employee|
            total << @salaries[employee.title]
        end
        total.sum / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding 
        startup.salaries.each  do |title2, salary2|
            if !@salaries.has_key?(title2)
                @salaries[title2] = salary2
            end
        end
        @employees += startup.employees
        startup.close
    end 
end
