require 'colored2'

module Pod
  class Command
    class Update < Command

      alias_method :run_before_update_if_you_dare, :run

      def run
        verify_podfile_exists! if self.respond_to? :verify_podfile_exists!

        dont_talk_to_me_or_my_son_ever_again = `defaults read net.Ashton-W.cocoapods-update-if-you-dare DontAskAgain 2>/dev/null`.chomp == "1"
        specific_pod_to_update_was_provided = @pods.length > 0

        unless specific_pod_to_update_was_provided or dont_talk_to_me_or_my_son_ever_again

          puts "\n"
          puts "[!] Running `pod update` will update ALL pods.".yellow
          puts "\n"
          puts "If you proceed you will be responsible for any changes in your dependencies and"
          puts "any changes in the project required to be compatible."
          puts "\n"
          puts "  pod update".green + " [POD_NAMES ...]".magenta + " should be used to update specific pods."
          puts "  pod install".green + " should be used to install changes to the Podfile."
          puts "\n"
          puts "For more information use the " + "--help".blue + " parameter with any command"
          puts "or consult " + "https://guides.cocoapods.org".cyan
          puts "This message is brought to you by the plugin cocoapods-update-if-you-dare"
          puts "\n"
          
          question = "Are you sure you want to update ALL pods?"
          answer = UI.choose_from_array(["Yes", "No", "Yes! Don't ask me again"], question)

          if answer == 0
            puts "You have choosen your fate.".yellow
          elsif answer == 1
            raise Informative, "You didn't dare."
          elsif answer == 2
            puts "OK! You know what you are doing.".green
            `defaults write net.Ashton-W.cocoapods-update-if-you-dare DontAskAgain -bool true`
          end

        end

        run_before_update_if_you_dare
      end

    end
  end
end
