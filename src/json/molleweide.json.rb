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

def main
  puts JSON.pretty_generate(
    'title' => 'molleweide personal',
    'maintainers' => ['molleweide'],
    'rules' => [
      {
        'description' => 'molleweide personal',
        'manipulators' => [

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
        ],
      },
    ]
  )
end

def generate_dual_key_rule(input, alone, held_down)
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

def generate_single_key_rule(input, output)
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

def layer_toggle() end

def single_switch_to_layer() end

def dual_key_hold_layer
  [
    # option+n -> control+page_down
    {
      'type' => 'basic',
      'from' => {
        'key_code' => 'n',
        'modifiers' => Karabiner.from_modifiers(['option'], ['caps_lock']),
      },
      'to' => [
        {
          'key_code' => 'page_down',
          'modifiers' => ['left_control'],
        },
      ],
      'conditions' => [
        Karabiner.frontmost_application_if(['visual_studio_code']),
      ],
    },
    # option+p -> control+page_up
    {
      'type' => 'basic',
      'from' => {
        'key_code' => 'p',
        'modifiers' => Karabiner.from_modifiers(['option'], ['caps_lock']),
      },
      'to' => [
        {
          'key_code' => 'page_up',
          'modifiers' => ['left_control'],
        },
      ],
      'conditions' => [
        Karabiner.frontmost_application_if(['visual_studio_code']),
      ],
    },
    # disable control+t
    {
      'type' => 'basic',
      'from' => {
        'key_code' => 't',
        'modifiers' => Karabiner.from_modifiers(['control'], ['caps_lock']),
      },
      'conditions' => [
        Karabiner.frontmost_application_if(['visual_studio_code']),
      ],
    },
  ]
end

def LAYER_space_down; end

main
