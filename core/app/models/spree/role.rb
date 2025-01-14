module Spree
  class Role < Spree::Base
    include UniqueName
    if defined?(Spree::Webhooks)
      include Spree::Webhooks::HasWebhooks
    end

    has_many :role_users, class_name: 'Spree::RoleUser', dependent: :destroy
    has_many :users, through: :role_users, class_name: Spree.user_class.to_s
  end
end
