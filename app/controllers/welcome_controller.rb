class WelcomeController < ApplicationController
  def index
  end

  def development
    @galaxies =  Galaxy.all[0..1]
    @galaxy =  Galaxy.first
    @galaxy_id = @galaxy.id
    @galaxy_velocities =  @galaxy.velocities[0..1]
    @galaxy_velocity =  @galaxy.velocities.first
    @galaxy_velocity_id = @galaxy_velocity.id
    @citations =  Citation.all[0..1]
    @citation =  Citation.first
    @citation_id = @citation.id
  end
end
