class Startup

    attr_reader :name, :founder, :domain
    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain

        @@all << self
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def self.find_by_founder(name)
        self.all.find { |startup| startup.founder == name}
    end

    def self.domains
        self.all.map { |startup| startup.domain }
    end

    def sign_contract(vc, type, amount)
        FundingRound.new(self, vc, type, amount)
    end

    #helper method: inc harge of finding all the funding rounds for a specific instance
    def funding_rounds
        FundingRound.all.select { |funding_round| funding_round.startup == self}
    end

    def num_funding_rounds
       self.funding_rounds.count
    end

    def total_funds
        self.funding_rounds.reduce(0) { |total, fr| total + fr.investment }
    end

    def investors
        self.funding_rounds.map { |fr| fr.venture_capitalist}.uniq
    end

    def big_investors
        self.investors.select { |inv| inv.total_worth > 1_000_000_000}
    end

    def self.all
        @@all 
    end
    
end
