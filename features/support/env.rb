require 'terrible_twos'
require 'greenletters'
require '/Users/mwilden/.rvm/gems/ruby-1.9.3-p392/gems/greenletters-0.3.0/lib/greenletters/cucumber_steps'

adv = Greenletters::Process.new('terrible_twos', transcript: $stdout)
