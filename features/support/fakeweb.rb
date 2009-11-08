require 'open-uri'
require 'fakeweb'
WEB_FIXTURES = File.expand_path(File.dirname(__FILE__) + '/fixtures/fakeweb')

[ %w[ http://www.guardian.co.uk/science/2009/nov/06/cern-big-bang-goes-phut
      Big-bang-goes-phut-as-bird-drops-baguette-into-Cern-machinery
    ],
  
  %w[ http://www.dailymail.co.uk/news/article-1225643/Sack-exam-chiefs-dumbed-science-says-Royal-Society-Chemistry.html
      Sack-exam-chiefs-over-dumbed-down-science-says-Royal-Society-of-Chemistry
    ],
  
  %w[ http://www.timesonline.co.uk/tol/news/politics/article6906914.ece,
      Science-Minister-renews-attack-over-advisers-sacking
    ]
  
].each do |fake_page|

  FakeWeb.register_uri(:get, fake_page[0],
          :body => File.read(File.join(WEB_FIXTURES,
          "#{fake_page[1]}.html")))
end

