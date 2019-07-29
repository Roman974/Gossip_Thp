require 'pry'
require 'csv'

class Gossip
    attr_accessor :author, :content

    def initialize(author, content)
        @author = author
        @content = content
    end

    def save
        CSV.open("./db/gossip.csv", "ab") do |csv|
          csv << [@author, @content]
        end
    end

    def self.all
        all_gossips= []
        CSV.read("./db/gossip.csv", "r").each do |value|
            all_gossips << Gossip.new(value[0], value[1])
        end
        return all_gossips
    end

    def self.find(id)
       return self.all[id.to_i]
    end

#Ne fonctionne pas correctemeent
=begin
    def self.update_gossip
        CSV.open("./db/gossip.csv", "w+") do |csv|
            csv << [@author, @content]
        end
    end
=end
        

end


