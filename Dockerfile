# This uses the latest Docker image built from the samples repository,
# defined by the Dockerfile in Build/images/samples.
FROM mcr.microsoft.com/quantum/samples:64ee8019e888c96afc29e2ad2ec0acb3d668fba1

# Mark that this Dockerfile is used with the samples repository.
ENV IQSHARP_HOSTING_ENV=SAMPLES_HOSTED

# Make sure the contents of our repo are in ${HOME}.
# These steps are required for use on mybinder.org.
USER root
COPY . ${HOME}
RUN chown -R ${USER} ${HOME}

# Finish by dropping back to the notebook user.
USER ${USER}
