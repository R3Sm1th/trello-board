class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_list
  before_action :set_column
  before_action :set_item, only: %i[ edit update destroy ]
  # GET /items or /items.json
  # def index
  #   @items = Item.all
  # end

  # GET /items/1 or /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = @column.items.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items or /items.json
  def create
    @item = @column.items.new(item_params)

    if @item.save
      redirect_to @list, notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    params[:positions].uniq.each_with_index do |id, index|
      @column.items.find(id).update(position: index + 1)
    end
    if @item.update(item_params)
      respond_to do |format|
        format.html { redirect_to @list, notice: 'Item was successfully updated.' }
        format.json {}
      end
    else
      render :edit
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy
    redirect_to @list, notice: "Item was successfully destroyed."
  end

  private

  def set_list
    @list = current_company.lists.includes(columns: :items).find(params[:list_id])
  end
  def set_column
    @column = @list.columns.find(params[:column_id])
  end
  def set_item
    @item = @column.items.find(params[:id])
  end
  def item_params
    params.require(:item).permit(:column_id, :content)
  end
end
