require 'greenletters'

When /^I run "(.*?)"$/ do |program_name|
  step %{a process "#{program_name}" from command "#{program_name}"}
  step %{I execute the process "#{program_name}"}
end

Then /^I should see "([\w _]+)"$/ do |text|
end
