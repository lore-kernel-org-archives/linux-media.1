Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020114.outbound.protection.outlook.com [52.101.225.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7543237187B;
	Sat, 18 Jul 2026 20:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784405479; cv=fail; b=YABgeFAA8oEjQr8rGFm3FYbXDlYkt/KDK1fvO5YUOW1igkO4ZTf0nmV3QOzgRsScx5yI3VczLwBY3nIna6tzkve8fS7/m/filHkU6A4Iau54CYqLMQsBbJyaeG1/3KgRJq3xaR3ME0JAv+q2fIPp/ABo8f1Ekg5ZX1vHtUFymMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784405479; c=relaxed/simple;
	bh=4m4CzQVKT4Mjk3Ded31+r7Dv3tt+HSulOC2USJta/6U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lI47L7++RrAz747Lc/YbV9DPr9/aeW6V0OZOIRe7ULF/VtuRxGmCKnjHw4UwhLN3AWxZOlo7NUqllDnb46s+E4VcmoyAZd7IHNh8ta9FvuzPhtgOuBzd6xSMY9j+435yk6HcP7W06+i2z6ygvXx45opbw9nuGPWFIArpz3lHzpw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=c560HAx9 reason="key not found in DNS"; arc=fail smtp.client-ip=52.101.225.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="c560HAx9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I2t6Uc4XuLssFxXxLLBHP96xm3E+hdRYHEEgMV+NDIwZsGoNgvzgZYfbclTdV4NNHTsxDpTNrACmMoCRYWgXJgNZStv8w18EvlSijqGtYUs0KAZq6XJihGXAzAdeHp/Vg3UGo53Qg1SILe3d7NRXlLE1thEb/WmwnqDvrFWHXErRnJM6LRFPfMQFoyihSUT6lSCM5+v/LECTIVScf1iHxj0vJmi2TlIEc6WEny722gKb2L+BBzBNeLiRYnErQXbmbDPD3/zsx2XkaKKosNupY83vVcKA/dI2uXL6s2rLfABPRZ9D9Dk1AI50EalGAFQzKcBhdtPfkpzDUOq3EafS7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55WkyTp4D6/g3NGB00m3oqHmRuCgJlja+lgAJulh1DQ=;
 b=dNYkEj0UzBt6mqKHHiFTojqk3IbW6LI8Tu//x46IeJClTE/LLfPOtyof9yMUZ/eDawU3czdd755hVpzPl01E7WTlZTCrXTe+OxlCsjcdisyn3nttpa9PIZURQuCb9BDQjzlXLiq0paVd0XxQXMvwz+zn33Rvj7aId0Wm8zw9gRjJ9BSM6cwvNbBX/Ti9dpA1sEdm1LHl94MDt0ZRU5BOAbfmBW6F9bZZOtDWY9b0maRuh81k7MCRUp/8uhXfV7WrmSKFgGp7JhKHr4u1FlgI735G1edFh42hx6T6EpVOtR0uiH/FdxbivnFH/JtGfrUA8uY0s92x1UPXGVcRJHHAsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=55WkyTp4D6/g3NGB00m3oqHmRuCgJlja+lgAJulh1DQ=;
 b=c560HAx9QEdEGyEIyqJmK/lPLDvHW34mME4ux135cJauWaGnryC8KutyrL5eL1aPjBq4lQ4FVI1pB7aderwcIyptMTgMiJXyd1xhDWVQJxH66TurEqgrRPV19ZpbcNeLbMr8Gvp+A3Oza5kCSpEP//9NoSoHsqvvUd9q8stxzK7IcZUgkhfvDlPpVSF3HruG8RvNhbaEo6UbhUpyMVhso2o3m1H/Eol+b6YRSOfgtKJdYXGRJVv52ivJMN8izkVDN6uIBZB2KZpIAOxEGIvS5rjZcN2rch3IZPrB9VJugVBMFcOFdIDbzt22WNQsOlxoUidX7FVXL4TZ1QxOGnjd9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB0774.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:131::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.14; Sat, 18 Jul
 2026 20:11:15 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0223.013; Sat, 18 Jul 2026
 20:11:14 +0000
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
Subject: [PATCH v3 12/17] media: i2c: os05b10: Update active format before adjusting framing controls
Date: Sun, 19 Jul 2026 01:39:03 +0530
Message-Id: <20260718200912.16001-13-tarang.raval@siliconsignals.io>
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
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN2P287MB0774:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d53232e-ebac-4aab-83c6-08dee508b7e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|10070799003|1800799024|376014|23010399003|18002099003|22082099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	MP39nuU7AEbE6BO9YINhCp98TrVlp4b1J63d2GZrg5IuoQD3LaK2imAXQNliaQEnXCeV1gVaH4KYvraFR+jCL3Hd792RKpp5IZ3Hr4IO7rmTQshspycGdAi6xdk7mjM7al9Dfsxa/xhDtsIB/MwtfmhLo0Y7fAiTmFWRcH612ZBUzVFonYmdJvZ5Fv9PhHAJd+MHWVb5zpQOjz99li69Q+yVFvUrisOsV+LAbN2G60auvPVS8amq0xtWMtzCmSTgb/r5s/P0DUK2M+rljpoBLDZfDY4pVZOxd7E1Hri0oXz+1qvthsdOJYjXECBOk+mxf5HOXSPkFvJSrNY9J7wuc2Ad+U3K6mnsUheZejv78p1aBDX9fyRIcbWylV8FL9l4EZnKIQKylNDWoY9RGqov9yrgGGEmdhMRVY2i4DsxOs7p8It6ev/Itzf5gjt/PJ1z8tsb0/E5eEudvTl2xWiBbpoLH6BZhDgkI3LADbhwHbvlYTynvEPZJR6UBh7uWZBtiTT/yr8DMdzk/ylynvGZShzn49QMa+reR9sIk6lzDSn34ePhajA6ywU/BZBvU6lH3vS3/AOuhRytXDvgJz4olFCa4w9faz4Gd5d3iJ0wxqIS1CXtYGAXNybfOREDAPk1WPmVdZSSmqU0X+loewF2YJma4Xqq7pwDUybJvUXsfVQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(10070799003)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NNSV05NGeh+OykR4Uapl0egzeN7mn+mNbVRFZb5DDcogR0kxrJWCsNb3p7T9?=
 =?us-ascii?Q?HTh7w2tKNwTdbo2E9W56b7v053cAFVoNPe9mliTlc+HdLlIIYJUKHvNxqpLF?=
 =?us-ascii?Q?YHmoFNsU0+RWV2Usxh3nN/LL4Ji7dk9Dq1dvSBvKMMhea8baYq1b0G3VFwuc?=
 =?us-ascii?Q?5fJYM3jKmmbwI3YHjXaBtxaquAAUrxNxjfy0oLCABe5CFd8YaHJTpGtF94hb?=
 =?us-ascii?Q?/Pxhj+l5INNUlyl0+PYGxgVJ8bg0wAn3QPno75PUQXU8FiH/R3aBY5gxFrBA?=
 =?us-ascii?Q?eZd60vwDt/qjUkh8Oepd5gMGSEtYcr+KJc1gMicL/zKP15bVVEZ+Pf72NAuH?=
 =?us-ascii?Q?GLMkeWtnwV4ZcLss1tghx2KAERBNYJuR2tjSPyQtO9XMkaan5tnzgH3oQt0u?=
 =?us-ascii?Q?mA11pHd9LnTPgG6+7i3py4CYf8Pr2jnCN/dWPPGgOX0WUUOAW2dRSur+Vf37?=
 =?us-ascii?Q?jMKt71ewQFQ8FWo5OT4RtiFzPc2DaLJFkADohTyZ1QbEPXndyLBWczkJ7dkn?=
 =?us-ascii?Q?y8k9Vyw/aPlZZGY4tbGXPKQbgd5/irfdeRbFXiq99TSzhwJTZqpP5ClCKOVF?=
 =?us-ascii?Q?DV7PoQFXBEynoumK3ttNewPfbEzBuwV5GtUIWOkWqBJsBbYvwb1KsZz3zCcR?=
 =?us-ascii?Q?RTVqk4yk3jsC6fxbhW/r5k6HqeLztab4iXUI9zTpTpbhlrWg7gziiUgn4YGi?=
 =?us-ascii?Q?/qO2jdp/Ss8PXnCYCq8jZtUaHMuzg4PE0TYlNWjwAmXbBAoxafA/jqq0VRN0?=
 =?us-ascii?Q?272ra+LH3DDDwGzU5IjAYJY/l4aXn931YNRGw7A5RpkBRH3UiRwWr3t8kzR8?=
 =?us-ascii?Q?D4CiwsRrOGPhUm2/6PhDTDuXDr/ed4Yzi4jh+u77DN95Ave48Qo+HNq2kidU?=
 =?us-ascii?Q?rZhyD9c9845tQL3l2DSDQsGd5/MrWrhQ7kM8gW2NzpaKAyOHdaOfFunQnuhG?=
 =?us-ascii?Q?3lL0mqyBqSIOPKuLxxIR4JV94/pS27Vape+pfEflZ8+Va+NWmf7dugjmkviU?=
 =?us-ascii?Q?NeaLQnlKZ5I13DsBOrSWvlpK+f0dL+W6aV5dudKsueA0eQ/lgj9ySKd7UDJq?=
 =?us-ascii?Q?qDr2cIibnM99RN6XNxB+/9nMcQw3k0zf7MeVsT5CHabt5Sa50aTnNamf8zZg?=
 =?us-ascii?Q?oJEhv2IznyjqNEeX9eIH4tKXjuJlWoAQr/e0iUHpQr5rFd1BYgLLrFt3xQAj?=
 =?us-ascii?Q?etslLFZVv/XrplPrAZ/QnecDujvlQgA2fyoseoyRFZbzyQIxakGKA1pVKh2e?=
 =?us-ascii?Q?2DcJXu09DaXUbyB5c6gucJLmppnhydxCqpdw7J6Bw8BZT4wImypMRHEdH5Tc?=
 =?us-ascii?Q?ewQduRi7vvcsE3qxfmguLDgmBtLDWUpP3TYj0haIyl8qUSKLiUPA43J3NtnO?=
 =?us-ascii?Q?0H0qD6LfuC/e2PBrtaWGX4zvChL74DD1ChnTKWlv3DhS+UNx8SDhiReNSRyw?=
 =?us-ascii?Q?oTwaT6L69BN2/rl6i2F41Bllq7CsSLZqmYKLgveTVLHo48BF53JH7nIMMnAL?=
 =?us-ascii?Q?71JqIivZ/+4k6WOXrz8dOh6xWolYDu7wh5qkHpLqE+hYDxlR6stopfMkKQ7l?=
 =?us-ascii?Q?7zbkfaVGW2xuftfRN4F5iTD5aPTgZU1uioz2kNkEwe0Cdb5pq09o5Cq1KiQc?=
 =?us-ascii?Q?3yXXLjapu6Q3mmxdrm+v9J3FU5l6ZllKkjCPRzVWi8fFWuMRAxIa/9OAGiTW?=
 =?us-ascii?Q?sQevoE7JqIr+KZMor3KMq2RghkMqnN8kflWfaTnMZWOLq0umULsVmHl+32y0?=
 =?us-ascii?Q?rtzwy5wWfAUK42hzHPAmBQqPtfmcRAfTKFNPopGbayouKQ4JrooSAgOio+Uu?=
X-MS-Exchange-AntiSpam-MessageData-1:
	us9HwFk2nMosocB0cvTRyxcAJvi5bzIhUfq8yLQzT947yQgdPS+DNXsx
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d53232e-ebac-4aab-83c6-08dee508b7e7
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2026 20:11:14.3829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mZndiMCjh4pFQroPRgC7AzHyQKbtpkMPx6wZ3UzpWrAf9TbjfF2c8awAcVigNSAAe8i7iphNazj58M1W2Ea8UlQPKXkmhN2U34BVb1c1Gwc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0774

os05b10_set_pad_format() calls os05b10_set_framing_limits() before updating
the ACTIVE format. As a result, the VBLANK control handler uses the old
height when recalculating exposure limits, causing -ERANGE when switching
to a larger resolution.

Update the ACTIVE format before adjusting framing controls so control
callbacks use the correct dimensions.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index d124db74766c..82a96081fe21 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -907,14 +907,14 @@ static int os05b10_set_pad_format(struct v4l2_subdev *sd,
 
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

