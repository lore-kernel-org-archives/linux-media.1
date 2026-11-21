Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.51.137
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795244502;
	b=Ovdd3O/2fb7wVPP8wTaWa+DFeM1BmN/XJKLGiLTGAcVcSEp2WgE/AEgc4P+uB58DeVFX
	 pgSMdADieofbuSXXBPK8Z8RkyNrwJK8TzN7/2Vh8C6ntXMrq+4AHGrvTq93iKmoRYL1Y1
	 qcAN66MDmLLg+ZUa4jweap/cADzW7nlok03P14dPw7zdgxteAt+dI/Bb8VUVwEnTFy2uY
	 SIM8O5x9/lx7xkfgdL6YN5SL64P9W2TgIBeifkeQIQ09YR4HgqR0ZA2XWMvxic5o3DCe1
	 yMACDflQRbBCDFW73EtJnq1e4vYD3Q1lwz0CEu9WrY+kYDlQwVgaSjAqZdu/uuNXckQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244502;
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
	bh=+AQ/IYZ957tAoMk4TuSUGIoQLQYDbnG6/1GQBNZaDcY=;
	b=bIQvSGp7S4uo3ZP38OdrfmuAY4sYexK3vaXf3j+CaK3FihEXBtMO4NbmNTHWd+XCUE1h
	 sJ2g45/1Bnb4hHQjlTp3Fb9/IuyYKmj5uzbiddHuxnO1rpZfm44kkPuU0iy/GTgcvfnpr
	 W1qnzKshDFGxdPuRE1bYlbdm+ErbUTSwJmY1I86lPUaZiXAzmt7PX+m5bpxgsQi+JIOgb
	 4uYh6Sd6+zfNMgKQmaoT77VoYPBYkXY/q/WkQ6mxViQ3cqDAbftLterSVfQqLdCWrhnwZ
	 e7zT9+9otD4MHA7vOlcoeyJR+CchuArQj25AYkuHqLNBpYkfP4vkm2uhAJ7SfKxwrKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.51.137
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021137.outbound.protection.outlook.com [40.107.51.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1ACF606A33C;
	Sat, 21 Nov 2026 07:01:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1ACF606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P/KXcGinm/RXdHSbCcjO1s0OVhS7KYDDWRElzOjlqz28E7t5gh4RJSoVR0ADh4zPE4dqn65oBd4++Ez84fKlH3Z/AgyaY5ZML4XZVZlhKaQeeHz97GUehg5n5E/E3nBluI3ZBgwxUnV4Di1UjefKjXazZVkuzebe10+7ApJzuRxH4UI3tnwV9U3NRaU067plzx+HwderOEuemeMBu1HVWQuIvS3Cki+JgDu7oDcPhgv7qzkUu/uUqLDhJYCQf43LwvVHhIJuH5kym6v8W/LZ37y6SM0blPZw4em7tli7kmfVHUySW1/KYh8M7h4M4OwuItk4wVmjI6EkZDL/iVn5Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+AQ/IYZ957tAoMk4TuSUGIoQLQYDbnG6/1GQBNZaDcY=;
 b=nShtr6xmlzZgWpn69tQfl2HXP6XssY+GCD92TPKs90Uux/84BHRlhuBX8qXEjphkzyD+Ymgo1DJI7NBhqiH2PDN8a2uo1Bv+x/WZb+djTYtO0L3JcwtXauJ+1/bIQSxpUxQyDOvFaIApr6rHVZPnWxBlsDJa9U40iwffj1XGI8FgdGzvt/YRHewbdNyLunjzZQVfUJ/2QDz2dNqC4EuXlJfZ2tixcu5HeKeW2U7/ESRxepGGEcWCW8H3xkKQipyUXrc496g5/S/juSXcoqIwRz8AHWmCwExF588qGfLCMbiNW8o8sD8nwIE2nBTNcXpq5qvsm/3rz05KwmGh87TpSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB1768.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Sat, 21 Nov
 2026 07:01:35 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%4]) with mapi id 15.21.0639.011; Sat, 21 Nov 2026
 07:01:35 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: jai.luthra@ideasonboard.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 04/15] media: i2c: os05b10: Enable runtime PM autosuspend
