Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020098.outbound.protection.outlook.com [52.101.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208D236D4E1;
	Sat, 18 Jul 2026 20:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784405390; cv=fail; b=WJgn3xrhN7A268jxbiEr4G1Kp8bus67T3PdhBH9KJvnRrqFuJ24MwcNjGHNGy9+2d+AU2NesS6lfGSaGSgDpeSxcZTbtkP2z9UtriYpeOZ53QYdO+FVC5UpeYXKe5+QDDBy6mM16welyeTPdNzjXoAJPK2g2E5OHHUhZNTKQcTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784405390; c=relaxed/simple;
	bh=g3Uy0ndykGe9VoH1vrHeui+fFWLFsfjDExLFM/UxQpk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dFJCJxujChHekAdnywinWt5lrcgdOCMYWBbfnjOocEYi1wrI6xZ5z+0rGrRkvzODY8dLVp1c4Hg1G3671r4z/SPJbmr57r+J73NTfDlhnUI17Nk1f2I+W2w1Hj55efzEekIU1xPandGTs0kqCG833KK6JtTPtgUBsGV8D4zZFkM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=GykSLOBa reason="key not found in DNS"; arc=fail smtp.client-ip=52.101.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="GykSLOBa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wg3OykdvQgvtTyYrO+evEdJfbbeo3yNp7+xmH0v6FxggMkbyV2bE5PRUhXt/ArudiS/qPWtHzr2hTYTKAOCU2Llw+tgu/TA67sFgz81Wj0w1FUOHdSKTfNc02oZ1HZoK9pDdFM7cT80qLq4vqF6FNk9jrv+hPOUTSgc355rtntdX3RVMaN+CTKTQ5FjjhaREo3vwpsltKsWuEsF6Z/OuiDRSTC1efW8gDm8cHqLqOsRdNFgbIy1AB6E7yrRWP+skXudOHn1dr2j8Z+Ar5tWl+aYHzzgBBFPAQ/GATasvQvZTYKW5Ux+Z/EW0zRWuwApAKbZ3AaF++inRCuKwyQvU9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MLpq8g7CRlQ9oZV9Och3/8B49QDOschsCqGjxTC5ylI=;
 b=ZZdrBAYSdT/FAG7ntMpIzAsxZ3DMVjJSUUS0E+AaGcPop/ffQEO4ozf7AS87Fjb/l8lmZ7w8h3I0GKNuKahr76mAmQxOp4XsmetCSnhzTUxzmJiJn09wlitTJCezbV4/cg2N7ca+auQNNnQZ5MX6ohCXDk5zaENFSm0qMu2ZZ/QCGuQBPen+GsfGmhhaCq+L037/z7lxdUwz0C4vbKMQBeH81YYWqgCmtOkMO97fDKCQKDBLx7+vzdTxTyKaKB/qKCz+Dfgsi/TXyWb7JZpi+o7YU7hzKK/azcqijDED/JZBAJ0JuhTq0LC2wEzju4DUVaz6HG/PVWrXIwIiZPudUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MLpq8g7CRlQ9oZV9Och3/8B49QDOschsCqGjxTC5ylI=;
 b=GykSLOBaVPV2tqIaIXb+aGNgdnFZjoVu6QESCbQ6oqLYuiZmykARJnr1A+4Z2zeFjY+q/2uHPD0Dr/HWKtUkfl47aPtGz/QGcgh4jQSJ+v3o9MEp/4VdsBwYjS6Ey5DIYgmSuo2rVyAG/nG7Cvu+rOdRvdadPGV/lDPdOO3m3NmrAaDq5cK6Ewiaqhm8ItRDIMsqng9e8Kj1IY2yBYFSLAsOXC0S2GyNLhczwioaSIHhMEZpe0xjdrw/B0GbDmH8JJffPNdos9jVZmKHuNEfpJhRTdT6HvNMOI3tbudtRmiesar/0+SBQDB4HK0wXI1WZe1qlujFsyCii5B75Nv5Dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB1343.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1ae::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.15; Sat, 18 Jul
 2026 20:09:45 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0223.013; Sat, 18 Jul 2026
 20:09:45 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	mehdi.djait@linux.intel.com
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 01/17] media: i2c: os05b10: Use pm_runtime_get_if_active() when applying controls
Date: Sun, 19 Jul 2026 01:38:52 +0530
Message-Id: <20260718200912.16001-2-tarang.raval@siliconsignals.io>
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
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN2P287MB1343:EE_
X-MS-Office365-Filtering-Correlation-Id: 50e9893e-0c30-4485-9112-08dee50882ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|23010399003|376014|52116014|22082099003|18002099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	NJX3d6CSEDLn7aVEKMIwLCZKBw5JsEYzINWzfhGON5SXJCh5lzl1fAW0bQ5HiOa6psM7P2UZ7npwpjKLjxV4yrwo4uxmcHJPQY/gb2AVpPTsFzbgu4FkAyVu9O6QwFuYff/LtfdzHdenIzAOUG1s2ggTr+ZYu4Amv7Vo+nbOq//RG0NxAD1DEItROYMoLDQBxY8qAwkHqj50znyqTtLRQR3kcXrIZnSPefUlEJhdHyQ7lEdjQKkApknLQ29vj4fCYV4Fo02TADa5PECCp0eW5M/4qAx3kE5c3msWgLo2dQ451euxvwHXDg68O778UCsoro5YSNzPfGBY6HqaeyUMSu9bjRk/snu9Tx6IjiFbcHN+qWIhn1fzD4Gipj4yDkmye9kH5ON187r9l42kewlK4cmOaYI311bCxRsM/ZVmq7NI2K8K5OvuJDMmUPhlgD4KqNeWnJvQoEPt1fTByVhABmyhA4RMR9741rV6hQwFqCYweKoZnK/EiQ2n2oV4qT3pctJuKrOW0aH7KTv5xDxzxCrcIylVjOfHEUN/cZWV3YQk/Q1vJWp9uLk4ZOoEdvfjBUOsoLfyA8AgOgwXUrIMklmd3kIm+EzK62f4i/Y8EBcOIyprySi/h0DfMQ9nkv5DQlfHH7ZAKoW69ASap1IMH0POXBvwdPNY0G2d0JHzegg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(23010399003)(376014)(52116014)(22082099003)(18002099003)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fWWkRWXQK0bcljeJbtJCwz79/R3kdhwqqz9/fjsPbElXrQhWh8Ymzol5D9Ai?=
 =?us-ascii?Q?zesejjAFp9qxOuConT+8y9yHY+nWsnlBTyYrcqhUrLzE7q69pIKCOQzGqhC2?=
 =?us-ascii?Q?Zzw9W3oyiDUReakBfcvsbblaIjR3RvGFF/oYWAy9I6I+r7smMYjT3FJZDBMC?=
 =?us-ascii?Q?JgjspD7zM9B8afCKFPL/5cCGsqG6hhSgNWTlkenrpxK7pM84JhiG5Isn6tTO?=
 =?us-ascii?Q?6RzD5jkFX7w135oDqOF5VEkao6X5Tp7Ibvosu6CB+fFz0d6mIiXRSG+lUf2j?=
 =?us-ascii?Q?+x6ZyB1w2J0oE3oBcOK0yTlWqpw9Ij/uGEBBh6v/G3iJege9q7k9Wxj+lF2A?=
 =?us-ascii?Q?GfpMZgX6um9t7/EXrmHf3wdDLzEG/AMn1wacX5dhOsnsAUNmCcaJYpYKmBmG?=
 =?us-ascii?Q?FoiIc3FhOcyQHyZcheRxhAWE3ILRiKDU1zLwVVGmVbOrWHpXxhyHKWKLePT5?=
 =?us-ascii?Q?RJYIz1awFlwyUbV/He0jSVb5X+wbF7l8Adf02xn6hdn17lZyRvBogf2ZA4FY?=
 =?us-ascii?Q?4Q/u97YaHNB8heLpCFP4vC9q6BA341RxrBjlK5n6VQ2ireRE2FXlWrHdBhkP?=
 =?us-ascii?Q?UgFvxK8qDDO9QexyYh3U+6k5/fHkamYe09iHkSjp2pHjuxe/QSRk2DaeRvcY?=
 =?us-ascii?Q?A/xtg4yWHDQDGK3v4vhQya+dZ4oNNptL4KR9ZRPd1TT8tt2dBPRshjiguh95?=
 =?us-ascii?Q?WSBwDIG9ArkEPKSiEyMNS4Qzv5mRhuGPcg4GSasQSt9BNlycmNh+5DVnPClb?=
 =?us-ascii?Q?I4I2AWHX6Khj19p5+mwSilIjULLTMdXn5ePtS+H5ZRQQtX0hMzHvdCifcK62?=
 =?us-ascii?Q?kRs7n0juvMn6MAncz9i8936YvycnOh7MhUJaB+xVBuCj82H4kw2HdYl1MaQg?=
 =?us-ascii?Q?CMIEG+LZNAR9styLtl4CeOAcIlTJwB6Yf7WWK/uptNYGHfI4chf5rMax5Hzk?=
 =?us-ascii?Q?MFwvWgtrn977ylGsqtB0n/9S7BtQACT1vE9Ym9RbvZvFcWw5Eb+6vVErUV2w?=
 =?us-ascii?Q?WlXd2PZfz6/HbDbgcCi6ZtFTqLsyw2V0pARwFZ58FIJPz/iPleNHVR4T07LH?=
 =?us-ascii?Q?M1qfU1LdTLBBuoxpZxYFa7UuVdODDhcmFET2GANuRGg52ort/8p9jDyxHRfK?=
 =?us-ascii?Q?zPlY9jD2wFDFthLmXaRm0L8NAfB0hCVI1ESg1vQTAlCFPmwdr/ZNt9o/pOHZ?=
 =?us-ascii?Q?ksp2W9xP/M2K/rDH/qjqfcWb6sAqzb5tP5vxZdTk+UJ6rChkGL0KSJ0zAH09?=
 =?us-ascii?Q?AuWRivDgUoPN27TrFwdFFNIv26UcKaK7Rs0TJr7kZPF64E4APahil/LdTiUe?=
 =?us-ascii?Q?SK7OJ6FKljWIfcF82CLMHRZSu/imuA68axENRiH/phTMFm8U9dUpF/+c00qJ?=
 =?us-ascii?Q?K5CybIGE1qo/v6A8rn5EZU49DCObPH8K9Yul7XFfyqRbHkje0DDP9sSrM84Y?=
 =?us-ascii?Q?pslH89fBDyZo72FHTDD3diyKbCKCuxDrpppiSDStp0BcRBfxI6GmkrhZqrRl?=
 =?us-ascii?Q?L7p33nC1Fe8vgB4BX0FbrvbbXy8Lo6Rk5Emr4S5Rv0ap3lotC6MrUG4MkPlY?=
 =?us-ascii?Q?CK/GCoQHVHWNfSg+JTxKrne+iCBTuYjGUSo8m02CJY3TlDC5cOD82Q8CyS9A?=
 =?us-ascii?Q?/mYHvmYnOLFYsFdOgwEsw6HcQlWBCKUAZ85yG38JX9IP5mgONd4jqPDdvO/0?=
 =?us-ascii?Q?A1SEUH1zumYdgmpayeDEFrLBr2ArDeZdks/lrYFjRI4A9iibnKpV8V+JCV5r?=
 =?us-ascii?Q?dSF4BRQyiUsB0f8TvD7juJPiQddXRSt3NlkmHeNJKk9rNboAMiNvnDjXklTB?=
X-MS-Exchange-AntiSpam-MessageData-1: qmPVEFfOEP8P0RnHlFKsb8xY6aqaBocSwDw=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 50e9893e-0c30-4485-9112-08dee50882ac
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2026 20:09:45.1043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XkDoLKTC+qAQ50UQdNkg6/pZt/ZcB2QO3lyZirMEX3MN3zjOcHHcQ3gZ0B6mkbZlBvMlRYWaZtlpbzMTSHgJGbjeHyBrMkLZmF6klFrVbiY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1343

os05b10_set_ctrl() currently uses pm_runtime_get_if_in_use() to decide
whether controls should be applied to hardware.

Use pm_runtime_get_if_active() instead so controls are applied whenever
the device is runtime-active, regardless of the current usage count.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
---
 drivers/media/i2c/os05b10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index e0453c988e4a..3e0440220c07 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -531,7 +531,7 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 			return ret;
 	}
 
-	if (pm_runtime_get_if_in_use(os05b10->dev) == 0)
+	if (!pm_runtime_get_if_active(os05b10->dev))
 		return 0;
 
 	switch (ctrl->id) {
-- 
2.34.1

