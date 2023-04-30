# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
first_person = Person.find_by(name: 'Gecko')
first_person = if first_person.blank?
                 Person.create!(name: 'Gecko', email: 'admin@boogie.com')
               else
                 Person.update(email: 'admin@boogie.com')
               end

second_person = Person.find_by(name: 'Tocko')
if second_person.blank?
  second_person = Person.create!(name: 'Tocko', email: 'test@boogie.com')
else
  second_person.update(email: 'test@boogie.com')
end
