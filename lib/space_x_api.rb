class SpaceXApi
  include HTTParty
  base_uri 'api.spacexdata.com'

  def launches
    response = self.class.get('/v1/launches')
    launches = JSON.parse(response, symbolize_names: true)

    launches.each_with_object([]) do |launch, filtered_launches|
      filtered_launches << {
        number: launch[:flight_number],
        mission_patch: launch[:links][:mission_patch],
        rocket_name: launch[:rocket][:rocket] || launch[:rocket][:rocket_name],
        launch_success: launch[:launch_success],
        land_success: launch[:land_success],
        details: launch[:details],
        video_link: launch[:links][:video_link]
      }
    end
  end
end
