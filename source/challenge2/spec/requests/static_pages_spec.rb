require 'spec_helper'

describe "Static pages" do

  subject {page}

  before do
  	@user1=FactoryGirl.create(:user)
    @stories=[]
    10.times do 
    	@stories << FactoryGirl.create(:story, active: true, user: @user1)
    end
    # 10.times do |n|
    #   @stories << Story.create!(user_id: @user1.id, active: true, url: "https://www.example.org",
    #                   title: "Story#{n}", description: "This is my Story #{n}")
    # end

    10.times do
    	@stories << FactoryGirl.create(:story, active: false, user: @user1)
    end
    
    # 10.times do |n|
    #   Story.create!(user_id: @user1.id, active: false, url: "https://www.example.org",
    #                   title: "Story#{n}", description: "This is my Story #{n}")
    # end
    @comments=[]
    35.times do 
    	@comments << FactoryGirl.create(:comment, user: @user1, story: @stories[3])
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
    it {page.all('table#inactive tr').count.should eql(10)}
    it {page.all('table#commented tr').count.should eql(36)}
      it "test1" do 
        @user1.stories.count.should eql (20)
    end
   
	end
   
  describe "Checking to see if checkbox works" do
    before do
    	@inactive=Story.where(active: false)
    	@active=Story.where(active: true)
      @stories=Story.all
    
      check("mycheckbox-#{@inactive.first.id}")
      #find(:css, ".mycheckbox-#{@inactive.first.id}").set(true)
      
      #find(:css, "#edit_story_#{@inactive.first.id} #story_active").set(true) 
      #find(:css, "#story_active", :label => "Checkbox#{@inactive.first.id}").set(true) 
   	end
    # it "test1" do 
    #   @inactive.count.should eql (10)
    # end
    # it "test1" do 
    #   @stories.first.id.should eql(@stories.last.id)
    # end
    # it "test1" do  
    #   @active.first.id.should eql(@active.last.id)
    # end
    # it "test1" do  
    #   @stories.count.should eql (20)
    # end
    # it "test1" do  
    #   User.all.count.should eql (1)
    # end
    # it "test1" do  
    #   @inactive.first.id.should eql(@inactive.last.id)
    # end
    
 
   	it "test" do 
    	expect { click_button "Activate#{@inactive.first.id}"}.to change(@inactive, :count).by(-1)
  	end
		it "test" do 
    	expect { click_button "Activate#{@inactive.first.id}"}.to change(@active, :count).by(1)
  	end
	end
end