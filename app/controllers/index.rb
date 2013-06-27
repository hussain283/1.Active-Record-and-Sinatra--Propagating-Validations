get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  @event = Event.new
  erb :event_form
end

post '/events/create' do
	@event = Event.new(params[:event])
	p params
	p @event[:date].class

	if @event.valid?
		@event.save
		redirect "/"
	else
		p @event.errors
		erb :event_form
	end
end
