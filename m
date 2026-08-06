Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021105.outbound.protection.outlook.com [40.107.57.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DCF33D6F8;
	Thu,  6 Aug 2026 12:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786017763; cv=fail; b=bk2W+Lz+4rxhXo4vciBk+NWzz7J3QsWpnt9T6atgyVtnFhht2R99WFyLLj5TY6prtyl1NAUTMOa9ywRYfpjhrF0TphQZYJkoD1LzLDVP5tbVe+BW63ghrp577BsuAnXwlq0Xww5b7//d/ze5LRlxmYUm3OJY9+OngYL0HjCAlqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786017763; c=relaxed/simple;
	bh=e7kgtaLC+LJMXZsRLt6XUCrseDGnGdSj+b3EGNOaTWE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=o5Pr3bFjbU0xxqokwNA+kEapg646xjMfI8I1FxO04dg8fEP52OiUoHtrcBy4BnkuH53ohA+MzQkB/Gs+Xt/PJj0CBKUPNQ3NHeJmqhT3KbGdD0XPtn1sEDu5d68G+MEk1oYLKGzpKpyfb2QKi3TzVulK5ubP0c85/eXJ/MzgxTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=hhyAg2fc reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.57.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="hhyAg2fc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wkg1nzYeVVswwingWjxCtRHv2CJQ6icv+CVDE6nzfZ1M1KYs34ovLSg7gKkhToRD7AusqExQy2ileNjcGG05GzilFjt7xgRUIlQSm4nfjKCJgMucx7wF2oZ6CBVMABYA8phB3GZh4/zUq+PHObhxSYd+1E2v3CpnUJoW0byH0rkGnMgjyxlAaQfDeqDfC6Kvi41/4GGNnJu6VmI57XSlB9m3BHuNkSKn+kHSaNnFENDLmiMAYzixajc58KU3YJ78nrpEzwpDIVSjKYQ85uv+XCV1lUKLVI41jdydLcazfQZuaa1XGhXiIsxSE6ftLyazyLzR/BZPqaq9WKi1mQbqYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQUsU7r74WwaEDUr3WL6pebLs1VNL3ntOgEM942+CJU=;
 b=gmSVamKOXcMbFY7Ic7ocmI4X135FLKkcdKCIgQWHd4VJhMnf9RLQnb66rwsvRBrsbnuo0OLktuXLs/uiXMZmqB5r5zX2Z72wojPIcrD2ONHzt4xCEJq0MKtdTlU7FVKVV/wvLzBU0L08DPTsp6ahl88rEvgn17dv465maLM6vTDK5dAuest6mz6pJ6Mp5wayha6v7uUWddQVoZphN5xm8Bvjw2XsmQhysbmVLWLWalVA6ez/Jc760CGbBBf6/B72Hox31QUVnvwiPaD0uuEn+INDJ/Y/YFXLdOZSWkgAEl6EaiJYEwJBUZsd9GsIH5LAiNy/H3Up+RavgOA0g9iA/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQUsU7r74WwaEDUr3WL6pebLs1VNL3ntOgEM942+CJU=;
 b=hhyAg2fcI/obW2BAl3ZB3CqjFOvnDgpep85AZ22D6CZ7kRN50CboMe2SODEE7UcCKf2zD5enUOF3C5YTLhOsTMlIMdcvImzyFnDOF+Btq3g6rThFJR/sALSzLr8W4k6dvrXS67N36E5hUUjRSIpDDAp7AC/bqLqILrpz3r6fsU9XE/GJ2sBVPEbQMCEwfJmlqEqPDhzNmjFd6qR3QLlUPZ8KQHrKGFUt6nK3Gki8dvLhH/it8UQqRTPItTEK/iuKCHGcmT1ZyMs8m0fLnTX9X26PuVoEaPrqVovcXg/KkcVnkMZ6Y0/PH7HqvUC8sG7JM6Zi8TjAVo9cjbr9dlhLlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by PNWP287MB6109.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:345::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 12:02:37 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%6]) with mapi id 15.21.0292.019; Thu, 6 Aug 2026
 12:02:37 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kate Hsuan <hpa@redhat.com>,
	Walter Werner Schneider <contact@schnwalter.eu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 0/3] media: i2c: Add imx576 camera sensor driver
