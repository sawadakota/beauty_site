class Scraping
  def self.salon_urls
    links = []
    agent = Mechanize.new
    main_page = agent.get("http://beauty.hotpepper.jp/svcSI/macIC/salon/")
    i = 1
    while i <= 13
      main_page = agent.get("http://beauty.hotpepper.jp/svcSI/macIC/salon/PN#{i}.html")
      elements = main_page.search('.mainContentsST a')
      elements.each do |ele|
        links << ele.get_attribute('href')
      end
      i += 1
    end
    links.each do |link|
      get_beauty_salon(link)
    end
  end
 
  def self.get_beauty_salon(link)
    agent = Mechanize.new
    page = agent.get(link)
    salon_name = page.at('.detailTitle a').inner_text
    salon_image = page.at('.detailHeaderImgArea img')[:src] if page.at('.detailHeaderImgArea img')
    salon_image = page.at('.fl img')[:src] if page.at('.fl img') unless salon_image
    beauty_salon = BeautySalon.where(:salon_name => salon_name, :salon_image => salon_image).first_or_initialize
    beauty_salon.save
  end
end
