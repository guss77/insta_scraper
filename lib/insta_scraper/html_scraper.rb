module HTMLScraper
  def html
    @html ||= get_html
  end

  private

  def get_html
    open(url).read
  end
end
