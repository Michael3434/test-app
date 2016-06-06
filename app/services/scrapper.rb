class Scrapper
require 'capybara/poltergeist'
require 'csv'


	def initialize(url)
		@url = url
	end


	def new_session
		# Configure Poltergeist to not blow up on websites with js errors aka every website with js
		# See more options at https://github.com/teampoltergeist/poltergeist#customization
		Capybara.register_driver :poltergeist do |app|
		  Capybara::Poltergeist::Driver.new(app, js_errors: false)
		end

		# Configure Capybara to use Poltergeist as the driver
		Capybara.default_driver = :poltergeist

		browser = Capybara.current_session
		url = @url
		browser.visit url

		# browser.find_by_id("nav-login").trigger('click')
		# browser.fill_in 'email', with: 'michael.snapflat@gmail.com'
		# browser.fill_in 'password', with: 'qwertyuiop'
		# browser.find_by_id("login-submit").trigger('click')

		p "######### LOG IN ###############"

		p "Scrolling...."

		10.times do 
			browser.execute_script('window.scrollTo(0,100000)')
			sleep(10)
		end 
		# browser.find('textarea').set("Bonjour")

		p "Getting information..."

		byebug
		browser.all(".hero").each do |link|
			# link.trigger("click")
			image_url = link.find('img')['src']
			url = link['href']
			budget = link.find('.ribbon').text
			name = link.find(:xpath, "..").find('.listing-head').text
			areas = link.find(:xpath, "..").find('h3').text
			text = link.find(:xpath, "..").find('p').text
				CSV.open("db/flatmates.csv", "a") do |csv|
				 		csv << [url, budget, name, areas, text, image_url]
				end
			p "#{name} in CSV"
		end
		
	end

end