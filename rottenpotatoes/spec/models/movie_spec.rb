describe "Movie" do
  describe "model validations" do
    it "should reject an empty title" do
      m = Movie.new(:title => '', :rating => 'G', :release_date => '1980-01-01')
      m.should_not be_valid
      m.errors[:title].should == ["can't be blank"]
    end

    it "should reject an invalid rating" do
      m = Movie.new(:title => 'Avatar', :rating => 'ABC', :release_date => '1980-01-01')
      m.should_not be_valid
      m.errors[:rating].should == ["is not included in the list"]
    end

    it "should reject an empty rating" do
      m = Movie.new(:title => 'Avatar', :rating => '', :release_date => '1980-01-01')
      m.should_not be_valid
      m.errors[:rating].should == ["is not included in the list"]
    end

    it "should grandfather a movie older than 1968 with no rating" do
      m = Movie.new(:title => 'Very Old Movie', :rating => '', :release_date => '1967-01-01')
      m.should be_valid
      m.errors[:rating].should be_empty
    end

 
    it "should reject an empty date" do 
      m = Movie.new(:title => 'Avatar', :rating => 'G', :release_date => '')
      m.should_not be_valid
      m.errors[:release_date].should == ["can't be blank"]
    end

    it "should reject a date older than 1930" do
      m = Movie.new(:title => 'Even Older', :rating => '', :release_date => '1929-01-01')
      m.should_not be_valid
      m.errors[:release_date].should == ["must be 1930 or later"]
    end

  end
end
