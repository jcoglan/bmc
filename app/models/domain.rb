class Domain < ActiveRecord::Base
  
  has_and_belongs_to_many :sources
  
  def self.search_by_url(url)
    find_all_by_host(host_from_url(url))
  end
  
  def self.from_url(url)
    find_or_create_by_host(host_from_url(url))
  end
  
  def self.host_from_url(url)
    URI.parse(url).host.gsub(/^www\./, '')
  end
  
end

