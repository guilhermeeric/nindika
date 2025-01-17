# frozen_string_literal: true

module Admin
  class ImportData < Actor
    def call
      wrap_task('Import games') { RawItems::Import.call }
      wrap_task('Import prices') { Prices::Import.call }
      wrap_task('Update flags') { Games::UpdateFlags.call }

      scrap_thread.join
      telegram_thread.join
    end

    private

    def wrap_task(task_name)
      yield
    rescue StandardError => e
      raise e if Rails.env.development?

      Sentry.capture_exception(e, extra: { task: task_name })
    end

    def telegram_thread
      Thread.new do
        wrap_task('Send Telegram notifications') { EventDispatches::SendToTelegram.call } if Rails.env.production?
      end
    end

    def scrap_thread
      Thread.new do
        wrap_task('Scrap games website data') { Games::ScrapPendingGamesData.call }
      end
    end
  end
end