Date: Sat, 21 Nov 2026 12:30:54 +0530
Message-Id: <20261121070107.1768-5-tarang.raval@siliconsignals.io>
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
X-MS-Office365-Filtering-Correlation-Id: da868d85-91db-4fc0-e6d9-08df479d47df
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|376014|23010399003|38350700014|10067099003|56012099006|261021123027099003|261021121427099003|261022105027099003|261009223327099003|261009223027099003|261009221727099003|261009221227099003|261009220027099003|261028144727099003|261026121527099003|261026140227099003|261102123227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 plCw/Z5YP2mKdyM7SB8O9fE2nmEbiuQgJ3R3r4EARy57BWwYuKx/V24VLT1NI/kLYJLV1yXjSsKqpSYspp14y3CZjEMYkWlSiSsnCEfPGdUEOfSHqUMogw/hzfTbXhkBHOH/+3Yniz9fKs5oVUMyTBdWkycFKuzubJuIIzPafbZsh/zYhyLEwi8Wm3CEJkjQXJgAVAPdEMcncmbe8zwSZxZ0epG2HV8CLcqnB1+hofYN/Ay942MFQTM68M5Ru49Cwm8ljnRDypvUFjAQ/3TEgWe7LtcCsGlz9Rj/Lwqe0JkIIDSKMFVF7BOJ/jOzJ5YXCvEwRAOM4sdRQYxpwuJH8LYybdAqoqg02Bboe+XyWjSR5qNWaYsXkg4iun/bSwZ7hf+qxQe+nYKk5XKGQ7qwah6v1aC9d3MbalkNwWv7pnKGH55aVvf5IcaBUYxkm9OZ7VJ/w2doEZtaJUDzHpa7aOOk5exq9qCO+WLn5DsSXxVhHAfoH80CER7LckmRS57l4BCl4AdHM7ObVK0cqK5CUJjCo290qEIvJ78tmnvkF9mUjwpsh3L9mrrkfkbh6p1HsTagYbp4h7ZfAigHn+HMk+JLw/jwoeBbX6FzwDB/V8vs9M7VtxY77F6En5liIRlHE0YoMuVEzPTvFKwIuLZUhWyiFr7IB1dXp4s4m6mT7nq+ypDZH82QhlEGpQv2dHvbu7cJqSQ1bUjaErZBKbjiVSA3WFk9lbbvAPGVf287bHw=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(23010399003)(38350700014)(10067099003)(56012099006)(261021123027099003)(261021121427099003)(261022105027099003)(261009223327099003)(261009223027099003)(261009221727099003)(261009221227099003)(261009220027099003)(261028144727099003)(261026121527099003)(261026140227099003)(261102123227099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?oXNVARxkMV6YbB49FteSceockdXfk4QjUDyP3vofp63RHzH+2QyjimxKVPcq?=
 =?us-ascii?Q?EYhWzSlwDaqeWEGPDqq9bGqLAb6cmYvLFkNUQbNSyXeobc8iOIJNr9gBCVAx?=
 =?us-ascii?Q?wvIWqBW/CbEkhvjAvHmxDgc5wIGlEFURX4DTCIriVUNHxr1eMFSLLy4a2Qxb?=
 =?us-ascii?Q?NHFgrvD7ysTfiWuiqOvymQFh6r2vl5aGFgcn49F8Rx6ie5bT7jWy9KEWryMo?=
 =?us-ascii?Q?2DXQfAdjTJZ6UvJz1LJPf1zu+7tDcmsXJO9n+RflqFix77kbNdVn7CR5fon1?=
 =?us-ascii?Q?n0usj/YU/ezOGOVK26F5BagrWccn3OZ1QRCLPgPya7KXF3ghGZ0VD+pfs3Ng?=
 =?us-ascii?Q?UMA0tP2K3fLYha6/EdW615tKWicMzh0+3u/4t5CVd0Q4MqZYcNy6ww74ZCk+?=
 =?us-ascii?Q?gC7SPyYfSH4hkXatCbzJhztHXluBjz8nWzrIKTrbpGvLfck7apx7aK7EHco3?=
 =?us-ascii?Q?kmUSDc/hXtaGR9N8+AmK/TOFlQFwA9VKrV4cZbhEVZVLSfNThIFPxKN6fKXe?=
 =?us-ascii?Q?LTILc0BbD8oj0aYP71lK0EZ5iLa+HfITiQkBlTCryccnpFb7uNwcrXe3zi0X?=
 =?us-ascii?Q?9u9hO4VVxs5u1fHoWnvGLM1vj6AZ7aNPdR1S7waZtfjy+66afGfHaLLznafq?=
 =?us-ascii?Q?jR9HbLkGqU8dpU+U+5B32jsoHJKOkpp4wEZY9Uokq5CRKALw5vH0m678hpeY?=
 =?us-ascii?Q?oJ7yra8EOcd+BUjQEnlGQH1IwYcdJIeNPDaYCz1CBnAMzmIMyWspmtkZFCQ5?=
 =?us-ascii?Q?2X/CxttSopVskQcHvSELXeo7XQGXvdwWe/+u/BQFsHjiPeDp6l/vItKlnAmh?=
 =?us-ascii?Q?BcxFJ/ySKV+ugVmjT8EHizusW3JNN2Fk5ntYB78HLFUNI+/HSJfx1evzJzgN?=
 =?us-ascii?Q?kOT1p8YiG0rhTzxQ/wJsB7iHHqYK2WEuNuhtp4XtcnGEvJEIr+3H1AAFgDML?=
 =?us-ascii?Q?FnHoGBKwjqVgzSCR5QONP7FgcYT8gek57gQG7FbOmEGduBmPPdPhBiqWRLMT?=
 =?us-ascii?Q?7FWKHONR7b1Jnv2BmtaLjDHL9euJw3ivFV1iSeDQ4eTl15FAx96jBiYgz4/h?=
 =?us-ascii?Q?oz461ru9HjnzOS1r9F6L+6Lrgx7BbcZWQ41zxjnTx1Xkqw+QNzVtd1+j0GvN?=
 =?us-ascii?Q?fFN4ZYSjykoL9jbwBAlAVYqZeudIYHMdkn5kyASQLRsg7zIQMlxG/XKrR2uH?=
 =?us-ascii?Q?v4eSi3mH7IJbfXIIYn1tYfM2gh8TRdfuHaEQd5hkCWwUgFG7v/ZGE6TxGShv?=
 =?us-ascii?Q?jk3+bPZAdSYDRJBxGno78582cFT4ZSt139vvrK8zqn2JeC1nRufYWbVTSAuI?=
 =?us-ascii?Q?Ky7NdYVauzquv0U3230x2MAeR9XPK1Es4xh9XXPaHu4PBgeUP6JSL7JdNBvJ?=
 =?us-ascii?Q?aDm+a2HERmO2yRb11SbqZAJVXZpKxdeGNMWrNn1GklDssJj7g7Uul9q87Y+C?=
 =?us-ascii?Q?+C/ypNvhfQS17qHkl1So//kmXGbekVDSzGnCWr4txjZWrG5L3eyf/qbte0Sv?=
 =?us-ascii?Q?ObSme34TxvfzO3dWQSCoeYoIhj+T2DG+WzdEacWuFrNbaMs2Y3oq2j7kRwxj?=
 =?us-ascii?Q?2c3GNxi+0lqep2gzqlzywV0paZdyNQbk2qhCiADu8acuHoTmCtosggtKfXXZ?=
 =?us-ascii?Q?z1rp0QIRBASobEhuPEmYuRBxbT6KM0Hvcd0xNMNeo8+UQesfCk9DlAOtX93o?=
 =?us-ascii?Q?Bcfb33z9S8X7+d1eeamHzMrDSkOhDobhhmEk+vaR525JyUOIWIfxPZfWnUzR?=
 =?us-ascii?Q?PL0vGbzp/u+sZRRlCacye65gZImVwlU=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: da868d85-91db-4fc0-e6d9-08df479d47df
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 07:01:35.2287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jzb/sI1+TnWrl5deHi0K/7HORZhuqzJaWOoiUKsyb72McTOW8VqMtlFm0wny9qS7vfEfYeCN9ysyClgyey8jg9E+Q/C5eWYEnM8eomGDeYA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1768

Use pm_runtime_put_autosuspend() instead of pm_runtime_put()
to allow autosuspend. Set a 1000ms autosuspend delay.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 70ad9124ad41..7f6cb4c7edc8 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -654,7 +654,7 @@ static int os05b10_enable_streams(struct v4l2_subdev *sd,
 	return 0;
 
 err_rpm_put:
-	pm_runtime_put(os05b10->dev);
+	pm_runtime_put_autosuspend(os05b10->dev);
 
 	return ret;
 }
@@ -671,7 +671,7 @@ static int os05b10_disable_streams(struct v4l2_subdev *sd,
 	if (ret)
 		dev_err(os05b10->dev, "failed to set stream off\n");
 
-	pm_runtime_put(os05b10->dev);
+	pm_runtime_put_autosuspend(os05b10->dev);
 
 	return 0;
 }
@@ -1029,6 +1029,8 @@ static int os05b10_probe(struct i2c_client *client)
 		goto error_subdev_cleanup;
 	}
 
+	pm_runtime_set_autosuspend_delay(os05b10->dev, 1000);
+	pm_runtime_use_autosuspend(os05b10->dev);
 	pm_runtime_idle(os05b10->dev);
 
 	return 0;
@@ -1037,6 +1039,7 @@ static int os05b10_probe(struct i2c_client *client)
 	v4l2_subdev_cleanup(&os05b10->sd);
 	pm_runtime_disable(os05b10->dev);
 	pm_runtime_set_suspended(os05b10->dev);
+	pm_runtime_dont_use_autosuspend(os05b10->dev);
 
 error_media_entity:
 	media_entity_cleanup(&os05b10->sd.entity);
@@ -1064,6 +1067,7 @@ static void os05b10_remove(struct i2c_client *client)
 	if (!pm_runtime_status_suspended(&client->dev)) {
 		os05b10_power_off(&client->dev);
 		pm_runtime_set_suspended(&client->dev);
+		pm_runtime_dont_use_autosuspend(&client->dev);
 	}
 }
 
-- 
2.34.1

