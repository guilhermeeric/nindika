# frozen_string_literal: true

module Games
  class UpdateVisits < Actor
    def call
      Game.update_all(all_time_visits: 0, last_week_visits: 0)
      update_all_time_visits
      update_last_week_visits
    end

    private

    def update_all_time_visits
      VisitsCollector.all_time_game_pages_stats.each do |stats|
        game = Game.friendly.find(stats['slug'])
        game.all_time_visits += stats['visitors']
        game.save!
      rescue ActiveRecord::RecordNotFound
        next
      end
    end

    def update_last_week_visits
      VisitsCollector.last_week_game_pages_stats.each do |stats|
        game = Game.friendly.find(stats['slug'])
        game.last_week_visits += stats['visitors']
        game.save!
      rescue ActiveRecord::RecordNotFound
        next
      end
    end
  end
end
