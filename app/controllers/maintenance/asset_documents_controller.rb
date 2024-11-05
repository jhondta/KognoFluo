# frozen_string_literal: true

class Maintenance::AssetDocumentsController < ApplicationController
  before_action :set_maintenance_asset_document, only: %i[ show edit update destroy ]

  # GET /maintenance/asset_documents or /maintenance/asset_documents.json
  def index
    @maintenance_asset_documents = Maintenance::AssetDocument.all
  end

  # GET /maintenance/asset_documents/1 or /maintenance/asset_documents/1.json
  def show
  end

  # GET /maintenance/asset_documents/new
  def new
    @maintenance_asset_document = Maintenance::AssetDocument.new
  end

  # GET /maintenance/asset_documents/1/edit
  def edit
  end

  # POST /maintenance/asset_documents or /maintenance/asset_documents.json
  def create
    @maintenance_asset_document = Maintenance::AssetDocument.new(maintenance_asset_document_params)

    respond_to do |format|
      if @maintenance_asset_document.save
        format.html { redirect_to @maintenance_asset_document, notice: 'Asset document was successfully created.' }
        format.json { render :show, status: :created, location: @maintenance_asset_document }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @maintenance_asset_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maintenance/asset_documents/1 or /maintenance/asset_documents/1.json
  def update
    respond_to do |format|
      if @maintenance_asset_document.update(maintenance_asset_document_params)
        format.html { redirect_to @maintenance_asset_document, notice: 'Asset document was successfully updated.' }
        format.json { render :show, status: :ok, location: @maintenance_asset_document }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @maintenance_asset_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintenance/asset_documents/1 or /maintenance/asset_documents/1.json
  def destroy
    @maintenance_asset_document.destroy!

    respond_to do |format|
      format.html { redirect_to maintenance_asset_documents_path, status: :see_other, notice: 'Asset document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maintenance_asset_document
      @maintenance_asset_document = Maintenance::AssetDocument.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def maintenance_asset_document_params
      params.require(:maintenance_asset_document).permit(:maintenance_asset_id, :document_type, :name, :description, :version, :expiration_date, :active)
    end
end
