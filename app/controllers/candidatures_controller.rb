class CandidaturesController < ApplicationController
  respond_to :html

  def new
    @candidature = Candidature.new
  end

  def create
    @candidature = Candidature.new(candidature_params)
    @candidature.steps = cookies.encrypted[:steps]
    @candidature.save

    respond_with(@candidature, location: received_candidatures_path)
  end

  def received
  end

  private
  def candidature_params
    params.require(:candidature).permit(:name, :email, :phone_number, :resume, :motivation)
  end
end
