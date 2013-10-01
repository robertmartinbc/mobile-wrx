class PromotionsController < ApplicationController
  def index
  	@promotions = Promotion.all
  end

  def show
  	@promotion = Promotion.find(params[:id])
  end

  def new
  	@promotion = Promotion.new
    # authorize! :create, Promotion, message: "You need to be a memeber to create a new promotion."
  end

  def create
  @promotion = current_user.promotions.build(params[:promotion])
  # authorize! :create, @promotion, message: "You need to be signed up to do that."
  if @promotion.save
    flash[:notice] = "Promotion was saved."
    redirect_to @promotion
  else
    flash[:error] = "There was an error saving the promotion. Please try again."
    render :new
  end
end

  def edit
    @promotion = Promotion.find(params[:id])
    # authorize! :edit, @promotion, message: "You need to own the promotion to edit it."
  end

  def update
    @promotion = Promotion.find(params[:id])
    # authorize! :update, @promotion, message: "You need to own the promotion to edit it."
    if @promotion.update_attributes(params[:promotion])
      flash[:notice] = "Promotion was updated."
      redirect_to @promotion
    else
      flash[:error] = "There was an error saving the promotion. Please try again."
      render :edit
    end
  end
end
