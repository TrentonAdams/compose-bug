# syntax=docker/dockerfile:experimental
# 1. start with init stage, installing everything common across all stages
# 2. deps and build stages are separated only to save on time by
#    using cached images
# 3. the final stage copies everything from the build stage into the
#    appropriate directory
#
# init stage
FROM prj-build AS init

FROM init AS build
RUN mkdir -p /var/tmp/web

#
# final stage
FROM prj-base AS final
COPY --from=build /var/tmp/web/ /usr/local/tomcat/webapps/oros
