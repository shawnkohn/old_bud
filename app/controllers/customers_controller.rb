class CustomersController < ApplicationController

    def index
        if params[:keywords].present?
            @keywords = params[:keywords]
            customer_search_term = CustomerSearchTerm.new(@keywords)
            @customers = Customer.where(
                customer_search_term.where_clause,
                customer_search_term.where_args).
                order(customer_search_term.order)
        else
            @customers = []
        end

        respond_to do |format|
            format.html {}
            format.json { render json: @customers }
        end
    end
end
