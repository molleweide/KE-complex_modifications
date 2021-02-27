#!/usr/bin/env ruby
# frozen_string_literal: true

# Helper methods for using layers like with QMK

require_relative './karabiner'

module QMK
  PARAMETERS = {
    :to_if_alone_timeout_milliseconds => 135,
    :to_delayed_action_delay_milliseconds => 0,
    :to_if_held_down_threshold_milliseconds => 135,
    :simultaneous_threshold_milliseconds => 300,
  }.freeze

  # def self.QMK_SET_LAYER(value)
  #   Karabiner.set_variable('QMK_LAYER', value)
  # end

  def self.generate_dual_key_rule(input, alone, held_down)
    {
      'type' => 'basic',
      'from' => {
        'key_code' => input,
        'modifiers' => { 'optional' => ['any'] },
      },
      'to_if_alone' => [
        {
          'key_code' => alone,
        },
      ],
      'to_if_held_down' => [
        {
          'key_code' => held_down,
        },
      ],
      'parameters' => {
        'basic.to_if_alone_timeout_milliseconds' => PARAMETERS[:to_if_alone_timeout_milliseconds],
        'basic.to_if_held_down_threshold_milliseconds' => PARAMETERS[:to_if_held_down_threshold_milliseconds],
      },
    }
  end

  def self.generate_single_key_rule(input, output)
    {
      'type' => 'basic',
      'from' => {
        'key_code' => input,
        'modifiers' => { 'optional' => ['any'] },
      },
      'to' => [
        {
          'key_code' => output,
        },
      ],
    }
  end

  def self.SINGLE_KEY(state_name, input, output)
    {
      'type' => 'basic',
      'conditions' => [
        {
          'type' => 'variable_if',
          'name' => state_name,
          'value' => 1,
        },
      ],
      'from' => {
        'key_code' => input,
        'modifiers' => { 'optional' => ['any'] },
      },
      'to' => [
        {
          'key_code' => output,
        },
      ],
    }
  end

  def self.DUAL_KEY(state_name, input, alone, held_down)
    {
      'type' => 'basic',
      'conditions' => [
        {
          'type' => 'variable_if',
          'name' => state_name,
          'value' => 1,
        },
      ],
      'from' => {
        'key_code' => input,
        'modifiers' => { 'optional' => ['any'] },
      },
      'to_if_alone' => [
        {
          'key_code' => alone,
        },
      ],
      'to_if_held_down' => [
        {
          'key_code' => held_down,
        },
      ],
      'parameters' => {
        'basic.to_if_alone_timeout_milliseconds' => PARAMETERS[:to_if_alone_timeout_milliseconds],
        'basic.to_if_held_down_threshold_milliseconds' => PARAMETERS[:to_if_held_down_threshold_milliseconds],
      },
    }
  end

  def self.STATE_HOLD_ACTIVATE(state_name, input, alone)
    {
      'type' => 'basic',
      'from' => {
        'key_code' => input,
        'modifiers' => { 'optional' => ['any'] },
      },
      'to_if_alone' => [
        {
          'key_code' => alone,
        },
      ],
      'to_if_held_down' => [
        Karabiner.set_variable(state_name, 1),
      ],
      'to_after_key_up' => [
        Karabiner.set_variable(state_name, 0),
      ],
      'parameters' => {
        'basic.to_if_alone_timeout_milliseconds' => PARAMETERS[:to_if_alone_timeout_milliseconds],
        'basic.to_if_held_down_threshold_milliseconds' => PARAMETERS[:to_if_held_down_threshold_milliseconds],
      },
    }
  end
end
