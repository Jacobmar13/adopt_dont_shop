class ApplicationPetsController < ApplicationController
  def create
    @application_pet = ApplicationPet.create!(application_pet_params)

    redirect_to "/applications/#{@application_pet.application_id}"
  end

  private

  def application_pet_params
    params.require(:application_pet).permit(:application_id, :pet_id)
  end
end
