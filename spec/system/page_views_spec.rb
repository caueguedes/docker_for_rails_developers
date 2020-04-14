require 'rails_helper'

RSpec.describe "PageViews" do
  it "shows the number of page views" do
    visit  '/welcome'
    expect(page.text).to match(/This page has been viewed [0-9]+ times?!/)
  end

  it "is enhanced with JavaScript on", js: true do
    visit '/welcome'
    expect(page).to have_text("ENHANCED!")
  end
end