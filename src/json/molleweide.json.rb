#!/usr/bin/env ruby

require 'json'
# require_relative '../lib/karabiner'
require_relative '../lib/layers'

def main
  puts JSON.pretty_generate(
    'title' => 'molleweide personal w/modrows',
    'maintainers' => ['molleweide'],
    'rules' => [
      {
        'description' => 'molleweide personal w/modrows',
        'manipulators' => [

          # todo
          #
          # upper left corner ESCAPE always get back to
          # base layer/state. Eg. if turn of all keyr escape
          # would bring you back/turn on keys..

          ##########################################
          # LAYER -> BASE (use no variable? hmm..) #
          ##########################################

          # TOP ::::::::::::::::::::::::::::::::::::

          # MIDDLE | HOMEROW :::::::::::::::::::::::
          Layers.generate_single_key_rule('caps_lock', 'escape'),
          Layers.generate_dual_key_rule('a', 'a', 'left_control'),
          Layers.generate_dual_key_rule('s', 's', 'left_shift'),
          Layers.generate_dual_key_rule('d', 'd', 'left_option'),
          Layers.generate_dual_key_rule('f', 'f', 'left_command'),
          Layers.generate_dual_key_rule('j', 'j', 'right_command'),
          Layers.generate_dual_key_rule('k', 'k', 'right_option'),
          Layers.generate_dual_key_rule('l', 'l', 'right_shift'),
          Layers.generate_dual_key_rule('semicolon', 'semicolon', 'right_control'),

          # BOTTOM :::::::::::::::::::::::::::::::::
          Layers.generate_single_key_rule('left_shift', 'grave_accent_and_tilde'),
          Layers.generate_single_key_rule('grave_accent_and_tilde', 'z'),
          Layers.generate_single_key_rule('z', 'x'),
          Layers.generate_single_key_rule('x', 'c'),
          Layers.generate_single_key_rule('c', 'v'),
          Layers.generate_single_key_rule('v', 'b'),
          Layers.generate_single_key_rule('b', 'delete_or_backspace'),
          Layers.generate_single_key_rule('right_shift', 'delete_or_backspace'),

          # THUMBS :::::::::::::::::::::::::::::::::
          Layers.STATE_HOLD_ACTIVATE('STATE_HOLD_SPACE', 'spacebar', 'spacebar'),
          Layers.generate_dual_key_rule('left_command', 'tab', 'left_command'),
          Layers.generate_dual_key_rule('right_command', 'return_or_enter', 'right_command'),

          ###########################################################
          # LAYER -> 'STATE_HOLD_SPACE' | hold spacebar to activate #
          ###########################################################

          # homerow
          Layers.DUAL_KEY('STATE_HOLD_SPACE', 'a', 'escape', 'left_control'),
          Layers.DUAL_KEY('STATE_HOLD_SPACE', 's', 'tab', 'left_shift'),
          # Layers.DUAL_KEY('STATE_HOLD_SPACE', 'd', 'return_or_enter', 'left_option'),
          Layers.SINGLE_KEY('STATE_HOLD_SPACE', 'd', 'delete_or_backspace'),
          Layers.DUAL_KEY('STATE_HOLD_SPACE', 'f', 'delete_or_backspace', 'left_command'),
          # g
          Layers.SINGLE_KEY('STATE_HOLD_SPACE', 'h', 'left_arrow'),
          Layers.SINGLE_KEY('STATE_HOLD_SPACE', 'j', 'down_arrow'),
          Layers.SINGLE_KEY('STATE_HOLD_SPACE', 'k', 'up_arrow'),
          Layers.SINGLE_KEY('STATE_HOLD_SPACE', 'l', 'right_arrow'),
          # ;

          #############################################
          # LAYER -> 'STATE_SYMBOLS_AND_NUMPAD' | todo #
          #############################################

          # put symbols left hand
          #
          # numpad on right hand

          #############################################
          # LAYER -> 'STATE_TURN_OFF_ALL_KEYS' | todo #
          #############################################

        ],
      },
    ]
  )
end

main
