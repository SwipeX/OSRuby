require 'java'

class RSAppletStub
  inherited java.applet.AppletStub
  require_relative "rs_applet_context"

  @hash
  @applet_context

  def initialize(hash = nil, applet = nil)
    @hash = hash
    @applet_context = RSAppletContext.new(applet)
  end

  java_signature 'boolean isActive()'

  def isActive
    true
  end

  java_signature 'URL getDocumentBase()'

  def getDocumentBase
    java.net.URL.new(@hash['codebase'])
  end

  java_signature 'URL getCodeBase()'

  def getCodeBase
    java.net.URL.new(@hash['codebase'])
  end

  java_signature 'String getParameter(String name)'

  def getParameter(name)
    puts name
    @hash[name]
  end

  java_signature 'AppletContext getAppletContext()'

  def getAppletContext()
    @applet_context
  end

  java_signature 'void appletResize(int width, int height)'

  def appletResize(width, height)
    @applet_context.getApplet("").resize(width, height)
  end
end