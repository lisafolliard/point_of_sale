require('spec_helper')
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('path to view individual purchase page', :type => :feature) do
  it('path to list all purchases') do
    visit '/'
    click_link('See all Purchases')
    expect(page).to have_content("Purchases")
  end

end