Date: Thu,  6 Aug 2026 17:32:06 +0530
Message-Id: <20260806120216.24145-1-himanshu.bhavani@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0246.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::16) To PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1b8::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2019:EE_|PNWP287MB6109:EE_
X-MS-Office365-Filtering-Correlation-Id: 1add3158-e968-4f51-6b70-08def3b29b74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|23010399003|5023799004|56012099006|10067099003|6133799003|3023799007|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	Hu3g7BhojoJagl2ry9q7tivsMyWVJh8W9lzQXobox0HDJdxlXfx55gJWem/qWBdc6jWlPzazJFSd51Qpqd9Q+YDa2hlPig3SpSqgofaubqUv6/KTVAhO9DxphogZh1FrJo+4eJe0TTVjtHYZ92/f+GbDmP8///b1mu1IUS9i1Mb0Nob2gaZBvjjCeLYDQx4asTlNT8vu3lnvWYH8rPGwHLHVAeiI9hgsGma6TZP6OUoX2b7iBFaahP+Y9Rp8NHaV7pD8kfR5BZzcxEAAHEPfxTu87R+/ri7SxTRVrZeq8VpXJmopt8weL1QxwzUSWDDVrJsTtHgXiw+kpM2Y/NBm8jJhB1EykmEWl2j+/EWheBt0aKaNEcTqN2ouMQKPwDvih56Is5GIhr+Op1gfSKQ/A3v0DK81aYh6DNc6JHfxVmUz41vmkSWXvaEyy7oZiqJmjsrUyIXWA0lwACQRvuKYOYUHfvx11eu/qYww2d1WTFpdXBXsBSYTj2K9O1tRwRi+LUchWxMP7FJs+5QByBFGMwb3irapziz4ij7xweWu/cSmv5ZTptqoRZnWVu/Ol/vL9DbXaEVTDRMeADfhHXZ9GxhLJ29c2LvGUMHddNwqWU1vTWAj0l63g35F1kBQUp+BAr3p1ERG0A9y6E0ETx03US4HXBE86vV4YH3KmRwVGa8tzKw6c6FjwUfnw9TKXB8koz2A2EUy3rkTHN6vtPPDFxFXjDfcM/sXAhnD94w30LQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(23010399003)(5023799004)(56012099006)(10067099003)(6133799003)(3023799007)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5hRpYjqAPE84sIvv2cX/9EO+422qEtCbUbuSRrxwRUjlFrNoKzLJ+nC8rs/j?=
 =?us-ascii?Q?X8un++6eNt22qdej9ZhK+dCIJNkgT0/tQ9rJz37Wi2h1XEJu7Oiv19f4nOEY?=
 =?us-ascii?Q?5njuHOAAVKN/HkaqYbeJ55Y0/Anh+TunqXOd9wRjXH1b5bq0fyk1+8LVqZHy?=
 =?us-ascii?Q?vBnumf1oNa0c0buSsX4/YpFJX2ZxEdeKPOqMo3nbnItqUiqPd/TR8QOB9WPS?=
 =?us-ascii?Q?IhvAc8tbWMA3aZpCAn6iVNckd8mQgLA1FdjcKtOBBH6JI8yg77Ji0VV/oHue?=
 =?us-ascii?Q?vUYWgaHsrnYBJBegmmLQedp6MJi7Rp61W5ZfZtP31Stqe5ase6i597W4ljx0?=
 =?us-ascii?Q?BZNrE0y49qa2dEcpGESeHsq0rUiQf13VNPrdPsqZe4d9Dlm9bwLyi35G4jmL?=
 =?us-ascii?Q?/xLOaKcFpWIH5x/qRmH6NSy3x2MuHizG44iUM4GS8fN2uWRR0VqYIwBPz+xz?=
 =?us-ascii?Q?YZ1YadmvSYmB6GtWbXA9Fj+VlO4nD3BO/bBg9NTjwdmAHNZ5EkpMX4r7WqUK?=
 =?us-ascii?Q?JPB4HXDgz1UTMQi52mJFGuvRXcpt40aIeBrttoXCqgm+Vgb3V98yBxXwwItj?=
 =?us-ascii?Q?W6DLGgec1PiNzUIR2o/KQmqRqJwOmUNw7kI4C3sRwNqrWIhWiof0gD5djERj?=
 =?us-ascii?Q?O250MBr9pLXa9nyCdjdBsF6D6RKuwS+Xi8y/zyiJgTcdGZQLJvl7AKi6jf8p?=
 =?us-ascii?Q?gjlWECMTMJPEN5iMS7f5q1158Q6LA//0z2VzxGVNkqQN3KLBWfDXJAFKcrWI?=
 =?us-ascii?Q?eFxu41g69cdSl1r5SEvxgHcwmmiJMLWWeguAzTo2i6imFhQgFotzOnKwz0Cf?=
 =?us-ascii?Q?1YQmjT9YRuQzqec7sfKqzM2Db5B4mqtGvG5NUPwrilPbUCFRHzp5VF6mMAfm?=
 =?us-ascii?Q?u1E3TyID9N9w2DjNFchgP7X+zo2+9njvI0wTVhxBf7YgaAsWnAeiHA9TyVY8?=
 =?us-ascii?Q?TD7vtVBjMDLh8OdOYJgJ4E78zyixXcmO2Blq3Y5lFn32UECs00F8kuqlp9gK?=
 =?us-ascii?Q?AldAv7JXrEVCS1I3N+7vLE9QATDoarROO9s+5t9/W1GQwdza79GQS/Ry36MF?=
 =?us-ascii?Q?IYK/j5PNv6O7KFCJ0owGavHOce2LfeOfEgn4KvjqKcIAQgTkQcJXIWAzVHjw?=
 =?us-ascii?Q?RGe1EhsxuX553TxVH4YCpRPVSz3EqGfwZ9sVceDiTSQS+mnKG/sFJkdgzAP1?=
 =?us-ascii?Q?ZG00ALcEaCJMWkDDTlhII6zhVXbRwRO6lov9/5FXv5ajTQg5L/rNAZo2hUNi?=
 =?us-ascii?Q?cvezNO/jeYbSp4pUpGhy54iVqP11oz6Yk8pPHqTUAYP/O+jLlD2LYMQ6pFLP?=
 =?us-ascii?Q?fweWpJYy9gdD0NleRnxYc1BM9dgFPCdt8gGYj1W2ZnJtvQLQszwBnEgzK2Ip?=
 =?us-ascii?Q?iSBRDz5jTlHCE+qikFRXZE7vNzfaPhQMVq91DtEsfnAdOzE6lEBI1tpiioNl?=
 =?us-ascii?Q?0Kd8OacjxQ6wK4tcsvYYY7DP6x+AQnD7X9ASG6K5lvnlovGSnZQXCz6O3jx+?=
 =?us-ascii?Q?wUl5a52VTR+35IsGiVFQSrH0VVeCan5wnmtS1DtuURzqFyjBWrymD36vSB+H?=
 =?us-ascii?Q?jYaTUovK5/U2BkZn1pn2EWKxIcz+Xe7vDPZdujl98/dgsVrvYrsS3V/iC5se?=
 =?us-ascii?Q?6eYkufkA0Dod7YJvy1rR4KG5eDlsY43DfhH8VXY3mkRNh0h+Q0nm6wwYqkjy?=
 =?us-ascii?Q?AYeJBqFJ7f69m1Skzc/PYxx6dpa5Yh2Ea4xHJn+l4fypP/OHleeiRrKBjswR?=
 =?us-ascii?Q?uaGbKcJYsV3Nl5nAEqajNtubMq+mhyjRYeh78ujup5g0DOBEPob8?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 1add3158-e968-4f51-6b70-08def3b29b74
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 12:02:37.2843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kbnI8h6ajD2dqatTJlQqRBb62U/izpv1UOknHPjsgXIt3bhXPo+hnK4J/dvxUyA20fLAG44HUBP0VxKKJWXiVUip4KcAiEYA0JrYnXYMqTcGiiCT1mZhzyLNz1y9lY8+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNWP287MB6109

