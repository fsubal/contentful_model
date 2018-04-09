require_relative 'query'

module ContentfulModel
  module Queries
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def query
        ContentfulModel::Query.new(self)
      end

      def all
        raise ArgumentError, 'You need to set self.content_type in your model class' if @content_type_id.nil?
        query
      end

      def load
        all.load
      end

      def first
        query.first
      end

      def params(options)
        query.params(options)
      end

      def offset(n)
        query.offset(n)
      end
      alias_method :skip, :offset

      def limit(n)
        query.limit(n)
      end

      def locale(locale_code)
        query.locale(locale_code)
      end

      def paginate(page = 1, per_page = 100, order_field = 'sys.updatedAt')
        query.paginate(page, per_page, order_field)
      end

      def load_children(n)
        query.load_children(n)
      end

      def order(args)
        query.order(args)
      end

      def find(id)
        query.find(id)
      end

      def find_by(find_query = {})
        query.find_by(find_query)
      end

      def search(parameters)
        query.search(parameters)
      end
    end
  end
end
