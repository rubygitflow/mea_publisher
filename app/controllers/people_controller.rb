# frozen_string_literal: true

class PeopleController < ApplicationController
  before_action :take_current_user, only: %i[index]
  before_action :find_person, only: %i[show edit update]

  # GET /people/1
  def show; end

  # GET /people
  def index
    @people = Person.all
  end

  # GET /people/new
  def new
    @person = Person.new.with_rand_nick.with_rand_email
  end

  # POST /people or /people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to root_path, notice: 'You have successfully registered!' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /people/1/edit
  def edit; end

  # PATCH/PUT /people/1 or /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to person_url(@person), notice: 'Person details were successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def person_params
    params.require(:person).permit(:name, :nickname, :email)
  end

  def take_current_user
    user_ids = Person.ids
    @person = Person.find(user_ids.sample)
    session[:user_id] = @person.id
  end

  def find_person
    @person = Person.find(params[:id])
  end
end
