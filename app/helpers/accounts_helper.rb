module AccountsHelper

  def render_taggings(tags)
    tags.map { |tag| render_tagging tag }.join.html_safe
  end

  def render_tagging(tag)
    content_tag :span, class: 'badge badge-info' do
      h tag["tag"]["name"]
    end
  end
end
