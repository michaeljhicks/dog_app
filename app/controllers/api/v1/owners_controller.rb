class Api::V1::OwnersController < ApplicationController
    before_action :find_owner, only: %i[update destroy]

    #notice: using .order instead of .all to order the JSON response based on the attribute params passed in
    def index
        @owners = Owner.order(name: :DESC)
        render json: @owners
    end

    def create
        @owner = Owner.save(owner_params)
        @owner.save
    end 

    def destroy 
        @owner.delete
    end

    def update
        @owner.update(params.permit(:name))
    end 

    private 

    def owner_params
        params.permit(:name)
    end 

    def find_owner 
        @owner = Owner.find(params[:id])
    end
end
