
# Example 5
def example5(is_get)
  set :client_id, ENV['GROUPDOCS_CID']
  set :private_key, ENV['GROUPDOCS_PKEY']
  # set :service_url, ENV['GROUPDOCS_URL']

  # Load template
  template = File.open('templates/example5.html', 'r'){ |file| file.read  }
  if is_get 
    return Liquid::Template.parse(template).render()
  end

  begin
    if settings.client_id == nil or settings.private_key == nil or  settings.client_id.empty? or settings.private_key.empty?
      raise "Please enter all required parameters"
    end
    set :file_id, params[:fileId]
    set :action, params[:action]
    set :sorc_path, params[:srcPath]
    set :dest_path, params[:dstPath]

    path = '/'
    files_list = GroupDocs::Storage::Folder.list!(path, {}, { :client_id => settings.client_id, :private_key => settings.private_key})
    manipulate_file = nil
    files_list.each do |element|
      if path + element.name == settings.sorc_path
        manipulate_file = element
      end
    end
    if manipulate_file.nil?
      raise "No file with such FileName"
    end
    puts '------------3'
    puts settings.dest_path
    puts '------------3.5'

    if settings.action  == 'copy'
      file = manipulate_file.copy!(settings.dest_path, {}, { :client_id => settings.client_id, :private_key => settings.private_key})
    end
    puts '------------4'

    if settings.action  == 'move'
      file = manipulate_file.move!(settings.dest_path, {}, { :client_id => settings.client_id, :private_key => settings.private_key})
    end
    puts '------------5'

    if file
      massage = "File was #{settings.action}'ed to the #{settings.dest_path} folder"
    end
      

  rescue StandardError => e
    errmsg = e.message
  end

  # Render template
  return Liquid::Template.parse(template).render(
    'massage' => massage,
    'errmsg' => errmsg
  )
end