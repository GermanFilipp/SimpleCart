module SimpleCart
  module ModelMethods
    extend ActiveSupport::Concern

    module ClassMethods
      def acts_as_product
        class_name = self.to_s.underscore
        SimpleCart::PRODUCT_CLASSES.push(class_name).uniq!

        extend_product(self)
      end

      def acts_as_customer
        extend_customer(self)
      end

      private

      def extend_product(product_class)

        product_class.send(:has_many, :cart_items, {
                                        class_name: 'SimpleCart::CartItem',
                                        as: :product,
                                        dependent: :destroy
                                    })
      end

      def extend_customer(customer_class)
        customer_class.send(:has_many, :carts, {
                                         class_name: 'SimpleCart::Cart',
                                         as: :customer,
                                         dependent: :nullify
                                     })
      end

    end
  end
end