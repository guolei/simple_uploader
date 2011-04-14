module ApplicationHelper
  
  def attachment_form_for(obj, options = {})
    javascript_include_tag('jquery.fileupload', 'jquery.fileupload-ui') +
      %{
        <script type="text/javascript" charset="utf-8">
        $(function () {
          $('.upload').fileUploadUI({
                uploadTable: $('.upload_files'),
                downloadTable: $('.download_files'),
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
                    return $('<tr><td><img alt="Photo" width="40" height="40" src="' + file.pic_path + '">' + file.name + '<\/td><\/tr>');
                },
            });
        });
        </script>
    } +
      content_tag(:div, :class => "files"){
      form_for(@upload, :html => { :class => "upload", :multipart => true }){|f|
        f.file_field(:attachment) +
          content_tag(:div){I18n.t(:upload_files, :raise => true) rescue "Upload Files"}
      } +
        content_tag(:table, :class => "upload_files") +
        content_tag(:table, :class=>"download_files")
    }

  end
  
end
