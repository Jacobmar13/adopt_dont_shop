require 'rails_helper'

RSpec.describe 'application creation' do
  describe 'start an application' do
    it 'renders the new form' do
      visit '/applications/new'

      expect(page).to have_content('New Application')
      expect(find('form')).to have_content('Name')
      expect(find('form')).to have_content('Street address')
      expect(find('form')).to have_content('City')
      expect(find('form')).to have_content('State')
      expect(find('form')).to have_content('Zipcode')
      expect(find('form')).to have_content('Your reason for adopting')
    end
  end

  describe 'the application create' do
    context 'given valid data' do
      it 'creates the application and redirects to the application show page' do
        visit '/applications/new'

        fill_in 'Name', with: 'Jacob'
        fill_in 'Street address', with: '1234 Sunshine Blvd'
        fill_in 'City', with: 'Denver'
        fill_in 'State', with: 'CO'
        fill_in 'Zipcode', with: '12345'
        fill_in 'Your reason for adopting', with: 'I really like dogs'
        click_button 'Create Application'

        expect(page).to have_content('Jacob')
        expect(page).to have_content('1234 Sunshine Blvd')
        expect(page).to have_content('Denver')
        expect(page).to have_content('CO')
        expect(page).to have_content('12345')
        expect(page).to have_content('I really like dogs')
        expect(page).to have_content('In Progress')
      end
    end
  end
end
