def mock_attachments item, attachment_name, options
  size = options[:size] || 1
  mimetype = options[:mime] || options[:mime_type] || 'image/png'

  f = mock 'FILE'
  object_id = item.object_id

  item.stubs(attachment_name).returns f
  item.stubs("#{attachment_name}_file_name").returns object_id

  f.stubs(:size).returns(size)
  MIME::Types.stubs(:type_for).with(object_id).returns [mimetype]

  f.stubs(:flush_errors).returns([])
  return item
end

