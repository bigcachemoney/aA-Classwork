class User
    attr_accessor :fname, :lname
    
    def self.find_by_id(id)
            ids = QuestionsDatabase.instance.execute(

            "SELECT
                *
            FROM 
                users 
            WHERE 
                users.id = id")
            ids.map {|id| User.new(id)}
    end

    def initialize(hash)
        @id = hash[id]
        @fname = hash[fname] 
        @lname = hash[lname]
    end
end