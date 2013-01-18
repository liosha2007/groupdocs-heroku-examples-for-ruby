
# Example 3
def example3(is_get)
  set :client_id, ENV['GROUPDOCS_CID']
  set :private_key, ENV['GROUPDOCS_PKEY']
  # set :service_url, ENV['GROUPDOCS_URL']

  # Load template
  template = File.open('templates/example3.html', 'r'){ |file| file.read  }
  if is_get 
    return Liquid::Template.parse(template).render()
  end

  begin
    if settings.client_id == nil or settings.private_key == nil or  settings.client_id.empty? or settings.private_key.empty?
      raise "Please enter all required parameters"
    end

    filepath = "#{Dir.tmpdir}/#{params[:fileData][:filename]}"
    File.open(filepath, 'wb') { |f| f.write(params[:fileData][:tempfile].read) }
      
    file = GroupDocs::Storage::File.upload!(filepath, {}, { :client_id => settings.client_id, :private_key => settings.private_key })
    guid = file.guid
  
  rescue StandardError => e
    errmsg = e.message
  end

  # Render template
  return Liquid::Template.parse(template).render(
    'filename' => params[:fileData][:filename],
    'guid' => guid,
    'errmsg' => errmsg
  )
end