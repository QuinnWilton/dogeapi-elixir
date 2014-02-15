defmodule DogeAPI do
	use HTTPotion.Base

	def process_url(url) do
		"https://www.dogeapi.com/wow/?" <> url
	end

	def get_balance(api_key) do
		params = [api_key: api_key]
		construct_url("get_balance", params)
			|> get
	end

	def withdraw(api_key, amount, payment_address) do
		params = [api_key: api_key, amount: amount, payment_address: payment_address]
		construct_url("withdraw", params)
			|> get
	end

	def get_new_address(api_key, address_label) do
		params = [api_key: api_key, address_label: address_label]
		construct_url("get_new_address", params)
			|> get
	end

	def get_my_addresses(api_key) do
		params = [api_key: api_key]
		construct_url("get_my_addresses", params)
			|> get
	end

	def get_address_received(api_key, payment_address) do
		params = [api_key: api_key, payment_address: payment_address]
		construct_url("get_address_received", params)
			|> get
	end

	def get_address_by_label(api_key, address_label) do
		params = [api_key: api_key, address_label: address_label]
		construct_url("get_address_by_label", params)
			|> get
	end

	def get_difficulty do
		construct_url("get_difficulty", [])
			|> get
	end

	def get_current_block do
		construct_url("get_current_block", [])
			|> get
	end

	def get_current_price do
		construct_url("get_current_price", [])
			|> get
	end

	defp construct_url(action, params) do
		Enum.reduce params, "a=#{action}&", fn({key, val}, acc) ->
			acc <> "#{key}=#{val}&"
		end
	end
end
