# Jinja2-Action

Jinja2 is a fast and straightforward templating engine. You can use this action to easily run it in your GitHub workflows. This Action support spesific files templating or all files in dir (by patern) templating.

![Main CI/CD Pipeline](https://github.com/jayamanikharyono/jinja-action/workflows/Main%20CI/CD%20Pipeline/badge.svg)

### Using Action Inputs
```yml
- name: Render Repo Name
  uses: jayamanikharyono/jinja-action@v0.1
  with:
    data: repo_name=${{ github.event.repository.name }}
    path: tests/test_template_single.py
```

### Using Data Files (Json)
```yml
- name: Render all DAGs in Dir
  uses: jayamanikharyono/jinja-action@v0.1
  with:
    datafile: tests/template_data.json
    path: tests/multi/*.py
```
### Examples of usage scenarios
Raw file
```python
def print_status():
    print('{{ repo_name }}')
    return ("Templating Succeded!")
```
Rendered file
```python
def print_status():
    print('master')
    return ("Templating Succeded!")
```
