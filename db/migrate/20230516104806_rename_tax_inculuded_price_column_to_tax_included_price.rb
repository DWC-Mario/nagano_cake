class RenameTaxInculudedPriceColumnToTaxIncludedPrice < ActiveRecord::Migration[6.1]
  def change
    rename_column :ordering_items, :tax_inculuded_price, :tax_included_price
  end
end
