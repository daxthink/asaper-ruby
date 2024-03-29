require 'asaper/builders/base'
require 'asaper/builders/knock'
require 'asaper/builders/concerns/optionable'

module Asaper
  module Builders
    class Confirmation < Asaper::Builders::Base
      include Concerns::Optionable

      def initialize(&block)
        @hash = Hash.new
        yield self
      end

      def message(message)
        new_attribute(:message, message)
      end

      def ok_button_text(text)
        new_attribute(:ok_button_text, text)
      end

      def cancel_button_text(text)
        new_attribute(:cancel_button_text, text)
      end

      def passwords(*passwords)
        new_array_attribute(:passwords, passwords)
      end

      def password(password)
        new_attribute(:password, password)
      end

      def password_label(text)
        new_attribute(:password_label, text)
      end

      def knock_in(time, &block)
        new_attribute(:knock, Builders::Knock.new(time, &block).hash)
      end
    end
  end
end
