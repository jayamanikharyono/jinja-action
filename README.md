# Jinja2-Action

Jinja2 is a fast and straightforward templating engine. You can use this action to easily run it in your GitHub workflows. This Action support per files templating and per dir (by patern) templating.


## Using Action Inputs
```yml
- name: Render Repo Name
  uses: jayamanikharyono/jinja-action@v1
  with:
    data: repo_name=${{ github.event.repository.name }}
    path: tests/test_template_single.py
```

## Using data files (Json)
```yml
- name: Render DAGs Dir
  uses: jayamanikharyono/jinja-action@v1
  with:
    datafile: tests/template_data.json
    path: tests/multi/*
```
