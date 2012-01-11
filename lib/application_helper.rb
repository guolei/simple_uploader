module ApplicationHelper
  
  def attachment_form_for(obj, options = {})
    c = ""
    unless @js_loaded
      c = javascript_include_tag('jquery.fileupload', 'jquery.fileupload-ui', 'jquery.iframe-transport', 'jquery.postmessage-transport','jquery.xdr-transport') + stylesheet_link_tag('jquery.fileupload-ui')
      @js_loaded = true
    end
    form_id = "form_#{rand(Time.now.to_i)}"
    c.html_safe + javascript_tag(:charset => "utf-8"){
      %{
        $(function () {
          $('##{form_id}').fileUploadUI({
      uploadTable: $('##{form_id}_upload_files'),
      downloadTable: $('##{form_id}_download_files'),
      buildUploadRow: function (files, index) {
      var file = files[index];
      return $('<tr><td>' + file.name + '<\/td>' +
      '<td class="file_upload_progress"><div><\/div><\/td>' +
      '<td class="file_upload_cancel">' +
      '<button class="ui-state-default ui-corner-all" title="Cancel">' +
      '<span class="ui-icon ui-icon-cancel">Cancel<\/span>' +
      '<\/button><\/td><\/tr>');
      },
      buildDownloadRow: function (file) {
        #{options[:callback]}
        return $('#{form_file_line("UUID","FILENAME")}'.replace(/UUID/g, file.uuid).replace(/FILENAME/g, file.filename));
      },
      });
        });
      }.html_safe
    } +
      content_tag(:div, :class => "files"){
      form_for(SimpleUploader::Attachment.new, :as => :attachment, :url => simple_uploader_attachments_path, :html => {:id => form_id, :class => "upload", :multipart => true }){|f|
        f.file_field(:attachment) +
          f.hidden_field(:content_type, :value => obj.class.to_s) +
          f.hidden_field(:content_id, :value => obj.id) +
          content_tag(:div, :class=>"upload-text-label"){I18n.t(:upload_files, :raise => true) rescue "Upload Files"}
      }.html_safe +
        content_tag(:table, "", :id=>"#{form_id}_download_files", :class=>"download_files"){
        obj.attachments.map{|t| form_file_line(t.uuid, t.original_filename)}.join.html_safe
      } +
        content_tag(:table, "", :id => "#{form_id}_upload_files")
    }

  end

  def attachments_for(obj, options = {}, &block)
    content_tag :div, :class => "attachment-list" do
      content_tag :ul do
        obj.attachments.map{|attach|
          content_tag(:li){block_given? ? block.call(attach) : attach.original_filename.html_safe + link_to("download", attach.url)}
        }.join.html_safe
      end
    end
  end

  private
  def form_file_line(uuid, filename)
    content_tag :tr, :id=>"#{uuid}" do
      content_tag :td do
        (filename + link_to((I18n.t(:del, :raise => true) rescue "Del"), simple_uploader_attachment_path(:id=>uuid), :method => :delete, :remote => true)).html_safe
      end
    end
  end
  
end
