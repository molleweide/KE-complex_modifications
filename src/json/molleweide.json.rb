#!/usr/bin/env ruby

require 'json'
# require_relative '../lib/karabiner'
require_relative '../lib/layers'

def main
  puts JSON.pretty_generate(
    'title' => 'molleweide personal',
    'maintainers' => ['molleweide'],
    'rules' => [
      {
        'description' => 'molleweide personal',
        'manipulators' => [

          ##########################################
          # LAYER -> BASE (use no variable? hmm..) #
          ##########################################

          # thumbs
          # Layers.generate_dual_key_rule('spacebar', 'spacebar', 'left_shift'),
          Layers.generate_dual_key_rule('left_command', 'tab', 'left_command'),
          Layers.generate_dual_key_rule('right_command', 'return_or_enter', 'right_command'),

          # homerow dual keys
          Layers.generate_dual_key_rule('a', 'a', 'left_control'),
          Layers.generate_dual_key_rule('s', 's', 'left_shift'),
          Layers.generate_dual_key_rule('d', 'd', 'left_option'),
          Layers.generate_dual_key_rule('f', 'f', 'left_command'),
          Layers.generate_dual_key_rule('j', 'j', 'right_command'),
          Layers.generate_dual_key_rule('k', 'k', 'right_option'),
          Layers.generate_dual_key_rule('l', 'l', 'right_shift'),
          Layers.generate_dual_key_rule('semicolon', 'semicolon', 'right_control'),

          # remappings
          Layers.generate_single_key_rule('caps_lock', 'escape'), # cntrl work around
          # Layers.generate_single_key_rule('left_command', 'tab'),
          # Layers.generate_single_key_rule('right_command', 'return_or_enter'),
          Layers.generate_single_key_rule('left_shift', 'delete_or_backspace'),
          Layers.generate_single_key_rule('right_shift', 'delete_or_backspace'),

          #####################################################
          # LAYER -> 'BASE_SPACE' | hold spacebar to activate #
          #####################################################

          Layers.STATE_HOLD_ACTIVATE('STATE_HOLD_SPACE', 'spacebar', 'spacebar'),

          # homerow left
          Layers.DUAL_KEY('STATE_HOLD_SPACE', 'a', 'escape', 'left_control'),
          Layers.DUAL_KEY('STATE_HOLD_SPACE', 's', 'tab', 'left_shift'),
          Layers.DUAL_KEY('STATE_HOLD_SPACE', 'd', 'return_or_enter', 'left_option'),
          Layers.DUAL_KEY('STATE_HOLD_SPACE', 'f', 'delete_or_backspace', 'left_command'),

          # vi arrows
          Layers.SINGLE_KEY('STATE_HOLD_SPACE', 'h', 'left_arrow'),
          Layers.SINGLE_KEY('STATE_HOLD_SPACE', 'j', 'down_arrow'),
          Layers.SINGLE_KEY('STATE_HOLD_SPACE', 'k', 'up_arrow'),
          Layers.SINGLE_KEY('STATE_HOLD_SPACE', 'l', 'right_arrow'),

        ],
      },
    ]
  )
end

main