The following features are supported:
- Manual exposure an gain control support.
- vblank/hblank control support.
- Supported resolution: 5760 x 4312 30fps (SRGGB10)

This series depends on the SM6350 CAMSS support series
https://lore.kernel.org/linux-arm-msm/20260216-sm6350-camss-v4-0-b9df35f87edb@fairphone.com/

The driver has been tested on the mainline v7.0-rc6 kernel on the Fairphone 4 running postmarketOS.

fairphone-fp4:~$ v4l2-compliance -d /dev/v4l-subdev21
v4l2-compliance 1.32.0, 64 bits, 64-bit time_t

Compliance test for device /dev/v4l-subdev21:

Driver Info:
	Driver version   : 7.0.0
	Capabilities     : 0x00000000
	Client Capabilities: 0x0000000000000002
interval-uses-which
Required ioctls:
	test VIDIOC_SUDBEV_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/v4l-subdev21 open: OK
	test VIDIOC_SUBDEV_QUERYCAP: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 12 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK (Not Supported)
	test VIDIOC_TRY_FMT: OK (Not Supported)
	test VIDIOC_S_FMT: OK (Not Supported)
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)
	test blocking wait: OK (Not Supported)

Total for device /dev/v4l-subdev21: 46, Succeeded: 46, Failed: 0, Warnings: 0


