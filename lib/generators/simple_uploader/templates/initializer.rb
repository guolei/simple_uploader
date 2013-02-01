SimpleUploader.setup do |config|
  config.file_path = "/d"
end

Paperclip.interpolates :six_bits_md5_sum do |attachment, style|
  six_bits_md5 = attachment.instance.attachment_fingerprint[0..5].downcase
  "#{six_bits_md5[0]}/#{six_bits_md5[1]}/#{six_bits_md5[2]}/#{six_bits_md5[3]}/#{six_bits_md5[4]}/#{six_bits_md5[5]}"
end
