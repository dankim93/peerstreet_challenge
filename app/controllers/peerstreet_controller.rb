require 'csv'
class PeerstreetController < ApplicationController
  def zip
    code = params[:code]
    alternate = nil
    @json = {}
    @json[:Zip] = code
    @json[:MSA] = "N/A"
    @json[:Pop2015] = "N/A"
    @json[:Pop2014] = "N/A"

    CSV.foreach("./../zip_to_cbsa.csv") do |row|
      if row[0] == code
        @json[:CBSA] = row[1]
        return if @json[:CBSA] == "99999"
      end
    end

    CSV.foreach("./../cbsa_to_msa.csv", encoding: 'iso-8859-1:utf-8') do |row|
      if row[0] == @json[:CBSA] && row[4] == 'Metropolitan Statistical Area'
        @json[:MSA] = row[3]
        @json[:Pop2015] = row[12]
        @json[:Pop2014] = row[11]
        return
      elsif row[1] == @json[:CBSA]
        alternate = row[0]
      end
    end

    if !alternate.nil?
      CSV.foreach("./../cbsa_to_msa.csv", encoding: 'iso-8859-1:utf-8') do |row|
        if row[0] == alternate && row[4] == 'Metropolitan Statistical Area'
          p "pop2"
          @json[:MSA] = row[3]
          @json[:Pop2015] = row[12]
          @json[:Pop2014] = row[11]
        end
      end
    end
  end
end
