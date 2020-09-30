require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
    include Singleton

    def initialize 

        #E.g., User.new('fname' => 'Ned', 'lname' => 'Ruggeri', 'is_instructor' => true) should return a User object with those attributes.
        super('questions.db')
        self.results_as_hash = true 
        self.type_translation = true 
            QuestionsDatabase.execute (<<-SQL
            
            
            
            
            SQL)
    end

end