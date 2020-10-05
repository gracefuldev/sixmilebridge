# Via Ron A. Williams. See https://twitter.com/avdi/status/1312903754514132997
module ActiveSupport
  class EventedFileUpdateChecker
    private

    def boot!
      Listen.to(*@dtw, force_polling: true, &method(:changed)).start
    end
  end
end
