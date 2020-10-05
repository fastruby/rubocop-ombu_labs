# frozen_string_literal: true

require 'rubocop'

require_relative 'rubocop/ombu_labs'
require_relative 'rubocop/ombu_labs/version'
require_relative 'rubocop/ombu_labs/inject'

RuboCop::OmbuLabs::Inject.defaults!

require_relative 'rubocop/cop/ombu_labs_cops'
