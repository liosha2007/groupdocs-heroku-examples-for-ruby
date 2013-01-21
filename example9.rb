
# Example 9
def example9(is_get)
  set :client_id, ENV['GROUPDOCS_CID']
  set :private_key, ENV['GROUPDOCS_PKEY']
  # set :service_url, ENV['GROUPDOCS_URL']

  # Load template
  template = File.open('templates/example9.html', 'r'){ |file| file.read  }
  if is_get 
    return Liquid::Template.parse(template).render()
  end
  set :fileId, params[:fileId]
  set :width, params[:width]
  set :height, params[:height]

  if settings.client_id == nil or settings.private_key == nil or  settings.client_id.empty? or settings.private_key.empty? or params[:fileId].empty? or params[:width].empty? or params[:height].empty?
    errmsg = "Please enter all required parameters"
  end

  iframe_url = "https://apps.groupdocs.com/document-viewer/embed/#{settings.fileId}?frameborder=0"

  # Render template
  return Liquid::Template.parse(template).render(
    'iframe_url' => iframe_url,
    'width' => settings.width,
    'height' => settings.height,
    'errmsg' => errmsg
  )
end