class SearchController < ApplicationController

  def search
    @model = params["search"]["model"]
    @content = params["search"]["content"]
    @how = params["search"]["how"]
    @datas = search_for(@how, @model, @content)
  end

  private
  def match(model, content)
    if model == 'customer'
      Customer.where(name: content)
    elsif model == 'bookmark'
      Bookmark.where(title: content)
    end
  end

  def partical(model, content)
    if model == 'customer'
      Customer.where("customer_name LIKE ?", "%#{content}%")
    elsif model == 'bookmark'
      Bookmark.where("bookmark_name LIKE ?", "%#{content}%")
    end
  end

  def search_for(how, model, content)
    case how
    when 'match'
      match(model, content)
    when 'partical'
      partical(model, content)
    end
  end
end
