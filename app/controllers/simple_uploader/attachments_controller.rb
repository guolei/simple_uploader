class SimpleUploader::AttachmentsController < ApplicationController
  def show
    file = SimpleUploader::Attachment.find_by_uuid(params[:id])
    disposition = file.image? ? "inline" : "attachment"
    send_file(file.url, :filename => file.name, :type => file.content_type, :disposition => disposition)
  end

  def create
    @attachment = SimpleUploader::Attachment.new(params[:attachment])
    if @attachment.save
      render :json => { :uuid => @attachment.uuid.to_s, :filename => @attachment.name }, :content_type => 'text/html'
    else
      render :json => { :result => 'error'}, :content_type => 'text/html'
    end
  end

  def destroy
    SimpleUploader::Attachment.find_by_uuid(params[:id]).try(:destroy)
  end
end