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
 	end

 	private

 	def find_user(params)
 		response  = Faraday.get("#{@url}?page=2")
 		response  = JSON.parse(response.body)
 		data 		  = response["data"]

 		records ||= []
 		data 		  = response["data"]

 		data.each do |e|
 			records.push({ 
 				first_name: e["first_name"], 
 				 last_name: e["last_name"] 
 			})
 		end

 		person = {
 		 	first_name: params[:first_name],
 		 	 	last_name: params[:last_name]
 		}

 		if records.include?(person)
 			 puts "User already exists."
 			 return false
 		else
 			 puts "start to creating a user."
 	  	 create_user(params)
 		end
 	end

 	def create_user(params)
 		puts "Creating an user."
 		response = Faraday.post(@url, params.to_json, {'Content-Type' => 'application/json'})
 		log_response(response)
 		(response.status.eql?(201)) ? true : false
 	end

 	def log_response(response)
 		ap [response.status, response.headers, response.body]
 	end
end