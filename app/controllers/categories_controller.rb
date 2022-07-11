class CategoriesController < ApplicationController
    def index
        @categories = Category.all
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        
        # respond_to do |format|
        #     if @article.save
        #         format.html { redirect_to categories_path. notice: "Entry was successfully created." }
        #     else
        #         format.html { render :new, status: :unprocessablee_entity}
        #     end
        # end
        
        # if @category.save
        #     render json: @category.to_json
        # else
        #     redirect_to :new
        # end
        
        if @category.save
            redirect_to categories_path
        else
            render :new, status: :unprocessable_entity
        end
    end
    
    def show
        @category = Category.find(params[:id])
    end

    def edit
        @category = Category.find(params[:id])
    end
    
    def update
        @category = Category.find(params[:id])

        if @category.update(category_params)
            redirect_to categories_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    # def destroy
    #     @category = Category.find(params["id"])

    #     if @category.destroy
    #         redirect_to categories_path
    #     else
    #     end
    # end

    private

    def category_params
        params.require(:category).permit(:name)
    end

end