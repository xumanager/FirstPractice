<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<script src="/static/js/vue.js"></script>
		<script src="/static/js/vue-axios.js"></script>
	
		<link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
		<!-- 引入组件库 -->
		<script src="https://unpkg.com/element-ui/lib/index.js"></script>
		<title>我的代办任务</title>
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
		
			<div style="height: 50px;background: #f8f8f8;padding-left: 15px;display: flex;justify-content: left;align-items: center;">
			</div>
				 <el-table
				    :data="task"
					 border
				    style="width: 100%">
		
					<el-table-column
					  prop="id"
					  label="任务ID"
					  width="120">
					</el-table-column>
				    <el-table-column
				      prop="name"
				      label="任务名称"
					  width="180px">
				    </el-table-column>
				    <el-table-column
				      prop="date"
				      label="任务创建时间">
				    </el-table-column>
				    <el-table-column
				      prop="apply"
				      label="任务办理人"
					  width="100">
				    </el-table-column>
				    <el-table-column
				      label="操作"
					  width="270">
				      <template slot-scope="scope" id="tempButton">
						  <div style="display: flex;justify-content: center;align-items: center;">
							  <el-button type="primary"  size="mini" style="padding: 5px 8px;" @click="addHoliday = true" >办理活动</el-button>
							  <el-button type="warning"  size="mini" style="padding: 5px 8px;">查看活动图</el-button>
							 
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
					
					
					 <el-dialog title="办理任务" :visible.sync="addHoliday" width="40%">
						<el-form style="padding-right: 20px;">
							<el-form-item label="请假标题" class="myformitem">
								<el-input v-model="holiday.title" autocomplete="off" style="width: 100%"></el-input>
							</el-form-item>
							<el-form-item label="请假天数" class="myformitem">
								<el-input v-model="holiday.day" autocomplete="off" style="width: 100%"></el-input>
							</el-form-item>
							<el-form-item label="开始时间" class="myformitem">
								<el-input v-model="holiday.date" autocomplete="off" style="width: 100%"></el-input>
							</el-form-item>
							<el-form-item label="请假原因" class="myformitem">
								<el-input type="textarea" v-model="holiday.content" autocomplete="off" style="width: 100%;" :autosize="{ minRows: 2, maxRows: 4}"></el-input>
							</el-form-item>
							<el-form-item label="批注内容" class="myformitem">
								<el-input type="textarea"  autocomplete="off" style="width: 100%;" :autosize="{ minRows: 2, maxRows: 4}"></el-input>
							</el-form-item>
						</el-form>
						<div  style="display:flex;justify-content: center;align-items: center;padding:0;">
							<el-button type="primary" >同意</el-button>
							<el-button type="warning">驳回</el-button>
						</div>
						<div style="height: 30px;background: #f8f8f8;"></div>
						<el-table
						   :data="history"
							 border
						   style="width: 100%">
								
								<el-table-column
								  prop="date"
								  label="批注时间"
								  width="120">
								</el-table-column>
							   <el-table-column
								 prop="people"
								 label="批注人"
												  width="180px">
							   </el-table-column>
							   <el-table-column
								 prop="content"
								 label="批注内容">
							   </el-table-column>
						   </el-table>
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
						day:'',
					},
					title:'',
					content:'',
					start:'',
					end:'',
					history:[
						{
							date:'2018-11-10 19:13:09',
							people:'李白',
							content:'同意申请'
						},
						{
							date:'2018-12-15 8:13:09',
							people:'小青',
							content:'好的'
						},
						{
							date:'2019-01-08 07:08:09',
							people:'刘其',
							content:'同意'
						}
					],
					task:[
						{
							id:'1',
							name:'请假',
							date:'2018-06-05',
							apply:'孙琦',
						},
						{
							id:'1',
							name:'请假',
							date:'2018-06-05',
							apply:'孙琦',
						},
						{
							id:'1',
							name:'请假',
							date:'2018-06-05',
							apply:'孙琦',
						},
					]
				}
			})
		</script>
	</body>
</html>
