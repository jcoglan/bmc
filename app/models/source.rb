class Source < ActiveRecord::Base
  
  has_and_belongs_to_many :domains
  has_many :articles
  
  def self.search_by_url(url)
    host = URI.parse(url).host.gsub(/^www\./, '')
    Domain.find_all_by_host(host).map(&:sources).flatten
  end
  
end

