Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.51.99
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795244515;
	b=z1LBCwS1ntvB8l/O2jnMjQ/iWbIqwsgKIA7TS6OdVhHVUYsn99bD6YT9sUTi+jc38YCf
	 CQSlPAAbx4ULB5lug8jv+jPqYzxf7rsrg2LRiOph5WC5wJBiCguX10K8BjSyq/odIbxIg
	 0tSeiuLaDw+mkSpMij6FfXopPsfiS+JrOuhDAi/rEI0pzcbR7NwNCPVqL4ByHYc0vFXTk
	 enNfTv+MwRppL7IDM3z2wb75JTTDh3FUjO5enshXfcDCqD0nh3fEnEYl1J2lCOgBA4Cmu
	 /bLhNkOWCkBGX+bEWkk2kgu31dM/nUugfpRxp8F9nvoFvU9KYuVI24mJdwlyIvQaYBQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244515;
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
	bh=6CZJUkL3kguNbhnUlMgJvjRSsdL6ARrRxqyg6ZKduow=;
	b=zgUfrsKniR0Lp11X4A86XacdjYLUPhfKebYKyLiIwuc7Pp4wp87APuKDrEEwVeAk356a
	 YmC4EL/rsnrjBkB/OMKWvVW1AnJ1LlWgQC8z5yUTX4RmB4NrUyX9eEYGoDyLeNhV3I4c0
	 Hll+LbsR4JyVQBmNhOnViOltyr+c9WWiSUQOf3G8zc4xOtwN07M9PgLOdxfPdV4LSfK3A
	 rDL32Un2bitQmXIK9gvsBvWZaN0qvK+0U0cixinCFMYcLjNfDjuPQRzFjcbzbiXQT6eEZ
	 IMQnHk9glFgBlwV+CispHBLiia4HyVwr4hoPGLitorZcofDnM6kZpLyybYAksHrJJWw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.51.99
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021099.outbound.protection.outlook.com [40.107.51.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6544E606A335;
	Sat, 21 Nov 2026 07:01:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6544E606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M08P5AHtLEiSb2qyzLfiomr32EikmWhvbumONP1+a4OYq3BVW5qm5o6VOzxu81fU/jeEbFLLUes1FiBi5pH9TZXob0OI9dwSobv46VSYncnFRuSPsw52PzyoIx8hA4xlgdUXPKwbTBbj8EpiwUhhqZaPaNbCsYe4qtQfJ9lv0K+mwdaLRf4pL3wZBGICIPl+vIMm6XdvN8P3eqMzxCF3s3h6OOivA4B3edzLR40+Afc57VPloK0AIYGGwNNHWhNbn02sdE1yZEt/Pf9tGcHTZF7PAZIKkaWwNdQqyYEsRUvOIF0wiG3tahODh8DbQpIFbLhKrQyk5EbMu8gzRLDjZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6CZJUkL3kguNbhnUlMgJvjRSsdL6ARrRxqyg6ZKduow=;
 b=FVwziKa14mol+4pKWK7vFh7MRNI1pBsLI5oMkJ0cjipwEZpdxV3N8hgObumL8nMLaSeYsdCdWhvi4rapAWROBUnj7lA93tpY7ZuIO9js/ns9AZkn4mDyhCu100eGAtAmL2Dh25vOVZRPfT3xGGSG9We/n9h5iPHkqMf2ztI+YmNt+ojslMKcVCrLOlZz+FQTm9AmiJTCAFHrstvkVKZUVmcgHRM0LiqEGu7cJtsQJPD4NOMgw7BNp6b6qkY2oWpEOFZLqLzwEKuFb2BR4hl3kmOfBYedY05dBK3Pr8kx5/JuXkCUbIC+O9BDh9uAtCBf2JnHiVAmbj7lousih41ABQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB1768.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Sat, 21 Nov
 2026 07:01:49 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%4]) with mapi id 15.21.0639.011; Sat, 21 Nov 2026
 07:01:49 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: jai.luthra@ideasonboard.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 10/15] media: i2c: os05b10: Add test pattern options
