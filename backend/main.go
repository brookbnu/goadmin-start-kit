package main

import (
	"adsk/pages"
	"adsk/tables"
	_ "github.com/GoAdminGroup/go-admin/adapter/gin" // 适配器
	"github.com/GoAdminGroup/go-admin/engine"
	"github.com/GoAdminGroup/go-admin/examples/datamodel"
	"github.com/GoAdminGroup/go-admin/modules/config"
	"github.com/GoAdminGroup/go-admin/modules/db"
	_ "github.com/GoAdminGroup/go-admin/modules/db/drivers/mysql" // sql 驱动
	"github.com/GoAdminGroup/go-admin/modules/language"
	"github.com/GoAdminGroup/go-admin/template"
	"github.com/GoAdminGroup/go-admin/template/chartjs"
	_ "github.com/GoAdminGroup/themes/adminlte" // ui主题
	"github.com/gin-gonic/gin"
	"io/ioutil"
)

func main() {
	r := gin.Default()

	gin.SetMode(gin.ReleaseMode)
	gin.DefaultWriter = ioutil.Discard

	// 实例化一个GoAdmin引擎对象
	eng := engine.Default()

	template.AddComp(chartjs.NewChart())

	// GoAdmin全局配置，也可以写成一个json，通过json引入
	// 增加配置与插件，使用Use方法挂载到Web框架中
	if err := eng.AddConfig(config.Config{
		// 数据库配置，为一个map，key为连接名，value为对应连接信息
		Databases: config.DatabaseList{
			// 默认数据库连接，名字必须为default
			"default": {
				Host:       "127.0.0.1",
				Port:       "3306",
				User:       "root",
				Pwd:        "Magento@123",
				Name:       "admin",
				MaxIdleCon: 50,
				MaxOpenCon: 150,
				Driver:     db.DriverMysql,
			},
			"business": {
				Host:       "127.0.0.1",
				Port:       "3306",
				User:       "root",
				Pwd:        "Magento@123",
				Name:       "admin_business",
				MaxIdleCon: 50,
				MaxOpenCon: 150,
				Driver:     db.DriverMysql,
			},
		},
		UrlPrefix: "admin",
		IndexUrl:  "/",
		Debug:     true,
		Language:  language.CN,
	}).
		// 这里引入你需要管理的业务表配置
		// 使用 adm generate 命令行根据你自己的业务表生成 Generators
		AddGenerators(tables.Generators).
		Use(r); err != nil {
		panic(err)
	}

	r.Static("/uploads", "./uploads")

	eng.HTML("GET", "/admin", datamodel.GetContent)
	//eng.HTML("GET", "/admin", pages.DashboardPage)
	eng.HTML("GET", "/admin/form", pages.GetFormContent)
	eng.HTML("GET", "/admin/table", pages.GetTableContent)
	eng.HTMLFile("GET", "/admin/hello", "./html/hello.tmpl", map[string]interface{}{
		"msg": "Hello world",
	})

	_ = r.Run(":9033")
}