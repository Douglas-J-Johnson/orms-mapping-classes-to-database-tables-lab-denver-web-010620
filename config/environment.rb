require 'sqlite3'
require 'bundler'
require 'pry'
Bundler.require

require_relative '../lib/student'

DB = {:conn => SQLite3::Database.new("db/students.db")}