Date: Sat, 21 Nov 2026 12:31:00 +0530
Message-Id: <20261121070107.1768-11-tarang.raval@siliconsignals.io>
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
X-MS-Office365-Filtering-Correlation-Id: c533a1dd-285a-4125-7960-08df479d504e
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|376014|23010399003|38350700014|10067099003|56012099006|261021123027099003|261021121427099003|261022105027099003|261009223027099003|261028144727099003|261026121527099003|261026140227099003|261102123227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 5B+Dugt9BuK8qRZjNnP0div7zbOuQR0db+ALDM86SCiKE7HLBZh04hSSA5YQrqKKW8VZExDy+zZOMkxxXCFGxLIzSTYSgbcmZ7KNak3vl9DxaP5KrOkg7qpknMjYhFJskZaJ5RHOlflfWbaZmZKsMbA0i4crY2KQQ69+57/QzpzdlapmioOSJq0RxWSRtHOEt+BLHvWQqekSP3JogT/nNSRy5G82I9aZiKnMqNDaoyr41VeJP2MzgUe1T+9l8/KrZSnRi5JiogvSIsUKmsBKwXA0wFInopTtH5Ji9p03T3lxxL55syg58ue+uXQCd1kyJgvNxOu9OBGcLeVNt3RBmsEzKqTSi+xsFiJD7Qym6PcRd+VJb+V4U4TiqU5Kty01e1brto1FTtNJm0xaT/mj6UOJz/s5+rRGGH6CR8J33bHQIegTl/5TdEufahk1sJYAhlv1buNoeFp3f/QV7aRiAEU4K/mD4jU3Yvoz/fb9FzKN1FX0N5vX0wq3Vj4qzOSEOp4vSIaVgfRWQrMTij9+TRdxc6tAYNjFPQjFls4IL24XnGP89Q9hDwjZCmJIYfUuqeqads2POIKKa9+bFEMiAq5t/KWvchVOY5jbhnDvNSeL2lXiS/cJ0kld9N9PAiypo+prZsi1bRc6jz17J9PW2v5JG7nJce7VFXIFUmBWB0nXMtjq3Yb1AIXsSyO54WT7eAJZ1ijNuhs6l71NM4GoMoSI4O9WIrFMFDA70xuPya8=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(23010399003)(38350700014)(10067099003)(56012099006)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003)(261028144727099003)(261026121527099003)(261026140227099003)(261102123227099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?danzIh2aXqGVqrrciLKJXW5yahmUiAaXq1cJXYSnNojlGRRtUxfXogfET17c?=
 =?us-ascii?Q?pUUbXz0pdxqAoGeWr46JwlUm+l4aahTfMgFYQ7KCcjQO7J2ks38ofD42bpig?=
 =?us-ascii?Q?8IfBxBC235ianXfTpwiBUdOyhyUaIbIJfSvrNcE9iIK7i5hNT1MRdLp1tzy5?=
 =?us-ascii?Q?Pqn9Y1Alt1q6bap2wvzGVq0sEPxb+DjDlCKGQXz+F8byw9EtbJN2e15Zf/Mc?=
 =?us-ascii?Q?uYDLnkR+2/a6XDBsZXXaSADE345t49UT3iwI62qEKzwr0c+Q4ZaMwmLa9D67?=
 =?us-ascii?Q?wXD2voe/5AiFLOqIFBjFLZlpVRgkjcjUqqJng78q81TR3DxeU5Pq/cktsIc/?=
 =?us-ascii?Q?e3Sast+RBnIptdRk/6FBCruPi4o0HrVDn1zXKxMyE+i3sRsuKN9yxS/Ask9I?=
 =?us-ascii?Q?16jS2Vgt3nlviaBTD9LffcHum7SIWn89l0piTukfwAlJjI8Z8VBRd3sQJrDj?=
 =?us-ascii?Q?66DBHEQKQvSpSt4ZmtAUVUdMx4EA0UjFWoEXEDnJbNnvA5qCjSF7qGiz+Xu0?=
 =?us-ascii?Q?3wpIxi74OURKSRrcUkMopdx7zropQAJKQH4GQpuNWufIBLBPooqe34BJJQgm?=
 =?us-ascii?Q?nPphVtj3i+tNvek3W8amJFS9KFSchbshgRm0qVfuO45J4sNDOaPIChQpLwlZ?=
 =?us-ascii?Q?3jsXLlJcVzMdTLECoIiCD6K5RMfkrOIuvof2mT7OwgbDgM2RS728qtuRSDbm?=
 =?us-ascii?Q?+2GE8l63GPkn73ceErd97CHd0zzSmBnewcJPKd/25e3iifxHC2fal19Eah3U?=
 =?us-ascii?Q?W5Scpxl9rsFLAtcGcEKWxDF9o2NjRH1XthpR28RC2BUWXc++ST641I5AsB/h?=
 =?us-ascii?Q?eiGavQwKyLysFRcIOfr3cGbV6fpM6zTtLaIdBiFNbA/n8G1RTwvFOBN3VGDv?=
 =?us-ascii?Q?pYETDB+z2Nbycco7W+gpbpCnKCNiQhnlw2Ejo/HllD7aQmJaCU68+nczJ1Ai?=
 =?us-ascii?Q?CMVx4t5AXwNagoRFh0I6dbf5EhTlznyJZNYEfXbym9ZHnjggWAGCNENzZmWe?=
 =?us-ascii?Q?+3B53aRNasLwmEd9QPbCyjxH5ttiE+ZIVq6EmWRfY7zWYqPdHMh34ezvSRIi?=
 =?us-ascii?Q?DxCr9h5S215H2BgNOR0b2eVXiz5wnSyxcTN+obV1RLbAPMCHCAgzwp3DAvPl?=
 =?us-ascii?Q?2YA3gK5Pv/0maE4hKLhimm1LBr2GdIzBQ6lL00ZBjb2Gd+bsY5DSvYUhRENm?=
 =?us-ascii?Q?bcbp364LJsaisQ292lAQ0A0DP8LizE5A9YNmNfcJBbLRzNP7PlHqsd2JmhON?=
 =?us-ascii?Q?Q3dTtqLQ3jAkKymwxM68Uk2XG9ruJJ1rOEiyHAcDGw78P9zqgtX+6OLPjkm5?=
 =?us-ascii?Q?hNbZENjmrETqbmRMKJmKubsw87fOCYesXt/DWm9N+04NO7O5JSf6oCuT9dG1?=
 =?us-ascii?Q?EArBHFGjP5FpMx84MzHTF6JFMnvvbusD4Lh+5VVe2ckCkQIOkIle6dOt1aU6?=
 =?us-ascii?Q?L4uvAIyQJmAcJK18hsMA/fsYG4v9oD6LhF5vNrRyU4Ia4nbwM4FScZrclw5K?=
 =?us-ascii?Q?yO1fDL0TS3kLCCsRdcVYQcOgJw7t/U/FVN7JTNxX7P3u5B8pgQroCEfYbE/h?=
 =?us-ascii?Q?1F/+O3eC+LPpsl3PI3OydUJRQjE70MADxhM5Fzu6E9ZHNS3tNdWEu12yY0DO?=
 =?us-ascii?Q?92675cebRsHoy3Nk1+lnJI2J1VdSikAV9/ddw2+bulvQ3ZktrfTS3f9gCKfv?=
 =?us-ascii?Q?9ly5w5acT9zsLHusR8BC90DEci5TSYRL2RQkfdf+br1vk3fHZcxCQnN+CSEr?=
 =?us-ascii?Q?Jy7ZQN0VPK5Xh6qdXeWSffd9Po2yIHs=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: c533a1dd-285a-4125-7960-08df479d504e
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 07:01:49.3655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G8+PnywsjHXdlWgu7h1gQOa4wF4jfu0+N71N/0JgtvH95pkTgpB4zQbv6cwr4o8MF2HfS44qZrYTqMX1vy2cT2B0vtxb2qVzz085spBzPYs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1768

Add V4L2_CID_TEST_PATTERN support with multiple sensor test-pattern modes
and program them via register 0x5080. Drop the fixed 0x5080 setting from
the common register sequence so the pattern is selected only through the
control.

Removing the default write of 0x04 to register 0x5080 does not change the
sensor's default behaviour. The value 0x04 leaves the test pattern enable
bit (bit 7) cleared, so the sensor remains in normal streaming mode. It
only programs the color bar style field, which is ignored unless a test
pattern is enabled.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/i2c/os05b10.c | 55 +++++++++++++++++++++++++++++++++++--
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 7b82ba274768..79d497e6c1c5 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -98,6 +98,17 @@
 
 #define OS05B10_REG_FORMAT2		CCI_REG8(0x3821)
 
+#define OS05B10_REG_PRE_ISP_20_0	CCI_REG8(0x5080)
+#define OS05B10_DISABLED		0x00
+#define OS05B10_COLOR_BAR_1		0x80
+#define OS05B10_COLOR_BAR_2		0x84
+#define OS05B10_COLOR_BAR_3		0x88
+#define OS05B10_COLOR_BAR_4		0x8c
+#define OS05B10_COLOR_SQUARE		0x82
+#define OS05B10_BW_SQUARE		0x92
+#define OS05B10_TRANSPARENT_EFFECT	0xa0
+#define OS05B10_ROLLING_BAR_EFFECT	0xc0
+
 #define OS05B10_LINK_FREQ_600MHZ	(600 * HZ_PER_MHZ)
 
 static const struct v4l2_rect os05b10_native_area = {
@@ -391,7 +402,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x5004), 0x00 },
 	{ CCI_REG8(0x5005), 0x0e },
 	{ CCI_REG8(0x5036), 0x00 },
