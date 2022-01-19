module Types
  class MutationType < Types::BaseObject
    field :signup, mutation: Mutations::SignUp
    field :signin, mutation: Mutations::SignIn
    field :update_token, mutation: Mutations::UpdateToken
    field :signout, mutation: Mutations::SignOut
    field :update_user, mutation: Mutations::UpdateUser
    field :request_password_recovery, mutation: Mutations::RequestPasswordRecovery
    field :presign_data, mutation: Mutations::PresignData
    field :update_password, mutation: Mutations::UpdatePassword
    field :confirm_user, mutation: Mutations::ConfirmUser
    field :omniauth_signin_or_signup, mutation: Mutations::OmniauthSignInOrSignUp

    field :create_project, mutation: Mutations::CreateProject
    field :update_project, mutation: Mutations::UpdateProject
    field :destroy_project, mutation: Mutations::DestroyProject
    field :add_user_to_project, mutation: Mutations::AddUserToProject

    field :create_task, mutation: Mutations::CreateTask
    field :update_task, mutation: Mutations::UpdateTask
    field :destroy_task, mutation: Mutations::DestroyTask

    field :create_comment, mutation: Mutations::CreateComment
    field :update_comment, mutation: Mutations::UpdateComment
  end
end
