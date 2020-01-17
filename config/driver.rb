require 'sqlite3'
require 'bundler'
require 'pry'
#Bundler.require

require_relative '../lib/student'
require_relative '../lib/course'
require_relative '../lib/student_course'

DB = {:conn => SQLite3::Database.new("db/students.db")}

Student.create_table

doug = Student.new("Doug", "17th")
doug.save
ella = Student.create(name: "Ella", grade: "5th")
lexie = Student.create(name: "Lexie", grade: "K")

Course.create_table

math = Course.new("Math", "Let's Calculate!")
math.save
art = Course.create(name: "Art", description: "Let's Color!")

#Student.drop_table
#Course.drop_table