
# Example 2
def example2()
  set :client_id, ENV['GROUPDOCS_CID']
  set :private_key, ENV['GROUPDOCS_PKEY']
  # set :service_url, ENV['GROUPDOCS_URL']
  begin
    if settings.client_id == nil or settings.private_key == nil or  settings.client_id.empty? or settings.private_key.empty?
      raise "Please enter all required parameters"
    end
    
    files_list = GroupDocs::Storage::Folder.list!('/', {}, { :client_id => settings.client_id, :private_key => settings.private_key})
    filelist = []
    files_list.each { |element| filelist  << element.name }
  rescue StandardError => e
    errmsg = e.message
  end

  # Load template
  template = File.open('templates/example2.html', 'r'){ |file| file.read  }
  # Render template
  return Liquid::Template.parse(template).render(
    'filelist' => filelist,
    'errmsg' => errmsg
  )
end