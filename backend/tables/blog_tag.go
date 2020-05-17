package tables

import (
	"github.com/GoAdminGroup/go-admin/context"
	"github.com/GoAdminGroup/go-admin/modules/db"
	"github.com/GoAdminGroup/go-admin/plugins/admin/modules/table"
	"github.com/GoAdminGroup/go-admin/template/types/form"
)

func GetBlogTagTable(ctx *context.Context) table.Table {

	blogTagTable := table.NewDefaultTable(table.DefaultConfigWithDriver("mysql"))

	info := blogTagTable.GetInfo()

	info.AddField("Id", "id", db.Int).FieldFilterable()
	info.AddField("Name", "name", db.Varchar)
	info.AddField("Created_on", "created_on", db.Int)
	info.AddField("Created_by", "created_by", db.Varchar)
	info.AddField("Modified_on", "modified_on", db.Int)
	info.AddField("Modified_by", "modified_by", db.Varchar)
	info.AddField("Deleted_on", "deleted_on", db.Int)
	info.AddField("State", "state", db.Tinyint)

	info.SetTable("blog_tag").SetTitle("Blog_tag").SetDescription("Blog_tag")

	formList := blogTagTable.GetForm()

	formList.AddField("Id", "id", db.Int, form.Default).FieldNotAllowAdd()
	formList.AddField("Name", "name", db.Varchar, form.Text)
	formList.AddField("Created_on", "created_on", db.Int, form.Number)
	formList.AddField("Created_by", "created_by", db.Varchar, form.Text)
	formList.AddField("Modified_on", "modified_on", db.Int, form.Number)
	formList.AddField("Modified_by", "modified_by", db.Varchar, form.Text)
	formList.AddField("Deleted_on", "deleted_on", db.Int, form.Number)
	formList.AddField("State", "state", db.Tinyint, form.Number)

	formList.SetTable("blog_tag").SetTitle("Blog_tag").SetDescription("Blog_tag")

	return blogTagTable
}
