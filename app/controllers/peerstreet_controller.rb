require 'csv'
class PeerstreetController < ApplicationController
  def zip
    code = params[:code]
    @json = {}
    @json[:Zip] = code
    @json[:MSA] = "N/A"
    @json[:Pop2015] = "N/A"
    @json[:Pop2014] = "N/A"

    CSV.foreach("./../zip_to_cbsa.csv") do |row|
      if row[0] == code
        @json[:CBSA] = row[1]
        break if @json[:CBSA] == "99999"
      end
    end

    CSV.foreach("./../cbsa_to_msa.csv", encoding: 'iso-8859-1:utf-8') do |row|
      if row[0] == @json[:CBSA] || row[1] == @json[:CBSA]

      end
    end
  end
end
