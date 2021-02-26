#!/usr/bin/env ruby

# inspired by marlonrichert "dual_keys" layout

PARAMETERS = {
  :to_if_alone_timeout_milliseconds => 135,
  :to_delayed_action_delay_milliseconds => 0,
  :to_if_held_down_threshold_milliseconds => 135,
  :simultaneous_threshold_milliseconds => 300,
}.freeze

require 'json'
require_relative '../lib/karabiner'
require_relative '../lib/qmk'

def main
  puts JSON.pretty_generate(
    'title' => 'molleweide personal',
    'maintainers' => ['molleweide'],
    'rules' => [
      {
        'description' => 'molleweide personal',
        'manipulators' => [

          #################
          # LAYER -> BASE #
          #################

          # thumbs
          generate_dual_key_rule('spacebar', 'spacebar', 'left_shift'),
          #
          # generate_dual_key_rule("left_command", "tab", ""),
          # generate_dual_key_rule("right_command", "enter", ""),

          # homerow dual keys
          generate_dual_key_rule('a', 'a', 'left_control'),
          generate_dual_key_rule('s', 's', 'left_shift'),
          generate_dual_key_rule('d', 'd', 'left_option'),
          generate_dual_key_rule('f', 'f', 'left_command'),
          generate_dual_key_rule('j', 'j', 'right_command'),
          generate_dual_key_rule('k', 'k', 'right_option'),
          generate_dual_key_rule('l', 'l', 'right_shift'),
          generate_dual_key_rule('semicolon', 'semicolon', 'right_control'),

          # remappings
          generate_single_key_rule('caps_lock', 'escape'), # cntrl work around
          generate_single_key_rule('left_command', 'tab'),
          generate_single_key_rule('right_command', 'return_or_enter'),
          generate_single_key_rule('left_shift', 'delete_or_backspace'),
          generate_single_key_rule('right_shift', 'delete_or_backspace'),

          ###############################################
          # hold down space activate layer 'BASE_SPACE' #
          ###############################################
          QMK_HOLD_DOWN_ACTIVATE_STATE('base', 'spacebar', 'spacebar', 'BASE_SPACE'),

          # generate_

        ],
      },
    ]
  )
end

main