-	{ CCI_REG8(0x5080), 0x04 },
 	{ CCI_REG8(0x5082), 0x00 },
 	{ CCI_REG8(0x5180), 0x00 },
 	{ CCI_REG8(0x5181), 0x10 },
@@ -507,6 +517,30 @@ static const u32 os05b10_mbus_codes[] = {
 	MEDIA_BUS_FMT_SBGGR10_1X10,
 };
 
+static const char * const os05b10_test_pattern_menu[] = {
+	"Disabled",
+	"Color bar type 1",
+	"Color bar type 2",
+	"Color bar type 3",
+	"Color bar type 4",
+	"Color square",
+	"Black-white square",
+	"Transparent effect",
+	"Rolling bar effect",
+};
+
+static const int os05b10_tp_val[] = {
+	OS05B10_DISABLED,
+	OS05B10_COLOR_BAR_1,
+	OS05B10_COLOR_BAR_2,
+	OS05B10_COLOR_BAR_3,
+	OS05B10_COLOR_BAR_4,
+	OS05B10_COLOR_SQUARE,
+	OS05B10_BW_SQUARE,
+	OS05B10_TRANSPARENT_EFFECT,
+	OS05B10_ROLLING_BAR_EFFECT,
+};
+
 static inline struct os05b10 *to_os05b10(struct v4l2_subdev *sd)
 {
 	return container_of_const(sd, struct os05b10, sd);
@@ -522,6 +556,15 @@ static u32 os05b10_get_format_code(struct os05b10 *os05b10)
 	return codes[os05b10->vflip->val][os05b10->hflip->val];
 }
 
