require 'spec_helper.rb'

describe Shout do
  it "returns .current shouts in reverse chronological order" do
    older_shout = create(:shout)
    newer_shout = create(:shout)
    Shout.current.should == [newer_shout, older_shout]
  end

  it "returns shouts from #search" do
    upcase_shout = create(:text_shout, :body=>"Blue").shout
    downcase_shout = create(:text_shout, :body=>"blue").shout
    non_search_shout = create(:text_shout, :body=>"green").shout
    photo_shout = create(:photo_shout, :photo_file_name=>"blue.jpg").shout
    non_search_photo_shout = create(:photo_shout, :photo_file_name=>"green.jpg").shout

    Shout.search("blue").include?(upcase_shout).should == true
    Shout.search("blue").include?(downcase_shout).should == true
    Shout.search("blue").include?(non_search_shout).should == false
    Shout.search("blue").include?(photo_shout).should == true
    Shout.search("blue").include?(non_search_photo_shout).should == false
  end
end
