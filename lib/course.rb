class Course
    attr_accessor :name, :description
    attr_reader :id

    def initialize name, description, id=nil
        @name = name
        @description = description
    end

    def save
        sql = <<-SQL
        INSERT INTO courses (name, description)
        VALUES (?, ?)
        SQL

      DB[:conn].execute(sql, self.name, self.description)
        
        @id = DB[:conn].execute("SELECT last_insert_rowid() FROM courses")[0][0]
    end

    def self.create (name:, description:)
        course = Course.new(name, description)
        course.save
        course
    end

    def self.create_table
        sql = <<-SQL
        CREATE TABLE IF NOT EXISTS courses (
            id INTEGER PRIMARY KEY,
            name TEXT,
            description TEXT
        )
        SQL

        DB[:conn].execute(sql)
    end

    def self.drop_table
        DB[:conn].execute("DROP TABLE courses")
    end
end