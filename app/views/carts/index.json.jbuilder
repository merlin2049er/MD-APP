# frozen_string_literal: true

json.array! @carts, partial: 'carts/cart', as: :cart
