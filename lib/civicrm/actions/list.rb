module CiviCrm
  module Actions
    module List
      module ClassMethods
        def all(params = {})
          params.merge!('entity' => entity_class_name, 'action' => 'get')
          response = CiviCrm::Client.request(:get, params)
          Resource.build_from(response, params)
        end

        def count
          all.count
        end

        def find_by(params={})
          all(params).first
        end

        def find_by!(params={})
          find_by(params) or raise Errors::NotFound.new
        end

        def first
          all.first
        end

        def last
          all.last
        end
      end

      def self.included(base)
        base.extend(ClassMethods)
      end
    end
  end
end
