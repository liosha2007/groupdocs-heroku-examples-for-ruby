
# Example 10
def example10(is_get)
  set :client_id, ENV['GROUPDOCS_CID']
  set :private_key, ENV['GROUPDOCS_PKEY']
  # set :service_url, ENV['GROUPDOCS_URL']

  # Load template
  template = File.open('templates/example10.html', 'r'){ |file| file.read  }
  if is_get 
    return Liquid::Template.parse(template).render()
  end
  set :fileId, params[:fileId]
  set :email, params[:email]

  if settings.client_id == nil or settings.private_key == nil or  settings.client_id.empty? or settings.private_key.empty?
    errmsg = "Please enter all required parameters"
  end

  files_list = GroupDocs::Storage::Folder.list!('/', {}, { :client_id => settings.client_id, :private_key => settings.private_key})
  name = nil
  doc = nil
  files_list.each do |element|
    if element.class.name.split('::').last == 'Folder'
      next
    end
    
    if element.guid == settings.fileId
      name = element.name 
      doc = element
    end
  end

  shared = doc.to_document.sharers_set!(settings.email.split(" "), { :client_id => settings.client_id, :private_key => settings.private_key});
  if shared
    shared_emails = settings.email
  end

  # Render template
  return Liquid::Template.parse(template).render(
    'shared_emails' => shared_emails,
    'errmsg' => errmsg
  )
end