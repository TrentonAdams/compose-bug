# 1. start with init stage, installing everything common across all stages
# 2. deps and build stages are separated only to save on time by
#    using cached images
# 3. the final stage copies everything from the build stage into the
#    appropriate directory
#
# init stage
FROM prj-build AS init

FROM init AS build

#
# final stage
FROM prj-base AS final
RUN yum -y install openssh-clients.x86_64 \
  && yum clean all \
  && rm -rf /var/cache/yum

COPY --from=build /opt/build/target/opt /opt
COPY --from=build /opt/build/target/etc/ /etc
COPY --from=build /opt/build/version /opt/project/oros/

WORKDIR /opt/project

CMD ["/usr/sbin/init"]