from airflow import DAG
from airflow.utils.dates import days_ago
from airflow.operators.python_operator import PythonOperator

from datetime import timedelta

DAG_ID = "test_template"

default_args = {
    'owner' : 'DE',
    'depends_on_past' : False,
    'start_date' : days_ago(0),
    'email' : ['example@123.com'],
    'email_on_failure' : False,
    'email_on_retry' : False,
    'retries' : 0,
    'retry_delay' : timedelta(minutes=5)
}

dag = DAG(
    DAG_ID,
    description = 'Sample DAG To Test Templating Engine',
    default_args = default_args,
    access_control = {
        'DE' : {'can_dag_read', 'can_dag_edit'},
        'BI' : {'can_dag_read'}
    },
    schedule_interval = timedelta(days = 1)
)


def print_status():
    print('{{ repo_name }}')
    return ("Templating Succeded!")


hello_task = PythonOperator(
                    task_id = 'hello_task',
                    python_callable = print_status,
                    dag = dag
                )

hello_task
