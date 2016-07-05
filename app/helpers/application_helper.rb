module ApplicationHelper

  def title name
    _title = ''
    p name
    case name
    when 'admin/news'
      _title = '通知新闻'
    when 'admin/bulletins'
      _title = '赛事公告'
    when 'admin/users'
      _title = '注册用户'
    when 'admin/activities'
      _title = '比赛列表'
    end
    _title
  end
end
