class PagesController < ApplicationController
	def index
		#@title = 'Bay_Max'
		#@content = 'prevention is better than cure'
	end

	def about
		@title = 'About'
		@content = 'this is a about page'
	end

	def section1
		@title = 'Section1'
		@content = 'this is a sec1 page'
	end

	def section2
		@title = 'Section2'
		@content = 'this is a sec2 page'
	end

	def section3
		@title = 'Section3'
		@content = 'this is a sec3 page'
	end

	def section4
		@title = 'section4'
		@content = 'this is a sec4 page'
	end

	def contact
		@title = 'Contact'
		@content = 'this is a contact page'
		@we = ['farag' , 'kamal' , 'ziad' , 'abdelfattah']
	end

end
