<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<script src="/static/js/vue.js"></script>
		<script src="/static/js/vue-axios.js"></script>
	
		<link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
		<!-- 引入组件库 -->
		<script src="https://unpkg.com/element-ui/lib/index.js"></script>
		<title>请假单管理</title>
		<style>
			*{
				margin: 0;
				padding: 0;
			}
			html,body{
				width: 100%;
				height: 100%;
			}
			#app{
				height: 100%;
			}
			#require{
				display: flex;
				justify-content: center;
				align-items: center;
				padding: 20px;
			}
			#require > div{
				width: 200px;
			}
			span{
				font-weight: 550;
			}
			.el-table td, .el-table th{
				text-align: center;
			}
			body .el-table th.gutter{
			  display: table-cell!important;
			}
			 .myformitem{
				display: flex;
				flex-direction: row;
				justify-content: flex-start;
			}
			.myformitem label{
				width: 100px;
			}
			.el-form-item__content{
				flex-grow: 1;
			}
			.el-dialog__header{
				background: #eee;
			}
			.el-dialog__header span{
				color: #000;
				font-size:14px;
				font-weight: 500;
			}
			.el-dialog__body{
				padding: 20px 20px 0px 20px;
			}
		</style>
	</head>
	<body>
		<div id="app">
			<el-divider content-position="left"><span style="font-size:18px;">查询条件</span></el-divider>
			<div id="require">
				<el-input
				  size="small"
				 
				  placeholder="请假标题"
				  style="padding-right: 30px;"
				  v-model="title">
				</el-input>
				<el-input
				  size="small"
				  placeholder="请假内容"
				   style="padding-right: 30px;"
				  v-model="content">
				</el-input>
				<el-input
				  size="small"
				  placeholder="开始时间"
				   style="padding-right: 30px;"
				  v-model="start">
				</el-input>
				<el-input
				  size="small"
				  placeholder="结束时间"
				  v-model="end">
				</el-input>
			</div>
			<div style="padding-bottom: 20px;display: flex;justify-content: center;align-items: center;">
				<el-button type="primary" size="small">查询</el-button>
				<el-button type="warning" size="small">清空</el-button>
			</div>
			<div style="height: 50px;background: #f8f8f8;padding-left: 15px;display: flex;justify-content: left;align-items: center;">
				<el-button type="primary"  size="small" @click="addHoliday = true">添加</el-button>
			</div>
				 <el-table
				    :data="holiday"
					 border
				    style="width: 100%">
					<el-table-column
				       type="selection"
				       width="55">
				     </el-table-column>
					<el-table-column
					  prop="id"
					  label="请假单ID"
					  width="120">
					</el-table-column>
				    <el-table-column
				      prop="title"
				      label="请假标题"
					  width="180px">
				    </el-table-column>
				    <el-table-column
				      prop="content"
				      label="请假内容">
				    </el-table-column>
				    <el-table-column
				      prop="day"
				      label="请假天数"
					  width="100">
				    </el-table-column>
				    <el-table-column
				      prop="date"
				      label="请假时间">
				    </el-table-column>
				    <el-table-column
				      prop="people"
				      label="请假人">
				    </el-table-column>
					<el-table-column
					  prop="status"
					  label="状态"
					  width="150px">
					  <template slot-scope="scope">
						 <span v-if="scope.row.status == 0" style="color:#808080;">已放弃</span>
						 <span v-if="scope.row.status == 1" style="color:indianred">未提交</span>
						 <span v-if="scope.row.status == 2" style="color:green">审核中</span>
						 <span v-if="scope.row.status == 3" style="color:cornflowerblue;">审核完成</span>
					   </template>
					 </el-table-column>
				    <el-table-column
				      label="操作"
					  width="270">
				      <template slot-scope="scope" id="tempButton">
						  <div style="display: flex;justify-content: center;align-items: center;">
							  <el-button type="info"  size="mini" style="padding: 5px 8px;" v-if="scope.row.status == 0 || scope.row.status == 1">编辑</el-button>
							  <el-button type="danger"  size="mini" style="padding: 5px 8px;" v-if="scope.row.status == 0 || scope.row.status == 1">删除</el-button>
							  <el-button type="primary"  size="mini" style="padding: 5px 8px;" v-if="scope.row.status == 1">提交申请</el-button>
							  <el-button type="warning"  size="mini" style="padding: 5px 8px;"  v-if="scope.row.status == 2 || scope.row.status == 3 || scope.row.status == 0">审批查询</el-button>
						  </div>
				      </template>
				    </el-table-column>
				  </el-table>
					<el-pagination
					style="margin-top: 20px;"
					  background
					  layout="prev, pager, next,total,jumper,sizes"
					  :total="1000">
					</el-pagination>
					
					
					 <el-dialog title="添加请假单" :visible.sync="addHoliday" width="40%">
						<el-form style="padding-right: 20px;">
							<el-form-item label="请假标题" class="myformitem">
								<el-input v-model="holiday.title" autocomplete="off" style="width: 100%"></el-input>
							</el-form-item>
							<el-form-item label="请假天数" class="myformitem">
								<el-input v-model="holiday.days" autocomplete="off" style="width: 100%"></el-input>
							</el-form-item>
							<el-form-item label="开始时间" class="myformitem">
								<el-input v-model="holiday.date" autocomplete="off" style="width: 100%"></el-input>
							</el-form-item>
							<el-form-item label="请假原因" class="myformitem">
								<el-input type="textarea" v-model="holiday.content" autocomplete="off" style="width: 100%;" :autosize="{ minRows: 2, maxRows: 4}"></el-input>
							</el-form-item>
						</el-form>
						<div slot="footer" style="display:flex;justify-content: center;align-items: center;padding:0;">
							<el-button type="primary" @click="submitHoliday">提交</el-button>
						</div>
					</el-dialog>
		</div>
		<script>
			var vm = new Vue({
				el:"#app",
				data:{
					addHoliday : false,
					messafeg : '123',
					holiday:{
						title:'',
						content:'',
						start:'',
						days:'',
					},
					title:'',
					content:'',
					start:'',
					end:'',

				},
				methods:{
					submitHoliday(){
						axios({
							method:'post',
							url:'holiday/addHoliday',
							params:{
								holiday : this.holiday,
								username:"张三",
								processName:"holiday"
							}
						}).then((request)=>{
							console.log(request.data);
						})
					}
				}
			})
		</script>
	</body>
</html>
