#/bin/bash
#
# 获取最新代码 编译
#
git_url=git@gitee.com:itodouble/projectName.git
local_dir=/data/temp/projectName
jar_dir=/data/temp/projectName/target

deploy_jar_dir=/data/www/jar
jar_name=projectName-0.0.1-SNAPSHOT.jar

# 拉取最新代码
rm -rf /data/temp/projectName
cd /data/temp
git clone $git_url
cd quit-zero
# 编译
mvn clean
mvn package

# 移动到其他目录 避免mvn clean时文件占用或其他问题
cd ${jar_dir}
cp -f ${jar_name} ${deploy_jar_dir}
cd ${deploy_jar_dir}

# 启动相关
pid=$(ps -ef | grep "projectName-0.0.1-SNAPSHOT.jar" | grep -v grep | awk '{print $2}')
if [ ${pid} ] ; then
    kill -9 ${pid}
fi
java -jar projectName-0.0.1-SNAPSHOT.jar >> /data/www/logs/projectName.log &
