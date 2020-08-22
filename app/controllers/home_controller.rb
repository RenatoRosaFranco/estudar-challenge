# frozen_string_literal: true

class HomeController < ApplicationController
	def index
		@person = Person.new
	end
end