require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/students')
require_relative('./models/houses')

#index
get '/hogwarts' do 
  @students = Student.all()
  erb(:index)  
end

#new
get '/hogwarts/new' do
  @houses = House.all()
  erb(:new)
end

#create
post '/hogwarts' do
  @students = Student.new(params)
  @students.save()
  redirect to '/hogwarts'
end