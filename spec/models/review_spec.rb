require 'spec_helper'

describe Review do
  it { should belong_to(:vendor) }
  it { should validate_presence_of(:description)}
  it { should validate_presence_of(:score)}

end
