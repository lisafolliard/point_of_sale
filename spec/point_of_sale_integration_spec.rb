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

  it('adds and displays new purchases') do
    visit('/purchases')
    fill_in('purchase_date', :with => '2012-12-30 00:00:00')
    click_button('Add')
    expect(page).to have_content('December 30, 2012')
  end

  it('lists individual purchase') do
    visit('/purchases')
    fill_in('purchase_date', :with => '2012-12-30 00:00:00')
    click_button('Add')
    click_link('December 30, 2012')
    expect(page).to have_content('Purchase:')

  end
end
