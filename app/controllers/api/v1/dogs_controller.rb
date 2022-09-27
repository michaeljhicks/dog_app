class Api::V1::DogsController < ApplicationController
    before_action :find_dog, only: %i[update destroy]

    def index
        @dogs = Dog.order(name: :DESC)
        render json: @dogs
    end 

    def create
        @dog = Dog.new(dog_params)
        @dog.save
    end 

    def destroy
        @dog.delete
    end 

    def update
        @dog.update(params.permit(:name, :breed))
    end 

    private

    def dog_params 
        params.permit(:name, :breed, :owner_id)
    end 

    def find_dog
        @dog = Dog.find(params[:id])
    end 
end
