# frozen_string_literal: true

json.array! @languages, partial: 'languages/language', as: :language
