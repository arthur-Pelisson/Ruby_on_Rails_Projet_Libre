class Ability
  include CanCan::Ability

  def initialize(user)
    # for any visitor or user
    can :read, Article
    if user
      if user.admin?
        # admins can do any action on any model or action
        can :manage, :all
      else
        # regular users can read all content
        can [:edit, :destroy, :read], @articles, user_id: user.id
        # and edit, update and destroy their own user only
        can [:edit, :destroy, :read], User, id: user.id
        can :create, Article
        # but cannot read hidden articles
      end
    else
      # only unlogged visitors can visit a sign_up page:
      can :new, User
    end
  end
end
