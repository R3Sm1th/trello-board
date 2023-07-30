class ColumnsController < ApplicationController
  before_action :set_column, only: %i[ edit update destroy ]
  before_action :authenticate_user!
  before_action :set_list
  # GET /columns or /columns.json
  def index
    @columns = Column.all
  end

  # GET /columns/1 or /columns/1.json
  def show
  end

  # GET /columns/new
  def new
    @column = @list.columns.new
  end

  # GET /columns/1/edit
  def edit
  end

  # POST /columns or /columns.json
  def create
    @column = @list.columns.new(column_params)

    respond_to do |format|
      if @column.save
        format.html { redirect_to list_url(@list), notice: "Column was successfully created." }
        format.json { render :show, status: :created, location: @column }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @column.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /columns/1 or /columns/1.json
  def update
    respond_to do |format|
      if @column.update(column_params)
        format.html { redirect_to list_url(@list), notice: "Column was successfully updated." }
        format.json { render :show, status: :ok, location: @column }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @column.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /columns/1 or /columns/1.json
  def destroy
    @column.destroy

    respond_to do |format|
      format.html { redirect_to lists_url, notice: "Column was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_column
      @column = @list.columns.find(params[:id])
    end
    # Only allow a list of trusted parameters through.
    def column_params
      params.require(:column).permit(:list_id, :name)
    end

    def set_list
      @list = current_company.lists.includes(:columns).find(params[:list_id])
    end
end