+static int os05b10_update_test_pattern(struct os05b10 *os05b10, u32 pattern)
+{
+	if (pattern >= ARRAY_SIZE(os05b10_test_pattern_menu))
+		return -EINVAL;
+
+	return cci_write(os05b10->cci, OS05B10_REG_PRE_ISP_20_0,
+			 os05b10_tp_val[pattern], NULL);
+}
+
 static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct os05b10 *os05b10 = container_of_const(ctrl->handler,
@@ -584,6 +627,9 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 
 		fmt->code = os05b10_get_format_code(os05b10);
 		break;
+	case V4L2_CID_TEST_PATTERN:
+		ret = os05b10_update_test_pattern(os05b10, ctrl->val);
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -972,7 +1018,7 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 	        return ret;
 
 	ctrl_hdlr = &os05b10->handler;
-	v4l2_ctrl_handler_init(ctrl_hdlr, 11);
+	v4l2_ctrl_handler_init(ctrl_hdlr, 12);
 
 	pixel_rate = os05b10_pixel_rate(os05b10, mode);
 	v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops, V4L2_CID_PIXEL_RATE,
@@ -1016,6 +1062,11 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 	os05b10->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
 					   V4L2_CID_VFLIP, 0, 1, 1, 0);
 
+	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &os05b10_ctrl_ops,
+				     V4L2_CID_TEST_PATTERN,
+				     ARRAY_SIZE(os05b10_test_pattern_menu) - 1,
+				     0, 0, os05b10_test_pattern_menu);
+
 	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &os05b10_ctrl_ops,
 					      &props);
 	if (ret) {
-- 
2.34.1

