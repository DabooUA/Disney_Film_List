require_relative './scraper.rb'
require_relative './film.rb'
require 'pry'
require 'colorize'

class DisneyFilmsList::CLI
    
    def start

        logo = %Q(                                                                                                                           
            I8,        8        ,8I            88                                                                                      
            `8b       d8b       d8'            88                                                                ,d                    
             "8,     ,8"8,     ,8"             88                                                                88                    
              Y8     8P Y8     8P   ,adPPYba,  88   ,adPPYba,   ,adPPYba,   88,dPYba,,adPYba,    ,adPPYba,     MM88MMM  ,adPPYba,      
              `8b   d8' `8b   d8'  a8P_____88  88  a8"     ""  a8"     "8a  88P'   "88"    "8a  a8P_____88       88    a8"     "8a     
               `8a a8'   `8a a8'   8PP"""""""  88  8b          8b       d8  88      88      88  8PP"""""""       88    8b       d8     
                `8a8'     `8a8'    "8b,   ,aa  88  "8a,   ,aa  "8a,   ,a8"  88      88      88  "8b,   ,aa       88,   "8a,   ,a8"     
                 `8'       `8'      `"Ybbd8"'  88   `"Ybbd8"'   `"YbbdP"'   88      88      88   `"Ybbd8"'       "Y888  `"YbbdP"'      
                                                                                                                                       
                                                                                                                                       
                                                                                                                                       
            88888888ba,    88                                                      88888888888  88  88                                 
            88      `"8b   ""                                                      88           ""  88                                 
            88        `8b                                                          88               88                                 
            88         88  88  ,adPPYba,  8b,dPPYba,    ,adPPYba,  8b       d8     88aaaaa      88  88  88,dPYba,,adPYba,   ,adPPYba,  
            88         88  88  I8[    ""  88P'   `"8a  a8P_____88  `8b     d8'     88"""""      88  88  88P'   "88"    "8a  I8[    ""  
            88         8P  88   `"Y8ba,   88       88  8PP"""""""   `8b   d8'      88           88  88  88      88      88   `"Y8ba,   
            88      .a8P   88  aa    ]8I  88       88  "8b,   ,aa    `8b,d8'       88           88  88  88      88      88  aa    ]8I  
            88888888Y"'    88  `"YbbdP"'  88       88   `"Ybbd8"'      Y88'        88           88  88  88      88      88  `"YbbdP"'  
                                                                       d8'                                                             
                                                                      d8'                                                              )
        
        
        
        puts ""
        puts ""
        puts logo
        puts ""
        puts ""
        puts ""
        puts "List of Disney films all the way from 1937 to most recent releases, including the bio! \n"
        input = ''
        input = gets.strip
        puts "Please enter any key to view the list of Films."

    loop do    
        list_films
        
        puts "---------------------------------------------------------------------------------------"       
        puts "Please select a number of the film you would like to view biography of: "
            
        input = gets.strip
        puts ""
            if input.to_i > 0 && input.to_i <= DisneyFilmsList::Film.all.length
                film = DisneyFilmsList::Film.all[input.to_i - 1]
                link = DisneyFilmsList::Scraper.get_film_bio(film.film_href)
                    if link == ""
                        puts "Sorry no biography available for this film at this time.".red
                    else
                        puts "#{link}"
                    end
                
                puts ""
                puts "If you would like to view full list of films, please type - yes or y".blue
                puts "OR".center(50)
                puts "If you would like to exit, please press any key. ".green
                    input = gets.strip.downcase
                    loop do

                    case 
                        when input.match?(/yes/ || /y/)
                            list_films
                        when input.match?(/exit/ || /e/)
                            exit                
                        when !input.match?(/yes/ || /y/)
                            puts "Wrong input, please type 'yes' or 'y': "
                            input = gets.strip.downcase
                        else
                            break
                            #input = gets.strip.downcase
                        # if input == "yes" || "y"
                        #     list_films
                        # elsif input =! "yes" && "y"
                        #     puts "Wrong input, please type 'yes' or 'y'."
                        #     input = gets.strip.downcase
                            
                        # else 
                        #     exit
                        # end
                    end
                end
            else 
                puts "Invalid input, please try again: ".red
                puts ""
                input = gets.strip.downcase
            end
        end    
    end

    def list_films
        DisneyFilmsList::Film.all.each_with_index do |f, index|
            puts "#{index + 1}. #{f.film_name}"           
        end
    end

end

DisneyFilmsList::CLI.new.start