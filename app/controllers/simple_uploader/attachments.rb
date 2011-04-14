module SimpleUploader
  class AttachmentsController < ApplicationController
    def show
      file = Attachment.find_by_uuid(params[:id])
      disposition = file.image? ? "inline" : "attachment"
      send_file(file.url, :filename => file.original_filename, :type => file.content_type, :disposition => disposition)
    end
  end
end