class VentureCapitalist
    attr_reader :name, :total_worth
    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self

    end

    def self.tres_commas_club
        self.all.select { |capitalist| capitalist.total_worth > 1_000_000_000 }
    end

    def offer_contract(su, type, amount)
        FundingRound.new(su, self, type, amount)
    end

    #helper method: in charge of finding all the funding rounds for a specific instance
    def funding_rounds
        FundingRound.all.select { |funding_round| funding_round.venture_capitalist == self}
    end

    def portfolio 
        self.funding_rounds.map { |fr| fr.startup }.uniq
    end

    def biggest_investment
        self.funding_rounds.max_by { |fr| fr.investment }
    end

    # def invested(domain)
    #     total = 0
    #     funding_rounds.each do |fr|
    #         if fr.startup.domain == domain
    #             total += fr.investment
    #         end
    #     end
    #     total
    # end

    def invested(domain)
        fr_domain = self.funding_rounds.select { |fr| fr.startup.domain == domain}
        fr_domain.reduce(0) {|total, fr| total += fr.investment}
    end


    def self.all
        @@all 
    end
end

#pass a string domain
#go into funding rounds
#once in funding rounds check that the domain = string domain
#then check investment for that round and save it
#repeat and 
