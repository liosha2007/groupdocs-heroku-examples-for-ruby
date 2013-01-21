
# Example 8
def example8(is_get)
  set :client_id, ENV['GROUPDOCS_CID']
  set :private_key, ENV['GROUPDOCS_PKEY']
  # set :service_url, ENV['GROUPDOCS_URL']

  # Load template
  template = File.open('templates/example8.html', 'r'){ |file| file.read  }
  if is_get 
    return Liquid::Template.parse(template).render()
  end
  begin
    if settings.client_id == nil or settings.private_key == nil or  settings.client_id.empty? or settings.private_key.empty?
      raise "Please enter all required parameters"
    end

    set :fileId, params[:fileId]
    set :dimension, params[:dimension]
    set :pageNumber, params[:pageNumber]

    files_list = GroupDocs::Storage::Folder.list!('/', {}, { :client_id => settings.client_id, :private_key => settings.private_key})
    doc = nil
    metadata = nil
    files_list.each do |element|
      if element.class.name.split('::').last == 'Folder'
        next
      end
      
      if element.guid == settings.fileId
        metadata = element.to_document.metadata!({ :client_id => settings.client_id, :private_key => settings.private_key})
        doc = element.to_document
      end
    end
    
    if doc == nil
      raise "Document not found"
    else
      dimensions = settings.dimension.split 'x'
      images =  doc.page_images!(dimensions[0], dimensions[1], {:first_page => settings.pageNumber, :page_count => 1, :quality => 50, :use_pdf => true}, { :client_id => settings.client_id, :private_key => settings.private_key})

      unless images.empty?
        image = images[0]
      end
    end

  rescue StandardError => e
    errmsg = e.message
  end

  # Render template
  return Liquid::Template.parse(template).render(
    'image' => image,
    'errmsg' => errmsg
  )
end