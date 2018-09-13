name 'hab-example'

run_list 'hab-policy-example::default'

default_source :supermarket
cookbook 'hab-policy-example', path: '..'
