FROM cidasdpdasartip.cr.usgs.gov:8447/mlr-python-base-docker:latest
LABEL maintainer="gs-w_eto_eb_federal_employees@usgs.gov"

ENV repo_name=usgs-python-centralized
ENV artifact_id=usgs-wma-mlr-legacy-transformer
ENV artifact_version=0.8.0.dev0
ENV protocol=https
ENV listening_port=7010
ENV authorized_roles=test_default
ENV oauth_server_token_key_url=https://example.gov/oauth/token_key

RUN pip3 install --no-cache-dir --quiet --user --extra-index-url https://cida.usgs.gov/artifactory/api/pypi/${repo_name}/simple -v ${artifact_id}==${artifact_version}

HEALTHCHECK CMD curl -k ${protocol}://127.0.0.1:${listening_port}/version | grep -q "\"artifact\": \"${artifact_id}\"" || exit 1