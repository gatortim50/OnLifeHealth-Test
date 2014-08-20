module Concerns
  module BattingConcern

    #Slugging percentage =
    # ((Hits – doubles – triples – home runs) + (2 * doubles) + (3 * triples) + (4 * home runs)) / at-bats

    def retrieve_data (data)
      data.each do | key|
        puts "#{key}"
        # convert key to hash
        player = key
        puts "=== player:" + player.fetch(:playerid, "NA").to_s
        puts "team:" + player.fetch(:teamid, "NA").to_s
        puts "league:" + player.fetch(:league, "NA").to_s
        puts "year:" + player.fetch(:yearid, 0).to_s
        puts "ab:" + player.fetch(:ab, 0).to_s
        puts "hits:" + player.fetch(:h, 0).to_s
        puts "double:" + player.fetch(:"2b", 0).to_s
        puts "triple:" + player.fetch(:"3b", 0).to_s
        puts "HR:" + player.fetch(:hr, 0).to_s
        puts "Steals:" + player.fetch(:sb, 0).to_s
        puts "Caught Stealing:" + player.fetch(:cs, 0).to_s
      end
    end

  end
end
