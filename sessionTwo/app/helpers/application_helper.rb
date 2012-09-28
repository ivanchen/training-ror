module ApplicationHelper
	def welcome_text
	  str = "" # if the user has logged in, show the welcome text.
	  if current_user
	    str = "<p>Welcome, #{current_user.email}</p> "
	    str += link_to "Logout", log_out_path
	  else
	    str = "#{link_to "Login", log_in_path} "
	    str += link_to "Signup", sign_up_path
	  end
	end 
end
