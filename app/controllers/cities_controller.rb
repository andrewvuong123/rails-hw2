class  CitiesController < ApplicationController
	def view

		#berkeley = City.new(
		#	name: 'Berkeley',
		#	population: 12, 
		#	landmark: 'oski'
		#)
		#berkeley.save
		
		@cities = City.all
		@c = @cities.find(params[:name])
		
	end

	def new
		
	end

	def create #post route to receive info needed to create City
		
		@cities = City.all
		if not @cities.has_value?(params[:name])
		city = City.new(
			name: params[:name],
			population: params[:population], 
			landmark: params[:landmark]
		)
		# Save the city so that it's in City.all
		city.save
		redirect_to "http://localhost:1337/cities/view"
		
			
		end
	end

	def update
		@cities = City.all
		city = @cities.find(params[:name])
		if city.has_value?(params[:name])
			City.update(landmark: params[:landmark], population: params[:population])
		end
		#redirect_to "http://localhost:1337/cities/view"
	end

end