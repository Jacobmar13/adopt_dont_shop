require 'rails_helper'

RSpec.describe 'the Applications show page' do
  before :each do
    @application = Application.create!(
      name: 'Jacob',
      street_address: '1234 Sunshine Blvd',
      city: 'Denver',
      state: 'CO',
      zip_code: 12345,
      applicant_story: "I'd make a good owner because I love dogs.",
      application_status: 'In Progress'
    )

    @shelter = Shelter.create!(
      name: 'Mystery Building',
      city: 'Irvine CA',
      foster_program: false,
      rank: 9
    )

    @pet1 = Pet.create(
      name: 'Scooby',
      age: 2,
      breed: 'Great Dane',
      adoptable: true,
      shelter_id: @shelter.id
    )
    @pet2 = Pet.create(
      name: 'Bacardi',
      age: 6,
      breed: 'Daschund',
      adoptable: true,
      shelter_id: @shelter.id
    )
    @pet3 = Pet.create(
      name: 'Yaeger',
      age: 1,
      breed: 'Swedish Valhund',
      adoptable: true,
      shelter_id: @shelter.id
    )

    ApplicationPet.create!(application: @application, pet: @pet1)
    ApplicationPet.create!(application: @application, pet: @pet3)
  end

  it "shows the application and all it's attributes" do
    visit "/applications/#{@application.id}"

    expect(page).to have_content(@application.name)
    expect(page).to have_content(@application.street_address)
    expect(page).to have_content(@application.city)
    expect(page).to have_content(@application.state)
    expect(page).to have_content(@application.zip_code)
    expect(page).to have_content(@application.applicant_story)
    expect(page).to have_content(@application.application_status)
    expect(page).to have_content(@pet1.name)
    expect(page).to have_content(@pet3.name)
    expect(page).to_not have_content(@pet2.name)
  end

  it 'links to a pets show page' do
    visit "/applications/#{@application.id}"

    click_link(@pet1.name)

    expect(current_path).to eq("/pets/#{@pet1.id}")
  end
end
