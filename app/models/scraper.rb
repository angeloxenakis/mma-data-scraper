require "nokogiri"
require "open-uri"
require "pry"

class Scraper
    # letters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

    def self.scanPages
        letters = ["a", "b", "c", "d"]
        master_list = []
        letters.each { |letter| 
            puts "http://ufcstats.com/statistics/fighters?char=#{letter}&page=all"
            html = URI.open("http://ufcstats.com/statistics/fighters?char=#{letter}&page=all")
            doc = Nokogiri::HTML(html)
            fighters = doc.css(".b-statistics__table-row")

            fighter_list = []
            fighters.each { |fighter| 
                fighter_object = {
                    first_name: "",
                    last_name: "",
                    nick_name: "",
                    height: "",
                    weight: "",
                    reach: "",
                    stance: "",
                    wins: "",
                    losses: "",
                    draws: ""
                }

                if fighter.children[1].children.children.text != nil
                    fighter_object[:first_name] = fighter.children[1].children.children.text
                end
                
                if fighter.children[3] != nil
                    fighter_object[:last_name] = fighter.children[3].children.children.text
                end

                if fighter.children[5] != nil
                    fighter_object[:nick_name] = fighter.children[5].children.text.strip
                end

                if fighter.children[7] != nil
                    fighter_object[:height] = fighter.children[7].children.text.strip
                end

                if fighter.children[9] != nil
                    fighter_object[:weight] = fighter.children[9].children.text.strip
                end

                if fighter.children[11] != nil
                    fighter_object[:reach] = fighter.children[11].children.text.strip
                end

                if fighter.children[13] != nil
                    fighter_object[:stance] = fighter.children[13].children.text.strip
                end

                if fighter.children[15] != nil
                    fighter_object[:wins] = fighter.children[15].children.text.strip
                end

                if fighter.children[17] != nil
                    fighter_object[:losses] = fighter.children[17].children.text.strip
                end

                if fighter.children[19] != nil
                    fighter_object[:draws] = fighter.children[19].children.text.strip
                end
                master_list << fighter_object
            } 
        }
        master_list
    end
    binding.pry
end

scrape = Scraper.new