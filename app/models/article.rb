class Article < ActiveRecord::Base
  
  def self.from_url(url)
    existing = find_by_url(url)
    return existing if existing
    
    article = new(:url => url)
    article.populate_from_url
    article
  end
  
  def populate_from_url
    doc = Nokogiri::HTML(open(url))
    doc_title = doc.css('title').first
    self.title = doc_title.content.strip.gsub(/\s+/, ' ') if doc_title
  end
  
end

