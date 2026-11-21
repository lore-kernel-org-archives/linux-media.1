Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.227.137
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795244507;
	b=GHrqYhkB/jFGkGv6j63SwEkaupzoohe8jbJfs2tFldDG5SJ8DIgZD/BZorcM8gUzil+Q
	 ShKtApo4/d+L/u8YnOnEywbLjFowTkUUR7c58fSjqkMb1ZKhojjNtTjUcLhg4VqqvUSQ+
	 Ym62dm6PC87lrAWTymd57TM5vhOtotsdy8pRjlmFd9plravHBfIz4QKl/9O5ZPn6meAcu
	 IVj8xIuCBPlPmS6TKppfY+IWWessdQjvBFY5lOwewRVm8m6+J0zKJA/ZbDs59e3zKHigk
	 t50vD1HJ24Eti5kponZL51Vdu4M5nvakkOJaccP2vFOasxQCKXs5uQ/riEAHEXpNTNw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244507;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=GCspNjbsbsHk6S/HAwg3ElT8fUvf5nFv79mIQDX0evw=;
	b=WUHkNsLx6RbsaKC621UOgTeHtUDU2/7fpWuKqf+mHR3Pj9F66QpLrGn9FFz1QE4UQG7Q
	 j9G1n+wTqRYIzBL1SuTsalGCJrYNmbXpGwG4LkFvEbNKbbOPeVtatxmLrfwGKCrw1dNKi
	 6P1hQoziOjbd6CwjOE5wQLdOz6omJndRPIOPrgC73t5QHL7Fk92P6+DoE7ASf1CYV4YRy
	 XGAyqMtTLmQ0qTrrT3gnBcAExpdO9bfUAuy8wLdLclqOVnbyXNC38kb+E2b06ujmoEUg1
	 Oset9pDaqH/n6wTzJUi7LRhx040cR1Z7BjIDgYF+Sq7iZ4nAMWARCEY1WibNBtu4uqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.227.137
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020137.outbound.protection.outlook.com [52.101.227.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95D3606A336;
	Sat, 21 Nov 2026 07:01:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B95D3606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hwfmRT9dlviLvLkdp3nCsXOtwP+Y1K/8p2gZmnVVMs0of7TbJQojxXbWlF/4as/ixoBXDJ538Y+RmBuPnk5IEImxMAUDA5rWsipJqIq4ZWfAgLfzTui1O2yK2L5tVPIY57KxdIH8+d+6PB3Qf0+fjEPNXY9cmjbOl3oG9TdWYLECZAoXyk7cqMmayeMrNS2FUOzZG5fwp3nXfVKxQdBFRRSrLlBd1sTwd136bPcK7hhjzmtHY7FAyWdKNwoGbQ541EV2i6l31f2FjuKPCesnS85oGahf5oLw2FxIRltV1Wf9vPRcLKdYxpeCmPV/sJlQ11VLB0XZ2kRMRCN8PBRXnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GCspNjbsbsHk6S/HAwg3ElT8fUvf5nFv79mIQDX0evw=;
 b=MEfYRoWIbXKvLmx5S6joEguJXl/JFjGtFC84lHXkzzpJtbc6rp8ekcPcBsIOnE7C3oSDFNJxK1GsHjYPR49Ou/+qmE2G9J0YT3mjVUApiZKMuqhEQLrbVpzJ8OESRGDGf93LYuqgh+YnmcRPUAWZ1LCYJGYjUffWO81oLXepaNrtHHsgfQuYrw8U02LgE9HqXnsfLapizDwjhM3fJ/lMh8fCq/kqndt/yMdOin9Ibegqv76ayseHhRBBw/wRbzO/U8VxNWIdJD7LxfOn2y++gNZRAiKjFytEjNr0C6IOej0j18ZmvAQhjQ/6zVDAvpi714NLKh5Om6k4Ykj7RjdOcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB1768.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Sat, 21 Nov
 2026 07:01:43 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%4]) with mapi id 15.21.0639.011; Sat, 21 Nov 2026
 07:01:43 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: jai.luthra@ideasonboard.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 07/15] media: i2c: os05b10: remove unused control fields, simplify error handling
