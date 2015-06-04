get '/' do
  erb :index
end

get '/contacts' do
  content_type 'json'
  Contact.all.to_json
end

post '/contact/add' do
  content_type 'json'
  response = {result: false}
  firstname = params[:firstname]
  lastname = params[:lastname]
  contact = Contact.create!(firstname: firstname, lastname: lastname)
  if contact
    response[:result] = true
    response[:contact] = contact.to_json(include: [:emails, :phone_numbers])
  end
  response.to_json
end
