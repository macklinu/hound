module Linter
  class Eslint < Base
    FILE_REGEXP = /.+(\.js|\.es6|\.es6\.js)\z/
    IGNORE_FILENAME = ".eslintignore".freeze

    def file_included?(commit_file)
      jsignore.file_included?(commit_file)
    end

    private

    def jsignore
      @jsignore ||= JsIgnore.new(hound_config, IGNORE_FILENAME)
    end
  end
end
