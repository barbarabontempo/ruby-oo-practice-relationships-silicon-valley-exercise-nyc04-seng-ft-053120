require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

s1 = Startup.new("Twitter", "Jack", "www.twitter.com")
s2 = Startup.new("Birdie", "Barbi", "www.birdie.com")
s3 = Startup.new("Tree Types", "Massiel", "www.trees.com")

v1 = VentureCapitalist.new("Kevin", 2_000_000_000)
v2 = VentureCapitalist.new("Yigah", 6_000_000_000_000)
v3 = VentureCapitalist.new("Eva", 150_000_000)

f1 = FundingRound.new(s1, v3, "Seed", 3_000_000)
f2 = FundingRound.new(s1, v2, "Seed", 9_000_000)
f3 = FundingRound.new(s1, v2, "Seed", 10_000_000)
f4 = FundingRound.new(s3, v2, "Seed", 100)
binding.pry
0 #leave this here to ensure binding.pry isn't the last line