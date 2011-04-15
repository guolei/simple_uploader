class SimpleUploader::AttachmentsController < ApplicationController
  def show
    file = SimpleUploader::Attachment.find_by_uuid(params[:id])
    disposition = file.image? ? "inline" : "attachment"
    send_file(file.path, :filename => file.original_filename, :type => file.content_type, :disposition => disposition)
  end
end