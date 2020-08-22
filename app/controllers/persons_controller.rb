# frozen_string_literal: true

class PersonsController < ApplicationController
	def create
		person = Person.new(person_params)
		url = "https://reqres.in/api/users"
		api_service = ApiService.new(url)
	
		if (person.valid? && api_service.perform!(person_params))
			 redirect_to :root, notice: 'Usuario adicionado com sucesso.'
		else
			 redirect_to :root, notice: 'Falha ao adicionar usuario, tente novamente.'
		end
	end

	private

	def person_params
		params.require(:person)
			.permit(:first_name, :last_name)
	end
end