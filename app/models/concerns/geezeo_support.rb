module GeezeoSupport

  def client
    @client ||= GeezeoClient.new
  end

  def make_paginated(target, pages)
    target.extend(Pagination)
    target.page = pages["current_page"]
    target.total_pages = pages["total_pages"]
    target
  end
end
