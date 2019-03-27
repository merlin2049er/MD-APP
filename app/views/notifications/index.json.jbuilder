# frozen_string_literal: true

json.array! @notifications, partial: 'notifications/notification', as: :notification
