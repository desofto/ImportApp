class ImportWorker
  include Sidekiq::Worker
  include SidekiqStatus::Worker

  def perform(file_name)
    self.payload = {}
    ::OperationsImporter.new(file_name).import do |info|
      self.payload = info
    end
  rescue
  end
end
