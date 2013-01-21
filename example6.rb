
# Example 6
def example6(is_get)
  set :client_id, ENV['GROUPDOCS_CID']
  set :private_key, ENV['GROUPDOCS_PKEY']
  # set :service_url, ENV['GROUPDOCS_URL']

  # Load template
  template = File.open('templates/example6.html', 'r'){ |file| file.read  }
  if is_get 
    return Liquid::Template.parse(template).render()
  end
  set :document, params[:document]
  set :signature, params[:signature]

  if settings.client_id == nil or settings.private_key == nil or  settings.client_id.empty? or settings.private_key.empty?
    errmsg = "Please enter all required parameters"
  end

  file_one_path = "#{Dir.tmpdir}/#{params[:document][:filename]}"
    File.open(file_one_path, 'wb') { |f| f.write(params[:document][:tempfile].read) }

    
  file_one = GroupDocs::Storage::File.new({:name => params[:document][:filename], :local_path => file_one_path})
    document_one = file_one.to_document

  signature_one_path = "#{Dir.tmpdir}/#{params[:signature][:filename]}"
    File.open(signature_one_path, 'wb') { |f| f.write(params[:signature][:tempfile].read) }

  signature_one = GroupDocs::Signature.new({:name => 'Test', :image_path => signature_one_path})
    signature_one.position = { :top => 0.1, :left => 0.07, :width => 50, :height => 50}

    signed_documents = GroupDocs::Document.sign_documents!([document_one], [signature_one], {}, { :client_id => settings.client_id, :private_key => settings.private_key })

  # Render template
  return Liquid::Template.parse(template).render(
    'signed_documents' => signed_documents,
    'errmsg' => errmsg
  )
end