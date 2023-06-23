class Ability
  include CanCan::Ability

  def initialize(user)
   
    return unless user.present?
    if user.admin?
      can :manage, :all
    else
      can :read, Studio
      can %i[create update destroy read], Reservation, user:
    end
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
