# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
first_person = Person.find_by(email: ENV["DEF_ADMIN_EMAIL"])
if first_person.blank?
  first_person = Person.create!(name: ENV["DEF_ADMIN_NAME"],
                                nickname: ENV["DEF_ADMIN_NICKNAME"],
                                email: ENV["DEF_ADMIN_EMAIL"],
                                password: ENV["DEF_ADMIN_PASSWORD"])
else
  first_person.update(nickname: ENV["DEF_ADMIN_NICKNAME"],
                      name: ENV["DEF_ADMIN_NAME"],
                      password: ENV["DEF_ADMIN_PASSWORD"])
end

second_person = Person.find_by(email: ENV["DEF_QA_EMAIL"])
if second_person.blank?
  second_person = Person.create!(name: ENV["DEF_QA_NAME"],
                                 nickname: ENV["DEF_QA_NICKNAME"],
                                 email: ENV["DEF_QA_EMAIL"],
                                 password: ENV["DEF_QA_PASSWORD"])
else
  second_person.update(nickname: ENV["DEF_QA_NICKNAME"],
                       name: ENV["DEF_QA_NAME"],
                       password: ENV["DEF_QA_PASSWORD"])
end
