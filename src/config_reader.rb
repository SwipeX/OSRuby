class ConfigReader
  require 'open-uri'

  @url

  def initialize(url = nil)
    url = 'http://oldschool.runescape.com/jav_config.ws' if url.nil?
    @url = url
  end

  def read_page
    page_string = ''
    open(@url) do |f|
      page_string = f.read
    end
    page_string = page_string.gsub! "msg=", ""
    page_string = page_string.gsub! "param=", ""
    page_string
  end

  def createMap(page_string)
    hash = string_to_map(page_string, "\n", '=')
  end

  private def string_to_map(str = "", arr_sep = ',', key_sep = ':')
    array = str.split(arr_sep)
    hash = {}

    array.each do |e|
      key_value = e.split(key_sep, 2)
      hash[key_value[0]] = key_value[1]
    end
    hash
  end

end