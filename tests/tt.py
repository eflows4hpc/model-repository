import mlflow
from mlflow import log_metric, log_param, log_artifacts

mlflow.set_tracking_uri('http://0.0.0.0:5000')
print('Uri:', mlflow.get_artifact_uri())

mlflow.set_experiment('remote2')
mlflow.log_artifact('./rep/model')
