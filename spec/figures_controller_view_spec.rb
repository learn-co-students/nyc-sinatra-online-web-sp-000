require 'spec_helper'

describe FiguresController do
  before do
    queenb = Figure.create(:name => "Beyonce")
    kanye = Figure.create(:name => "Kanye")
    bqe = Landmark.create(name: 'BQE', year_completed: 1961)
    mr_president = Title.create(name: "Mr. President")
    bqe.figure = queenb
    bqe.save
  end

  after do
    Figure.destroy_all
    Title.destroy_all
    Landmark.destroy_all
  end

  it "allows you to view form to create a new figure" do
    visit '/figures/new'
    expect(page.body).to include('<form')
    expect(page.body).to include('figure[name]')
    expect(page.body).to include('figure[title_ids][]')
    expect(page.body).to include('figure[landmark_ids][]')
    expect(page.body).to include('landmark[name]')
    expect(page.body).to include('title[name]')
  end

  it "creates checkboxes for all the landmarks and titles created on the Figures new page" do
    Landmark.create(name: 'BQE', year_completed: 1961)
      visit "/figures/new"
      expect(page).to have_css("input[type=\"checkbox\"]")
      expect(page).to have_content('BQE')
      Title.create(:name => "Mayor")
      visit "/figures/new"
      expect(page).to have_css("input[type=\"checkbox\"]")
      expect(page).to have_content('Mayor')

  end
end
