class PeopleController < ApplicationController

  def home

  end

  def index
    @people = Person.all
    if @people.empty?
      render json: "People are empty."
    else
      render json: @people.to_json
    end
  end

  def show
    @person = Person.find_by_id(params[:id])
    if @person
      render json: @person
    end
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(people_params)

    if @person.save
      render json: @person
    else
      render json: "Didn't save."
    end
  end


  def update
    @person = Person.find_by_id(params[:id])

    @person.update(people_params)
    if @person.save
      render json: @person
    end

  end

  def destroy
    @person = Person.find_by_id(params[:id])

    if @person
      @person.destroy
      render json: @person
    end

  end


  private

    def people_params
      params.require(:person).permit(:name, :favoriteCity)
    end

end
