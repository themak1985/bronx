<?php

return [
  [
    'name' => 'RiverleaStream_Bronx',
    'entity' => 'RiverleaStream',
    'update' => 'unmodified',
    'cleanup' => 'always',
    'params' => [
      'version' => 4,
      'values' => [
        'name' => 'bronx',
        'label' => 'Bronx',
        'description' => 'A clean, accessible, mobile-first Stream for public-facing CiviCRM forms.',
        'is_reserved' => FALSE,
        'extension' => 'bronx',
        'file_prefix' => 'streams/bronx/',
        'css_file' => '_main.css',
        'css_file_dark' => '_dark.css',
      ],
      'match' => ['name'],
    ],
  ],
];
