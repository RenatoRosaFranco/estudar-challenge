# frozen_string_literal: true

class PersonsController < ApplicationController
	def create
		person = Person.new(person_params)

		if person.valid?
			 # do something
			 # do anything here
			 redirect_to :root, notice: 'Usuario adicionado com sucesso.'
		else
			 # do another thing
			 redirect_to :root, notice: 'Falha ao adicionar usuario, tente novamente.'
		end
	end

	private

	def person_params
		params.require(:person)
			.permit(:first_name, :last_name)
	end
end