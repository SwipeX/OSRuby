require 'java'

require_relative "config_reader"
require_relative "rs_applet_stub"

cr = ConfigReader.new

map = cr.createMap(cr.read_page)
jar_location = map['codebase'] + map['initial_jar']
urls = java.net.URL[1].new
urls[0] = java.net.URL.new(jar_location)
url_class_loader = java.net.URLClassLoader.new(urls)


initial_class = map['initial_class']
initial_class = initial_class.sub! '.class', ''

client = url_class_loader.loadClass(initial_class)
applet = client.newInstance()

applet_stub = RSAppletStub.new(map, applet)
applet.setStub(applet_stub)

applet.init()
applet.setSize(765, 503)

frame = javax.swing.JFrame.new("OSRuby")
frame.setSize(800, 600)
panel = javax.swing.JPanel.new()
frame.add(panel)
panel.add(applet)
frame.pack()
frame.setVisible(true)

puts applet