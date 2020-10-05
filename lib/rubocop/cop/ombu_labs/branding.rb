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
        OMBULABS_RGX = /(ombu\s?labs[^"]?)/i.freeze
        OMBULABS_BRAND = "OmbuLabs"
        # ombulabs-styleguide or ombulabs/styleguide should count as misspelled
        OMBULABS_VALIDS = ["OmbuLabs", "ombulabs-", "ombulabs/"]
        FASTRUBY_RGX = /(fast\s?ruby.?i?o?)/i.freeze
        FASTRUBY_BRAND = "FastRuby.io"

        # fastruby-styleguide or fastruby/styleguide should count as misspelled
        FASTRUBY_VALIDS = ["FastRuby.io", "fastruby-", "fastruby/"]

        def on_str(node)
          check_ombu_labs(node)
          check_fast_ruby(node)
        end

        def check_ombu_labs(node)
          return unless node.source =~ OMBULABS_RGX

          found = $1
          return if OMBULABS_VALIDS.include?(found)

          msg = format(MSG, replacement: OMBULABS_BRAND)
          add_offense(node, message: msg) do |corrector|
            corrector.replace(node, OMBULABS_BRAND)
          end
        end

        def check_fast_ruby(node)
          return unless node.source =~ FASTRUBY_RGX

          found = $1
          return if FASTRUBY_VALIDS.include?(found)

          msg = format(MSG, replacement: FASTRUBY_BRAND)
          add_offense(node, message: msg) do |corrector|
            corrector.replace(node, FASTRUBY_BRAND)
          end
        end
      end
    end
  end
end
