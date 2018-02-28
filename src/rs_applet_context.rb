require 'java'

class RSAppletContext
  include java.applet.AppletContext

  @applet

  def initialize(applet = nil)
    @applet = applet
  end

  java_signature 'AudioClip getAudioClip(Url url)'

  def getAudioClip(url)
    @applet.newAudioClip(url)
  end

  java_signature 'Image getImage(Url url)'

  def getImage(url)
    javax.imageio.ImageIO.read(url)
  end

  java_signature 'Applet getApplet(String name)'

  def getApplet(name)
    @applet
  end

  java_signature 'Enumeration<Applet> getApplets()'

  def getApplets()
    nil
  end

  java_signature 'void showDocument(Url url)'

  def showDocument(url)

  end

  java_signature 'void showDocument(Url url, String target)'

  def showDocument(url, target)

  end

  java_signature 'void showStatus(String status)'

  def showStatus(status)

  end

  java_signature 'void setStream(String key, Inputstream stream)'

  def setStream(key, stream)

  end

  java_signature 'InputStream getStream(String key)'

  def getStream(key)

  end

  java_signature 'Iterator<String> getStreamKeys()'

  def getStreamKeys()

  end


end