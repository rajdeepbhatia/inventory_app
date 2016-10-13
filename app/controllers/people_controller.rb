class PeopleController < ApplicationController
  before_action :authenticate_user!
  before_action :set_person, only: [:edit, :destroy, :items]

  def index
    @people = Person.load_table_data
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)
    flash[:success] = t('people.success.created') if @person.save
  end

  def show
    @person = Person.load_details(params[:id])
    @error = t('people.error.not_found') and return if @person.blank?
  end

  def edit
  end

  def update
    @person = Person.find_by(id: params[:id])
    flash[:error] = t('people.error.not_found') and return if @person.blank?
    @updated = @person.update(person_params)
  end

  def destroy
    @person.destroy
    flash[:success] = t('items.success.deleted')
    redirect_to people_path
  end

  def items
    @items = @person.items.load_table_data
  end

  private
  def set_person
    @person = Person.find_by(id: params[:id])
    if @person.blank?
      flash[:error] = I18n.t('people.error.not_found')
      redirect_to people_path
    end
  end

  def person_params
    params.require(:person).permit(:name, :mobile_no)
  end
end
