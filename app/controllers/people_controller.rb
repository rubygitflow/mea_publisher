# frozen_string_literal: true

class PeopleController < ApplicationController
  before_action :find_person, only: %i[show]

  # GET /people/1 or /people/1.json
  def show; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def find_person
    @person = Person.find_by(name: 'Gecko')
  end
end
