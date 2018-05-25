require 'nokogiri'
require 'open-uri'

class WebParser
  attr_reader :page, :contents

  HEADER_TAGS = (1..6).map { |num| "h#{num}" }.freeze

  def initialize(page)
    @page = page
    @contents = []
  end

  def parse
    title = web_content.at_css("title").text
    page.update_column(:title, title)
    process!
  end

  def process!
    extract_headers
    extract_anchors
    store!
  end

  private

  def store!
    page.contents.create(contents)
  end

  def extract_headers
    web_content.css(*HEADER_TAGS).each do |node|
      contents << { tag: node.name, text: node.text } if node.text.present?
    end
  end

  def extract_anchors
    web_content.css('a').each do |link|
      contents << { tag: 'a', text: link['href'] } if link['href'].present?
    end
  end

  def web_content
    @web_content ||= Nokogiri::HTML(open(page.url))
  end
end
