# frozen_string_literal: true

module RuboCop
  module Cop
    module OmbuLabs
      # Checks that left braces for adjacent single line lets are aligned.
      #
      # @example
      #
      #     # bad
      #     "Ombu Labs"
      #     "Ombu labs"
      #     "Ombulabs"
      #     "OMBULABS"
      #
      #     # good
      #     "OmbuLabs"
      #
      class Branding < ::RuboCop::Cop::Base
        extend AutoCorrector

        MSG = 'Wrong branding, use "%<replacement>s"'
        OMBULABS_RGX = /(ombu\s?labs)/i.freeze
        OMBULABS_VALID = "OmbuLabs"
        FASTRUBY_RGX = /(fast\s?ruby.?i?o?)/i.freeze
        FASTRUBY_VALID = "FastRuby.io"

        def on_str(node)
          check_ombu_labs(node)
          check_fast_ruby(node)
        end

        def check_ombu_labs(node)
          return unless node.source =~ OMBULABS_RGX

          found = $1
          return if found == OMBULABS_VALID

          msg = format(MSG, replacement: OMBULABS_VALID)
          add_offense(node, message: msg) do |corrector|
            corrector.replace(node, OMBULABS_VALID)
          end
        end

        def check_fast_ruby(node)
          return unless node.source =~ FASTRUBY_RGX

          found = $1
          return if found == FASTRUBY_VALID

          msg = format(MSG, replacement: FASTRUBY_VALID)
          add_offense(node, message: msg) do |corrector|
            corrector.replace(node, FASTRUBY_VALID)
          end
        end
      end
    end
  end
end
