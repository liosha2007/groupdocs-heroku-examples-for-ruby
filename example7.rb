
# Example 7
def example7()
  set :client_id, ENV['GROUPDOCS_CID']
  set :private_key, ENV['GROUPDOCS_PKEY']
  # set :service_url, ENV['GROUPDOCS_URL']

  # Load template
  template = File.open('templates/example7.html', 'r'){ |file| file.read  }
  begin
    if settings.client_id == nil or settings.private_key == nil or  settings.client_id.empty? or settings.private_key.empty?
      raise "Please enter all required parameters"
    end

    files_list = GroupDocs::Storage::Folder.list!('/', {:extended => true}, { :client_id => settings.client_id, :private_key => settings.private_key})
    thumbnails = []
    files_list.each do |element|
      if element.class.name.split('::').last == 'Folder'
        next
      end
      
      if element.thumbnail
        name = element.name 
        thumbnails  << "<img src='data:image/png;base64,#{element.thumbnail}', width='40px', height='40px'> #{name}"
      end
    end
    
    if thumbnails.empty?
      set :thumbnails, thumbnails
    end

  rescue StandardError => e
    errmsg = e.message
  end

  # Render template
  return Liquid::Template.parse(template).render(
    'thumbnails' => thumbnails,
    'errmsg' => errmsg
  )
end