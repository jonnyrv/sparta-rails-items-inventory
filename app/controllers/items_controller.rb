class ItemsController < ApplicationController

    def index
        @item = Item.all
        render  :index
    end

    def new
        @item = Item.new        
        render :new
    end

    def create
        @item = Item.new(items_params)
        if(@item.save)
            redirect_to "/"
        end
    end

    def items_params
        params.require(:item).permit(:serial_number, :description, :supplier, :status, :lender)
    end

    def edit
        @item = Item.find(params[:id].to_i)
        render :edit
    end

    def show
        @item = Item.find(params[:id].to_i)
    end

    def update
        @item = Item.find(params[:id].to_i)
        @item.update(items_params)
    end

    def destroy
        @item = Item.find(params[:id].to_i)
        @item.destroy
        redirect_to(items_path)
    end

end
