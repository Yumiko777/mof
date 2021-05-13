class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy ]

  def index
    @properties = Property.all
  end

  def show
    @nearest_stations = @property.nearest_stations
  end

  def new
    @property = Property.new
    2.times { @property.nearest_stations.build}
  end

  def edit
    @property.nearest_stations.build
  end

  def create
    @property = Property.new(property_params)
      if @property.save
        redirect_to properties_path, notice: "物件を登録しました！"
      else
        2.times { @property.nearest_stations.build}
        render :new
      end
  end

  def update
      if @property.update(property_params)
        redirect_to properties_path, notice: "物件を編集しました！"
      else
        @property.nearest_stations.build
        render :edit
      end
  end

  def destroy
    @property.destroy
    redirect_to properties_path, notice: "削除しました！"
  end

  private
    def set_property
      @property = Property.find(params[:id])
    end
    def property_params
      params.require(:property).permit(:property_name, :rent, :address, :age, :remarks, nearest_stations_attributes: [:id, :route, :station, :minute_walk])
    end
end
