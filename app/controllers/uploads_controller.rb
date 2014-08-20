require 'smarter_csv'

class UploadsController < ApplicationController
  before_action :set_upload, only: [:show, :edit, :update, :destroy]

  include Concerns::BattingConcern

  # GET /uploads
  # GET /uploads.json
  def index
    @uploads = Upload.all
  end

  # GET /uploads/1
  # GET /uploads/1.json
  def show
    puts "=== show === #{$file_path}"

    data = SmarterCSV.process($file_path, row_sep: :auto)
    retrieve_data data
  end

    # GET /uploads/1
  # GET /uploads/1.json
  def reshow
    puts "=== reshow === #{params[:id]}"

    # this should be a partial rather than ugly global
    #new_file_path = "./public/uploads/upload/attachment/" + params[:id] + "/\*.csv"
    new_file_path = $file_path
    puts "=== reshow === #{new_file_path}"

    data = SmarterCSV.process(new_file_path, row_sep: :auto)
    retrieve_data data
  end

  # GET /uploads/new
  def new
    @upload = Upload.new
  end

  # GET /uploads/1/edit
  def edit
  end


  # POST /uploads
  # POST /uploads.json
  def create
    @upload = Upload.new(upload_params)

    respond_to do |format|
      if @upload.save
        format.html { redirect_to @upload, notice: 'Upload was successfully created.' }
        format.json { render action: 'show', status: :created, location: @upload }
      else
        format.html { render action: 'new' }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
    $file_path =  "./public" + @upload.attachment.to_s
  end

  # PATCH/PUT /uploads/1
  # PATCH/PUT /uploads/1.json
  def update
    respond_to do |format|
      if @upload.update(upload_params)
        format.html { redirect_to @upload, notice: 'Upload was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uploads/1
  # DELETE /uploads/1.json
  def destroy
    @upload.destroy
    respond_to do |format|
      format.html { redirect_to uploads_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upload
      @upload = Upload.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def upload_params
      params.require(:upload).permit(:name, :attachment)
    end
end
