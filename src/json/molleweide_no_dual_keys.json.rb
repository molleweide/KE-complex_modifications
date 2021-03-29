#!/usr/bin/env ruby

require 'json'
require_relative '../lib/layers'

def main
  puts JSON.pretty_generate(
    'title' => 'molleweide personal without dual keys on main rows',
    'maintainers' => ['molleweide'],
    'rules' => [
      {
        'description' => 'molleweide personal no dual keys',
        'manipulators' => [

          # TOP ::::::::::::::::::::::::::::::::::::

          # MID ::::::::::::::::::::::::::::::::::::
          Layers.generate_single_key_rule('caps_lock', 'escape'),

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
          Layers.generate_single_key_rule('left_command', 'tab'),
          Layers.generate_single_key_rule('right_command', 'return_or_enter'),

        ],
      },
    ]
  )
end

main
