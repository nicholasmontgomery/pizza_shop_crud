require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/pizza_order')
also_reload('./models/*')


get "/pizza_orders" do
  @orders = PizzaOrder.all()
  erb(:index)
end

get "/pizza_orders/new" do
  erb(:new)
end


get "/pizza_orders/:id/edit"do
  @order = PizzaOrder.find(params[:id])
  erb(:edit)
end

get "/pizza_orders/:id" do
  @order = PizzaOrder.find(params[:id])
  erb(:show)
end

post "/pizza_orders" do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
  # redirect to "/pizza_orders"
end

post "/pizza_orders/:id/delete" do
  @order = PizzaOrder.find(params[:id])
  @order.delete()
  redirect to "/pizza_orders"
end


post "/pizza_orders/:id" do
  # binding.pry()
  @order = PizzaOrder.new(params)
  @order.update()
  redirect to "/pizza_orders/#{params[:id]}"
end
