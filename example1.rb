
# Example 1
def example1()
  set :client_id, ENV['GROUPDOCS_CID']
  set :private_key, ENV['GROUPDOCS_PKEY']
  # set :service_url, ENV['GROUPDOCS_URL']

  begin
    if settings.client_id == nil or settings.private_key == nil or  settings.client_id.empty? or settings.private_key.empty?
      raise "Please enter all required parameters"
    end
    userInfo = GroupDocs::User.get!({:client_id => settings.client_id, :private_key => settings.private_key})
  rescue StandardError => e
    errmsg = e.message
  end

  # Load template
  template = File.open('templates/example1.html', 'r'){ |file| file.read  }
  # Render template
  return Liquid::Template.parse(template).render(
    'firstname' => userInfo.firstname,
    'lastname' => userInfo.lastname,
    'nickname' => userInfo.nickname,
    'primary_email' => userInfo.primary_email,
    'errmsg' => errmsg
  )

end
