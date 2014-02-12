require 'spec_helper'

describe "Static pages" do

  subject {page}

  before do
  	@user1=FactoryGirl.create(:user)
    @stories=[]
    10.times do 
    	@stories << FactoryGirl.create(:story, user: @user1)
    end
    1.times do
    	@stories << FactoryGirl.create(:story, active: false, user: @user1)
    end
    @comments=[]
    35.times do
    	@comments << FactoryGirl.create(:comment, user: @user1)
    end
  	visit user_path(@user1)
  end
  
  describe "there should be 3 lists" do
    it {should have_selector('table#active')}
    it {should have_selector('table#inactive')}
    it {should have_selector('table#commented')}
  end  

  describe "Correct number of stories" do
    it {page.all('table#active tr').count.should eql(11)}
    it {page.all('table#inactive tr').count.should eql(1)}
    it {page.all('table#commented tr').count.should eql(36)}
	end
   
  describe "Checking to see if checkbox works" do
    before do
    	@inactive=Story.where(active: false)
    	@active=Story.where(active: true)
      check("story_active", match: :first)
   	end

   	it "test" do 
    	expect { click_button "Activate" }.to change(@inactive, :count).by(-1)
  	end
		it "test" do 
    	expect { click_button "Activate" }.to change(@active, :count).by(1)
  	end
	end
end