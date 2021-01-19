module LinksHelper

  def get_shortened_link(link)
    (root_url + link.identifier).gsub(/(https?:\/\/)|(www\.)/,"")
  end

  def get_link_id(link)
    "link-#{link.id}"
  end
end
