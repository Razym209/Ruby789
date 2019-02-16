year = { 'January' => 31,   'May' => 31,       'September' => 30, 'February' => 28,
         'June' => 30,      'October' => 31,   'March' => 31,     'July' => 31, 
         'November' => 30,  'April' => 30,     'August' => 31,    'December' => 31 }

year.each { |month, day| puts month if day == 30 }
