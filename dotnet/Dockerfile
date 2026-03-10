FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

RUN dotnet new console -o HelloWorld
COPY hello.cs /app/HelloWorld/Program.cs
WORKDIR /app/HelloWorld
RUN dotnet publish -c Release -o /app/out

FROM mcr.microsoft.com/dotnet/runtime:8.0
WORKDIR /app
COPY --from=build /app/out/ .
ENTRYPOINT ["dotnet", "HelloWorld.dll"]
