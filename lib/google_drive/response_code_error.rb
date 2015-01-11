# Author: Hiroshi Ichikawa <http://gimite.net/>
# The license of this source is "New BSD Licence"

require "cgi"

require "google_drive/error"


module GoogleDrive

    # Raised when an HTTP request has returned an unexpected response code.
    class ResponseCodeError < GoogleDrive::Error

        def initialize(code, body, method, url) #:nodoc:#
          @code = code
          @body = body
          @method = method
          @url = url
          error
        end

        attr_reader(:code, :body)

        def not_vaild?
          true 
        end

        def error
          super("Response code %s for %s %s: %s" % [@code, @method, @url, CGI.unescapeHTML(@body)])
        end

    end
end
