require 'composite_primary_keys'


class Towerem < ApplicationRecord
self.table_name = "merged_data_tbl"
self.primary_keys = :ctrlr_serial_no, :updated_date, :updated_time


end
