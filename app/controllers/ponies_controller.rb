class PoniesController < ApplicationController
  before_action :set_pony, only: [:show, :edit, :update, :destroy]
  
  def index
    @ponies = Pony.all
  end

  def show
  end

  def new
    @pony = Pony.new
  end

  def edit
  end

  def create
    @pony = Pony.new(pony_params)
    respond_to do |format|
      if @pony.save
        format.html { redirect_to @pony, notice: 'Pony was successfully created.' }
        format.json { render :show, status: :created, location: @pony }
      else
        format.html { render :new }
        format.json { render json: @pony.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @pony.update(pony_params)
        format.html { redirect_to @pony, notice: 'Pony was successfully updated.' }
        format.json { render :show, status: :ok, location: @pony }
      else
        format.html { render :edit }
        format.json { render json: @pony.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @pony.destroy
    respond_to do |format|
      format.html { redirect_to ponies_url}
      format.json { head :no_content }
    end
  end

  private
    def set_pony
      @pony = Pony.find(params[:id])
    end

    def pony_params
      params.require(:pony).permit(:name, :profession)
    end
end
