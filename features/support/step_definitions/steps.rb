require 'greenletters'

When /^I run "(.*?)"$/ do |program_name|
  step %{a process "#{program_name}" from command "#{program_name} -b Q_"}
  step %{I execute the process "#{program_name}"}
end

Then /^I should see$/ do |text|
  %{I should see the following output:}
end
