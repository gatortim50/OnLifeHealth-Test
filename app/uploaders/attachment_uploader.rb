class AttachmentUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    # uploads/uploads/attachment/1
  end

  def extension_white_list
    %w(csv)
  end
end
