ActiveSupport.on_load :active_record do
  module ActiveRecord::ConnectionAdapters
    class AbstractMysqlAdapter
      def create_table table_name, options = {}
        df_options = "ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=utf8mb4"
        tbl_options = options.reverse_merge options: df_options
        super(table_name, tbl_options)
      end
    end
  end
end
