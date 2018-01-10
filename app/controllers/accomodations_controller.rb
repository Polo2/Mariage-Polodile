require 'json'

class AccomodationsController < ApplicationController
  before_action :set_wedding

  def upload
    Accomodation.destroy_all
    @accomodations_list = parsing_json["accomodations-DB"]
    creating_new_accomodations_from_array(@accomodations_list)

  end

  private

  def set_wedding
    @wedding = Wedding.find(params[:wedding_id])
  end

  def parsing_json
    file = File.read("#{Rails.root}/lib/accomodations_details/accomodations-DB.json")
    accomodations_details = JSON.parse(file)
    return accomodations_details
  end

  def creating_new_accomodations_from_array(array)
    array.each do |accom|
      Accomodation.create(name: accom["name"], location: accom["location"], contact_name: accom["contact_name"], contact_email: accom["contact_email"], contact_website: accom["contact_url"], contact_phone: accom["contact_phone"], complete?: false, wedding: @wedding )
    end
  end

end