Date: Sat, 21 Nov 2026 12:30:57 +0530
Message-Id: <20261121070107.1768-8-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261121070107.1768-1-tarang.raval@siliconsignals.io>
References: <20261121070107.1768-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4P287CA0020.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:269::13) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN2P287MB1768:EE_
X-MS-Office365-Filtering-Correlation-Id: a6278da9-3186-4752-3272-08df479d4c7d
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|376014|23010399003|38350700014|10067099003|56012099006|261021123027099003|261021121427099003|261022105027099003|261009223027099003|261028144727099003|261026121527099003|261026140227099003|261102123227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 3/2QYsJEyZMHrIyRh8z0ioNcN0cyRiOnowJp4EvRpdww3MQjhcdNPDfTF2u399J4ze6hUbMGcshnDQn5VxQYWCuEsDdoT0F4nmxoRZ7hT0NywzZdouInMgl9XO0ThM4UfyS8RjscZ5xEqNtYi7/c+3xTHEixvIqQf0esEVEp8PMuMTmRgMMLLfxIWDsjd17j8E8uukuPeRGN+CoZTlNfFHKpClPzwE4hZuENFuuCEt5DlJOuYwYXX6KCqZrI6htZpAkiSFuJI5p1aLU/2A2ZKR0zGNwYPCLeEoNAmQdw54UZ4rV1zTYGeXLnaLmocVEPO0Irsmg4WMUVBOQ2yFzLu7mRQ8bVUwE8UR12mvKDjUKFeHdgv/LMo3RihFBWboxU4OK869nQ1hEXmJEOFFbtncsEMSU4F8tu5h5KKdUkmB3miZLo8FHfuX45r8I9srR4CFFF39mu2GDTk1NtrcUASgXYu4FXJhYkVxAN1LYL5Cg91Ix4Vin/yf9ZDL6b5lRTi2dbE7spHc0h936a0faR8wsLGstQJjo8Z00nBH7K+n8BwcoZlu/WlLW38Nbm2FQVAeTdl69PpijClwlnC0DgjLtjRTexVLNGZOEH/Ii888exdPkWA+T5M1wg5UqxSLjX+1r8RoTVqN8pV32s1pqRgsmtANYx3cvkmHAvpGPGhz8EdmSg0h6dbhwiTVGciASgjaSVrnpj6RlUCgVktPc64uH/vzORtu0LgOelI4pdhiI=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(23010399003)(38350700014)(10067099003)(56012099006)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003)(261028144727099003)(261026121527099003)(261026140227099003)(261102123227099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?xzyPXR48z0X93+THJBRQMGogRxG5bUEsXnjauq7HytZlbSlOPRA3TaUx9wP9?=
 =?us-ascii?Q?B+tDCmE6jmAKpABTeeZufX+wQ5XOzl25muog3rx0b06r+bJW0fYW2wV1X1wQ?=
 =?us-ascii?Q?RXeNUninR6tAvFvOA+Ax9fEoB88i05K/axz/43tu1FUCB0Nal8jPttlKUX5l?=
 =?us-ascii?Q?007LEytZvi4hpCtYrvhnVydktE9EZ3s8QODbh/KI0ql+m90PDJMV1cp2LSS+?=
 =?us-ascii?Q?gfMBrBmlU2PFM/9OTLUp4ayARVy23RFpu4KFP5d0vhFpheO3oe1AdboGKWei?=
 =?us-ascii?Q?/Txf97Ei5EMAk2WiWUP+otn1jWoZXenfPEyizhVBj7GbQXYX9h4LEXS1cUT2?=
 =?us-ascii?Q?UhQVfmVKNm8ofD0wu+tyu/jmZ7dwdFT49j7rBi+A8o7sr3at0P8Dv9WgeN6s?=
 =?us-ascii?Q?ciMzAWNFgpIXydQc+Oo9ffw99hfA8m99FN+k94px7RVEYsaNeu5p6I4o4z56?=
 =?us-ascii?Q?+h4JR2eyLYp5XHf6jzkhANd0J/ljdMIYKYUtPZkPwfyuV4hX3tAjrVJQo2y8?=
 =?us-ascii?Q?YgLk6pCKWgp2Lb5lctKrmCpWbhRMRS00VE9X0R0CL51nttJzbEApfAUjD96C?=
 =?us-ascii?Q?qWqIljyMTsLW11yRbaEbDwbWNsaRIxc8oQnJ9aMTFY1rXo49g/Pi9spgRHiL?=
 =?us-ascii?Q?snNtW0U2sjBrvkzWuXEFgZDcOchR2RGgAS5aSCTnDVOv5J+JoH0b9Cnqkqiz?=
 =?us-ascii?Q?ZybSdbEmtmnj7pzjRp/gsvTGXm5vsujBP4nC/GgxqzQmB8yAvxkdMvAapwo4?=
 =?us-ascii?Q?JT8Opxiasl4mPvCKR5uKvDAXGd5exIichQM5MJJ5O+0B768vlPbOSMnsUjzf?=
 =?us-ascii?Q?8gQrggmUYlbWwCqhjc9jejbGKgfSvygP9memmx0JYOIMMrEBP2kff+aQsKnQ?=
 =?us-ascii?Q?cnJNfhjiedmylr7hqCR1SN3NLI+/yfrTDANiTucqvk4WvbKCosOPOY2Igv4I?=
 =?us-ascii?Q?uLgE2jFkEUzS64sy7SZiPOyNztO+qfzcQpktggI1752Om7T/kR03TcZUx5M2?=
 =?us-ascii?Q?z6twpgc6BYM9r8h6TOPgSkxsgxz9hrpGIfsDfmZDqJNf9r/OzDM/1XNt/TN7?=
 =?us-ascii?Q?HLh6+O3hF1y1q8WQsKMMFDgraORfqXZHVkmdzV8JDPgeQqAq0YN8zLf1ZCsJ?=
 =?us-ascii?Q?gx+5YrkSSCWTyYLt6t0INSgtTMas7ILhCE+M9IbjWmgx+2QcFbBIoz5IYgCc?=
 =?us-ascii?Q?hUfNKxM/idp3NoqRt8o3H77svSQvEDnJNA3Z58OYzsgWrgFcF9EGMStvEYIb?=
 =?us-ascii?Q?a5IQLHk8rs9fW1OiUMBmcO9nEV+2adj2F3IkjSEnY/P3OImh0t/PB9fsEzAn?=
 =?us-ascii?Q?ncUkIR3ScAz6luBgljJYz6YwPQwoU3aeRotFpXWwQ/pN9JtIQm3zhw4h4eih?=
 =?us-ascii?Q?ozNBVyoUdWrtWZacR+bB0GwHYe1gOxykvjZcky0MKmSdzpxYw2ILDoxP5MIn?=
 =?us-ascii?Q?Y09C3XoxOnh5mv90lGVXJ4unN6U4W/HzKcK1Y4zqZ4oHJZmP4913e9F66HjU?=
 =?us-ascii?Q?I1RtSzoFgJI1iwunHmwWmwm5xLrJZgWobxGgykKclDGsBRWVw8j4CDzYVwHi?=
 =?us-ascii?Q?AdNSd5oJEi4SVfdcVF610Uf+bjR+/9qnQo4mIyAh494ukYq9kC2avQAajL4j?=
 =?us-ascii?Q?7cIflv5xgOaQZhBIKewSpuj5yZFg+Sj0z8gXa7Wj+7h6zsapY7J1In0Nk1Hb?=
 =?us-ascii?Q?VOXCbYD1aIDcEm6vHkZeV154gfEPNx88DJGu0kimky34M/tNFv4wE5D92OfF?=
 =?us-ascii?Q?PyriTGpDKIyWVcbNVohahhXWuE4XBNA=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: a6278da9-3186-4752-3272-08df479d4c7d
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 07:01:42.9688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cr2MpB8nliR8yAgNoAlCX0HxVFP9Jkwv7pOKaocR1Xwki9jX2qi5jMqo+yBG7oiw+uTzUbq0h5Qb5iGLw/sBTzXptcJIHefnW9Ii2pI8/NY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1768

link_freq and gain don't need to be stored in struct os05b10; make
them local.

Parse the fwnode properties up front and register them before the
single ctrl_hdlr->error check, so all controls are covered by one
check and the per-control NULL guards before setting flags can be
dropped.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/i2c/os05b10.c | 54 ++++++++++++++-----------------------
 1 file changed, 20 insertions(+), 34 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 46d514d2a479..c75866489e7a 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -457,10 +457,8 @@ struct os05b10 {
 
 	/* V4L2 Controls */
 	struct v4l2_ctrl_handler handler;
-	struct v4l2_ctrl *link_freq;
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *vblank;
-	struct v4l2_ctrl *gain;
 	struct v4l2_ctrl *exposure;
 
 	u32 link_freq_index;
@@ -920,8 +918,13 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 	u64 hblank_def, vblank_def, exp_max, pixel_rate;
 	struct v4l2_fwnode_device_properties props;
 	struct v4l2_ctrl_handler *ctrl_hdlr;
+	struct v4l2_ctrl *link_freq;
 	int ret;
 
+	ret = v4l2_fwnode_device_parse(os05b10->dev, &props);
+	if (ret)
+	        return ret;
+
 	ctrl_hdlr = &os05b10->handler;
 	v4l2_ctrl_handler_init(ctrl_hdlr, 8);
 
@@ -929,21 +932,16 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 	v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops, V4L2_CID_PIXEL_RATE,
 			  pixel_rate, pixel_rate, 1, pixel_rate);
 
-	os05b10->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &os05b10_ctrl_ops,
-						    V4L2_CID_LINK_FREQ,
-						    ARRAY_SIZE(link_frequencies) - 1,
-						    os05b10->link_freq_index,
-						    link_frequencies);
-
-	if (os05b10->link_freq)
-		os05b10->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &os05b10_ctrl_ops,
+					   V4L2_CID_LINK_FREQ,
+					   ARRAY_SIZE(link_frequencies) - 1,
+					   os05b10->link_freq_index,
+					   link_frequencies);
 
 	hblank_def = mode->hts - mode->width;
 	os05b10->hblank = v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_HBLANK,
 					    hblank_def, hblank_def,
 					    1, hblank_def);
