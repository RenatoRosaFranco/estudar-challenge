# frozen_string_literal: true

class Person <:: Object
	include ActiveModel::Conversion
	include ActiveModel::Validations

	def initialize(params = {})
		@first_name = params[:first_name]
		@last_name = params[:last_name]
	end

	def persisted?
		false
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