V2 -> V3

In Patch 1/3
- Added required endpoint

In Patch 2/3
- Change the capturing to full active-area of 5760x4312, up to 30fps.
- Replace mode table with imx576_program_window().
- Added DT-configurable link frequency with PLL parameters.

In Patch 3/3
- Replace the hardcoded orientation <0> with <MEDIA_ORIENTATION_FRONT>.


V1 -> V2

In Patch 1/3
- Rename regulator supplies to (vana, vdig, vif).

In Patch 2/3
- Rename link_freq array to avoid confusion with the link_freq control.
- Use IMX576_EXPOSURE_STEP in exposure control range update.
- Make cci_write() error handling consistent.
- Return imx576_set_pad_format() result instead of return 0.
- Initialize link_freq_index before creating the link frequency control.
- Replace dev_err() with dev_err_probe().
- Remove redundant comment.

In Patch 3/3
- Added the remaining supplies CSIPHYs (0-3).
- Add comment for camera orientation property.
- Move cam_mclk1_default{..} pinctrl definition to SoC SM6350 dtsi.


Hardevsinh Palaniya (2):
  dt-bindings: media: i2c: Add imx576 sensor
  arm64: dts: qcom: sm7225-fairphone-fp4: Add Sony IMX576 front camera
    support

Himanshu Bhavani (1):
  media: i2c: add imx576 image sensor driver

 .../bindings/media/i2c/sony,imx576.yaml       |  114 ++
 MAINTAINERS                                   |    8 +
 arch/arm64/boot/dts/qcom/sm6350.dtsi          |    7 +
 .../boot/dts/qcom/sm7225-fairphone-fp4.dts    |   54 +-
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/imx576.c                    | 1054 +++++++++++++++++
 7 files changed, 1247 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx576.yaml
 create mode 100644 drivers/media/i2c/imx576.c

--
2.34.1

