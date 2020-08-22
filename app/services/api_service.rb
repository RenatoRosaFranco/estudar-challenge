# frozen_string_literal: true
require 'faraday'
require 'json'

class ApiService <:: Object
	attr_reader :url, :params
 	
 	def initialize(url)
		@url = url
 	end

 	def perform!(params)
 		find_user(params)
 		create_user(params)
 	end

 	private

 	def find_user(params)
 		# response = Faraday.get(@url, params.to_json)
 		# ap [response.status, response.headers, response.body]
 		# (response.status.eql?(200)) ? true : false
 	  create_user(params)
 	end

 	def create_user(params)
 		response = Faraday.post(@url, params.to_json, {'Content-Type' => 'application/json'})
 		ap [response.status, response.headers, response.body]
 		(response.status.eql?(201)) ? true : false
 	end
end