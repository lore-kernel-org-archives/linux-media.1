Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021085.outbound.protection.outlook.com [40.107.51.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4B636F902;
	Sat, 18 Jul 2026 20:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784405510; cv=fail; b=Yp2y4ILDucitOPfrXGgf35J1VPBeUM5L/cTnNdxwFLCoUWi3g9JmtsWxgeepl2UtAtHHCKDmwEiyhIB62EXxSgYy01SP3G9XBjiXxFYS2PvU6a7eAJ8wf5i67fJKbiosmhzVxrAw+tDiJd1nIGNFQI+cONL5K0RaZuRYq2HgSBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784405510; c=relaxed/simple;
	bh=n8z9VdJyr/zCI0kZAQkjFPuJDdsTS9s+E9L8R3j9CUA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ORxT+gJPFvziIdITzkIitmtrIsUC30Mv973B1tA9Vmns/t8Ct3ipXTiAsi32TKVMDeVStGn5iG2j1RynFWEIGHoyX1qNRfFtPS+2pHIxsv984al7ClOLH2ASJb6UNAWcg6gfmrz6V4+Jz2X8pmTAIH1QU3RGZ9uynXdw4sli6i0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=M07LGn1U reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.51.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="M07LGn1U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YkbEOf21bNUiN4lYjmbA2jP2XeoW8W9F0PQzLZQxI/NHEDT0rYC2QXq0JGq95IMQnTw6rRBLrH65tzveJwwdg2DeB0kn4+vKeOuDtTWUoT6nSlquuD9VLB2mzl+LtQwV08b4k0YV4VTPwYEKVZStNnjmnLvzYzB9tU5/teo4nFR7em9YEXRcIMakHjJQsimcMnx6M0/Hee3Ec3t9ZUHFYuSbVx6Je/MZH1mOUCNoy0xxhtHNysfxnJC89azN2VbSjWn9qH0wAoIOGROZXcsQovHTnMNLyeYMspl6DzuAg9Vl71qOq+rlb+wABCH0J/HefTaeyvmwEfmfMwZUA9yibA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gc5OCCBuEaJ9NtHaiGUIbbOyhqH0G8dD4fStrEfSsag=;
 b=crM7Q+bbMfxeTda0MIbVak69DAdaxosNo5H4QUniACGQRYLs76YTMSnt9wU3OeKjwwHZl0N5rAHZnhyCZKbx5P517uShHyxI0ssKUf7ygXSYhEKjlE6RxTIyXH0cQimigefULSwCJ9ZTDuuJJXv+YuMZmBytNJNbHencAmhZFxa99BrUGpd08GFXlV1UHuub/B640lcqtRj4UBLXBAeEzh5LeUN+wdbHQy4o1+IFls5n3Jg8FSzrZmVVuaqSP6r+aNiW/FTzuTNF7Jdk3iWsqhxZCAbCwKB2trU5suDOTiONZSIAeZdlsUYoQCmE+3fTOEp/W1vfoE81F4UtJTzC5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gc5OCCBuEaJ9NtHaiGUIbbOyhqH0G8dD4fStrEfSsag=;
 b=M07LGn1UQUqs6Nj93Tg0D9i8toXG4oDj1134L28iVs9BB8ow1fSPMKHdr6ZAYvT5pJ6YF28bAUqZOEgDpsyCZIB7tKQZDQ269wKLa2y+9zYj4TNI3yfa0OP5CZqVJArty3POx5SkCDBxb+XWc5Lx2wIuXDobfI/PGhOFQBuVe4ypY1zD6brjbGz5q7iOGdgOMub0QUu2bvY2pEKxCBWbTptJTWDRgjCJSsVlz6a7j8WNaIcv0N0LhKJGNmwnA5FpN7ZvTK3Vhs7sRSV3tk+XyQJ6vs9JTRfuhaWFX6wU0hx6Hxs3wAzY9gIfw8wj9xx4mgEa52uwQild1Z7iA6NH1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB2078.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1c2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.14; Sat, 18 Jul
 2026 20:11:45 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0223.013; Sat, 18 Jul 2026
 20:11:44 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	mehdi.djait@linux.intel.com
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 16/17] media: i2c: os05b10: Enable runtime PM autosuspend
Date: Sun, 19 Jul 2026 01:39:07 +0530
Message-Id: <20260718200912.16001-17-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260718200912.16001-1-tarang.raval@siliconsignals.io>
References: <20260718200912.16001-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN0PR01CA0018.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::23) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN2P287MB2078:EE_
X-MS-Office365-Filtering-Correlation-Id: 907110c0-df20-446a-5dce-08dee508c9fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|23010399003|10070799003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	1Gm+Cx5aU9mh2ad/EZ9neq4zh8XyakuV3VICbLUhCo/AuUJVD8/BL2jK4gcy3DgvXFFj4E2zogPUAuqrXB+Q9gczpD+MtuMHJu7gLw51lMdEPSwF4HQ+WT2FgRhSixSSkWx9a2XmKI+YwdfwoB3KyDD0n5PNhkAojtYuq6Ygv++QZbpm2NP1wnpPNop2/WNudJP2+Efb+kyqPWozA3wol5RmxURFzvPMi+3a3GR8Q+9Vb6nMB/DOHoc+71Nd5hgPecaUdDMFawXEG6lmmuSIiam/gylGod4qnqRl5MbAVNh/2DQg1im5Mr5gb2oqp/CQ+c03RKGH/Dm8AXO1H8pdPAbTO7MVegmIhFoaucuuTPmy16Aw18M/YinANm4GYE0FgEMGMvizuFpeNxT+W06UepDKKXlzJIyco1aR9vqNslL2LLUhMVWzwOFP5uvp+YTw9dvwxxW6Ky+G1GSAttuiRsN6xOdIYnPqjPJXqJiDZwM/FxfFCYu7kSvv6RGB8iFiLgh1lFbKzkCPc/YhxftgZqFHcT3DCJjny8oC7TXyatNPJAtm9zaUITL01NrQyNo99gcbK4lVujHPMR4/stg7nF0CUxewFxeaSCokFGc0mzlkXnf0u26B6iUzrJrYGAWN1JD9zOfXJkHa6eXNrsFX7wPVTGO1NMuEAZw8og3PYOI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(23010399003)(10070799003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0/BBVdTpCuhomXQhIPIPe6oyG8SBtghsHALatVJ4Stk7k/o9QCy9Eu+vNI8o?=
 =?us-ascii?Q?DVdNLgc6zKCJ6ZqH81dJxBNDiB6ZxWuJ9V/crI8ejacq4p9w22amI5d2cy1I?=
 =?us-ascii?Q?rG/kDTM02SP2cGjmSXTiGe7X/7UR8s+WOZzhINlxX3BvMgQ/qKWNSmgmruM9?=
 =?us-ascii?Q?js2iGlCToXBU8r0yaEQGl9vMOY45FtOeQpqx/ijQydcD86YycAVer8xpmYgE?=
 =?us-ascii?Q?IypVrmDyYWicJsKdqd5r155Uqlvjjl9RExrVyGHlRRXX6ZN6wHA9nIn5dpsZ?=
 =?us-ascii?Q?jzODxnxn5aQBy+iIOAXM+xIP3PSJIBkDW85kcACi+WHYO3ZMwb/7ot1QFGMT?=
 =?us-ascii?Q?ppZhaah0Tc0IDwDLGEvSXQ/U7Zidy92MuU8ul1+qkTVCXuOjvd6AuZ16wuVg?=
 =?us-ascii?Q?6dLM/OzF2Ua6oM9zECMMChOraSi2kFwiFc8heXZsaWQ4EzjxixTmwR/E0bJU?=
 =?us-ascii?Q?wW0+BSp7RB+ULeT7QDERDXDR1hagJ2YREfYHnG8N/ZJ/8oJH3nvW75k6YoPC?=
 =?us-ascii?Q?nvzihuSWhnCQzQCH+HhQzZsOiNVq7jqk7uj841bcVUMvPhK9m/xwIO36FImV?=
 =?us-ascii?Q?DdC4qCbcXd8YEJPXdoxbAyI27VxIZozps7PZhSan6SjE7AwVZBYSLFAyVtYd?=
 =?us-ascii?Q?j5aAdRMjLcebjS4HVtKQG0D620t+SC/OUlAuFaBi5oX+mybazkTJli5ALSPn?=
 =?us-ascii?Q?q0ckG3ZnarvtSGD1r2HICFE/5nJcp/r3Br+cdNCRBN9JW45hvpeug/VTWhF/?=
 =?us-ascii?Q?AL9ZFuqe3v8Jd8FTQJrnOIRVX8hWz2I40e+u82rfNO4hwxIiAUcPiRgfuDHu?=
 =?us-ascii?Q?rejenX9BTBzNLYeGIuGvzDpCGBnheYdPhqG2hz5xQXM/O9Ahue/rI1Nbp+DU?=
 =?us-ascii?Q?jfnQf0xGzL7p/a2GVN0kodS+URxd0V6Hm+W2tYa0huGpnLyQ1byq+HkGKgK5?=
 =?us-ascii?Q?daAjdd3UbrIWStddLvWuPtR4KxQbdqs0eJlSzGJiP0yq5UnycZbU8X7ELkTu?=
 =?us-ascii?Q?edv51HqFRGJFx8oMGV9OZAyB/lyMlLO/VsQPTpIkTkOIg88erYOiHgdHp1Hf?=
 =?us-ascii?Q?EwQzvGOB5POcHvO3VBzPUgEyVXe/IzZ7Q/1arDE6dqeiHH5jIqEoRJRrNRvX?=
 =?us-ascii?Q?Sv3MvL62Qy5yOwy4GsSNhdtOHjbDOFxQbLMKvVJXUYzxCJK9RPDDl12AY4Yh?=
 =?us-ascii?Q?iB4U3h4k2W7SDYCvwJwg3EdxukAAYVGgCBOBHjmcXoTrFuzd+pW+D8F4TfLu?=
 =?us-ascii?Q?58bTWEt0SuxFyPZXwEwOocDO/6iYKolMcKHRCdX7L+cCy/tt4SF9OIDwqhd1?=
 =?us-ascii?Q?jePGS3G02DZPydl/W3pAprisVp+YS5hkeS29582M6TN9fYvrnULBQJn7iTrm?=
 =?us-ascii?Q?dZ3Ga2VfK0MB6+KTgqY1Sot9KJ6dPJVYfrzUFRAG9IZwAhjxDqDQ4SIzcYdd?=
 =?us-ascii?Q?sRdhxZE82JnSos3ufayG6mI9yvIVVJqFu6u+OSQGc5GStrm6vJyWWyB2jkXG?=
 =?us-ascii?Q?B66oK9mP2rcWJFC7KOclwmCp4kXfFHWuYlnuHcUh2fH3+6i5mLT2QZc12s96?=
 =?us-ascii?Q?fIxd1MixTRSbs9pOFxeC7qUtXRCdte3CpZyH5CmqtKQzOUjjJJmjXCwDNpKM?=
 =?us-ascii?Q?NA19ybikDzbgV8v0pBrwK4voK75ivCRC77zr4blvT7ohsy082JZigpfPLvPw?=
 =?us-ascii?Q?ONo5g2dIL5QbRkBfNtpN/+8V4vCeUd42Yl4WJqn+CWiA5qP46gLlkhw2BszT?=
 =?us-ascii?Q?y1KP70s98gaNc65WnmSK0b/lIVtkTgKAXN86IlMk6r/0FYuAiQWSnz7ZMiV8?=
X-MS-Exchange-AntiSpam-MessageData-1: mVApXUrVJTAWQmaAO2FEa3pJiligCrXfZkA=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 907110c0-df20-446a-5dce-08dee508c9fa
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2026 20:11:44.8451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AoxqfhyYvtzUAZONSFwUR2MbXdTRZkyAMAyF0caPnqs5BzeyRygVJ/QW6+JvZ5avx4huUvHKEH8IOCjOvbWxbLlRwSLEKzyMadWFnnd63Dk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB2078

Use pm_runtime_put_autosuspend() instead of pm_runtime_put()
to allow autosuspend. Set a 1000ms autosuspend delay.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 59097eb96561..b4dd3137ad5c 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -1057,7 +1057,7 @@ static int os05b10_enable_streams(struct v4l2_subdev *sd,
 	return 0;
 
 err_rpm_put:
-	pm_runtime_put(os05b10->dev);
+	pm_runtime_put_autosuspend(os05b10->dev);
 
 	return ret;
 }
@@ -1077,7 +1077,7 @@ static int os05b10_disable_streams(struct v4l2_subdev *sd,
 	__v4l2_ctrl_grab(os05b10->vflip, false);
 	__v4l2_ctrl_grab(os05b10->hflip, false);
 
-	pm_runtime_put(os05b10->dev);
+	pm_runtime_put_autosuspend(os05b10->dev);
 
 	return 0;
 }
@@ -1455,6 +1455,8 @@ static int os05b10_probe(struct i2c_client *client)
 
 	pm_runtime_set_active(os05b10->dev);
 	pm_runtime_enable(os05b10->dev);
+	pm_runtime_set_autosuspend_delay(os05b10->dev, 1000);
+	pm_runtime_use_autosuspend(os05b10->dev);
 
 	ret = v4l2_async_register_subdev_sensor(&os05b10->sd);
 	if (ret < 0) {
-- 
2.34.1

