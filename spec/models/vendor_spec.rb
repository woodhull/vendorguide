require 'spec_helper'

describe Vendor do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should have_many(:reviews) }
end


