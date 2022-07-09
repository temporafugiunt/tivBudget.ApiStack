@Library('freebyTech')_

import com.freebyTech.BuildInfo

String versionPrefix = '2.3'
String repository = 'trackitsvalue'    
String imageName = 'tiv-api-budget'
String dockerBuildArguments = ''
BuildInfo buildInfo

node 
{
  buildInfo = build(this, versionPrefix, repository, imageName, dockerBuildArguments, true, true)

  if('main'.equalsIgnoreCase(env.BRANCH_NAME)) 
  {
    env.NAMESPACE = 'production'
    deploy(buildInfo, repository, imageName, './env/production.yaml')
  } 
  else if('develop'.equalsIgnoreCase(env.BRANCH_NAME)) 
  {
    env.NAMESPACE = 'beta'
    deploy(buildInfo, repository, imageName, './env/beta.yaml')
  }
}

