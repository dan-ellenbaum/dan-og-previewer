# frozen_string_literal: true

# This page will handle creation and display for the user's inputted url
# and associated data (as well as enqueing jobs to process
# that url) and another input to poll the status of enqueued jobs
class OgPreviewersController < ApplicationController
  before_action :set_og_previewer, only: %i[show update destroy]

  # GET /og_previewers
  # GET /og_previewers.json
  def index
    @og_previewers = OgPreviewer.all
  end

  # GET /og_previewers/1
  # GET /og_previewers/1.json
  def show; end

  # GET /og_previewers/new
  def new
    @og_previewer = OgPreviewer.new
  end

  # POST /og_previewers
  # POST /og_previewers.json
  def create
    @og_previewer = OgPreviewer.new(og_previewer_params)
    respond_to do |format|
      if @og_previewer.save
        FetchOgDataJob.perform_later(@og_previewer)
        format.html do
          redirect_to @og_previewer,
                      notice: 'Processing URL...'
        end
        format.json do
          render :show, status: :created, location: @og_previewer
        end
      else
        format.html { render :new }
        format.json do
          render json: @og_previewer.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /og_previewers/1
  # DELETE /og_previewers/1.json
  def destroy
    @og_previewer.destroy
    respond_to do |format|
      format.html do
        redirect_to og_previewers_url,
                    notice: 'Og previewer was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_og_previewer
    @og_previewer = OgPreviewer.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def og_previewer_params
    params.require(:og_previewer).permit(:input_url, :og_image_url, :job_id, :status)
  end
end
