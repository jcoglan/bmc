class Source < ActiveRecord::Base
  
  has_and_belongs_to_many :domains
  has_many :articles
  
  def self.search_by_url(url)
    Domain.search_by_url(url).map(&:sources).flatten
  end
  
  def associate_with_domain(url)
    domain = Domain.from_url(url)
    domains << domain unless domains.include?(domain)
  end
  
end

