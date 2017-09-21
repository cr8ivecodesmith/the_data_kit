FROM python:latest

ENV BUILD_ROOT /opt
ENV APP_USER caffeine
ENV APP_USER_HOME /home/caffeine
ENV APP_PROJECT_ROOT /home/caffeine/project
ENV APP_PROJECT_VENV /home/caffeine/venv

# Create non-priv user
RUN useradd \
    --user-group \
    --uid 1000 \
    --shell /bin/bash \
    --home-dir $APP_USER_HOME \
    $APP_USER

# Create virtualenv
RUN python -m venv $APP_PROJECT_VENV

# Install requirements and fix permissions
WORKDIR $BUILD_ROOT
COPY requirements.txt $BUILD_ROOT
RUN . $APP_PROJECT_VENV/bin/activate \
    && pip install -r requirements.txt \
    && chown $APP_USER: -R $APP_USER_HOME

# Clean up
RUN apt-get autoclean \
    && apt-get autoremove --purge \
    && find . -name "*.pyc" -delete \
    && find . -iname "__pycache__" -type d | xargs rm -Rf \
    && rm -f $BUILD_ROOT/requirements.txt

# Start
WORKDIR $APP_PROJECT_ROOT
