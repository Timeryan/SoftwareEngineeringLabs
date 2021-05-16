class LabsController < ApplicationController
  def index
    @labs = Lab.all
  end

  def new
    @lab = Lab.new
  end

  def create
    @lab = Lab.new(lab_params)

    if @lab.save
      redirect_to labs_path
    else
      render "new"
    end
  end

  def destroy
    Lab.destroy(params[:id])
    redirect_to labs_path
  end

  private def lab_params
    params.require(:lab).permit(:title, :text)
  end
end
