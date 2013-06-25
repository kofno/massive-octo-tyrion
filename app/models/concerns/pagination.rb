# add a notion of pagination to, well anything. But mostly Arrays
module Pagination

  def page
    @page
  end

  def page=(page)
    @page = page
  end

  def total_pages
    @total_pages
  end

  def total_pages=(total)
    @total_pages = total
  end

  def more?
    total_pages > page
  end

  def next_page
    page + 1
  end

end
