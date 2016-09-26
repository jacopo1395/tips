module ApplicationHelper
	def check(id)
    f=Is_favourite.where("userMail = ? AND PoisId = ?",current_user.email,id)
    if(!f.empty?)
      true
    else
      false
    end
  end
end
