class CostsController < ApplicationController
	before_action :authenticate_user! #add except: [:blahblahblah] to liimit options for the authentication

	def index
		# @costs = Cost.all 
		@costs = current_user.costs
	end

	def show
		@cost = Cost.find params[:id]
	end

	def new 
		@cost = current_user.costs.build
	end

	def edit
		@cost = Cost.find params[:id]
	end

	def create
		@cost = current_user.costs.build(cost_params)
		if @cost.save
			redirect_to user_cost_path(current_user, @cost), notice: "Cost successfully created."
		else
			render 'new'
		end
	end

	def update
		@cost = Cost.find params[:id]
		if @cost.update(cost_params)
			redirect_to user_cost_path(current_user, @cost)
		else
			render 'edit'
		end
	end

	def destroy
		@cost = Cost.find params[:id]
		@cost.destroy

		redirect_to user_costs_path(current_user)
	end

	private
		def cost_params
			params.require(:cost).permit(:name, :price, :reason, :image_url)
		end


end