-	if (os05b10->hblank)
-		os05b10->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	vblank_def = mode->vts - mode->height;
 	os05b10->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
@@ -958,36 +956,24 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 					      exp_max, OS05B10_EXPOSURE_STEP,
 					      mode->exp);
 
-	os05b10->gain = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
-					  V4L2_CID_ANALOGUE_GAIN,
-					  OS05B10_ANALOG_GAIN_MIN,
-					  OS05B10_ANALOG_GAIN_MAX,
-					  OS05B10_ANALOG_GAIN_STEP,
-					  OS05B10_ANALOG_GAIN_DEFAULT);
+	v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
+			  OS05B10_ANALOG_GAIN_MIN, OS05B10_ANALOG_GAIN_MAX,
+			  OS05B10_ANALOG_GAIN_STEP, OS05B10_ANALOG_GAIN_DEFAULT);
 
-	if (ctrl_hdlr->error) {
-		ret = ctrl_hdlr->error;
+	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &os05b10_ctrl_ops,
+					      &props);
+	if (ret) {
 		dev_err(os05b10->dev, "control init failed (%d)\n", ret);
-		goto error;
+		v4l2_ctrl_handler_free(ctrl_hdlr);
+		return ret;
 	}
 
-	ret = v4l2_fwnode_device_parse(os05b10->dev, &props);
-	if (ret)
-		goto error;
-
-	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &os05b10_ctrl_ops,
-					      &props);
-	if (ret)
-		goto error;
+	link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	os05b10->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	os05b10->sd.ctrl_handler = ctrl_hdlr;
 
 	return 0;
-
-error:
-	v4l2_ctrl_handler_free(ctrl_hdlr);
-
-	return ret;
 }
 
 static int os05b10_probe(struct i2c_client *client)
-- 
2.34.1

