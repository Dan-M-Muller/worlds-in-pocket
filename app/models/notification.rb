class Notification < ApplicationRecord
  belongs_to :friendship_message, optional: true

  after_create_commit :broadcast_message

  def broadcast_message
    # if criou notific id friendship
    #   -> manda pro reciever
    # elsif id player
    #   -> manda pro player.user
    # elsif id game message
    #   -> manda pro game.players.user
    # else
    #   -> manda pro other_user
    # .
    # atalizar o turbo frame
    #  instert html( <i> "Icone" </i> )
  end
end
