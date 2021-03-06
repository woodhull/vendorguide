Given /^the following vendors:$/ do |vendors|
  Vendor.create!(vendors.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) vendor$/ do |pos|
  visit vendors_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following vendors:$/ do |expected_vendors_table|
  expected_vendors_table.diff!(tableish('table tr', 'td,th'))
end
