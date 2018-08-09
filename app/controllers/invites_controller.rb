class InvitesController < ApplicationController


def new
 @invite = Invite.new
 end

 def create
 @invite = Invite.new(invite_params)

 @search = User.find_by_email(params[:invite][:email])

 if @search.blank?


 if @invite.save
    redirect_to root_path
    name = params[:invite][:name]
    email = params[:invite][:email]
    message = params[:invite][:message]

    InviteMailer.invite_email(name, email, message).deliver
    flash[:success] = "Thanks for the inviting your friend."
 else
    redirect_to pages_invite_path
    flash[:danger] = "Oops, there was a problem! Please fill out all the fields correctly, or invite already sent to #{params[:invite][:email]}"
 end

 else
   redirect_to pages_invite_path
   flash[:danger] = "Oops, there was a problem! That email belongs to a registered user."

   end
 
 end



 private

 def invite_params
 params.require(:invite).permit(:name, :email, :message)
 end
end