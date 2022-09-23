class CopiesController < ApplicationController
  def index
    @copies = Copy.all
  end

  def show
    @copy = Copy.find(params[:id])
  end

  def new
    @copy = Copy.new(copy_params(false))
  end

  def create
    @copy = Copy.new(copy_params)
    if @copy.save
      redirect_to @copy
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @copy = Copy.find(params[:id])
  end

  def update
    @copy = Copy.find(params[:id])

    if @copy.update(copy_params)
      redirect_to @copy
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @copy = Copy.find(params[:id])
    @copy.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def copy_params(require_all=true)
    required_params = require_all ? params.require(:copy) : params
    permitted_params = required_params.permit(:borrower, :due_date, :book_id)
    borrower = permitted_params[:borrower]
    permitted_params[:borrower] = nil if borrower == ""
    permitted_params
  end
end
