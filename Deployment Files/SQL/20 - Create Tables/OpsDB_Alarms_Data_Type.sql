--DROP TYPE [dbo].[OpsDB_Alarms_Data_Type]
--GO

CREATE TYPE [dbo].[OpsDB_Alarms_Data_Type] AS TABLE(
	[DataServerName] [varchar](100) NULL,
	[PLDesc] [nvarchar](200) NOT NULL,
	[PLDescGlobal] [varchar](50) NULL,
	[PUDesc] [nvarchar](200) NOT NULL,
	[PUDescGlobal] [varchar](50) NULL,
	[MasterPUDesc] [nvarchar](200) NOT NULL,
	[MasterPUDescGlobal] [varchar](50) NULL,
	[VarId] [int] NOT NULL,
	[VarDesc] [nvarchar](255) NOT NULL,
	[AlarmDesc] [nvarchar](500) NOT NULL,
	[AlarmTemplate] [nvarchar](500) NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NULL,
	[MaxValue] [nvarchar](25) NULL,
	[MinValue] [nvarchar](25) NULL,
	[CommentId] [int] NULL,
	[CommentModifOn] [datetime] NULL,
	[StartValue] [nvarchar](25) NOT NULL,
	[EndValue] [nvarchar](25) NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[UserName] [nvarchar](200) NOT NULL,
	[EventTypeDesc] [nvarchar](200) NOT NULL,
	[EventSubTypeDesc] [nvarchar](200) NULL,
	[ProcessOrder] [nvarchar](50) NULL,
	[ProdCode] [varchar](25) NOT NULL,
	[ProdDesc] [nvarchar](255) NOT NULL,
	[ProdDescGlobal] [varchar](50) NULL,
	[LReject] [nvarchar](25) NULL,
	[Target] [nvarchar](25) NULL,
	[UReject] [nvarchar](25) NULL,
	[AlarmId] [int] NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
	[PUGDesc] [nvarchar](200) NOT NULL,
	[CauseCommentText] [nvarchar](max) NULL,
	[ActionCommentText] [nvarchar](max) NULL,
	[CauseCommentId] [int] NULL,
	[CauseCommentModifOn] [datetime] NULL,
	[CauseComment_Rtf] [text] NULL,
	[ActionCommentId] [int] NULL,
	[ActionCommentModifOn] [datetime] NULL,
	[ActionComment_Rtf] [text] NULL,
	[Action1] [nvarchar](100) NULL,
	[Action2] [nvarchar](100) NULL,
	[Action3] [nvarchar](100) NULL,
	[Cause1] [nvarchar](100) NULL,
	[Cause2] [nvarchar](100) NULL,
	[Cause3] [nvarchar](100) NULL,
	[SourceVarId] [int] NULL,
	[RcdIdx] [bigint] NOT NULL
	PRIMARY KEY CLUSTERED 
(
	[RcdIdx] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO


