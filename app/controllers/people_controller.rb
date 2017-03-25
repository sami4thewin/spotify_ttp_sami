class PeopleController < ApplicationController

  def index
    @people = People.all
    render json: @people.to_json
  end

  def show
    @person = People.find_by_id(params[:id])
    if @person
      render json: @person
    end
  end


  def create
    @person = People.new(people_params)

    if @person.save
      render json: @person
    end
  end


  def update
    @person = People.find_by_id(params[:id])

    @person.update(people_params)
    if @person.save
      render json: @person
    end

  end

  def destroy
    @person = People.find_by_id(params[:id])

    if @person
      @person.destroy
      render json: @person
    end

  end


  private

    def people_params
      params.permit(:name, :favoriteCity)
    end

end
