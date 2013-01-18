
# Example 4
def example4(is_get)
  set :client_id, ENV['GROUPDOCS_CID']
  set :private_key, ENV['GROUPDOCS_PKEY']
  # set :service_url, ENV['GROUPDOCS_URL']

  # Load template
  template = File.open('templates/example4.html', 'r'){ |file| file.read  }
  if is_get 
    return Liquid::Template.parse(template).render()
  end

  begin
    if settings.client_id == nil or settings.private_key == nil or  settings.client_id.empty? or settings.private_key.empty?
      raise "Please enter all required parameters"
    end
    set :file_id, params[:fileId]
    
    
    files_list = GroupDocs::Storage::Folder.list!('/', {}, { :client_id => settings.client_id, :private_key => settings.private_key})
    dowload_file = ''

    files_list.each do |element|
      puts '----------'
      puts element
      if element.respond_to?('guid') and element.guid == settings.file_id
        dowload_file = element
      end
    end
    
    puts '------------------'
    puts dowload_file
    puts '------------------'

    dowloaded_file = dowload_file.download!(File.dirname(__FILE__), { :client_id => settings.client_id, :private_key => settings.private_key})
    unless dowloaded_file.empty?
      massage = "<font color='green'>File was downloaded to the <font color='blue'>#{dowloaded_file}</font> folder</font> <br />"
    end
    
    
    
  
  rescue StandardError => e
    errmsg = e.message
  end

  # Render template
  return Liquid::Template.parse(template).render(
    'filePath' => dowloaded_file,
    'errmsg' => errmsg
  )
end