class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.decimal :amount_for_monthly_financial_goals, :precision => 12, :scale => 2, :default => 0
      t.decimal :amount_for_non_monthly_expenses, :precision => 12, :scale => 2, :default => 0
      t.boolean :calculate_biweekly_income_using_two_periods
      t.boolean :use_biweekly_extra_for_non_monthly_expenses
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
