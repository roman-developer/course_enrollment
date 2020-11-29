module ApplicationHelper

  def votes_url(item)
    case item.class.name
    when 'Course'
      vote_course_path(item)
    when 'Teacher'
      vote_teacher_path(item)
    else
      'invalid URL'
    end    
  end
end
