class CopiesController < ApplicationController
  def index
    @copies = Copy.all
  end

  def show
    @copy = Copy.find(params[:id])
  end

  def new
    @copy = Copy.new
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

  def copy_params
    params.require(:copy).permit(:borrower, :due_date, :book_id)
  end
end
