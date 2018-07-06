# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def tasks_list(user_id)
    @user = User.find(user_id)
    @tasks = @user.tasks

    mail to: @user.email,
         subject: 'You Have Open Tasks!'
  end
end
