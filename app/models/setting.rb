class Setting < ApplicationRecord

  # types: int, float, boolean, string, enum, text, js, css, erb, ...

  KNOWN_NAMES = %i(max_comments)

  default_scope { order(:group) }

  def self.method_missing(name, *args, &block)
    if KNOWN_NAMES.include? name
      setting = find_by_key(name)
      setting.val.send(setting.cast)
    else
      super
    end
  end

end