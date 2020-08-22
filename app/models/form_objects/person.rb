# frozen_string_literal: true
require 'json'

class Person <:: Object
	include ActiveModel::Conversion
	include ActiveModel::Validations

	attr_accessor :first_name, :last_name

	def initialize(params = {})
		@first_name = params[:first_name]
		@last_name = params[:last_name]
	end

	def persisted?
		false
	end

	def as_json
		self.to_json
	end

	validates :first_name,
						presence: true,
						uniqueness: false,
						allow_blank: false,
						length: { minimum: 3, maximum: 30 }

	validates :last_name,
						presence: true,
						uniqueness: false,
						allow_blank: false,
						length: { minimum: 3, maximum: 30 }
end