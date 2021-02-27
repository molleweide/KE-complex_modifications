#!/usr/bin/env ruby

#
# should i use layers or states
#
#
# TODO
#
# - add layer variables
#
# - test variable_if and `variable_unless`

# STATES = {
#   BASE => 0,
#   nds => 3,
#   nds => 4,
# }.freeze

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
          QMK.generate_dual_key_rule('spacebar', 'spacebar', 'left_shift'),
          #
          # generate_dual_key_rule("left_command", "tab", ""),
          # generate_dual_key_rule("right_command", "enter", ""),

          # homerow dual keys
          QMK.generate_dual_key_rule('a', 'a', 'left_control'),
          QMK.generate_dual_key_rule('s', 's', 'left_shift'),
          QMK.generate_dual_key_rule('d', 'd', 'left_option'),
          QMK.generate_dual_key_rule('f', 'f', 'left_command'),
          QMK.generate_dual_key_rule('j', 'j', 'right_command'),
          QMK.generate_dual_key_rule('k', 'k', 'right_option'),
          QMK.generate_dual_key_rule('l', 'l', 'right_shift'),
          QMK.generate_dual_key_rule('semicolon', 'semicolon', 'right_control'),

          # remappings
          QMK.generate_single_key_rule('caps_lock', 'escape'), # cntrl work around
          QMK.generate_single_key_rule('left_command', 'tab'),
          QMK.generate_single_key_rule('right_command', 'return_or_enter'),
          QMK.generate_single_key_rule('left_shift', 'delete_or_backspace'),
          QMK.generate_single_key_rule('right_shift', 'delete_or_backspace'),

          ###############################################
          # hold down space activate layer 'BASE_SPACE' #
          ###############################################

          QMK.STATE_HOLD_ACTIVATE('STATE_HOLD_SPACE', 'spacebar', 'spacebar'),

          # homerow left
          QMK.DUAL_W_STATE('STATE_HOLD_SPACE', 'a', 'escape', 'left_control'),
          QMK.DUAL_W_STATE('STATE_HOLD_SPACE', 's', 'tab', 'left_shift'),
          QMK.DUAL_W_STATE('STATE_HOLD_SPACE', 'd', 'return_or_enter', 'left_option'),
          QMK.DUAL_W_STATE('STATE_HOLD_SPACE', 'f', 'delete_or_backspace', 'left_command'),

          # vi arrows
          QMK.SINGLE_W_STATE('STATE_HOLD_SPACE', 'h', 'left_arrow'),
          QMK.SINGLE_W_STATE('STATE_HOLD_SPACE', 'j', 'down_arrow'),
          QMK.SINGLE_W_STATE('STATE_HOLD_SPACE', 'k', 'up_arrow'),
          QMK.SINGLE_W_STATE('STATE_HOLD_SPACE', 'l', 'right_arrow'),

        ],
      },
    ]
  )
end

main
