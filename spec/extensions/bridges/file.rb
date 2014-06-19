module Sensu
  module Extension
    class LatestEventFile < Bridge
      def name
        'latest_event_file'
      end

      def description
        'writes the latest event data to /tmp/sensu-event.json'
      end

      def run(event, &block)
        update_file = Proc.new do
          event_json = MultiJson.dump(event)
          File.open('/tmp/sensu-event.json', 'w') do |file|
            file.write(event_json)
          end
          ['wrote event data to /tmp/sensu-event.json', 0]
        end
        EM::defer(update_file, block)
      end
    end
  end
end
