module App::Utils

  def sql_multi_like(val)
    '%' + val.split(' ').map(&:strip).join('%') + '%'
  end

  module_function :sql_multi_like

end
