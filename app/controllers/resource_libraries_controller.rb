class ResourceLibrariesController < ApplicationController
  before_action :set_resource_library, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @resource_libraries = ResourceLibrary.all
    respond_with(@resource_libraries)
  end

  def show
    respond_with(@resource_library)
  end

  def new
    @resource_library = ResourceLibrary.new
    respond_with(@resource_library)
  end

  def edit
  end

  def create
    @resource_library = ResourceLibrary.new(resource_library_params)
    @resource_library.save
    respond_with(@resource_library)
  end

  def update
    @resource_library.update(resource_library_params)
    respond_with(@resource_library)
  end

  def destroy
    @resource_library.destroy
    respond_with(@resource_library)
  end

  private
    def set_resource_library
      @resource_library = ResourceLibrary.find(params[:id])
    end

    def resource_library_params
      params.require(:resource_library).permit(:title, :catalog, :mdate)
    end
end
