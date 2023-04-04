## portainer-ce

```
sudo docker run -p 8000:8000 -p 9000:9000 -p 9443:9443 --detach --name=portainer-ce --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v /volume1/docker/portainer-ce:/data portainer/portainer-ce

20d5eb65e900dec9b7653a8f82f847cdff19c0475c94540bbc06ccf7a66d5f4b
```

## baota

```
docker run -d --restart unless-stopped --name baota --net=host -v /volume1/docker/baota/website_data:/www/wwwroot -v /volume1/docker/baota/mysql_data:/www/server/data -v /volume1/docker/baota/vhost:/www/server/panel/vhost btpanel/baota:latest

a9c86ff18a4f4283d0ab2bb6791fb43eb0628cad90aa3f2dd8a618f3f2ffb046
```



```
[root@kiwinas etc]# /etc/init.d/bt default                                                              
==================================================================                                      
BT-Panel default info!                                                                                  
==================================================================                                      
外网面板地址: http://[****:***:****:****:***:****:****:****]:8888/btpanel                               
内网面板地址: http://192.168.50.100:8888/btpanel                                                        
*以下仅为初始默认账户密码，若无法登录请执行bt命令重置账户/密码登录                                      
username: btpanel                                                                                       
password: ********                                                                                      
If you cannot access the panel,                                                                         
release the following panel port [8888] in the security group                                           
若无法访问面板，请检查防火墙/安全组是否有放行面板[8888]端口                                             
==================================================================  
```