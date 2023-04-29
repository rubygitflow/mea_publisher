# frozen_string_literal: true

class PeopleController < ApplicationController
  before_action :take_current_user, only: %i[index]
  before_action :find_person, only: %i[show]

  # GET /people/1
  def show; end

  # GET /people
  def index
    @people = Person.all
  end

  private

  def take_current_user
    c = Person.ids
    @person = Person.find(c.sample)
    session[:user_id] = @person.id
  end

  def find_person
    @person = Person.find(params[:id])
  end
end
