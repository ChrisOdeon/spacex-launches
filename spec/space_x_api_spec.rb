require 'rails_helper'
describe SpaceXApi do
  let(:response_body){
    [{
        flight_number: 1,
        launch_success: false,
        land_success: false,
        details: 'test details',
        rocket: {
          rocket: 'Falcon 1'
        },
        links: {
          mission_patch: 'test_mission_patch_link',
          video_link: 'test_video_link'
        }
    }]
  }
  before do
    stub_request(:get, "http://api.spacexdata.com/v1/launches").
      to_return(status: 200, body: response_body.to_json, headers: {})
  end

  describe ".launches" do
    it 'returns a list of launches from the api' do
      space_x_api = SpaceXApi.new
      launches = space_x_api.launches
      expect(launches.count).to eq(1)
    end
  end
end
