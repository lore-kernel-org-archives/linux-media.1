Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.225.125
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795244497;
	b=CEH+kkJxmUyIRJDBJ3pMCotPj/za+FE5YghyVbuQ7q/aKY2enCUe+Z1uh5SiAxAIVNmv
	 GDAd9UmJUIIriefD+q6hu9TOjAMOMWK+832Gaczxs4bogTJojMoeuuZ8+rszDsfxopFDA
	 z0utiUJWiqdPy1zhlEhOAH8fr/uu6emZE+7lTMCX66fUPldv7FJD7sCWlaqjXxBn9UktA
	 k/fv4QG9qgvVq+jzqVXjMVCbMnA1eqS5S9GwsZ8SJOlnxp1Lz32VNnfvhnxzj1yPGvKag
	 JWfosaiPcpwathRVuNsCVv+c1f5mHSJTCRxiGkMr9AGeKJnXpgoK8XzT9DWpvoUmA8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244497;
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
	bh=M6/Jb/DVlIH9CiT1NowkKM+A0AnVCIZdl87Bc8ox+AU=;
	b=i6KzGN/VgiGnHOjUS7hM5yYjjMTWsBjFkv4GGBc5WQ2048M/gwY9JBsJz5usDLsjuI8M
	 o0l7B+noEDZG9cLagQmNMCGAetLqy73sR/RP+RQ/fyCSMoEyOCk0IyMsgpVoJqyIYRq9U
	 3bgw1N5gQqS9nEIACcJ9yNgik7pk5ClcBXSyyMKvZx6JI6Wx15Jlqol9yaH4nhl3YDLdF
	 5LFdvt2UjgSVlhsgpF8l40hy3a+TvXApFCJGxuR8/Tq6akxKF12cSSDdvrtOqt4xsPTaz
	 BBChu1Mz4PTRFdXw9LUDEmqUflLCaWkwAMsEJX6W89o7kNdf+WMDhK6GqqEOh457UqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.225.125
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020125.outbound.protection.outlook.com [52.101.225.125])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803CE606A330;
	Sat, 21 Nov 2026 07:01:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 803CE606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uMHwm7qmEeQMZj3ViNT0HCH4EhrDyYBTZhz5etQ6HLUohH4eGKcgm6m1gYDSX+ARsdiqBzOoXS2HT5YytKNBwtmaE48yWB6WIb9akALXvLgs7jCcZtj6lne+d7AdG9K/sizA/sPOqXQq9rOM3utlZneMHamMvtH7lI+Vi41KN7wHOGy615D7t6Ob1W9eEQ+eVx49IWK8bxQbxST5kuNSRcM0PhZ/Lzlh1U7ZjxxSW4GztemvLDC2fKEBvItEAOHd5n++pTIqnbz6y+iIuJoj1Qu0Uy0ToyN8MsFmZnFW//8kZaOe3rB0j5jbmjjadSfNY+1BeuomI/D0OcuoKPBpcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6/Jb/DVlIH9CiT1NowkKM+A0AnVCIZdl87Bc8ox+AU=;
 b=QiMyLmZIUUtOYEOCz4rVabG5XhizKAGR8DKyd0yqsO0Wwhz1P2MHrARwtZji90myUs53L7Yq7g4TOsHM0vBLv2DRTjjBqoxOB7WFAtg8NOqjnQkvoc775FITsiPj7pTYik1s5bM6yNj/EXD4+2nDpzVs9L9cJ3DKbqK2RpyGfhc/mg7z/2z9jk5rwzrkOtlFuUO3ibCuvJMUZLIdS/YYdZOk9Wy5gH/1hC9tTSx12RCvYKQiZ3ZjGSchjTayhEckR8HAtIxW3PIodCOB2miTtDYKRVfbW2IXznV+HLpBIbeGoZFLdnpbVx2pzB1IPriuN3DppymgF2p5hCNMmAdIIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN3P287MB1492.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:19e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Sat, 21 Nov
 2026 07:01:33 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%4]) with mapi id 15.21.0639.011; Sat, 21 Nov 2026
 07:01:33 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: jai.luthra@ideasonboard.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 03/15] media: i2c: os05b10: Update active format before adjusting framing controls
