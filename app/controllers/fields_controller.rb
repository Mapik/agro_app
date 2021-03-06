# encoding: UTF-8
class FieldsController < ApplicationController
  before_action :logged_in_user, only: [:index, :create, :show, :update]
  before_action :correct_user, only:[:show, :update]
  

  def index
    @field = current_user.fields.build
  end

  def create
    @field = current_user.fields.build(field_params)
    if @field.save
      redirect_to @field
    else
      render 'index'
    end
  end

  def show
    field = Field.find_by(id: params[:id])
    remember_field field
    @field = current_field
    if @field.archive == 1
      redirect_to fields_path
    end
    @field_seasons = current_field.seasons.all
    @season = current_field.seasons.build
    @cultivation = Cultivation.new
  end
  
  
  def update
    @field = current_field
    if @field.update_attributes(field_params)
      if @field.archive == 0
        redirect_to @field
      else
        redirect_to fields_path
      end
    else
      render 'show'
    end
  end

  def jakasfunkcja
  end

  
  private

      def field_params
        params.require(:field).permit(:name, :area, :unit_symbol, :location, 
          :archive, :area_unit_id)
      end

      #def season_params
      #  params.require(:season).permit(:season_name)
      #end
      
      # Before filters

      # Confirms the correct user.
      def correct_user
        @field = Field.find_by(id: params[:id])
        @user = @field.user
        redirect_to(fields_path) unless current_user?(@user)
      end  
end
