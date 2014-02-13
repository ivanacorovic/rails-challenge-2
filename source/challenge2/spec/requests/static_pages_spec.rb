require 'spec_helper'

describe "Static pages" do

  subject {page}

  before do
    @user1=FactoryGirl.create(:user_with_stories, story_count: 10)
    visit user_path(@user1)
  end

  describe "Activate story" do
    before do
      @inactive=Story.where(active: false)
      @active=Story.where(active: true)
      check("mycheckbox-#{@inactive.first.id}")
    end
    it "test" do
      expect { click_button "Activate#{@inactive.first.id}"}.to change(@inactive, :count).by(-1)
    end
    it "test" do 
      expect { click_button "Activate#{@inactive.first.id}"}.to change(@active, :count).by(1)
    end
  end

  describe "there should be 3 lists: active, inactive and commented." do
    it {should have_selector('table#active')}
    it {should have_selector('table#inactive')}
    it {should have_selector('table#commented')}
  end  

  describe "Correct number of active and inactive stories for User1." do
    it {page.all('table#active tr').count.should eql(11)}
    it {page.all('table#inactive tr').count.should eql(10)}
    
    describe "Number of stories commented by User1" do
      before do
         FactoryGirl.create_list(:comment, 20, user: @user1)
         visit user_path(@user1)
      end
      it {page.all('table#commented tr').count.should eql(21)}
    end
  end 	
    #find(:css, ".mycheckbox-#{@inactive.first.id}").set(true)
    
    #find(:css, "#edit_story_#{@inactive.first.id} #story_active").set(true) 
    #find(:css, "#story_active", :label => "Checkbox#{@inactive.first.id}").set(true) 	
end