Date: Sat, 21 Nov 2026 12:30:53 +0530
Message-Id: <20261121070107.1768-4-tarang.raval@siliconsignals.io>
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
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN3P287MB1492:EE_
X-MS-Office365-Filtering-Correlation-Id: 18062676-b3c8-4e92-e774-08df479d46b9
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|22082099003|18002099003|56012099006|10067099003|261021121427099003|261102123227099003|261021123027099003|261009223027099003|38350700014;
X-Microsoft-Antispam-Message-Info:
 3gc65sqZZRX0/i1+UX9d34dget4Dfvnbh+I2Tf0pQwBxFTRIyuSlhip+o7GLk28tUWhtzCxYFiXMNUzZ6CS8FkSzT9F1Q+by+OZOKuk08PtfMps9jUBCzfSW9/AtJjAQgfcswcXslpDutREyP7+xb+ykbqe41CVXzpbDL6j9ii15bq2+RK99j6K+U+b5GB5aTi8gCLWlrQoFwt+YT/W7/79FdMUnyQJrrW/AEsWSXqbJmyVAID0uJyjaaQmyAbftYlIMCyw9g3aPgJQFOugxDM5R9zS5Od7bbP0t2FhHrSiCIGnaQvBfB9+wdCzclDPhc7kP0EqE3kOUxtjIxwAd8lc2eD25LDjpD55awmAw3egu22Pem4sAvR9UR6hfcLVLR2fHJ4KsFDj+OJMYRErZ0K1A5czi4RyZS8gilRLQYQmXOpiLc6SoaSaaCog5nbNVvjRdiUL7W6z8hk9k0cMork3rv2saLdF5wqXmBS2zcnW24KyyInDYUKc2uTWyPK8eLcesOy1Cqwv8Mw56Y622eAqFf6Y06nzdOkTeWyyFwQArO2MWZc3lKpSl2wEETEGNzRsvc4i7Ul8A7XitQgoR9paH/WiReHiquWJoHIuonaRfEYKpkr82/DaQ33dOF5m60MttkW8JyK+U9MYurYVXJCNcE333WpiT2EZr7LSUvegXv2Ap3qasl8P77XiUJrJ/WRuRXx6HswJZUfrbG9uPM6jXVSIDsqj7HgNNBos/R2Y=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(22082099003)(18002099003)(56012099006)(10067099003)(261021121427099003)(261102123227099003)(261021123027099003)(261009223027099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?DgY4UZJpgyGcNALlb+Yo2RQg/RFbPOM5or0kY5e0sN9IycVwuVYkJggeixW9?=
 =?us-ascii?Q?7AQ5nsV3Jnd0l9g0g/mVHfVFTW58zx9zch4txnD8xiarEgKWgjNDpQ9tvfh4?=
 =?us-ascii?Q?+NzD22Gr1OPi0j85ou65CIBcFZ6piWMcUp7v+uVM7MJthq4neKECqGhgzON2?=
 =?us-ascii?Q?Gj39PFolcrjuTh2Lpq+xirverCmpKMv7kMQo+KSDf+QxjOIUitl0nh5GNNqn?=
 =?us-ascii?Q?q+79277Xty1a50+xlatJlIN0XPqivVdycGTx8h5BydZmPF/IWpvCMbVXbpmT?=
 =?us-ascii?Q?twdZezuiVgXv+31DWDtfr+WKPEkFwPYFmUbONnHiqdoe6VPzIHHyK2RAoj6f?=
 =?us-ascii?Q?3rmB440ZG3NtFf+45U8BK5xYRPOdOYynrc+CBlBBACK36m1gV15TH6aOqwr4?=
 =?us-ascii?Q?0Avx9O/jBRqE1glwEijrK5uCbfWD+WpRsCcYPdguf7x5A83OlN/zD23VSksn?=
 =?us-ascii?Q?4ME6kK/izZqzGunVnC6yaJ2NtDU50mzhkB3c6BjYJ52cKxDSoeUPg3mZMHeX?=
 =?us-ascii?Q?Y/wHh5H7yj77DY2u84C7msc35cCVKgixpJ4b4L6szilno0l/fw4WI6+wybLE?=
 =?us-ascii?Q?qYCSUJhKkg7XndWDIAn4uxLqE8Q/OPMJKPEUOI8O83XoOgcXbCAoBiJRVzHP?=
 =?us-ascii?Q?S2gnvVe9fm4uxEk12Ehk11ODcmHjXWlEjVCm+7eK1+cItOBsi5K52gFVWi2i?=
 =?us-ascii?Q?R2BDdHnqodib1CUPv3195GGpAtncOcYkg/4SKc/8uLq28ptE8yONSspoejD+?=
 =?us-ascii?Q?wtsJ/pntiEQgmtkd9lepdW8/MESyNof8pkZ42c2bbQ+qXGVZ0zl0zRwLtZLM?=
 =?us-ascii?Q?bDhp0Xs2EkW5e+jDz3LDrMeycgnrzPY2vWV7uj6Kd7g/3iwxBTz2yUx20Hvp?=
 =?us-ascii?Q?/lUFQOY6wX/PgZQxXKaok/RzlSjKmHO6U6QSE2C4qWoIssQ5BiYMPH+mHmxr?=
 =?us-ascii?Q?vF6qXlkKdHFz5nBHDLdVljdgyw2GpZUm3sM/B7P8riiKfmZxGfaJFUVLPK3Z?=
 =?us-ascii?Q?oKEuQ8w29iZ4jxSGu7FdDEdQ760+wAxFzCcAJTqLuq2+stHEroO2yerUR6yF?=
 =?us-ascii?Q?1cWInw28Q3KplsinCJZOfn3SgYntLSr2d+uANouLPxbdxTYIyTGqETUCfJ5g?=
 =?us-ascii?Q?VhepaCgrdWzQ8zosRlEKqylFgYvdWsKvcRv9LFYyCZKAxoJ3NazMkZ7XJBti?=
 =?us-ascii?Q?C/HPZwSByLWxDdkkaZscRwdYjKh9YiovrbxFWycHAj1X3aLxYERXvDaYjMfV?=
 =?us-ascii?Q?uwPneEFXIgrw/vSru4Q4D07ITyS6rXDkbsjO42ouje/yI1hqsdHVn01hWiaQ?=
 =?us-ascii?Q?s2FaWeiWiD5smLYkUDaDiVnTSytEPLTEnpwkqjHaijHXrxao3ZdlVhdVw79m?=
 =?us-ascii?Q?diHeh9TJrfXu/t8Bn3/M3uPZHv+/yeqULHoo6vwoM9h0TfpA4z6qbkbWNhfe?=
 =?us-ascii?Q?4h09gZ5UReYjGnj0LfsnsWhav1tNFAe6Md9axjdlTSvhWXFN5kM4CNYv906M?=
 =?us-ascii?Q?s1b01K9nKDn0+kM8PwCmSQNui3stlfgtAUXwpBgWLPkfShwDKyG3mtMIYsj+?=
 =?us-ascii?Q?5SorrVWsmvLzJI1/9wo9n5NQENSp47oozcfGfQOPD1XaupIb6jhkNB3g6Im7?=
 =?us-ascii?Q?rD/VOhOtgLodKB1z7ocHlfNhHinBlxJRWNmNxnfa8xyoa1H74urIg0ixf+hY?=
 =?us-ascii?Q?8Fp9dzO/zOg5LbXDRKQTJDAmUIirI1eAH5oiT1nkXtl7OP/vTq/0IJQkK/ti?=
 =?us-ascii?Q?pToQod0GplfSngDRAVDgFVLBcNRbRM0=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 18062676-b3c8-4e92-e774-08df479d46b9
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 07:01:33.3078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f3JZAL+amJACRBbM8EqWB/rO5Hd7E+5WBkNvjKNXba3DS9VWWyB9WCGPTypau9vC7vOH3kadEADBuegOgZLRXsWB2TXpPYe5q81kLB3R3o8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1492

os05b10_set_pad_format() calls os05b10_set_framing_limits() before updating
the ACTIVE format. As a result, the VBLANK control handler uses the old
height when recalculating exposure limits, causing -ERANGE when switching
to a larger resolution.

Update the ACTIVE format before adjusting framing controls so control
callbacks use the correct dimensions.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/i2c/os05b10.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 46246d297a44..70ad9124ad41 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -576,14 +576,14 @@ static int os05b10_set_pad_format(struct v4l2_subdev *sd,
 
 	format = v4l2_subdev_state_get_format(sd_state, 0);
 
+	*format = fmt->format;
+
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		ret = os05b10_set_framing_limits(os05b10, mode);
 		if (ret)
 			return ret;
 	}
 
-	*format = fmt->format;
-
 	return 0;
 }
 
-- 
2.34.1

