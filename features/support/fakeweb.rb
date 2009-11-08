require 'open-uri'
require 'fakeweb'
WEB_FIXTURES = File.expand_path(File.dirname(__FILE__) + '/fixtures/fakeweb')

FakeWeb.register_uri(:get, 'http://www.guardian.co.uk/science/2009/nov/06/cern-big-bang-goes-phut',
        :body => File.read(File.join(WEB_FIXTURES,
        'Big-bang-goes-phut-as-bird-drops-baguette-into-Cern-machinery.html')))

