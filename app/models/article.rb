class Article < ActiveRecord::Base
  
  belongs_to :source
  belongs_to :user
  
  def self.from_url(url)
    existing = find_by_url(url)
    return existing if existing
    
    article = new(:url => url)
    article.populate_from_url
    article
  end
  
  def populate_from_url
    self.source ||= Source.search_by_url(url).first
    self.title  ||= title_from_url
  end
  
  def title_from_url
    doc = Nokogiri::HTML(open(url))
    doc_title = doc.css('title').first
    doc_title && doc_title.content.strip.gsub(/\s+/, ' ')
  end
  
end

