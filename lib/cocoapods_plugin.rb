require 'colored'

module Pod
  class Command
    class Update < Command
      
      alias_method :run_before_update_if_you_dare, :run

      def run
        verify_podfile_exists!

        unless @pods
          raise Informative, "Don't you dare!"
        end

        run_before_update_if_you_dare
      end

    end
  end
end
