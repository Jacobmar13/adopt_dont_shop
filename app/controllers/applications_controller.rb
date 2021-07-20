class ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
  end

  def new
    @application = Application.new
  end

  def create
    @application = Application.new(application_params)

    if @application.save
      redirect_to "/applications/#{@application.id}"
    else
      flash[:notice] = @application.errors.full_messages.join(', ')
      render :new
    end
  end

  private

  def application_params
    params.require(:application).permit(
      :name,
      :street_address,
      :city,
      :state,
      :zip_code,
      :applicant_story,
      :application_status
    )
  end
end
