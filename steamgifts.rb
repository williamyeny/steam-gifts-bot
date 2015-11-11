require 'mechanize'

mechanize = Mechanize.new

puts "Loading cookies..."
mechanize.cookie_jar.load 'cookies'

for i in 1..5
  page = mechanize.get("http://www.steamgifts.com/giveaways/search?page=" + i.to_s);

  page.search(".giveaway__heading__name").each do |x|
    giveaway = Mechanize::Page::Link.new( x, mechanize, page ).click
    form = giveaway.forms.first
    begin
      if form['code'] != nil
        puts 'title: ' + giveaway.title
        puts 'token: ' + form['xsrf_token']
        puts 'code: ' + form['code']
        mechanize.post('http://www.steamgifts.com/ajax_2J2No.php', {
          xsrf_token: form['xsrf_token'],
          do: "entry_insert",
          code: form['code']
        })
        puts 'entered!'
        puts
      end
    rescue
      puts 'Oh no! Something happened when trying to enter \'' + giveaway.title + '\'!'
    end
  end
end