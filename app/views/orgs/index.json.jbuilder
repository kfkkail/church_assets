# frozen_string_literal: true

json.array! @orgs, partial: 'orgs/org', as: :org
