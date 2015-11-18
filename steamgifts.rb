require 'mechanize'

mechanize = Mechanize.new

puts "Loading cookies..."
mechanize.cookie_jar.load 'cookies'
puts "Cookies loaded!"
puts
while true
  begin
    page = mechanize.get('http://www.steamgifts.com/')
    points = page.search('.nav__points').text.strip.to_i
    if points >= 230
      pageNumber = 0
      while points > 5
        pageNumber += 1
        page = mechanize.get("http://www.steamgifts.com/giveaways/search?page=" + pageNumber.to_s);

        page.search(".giveaway__heading__name").each do |x|
          giveaway = Mechanize::Page::Link.new( x, mechanize, page ).click
          form = giveaway.forms.first
          if form['code'] != nil
            print giveaway.title + " [" + form['code'] + "] | "
            mechanize.post('http://www.steamgifts.com/ajax.php', {
              xsrf_token: form['xsrf_token'],
              do: "entry_insert",
              code: form['code']
            })
            puts "Points left: #{page.search('.nav__points').text.strip}"
          end
        end
        points = page.search('.nav__points').text.strip.to_i
      end
    else
      puts "Not enough points: " + points.to_s
    end
  rescue
    puts "Something happened! D:"
  end
  sleep(60)
  
end