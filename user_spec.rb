require "date"

def leap_year?(year)
  year % 400 == 0 or year % 100 != 0 and year % 4 == 0
end

class User
  def initialize(name, birthday)
    @name = name
    @birthday = birthday
  end

  def name
    @name
  end

  def born_in_leap_year?
    leap_year?(Date.parse(@birthday).year)
  end
end

describe User do
  context "born in 2001" do
    it "is not born in a leap year" do
      user = User.new("Francisca", "2001-01-01")
      expect(user).not_to be_born_in_leap_year
    end
  end

  context "born in 1900" do
    it "is not born in a leap year" do
      user = User.new("Francisca", "1900-01-01")
      expect(user).not_to be_born_in_leap_year
    end
  end

  context "born in 2000" do
    it "is born in a leap year" do
      user = User.new("Francisca", "2000-01-01")
      expect(user).to be_born_in_leap_year
    end
  end

  context "born in 2004" do
    it "is born in a leap year" do
      user = User.new("Francisca", "2004-01-01")
      expect(user).to be_born_in_leap_year
    end
  end
end

#before
describe User do
  before { @user = User.new("Francisca", "2001-01-01") }

  context "born in 2001" do
    it "is not born in a leap year" do
      expect(@user).not_to be_born_in_leap_year
    end
  end
end

#let
describe User do
before { @user = User.new("Francisca", "#{year}-01-01") }

context "born in 2001" do
  let(:year) { 2001 }

  it "is not born in a leap year" do
    expect(@user).not_to be_born_in_leap_year
  end
end

context "born in 2000" do
  let(:year) { 2000 }

  it "is born in a leap year" do
    expect(@user).to be_born_in_leap_year
  end
end
end

#subject
describe User do
  subject { User.new("Francisca", "#{year}-01-01") }

  context "born in 2001" do
    let(:year) { 2001 }
    it { should_not be_born_in_leap_year }
  end

  context "born in 1900" do
    let(:year) { 1900 }
    it { should_not be_born_in_leap_year }
  end

  context "born in 2000" do
    let(:year) { 2000 }
    it { should be_born_in_leap_year }
  end

  context "born in 2004" do
    let(:year) { 2004 }
    it { should be_born_in_leap_year }
  end
end
