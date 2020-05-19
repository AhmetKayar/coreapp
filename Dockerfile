FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.sln .
COPY API/*.csproj ./API/
RUN dotnet restore

# copy everything else and build app
COPY API/. ./API/
WORKDIR /app/API
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS runtime
WORKDIR /app
ENV ASPNETCORE_URLS http://+:80
EXPOSE 80
COPY --from=build /app/API/out ./
ENTRYPOINT ["dotnet", "API.dll"]