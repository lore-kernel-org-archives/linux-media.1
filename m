Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020114.outbound.protection.outlook.com [52.101.227.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E304033D6F8;
	Thu,  6 Aug 2026 12:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786017774; cv=fail; b=UpNFHvU8UqL4a7KtI0lAyKu7BEPc99TwB0ZWxSHfclAVt1ffHMmtCeqzI7jKTznO9gInGwmN5zX7yo8IubS8HA3jVgGOkOV7vnnFXtRmUn93PQMOSlntvYcIy0jo/kCPuSdiP9+8kgKrDak4NYmi5y/E04m8R5Tq+yK3+KUa5tI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786017774; c=relaxed/simple;
	bh=A/P5WQAWWzUKfW1O2YhAh33KI9HbfRknlA1DSC5Piew=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fdGZCweM/6v5heFa3sryfitOKVk6xHzsGxr8Q+XJpkjYfAHOqAaDrQxkv4I9qfarFqyemot5Z+4KqFzE08w1MUrISxlD/UbAou/4qoK44VscLDHc1vh0qgRl1GL9dw1xjg2QorS6Ge0/g7SgETL1xCKoWCeSj20XdJSBNNdqBcE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=ZIHIuH/A reason="key not found in DNS"; arc=fail smtp.client-ip=52.101.227.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="ZIHIuH/A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dx9Jf+XvIITfqWAacrD9y57uyun2yk8ZHrajBffIKbG6Na6WzW30tmvo0oCRSES/rf5/WC0U6+kjoiwKsW3kVUgUTluVoY6Y+PQYC0M2Ws8wTOuBSnTub46Rx/r26DZXkyYFAOnvxcbIcL59AnfMq+SOuDJ5iGOZodcqoq5MBHZkN2/Z2DjaSCjWIC5crSzFYjFm8Mv3XA9QIoj2YuabRL+SGRt1Id15vGzS0+4Ug31nmwa0oS+w/gkIEVbm/jLrz/L+UjMXAlsMVvVEhb0oRl1EFmTYd6vOUcmjX+iTSJtVuf1gUgVePgW1dJW4CeIOOPWHx40IOa4vQ0cshfNDzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bTK9naZrA7aePspAy5n7eo10Vgn/Q6tzmo0PEQjGgnI=;
 b=lRl/ODqCFaDqDx4z8EjFr7NIcu2oWxXQ+W2RswriTRYtwcqoTHcfFG6TXgottvAT+88PNlEnaT4SC+jd6nlEBLa0outBr+nX5tNfoRzBCu9BQeI9rN4hH0DdnpuevnnQIsKrpKPrB5PRfg7WskWu/Uw45Fvj581yiHdeL5fTPwQP4P4/tBK8HB+6Uoy0QS7xOIm/YNdIhQfShBkusnxH1FIWpvKHBvulHj7QsuCqv3poUS2Cghb1Eu64uqWlAs/7hLVYp4CXQ0WH0bh558k6cc0zqpvO5zW/xpemwZxm7BZRG3CYG9EDKNO92slmgCkAJvsqZreRHF45CUCtUY7iLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bTK9naZrA7aePspAy5n7eo10Vgn/Q6tzmo0PEQjGgnI=;
 b=ZIHIuH/AnTrfA1ja98Jk/VonxZiS+rL0zRG2+8RT4drR2qyJ6yLlCzBTMAUj8ofLcerKqml+YWl4sR++3kZzngPkhc2J+EhPTZLBmXaE65BwV3/3L7fDxjHmIUUaHZPgwterdR/9Q3kvRfXXYzP7tanFZV0jjA804FyZIlz59BcLx1WXWD4fr/Mq8ibSu16WIDRHq52HlsxhcgHYW+DD3pWqrbu6qofrRGNDXzzKeFt7WKmusbsFjYSr3wnDaqFPYydqtkKz06UBDLz7AIvNQuiIe1auD6xIOL8xUZlAXeZUaODrN+cGHZHEBVOhUp0lZIdS/9N3WaPrjjVAVvQ53A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by PNWP287MB6109.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:345::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 12:02:50 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%6]) with mapi id 15.21.0292.019; Thu, 6 Aug 2026
 12:02:50 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Kate Hsuan <hpa@redhat.com>,
	Walter Werner Schneider <contact@schnwalter.eu>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Miguel Vadillo <miguel.vadillo@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: media: i2c: Add imx576 sensor
Date: Thu,  6 Aug 2026 17:32:07 +0530
Message-Id: <20260806120216.24145-2-himanshu.bhavani@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806120216.24145-1-himanshu.bhavani@siliconsignals.io>
References: <20260806120216.24145-1-himanshu.bhavani@siliconsignals.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-MS-Office365-Filtering-Correlation-Id: d7a4cecb-ece8-4944-3bf2-08def3b2a30d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|23010399003|56012099006|10067099003|3023799007|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	H7Qh39VEcBHzgCYsw3sDjFeyFReyfXjIShXdy939TIlzqI4XXIO15cZZeSnEh390zuswqOsEn6rzxdIuiNF9kU7Nz+R//oFqdp98Nqf7gu3p7Nm41vvc2IZmhif3RXqB4loS/WAScDFXm8YPLI6ytpI6XJ96OCoIA/ozT8UH3z1oqhUVWr9B6d6B762VSVA47/t3w6/Mp+YzVMNJnxnp9lmOvJYCnSKKdU7fHmUdI6+VML4v5WfDwFRH92DQlp2XFmSAXvFK8WoUd6CFcGN46CcFy63TNKTh27BNkmc7SNTRbcxUl+cgA0atcjpqldoiJh4LL7fAVxgOQ96wQoeDHckIR1zjPx92fRc13F45dNaOStMo3hP/FKJ5p8l/jrKL0Yy5PlR2bK7BamaCPRGtIL7O5SS/QFa4CIX8PzFxlsgldSo5N0uDHOYbm90cXFhQHW8LeFb7c8pf6gkbYe0qvFDHW/hd60IS70c79wzx2q/mV2vf5s6e7EqIbLXRx49WeXFY1nAWwaKLBdtvN7jdvkswMEXysDJYDvlvd43ZwIRtDfhnuZeQCtpkufDLoIXwlqjwt6Qnx0bxsyS5aA1SNrWw73hWWfUHVbKR/HnEUtOo8x6viuciBW0IHFUJ8TI7Qc0mQsDX/zeB0Wl75Ywcq9G+ocI7wjg4DiMbfOuUl6FQiheBznCV1sfBo/N6bE4hpJ7ceOyem8bAW4bduyW2vmn/4n8444z3aNrGDeFRgCY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(23010399003)(56012099006)(10067099003)(3023799007)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVN5TFJzUUJkenphYVhiNFVEbnY1aEpJTDJxR2dvTGlpSlM1Nk1kcDFVbE5U?=
 =?utf-8?B?TVZzWEtIZ2lwMmhHWlJiYXozWjNGVDdOMW9VMmd1aDEzZEhWK2xaSzlrQXVj?=
 =?utf-8?B?UVhoSlhWUVFjSFZrVG1Tb1JQSVVwM0I1K3ZpbTVudzBBZTdmVFZnM2p0UWV3?=
 =?utf-8?B?Y1ZqWk03ejJuc3Jxc1EzNHpzcndQNGV1TTExZGZEWUcyYUJkQ1htK09VVnJ0?=
 =?utf-8?B?OS9DeXo5THlFK0tSOVNadi9ISjd3N205OGdIeGlnazl2SU1EblowemR5NzNw?=
 =?utf-8?B?V1lMWGphSDY3YW5UTWpnU3hDT0lPbDg0SXBEbmFVdk9QL3VrUm1PNkZhWEdG?=
 =?utf-8?B?a2srdGtMc0NubUZ3VjdHMWI4b1BMaVRJSDJ5WnhBdGtId050NE5jS0IyRmpk?=
 =?utf-8?B?RE1saUF0bWVjMW80NDExMXhEckYzWHg5S1RJK0dpeWtaeXA1Vno2KzJwUXVR?=
 =?utf-8?B?UjRBZTh0VGRNNi8valhoTUtUMjJ3SU51MktlUVI0ZUxaREZGTGkwZW40SzUw?=
 =?utf-8?B?L0JzNkJEWHNhdG9xUDJreVZqVk9ZVEwwd1ZuZnJvQ0Q3NjNUS29oY0hFV3ZF?=
 =?utf-8?B?SHJhemJPM1VZSEJKZ25GUXlXWkVlTEJ6OUZNZXVHRUJyUUowbzA1dW5GY1lI?=
 =?utf-8?B?RktOUGo1dmgvWWZZWFVmTW9sMG9qMjlCdzZhRDdOMzZRRUFpTmFmWW1BQ1Uw?=
 =?utf-8?B?MURQZXBGQWIrSU9GejZ3YjNvVVAxeE5yOXZOenQxWFVRZDdDWFJ1QXJmNHhZ?=
 =?utf-8?B?MkZrcHV2YktFNHhZNXowU2ltWlFDaEtnSVpOMms1aEFqOGtZcS9LTVdWa3NX?=
 =?utf-8?B?R2IxYTVrRk1DaVBTZVBGU1Zlb2Y1Qlg0b2hEVXZJNU1EK3FCMkxQajZtY09S?=
 =?utf-8?B?RnovR0lMclJaeFBDclFqMUZmbUxXWHhmZUd1Rm1Hd24vMGdrTUp4SC9CVjBi?=
 =?utf-8?B?Zko5NVlBYWJobmhZWVZ3SmN1Q1FhMnlYQU1XVHhrcDVDaEpuWjJmcy84R3h5?=
 =?utf-8?B?SWFQUkhvMEpVeUYzSkFhTGozdEpFeVVIQ0tOOG5teEwzVUlTOFVMcSs4QlJn?=
 =?utf-8?B?d0dwNTgraGcrK3VwbFBRbkhSOGUwZUV6RmJaMTJBQkdJV1JJVjdSbXZqMzUy?=
 =?utf-8?B?VnVsTkxmdXpYSFVSSWFYaXJDclAvZFVOS3YrS09TNWs5MlZ2NXkxdUIrU0U3?=
 =?utf-8?B?RGNmMlZkb0NWQzl1M0ppQWFrWjBPS2RtY2NqdHJ3NGxLdGk0bUVieUZvd2hu?=
 =?utf-8?B?czV2amJOS013MDNIeGxmNTNzY1JGWjVPTXd6bGwza3pvcExnWjB3R0dqNStM?=
 =?utf-8?B?Nk9JN1ByRStObHo0T3YzTG1PSWZWWHJCVWsrU1haRTRWN3M2SXVHYk02cUk2?=
 =?utf-8?B?YmJDL1d0Rzl5d21RTFA3RndLK2NjZ29RUmpMWTEwM0pERWNmZElNUGhUUUty?=
 =?utf-8?B?VGExSTRCU3pmMHorY0hHcUQzQ0xFNm9NK0Y3TEhEb3lTWHB3TjViMDJ1ckZp?=
 =?utf-8?B?a3VDQzJUaERQMDZXQmF1SmphVWc5b1ZwNFV5am16ZDRwb2IxWi9jUkVtcjFp?=
 =?utf-8?B?c1htb2trQUNMS3MwQ2VKWTdqbGNtMG1xMmVISHczSDRrQjlHemwzUXFEU3Ju?=
 =?utf-8?B?UDBlSEI0azVoZVFNT0ZmdStseFNFWW1WaC9RbnpmMVoxKy9Cc1BZdGQxamdH?=
 =?utf-8?B?a3R0a2FXa3lIcUs1c1hyUUZIZzRDb1dTR3JJRmlyTlFkQ25iMS9zUVdrN3BM?=
 =?utf-8?B?dWFTOWJ2RDJobDFMVFljSVNYdjExOURYYXBJTHlSb0hOcENxMzhjdDZYdThx?=
 =?utf-8?B?K3hlUkpCN3lFZnlVcUlLalI5Y1ZoazdvaUxVaUlCei9zcnJRRkdlRVNrby9h?=
 =?utf-8?B?OHJJM2lNWVdwaVc0L2p5NDd0Q3p0a3VmZjJnWGlDUkk3eHBOMnFOWVA1cTZK?=
 =?utf-8?B?NmRVQW15YVByWlVHWkdIRzVrY25BMTYveDRjS01KRkY0RWJjNk1XeEt2a1M5?=
 =?utf-8?B?akF1SkJxc2N0Rmt3Y2NLMWFPN0ZzQVFLU09MeDdCSUMrdVM1ZUtCbThWdGJH?=
 =?utf-8?B?RVp4QUxTZjVmVVNSa1NMQ2pBR0JDelRoWGZXR1Y0d0ZoaWxrNHIzNjNxTE53?=
 =?utf-8?B?cXdkQnNoVkxaUzBGSE9ObTBMYUtTVTJhUmc5WDlzTjhmQUhVVkdXZEpaNUl5?=
 =?utf-8?B?MDAybk5GYUpHK0hZck9aU0pUNW9mc3lOMHNINDVHVGl4djI4a1hZd3JzN3dt?=
 =?utf-8?B?S093MWI4NUZLVUE2WmxrdmZKNi9IRXhGamlYY09oUllNN2lWUlkwYldvVHQx?=
 =?utf-8?B?b2NxMVQ4QzZJMUp0VmdYNlNzUHVYbCtadW1ZME1MNmRFd2dQczU4M1NpT01O?=
 =?utf-8?Q?JJ9oon1RIkNHotiSoqeT4v3+T5UgOi048vu8x?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: d7a4cecb-ece8-4944-3bf2-08def3b2a30d
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 12:02:49.9439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SOVnK7mt6epfWRqWbD9JdcYV5z4tvIEmYIysxhZOQCRysWaz8BWgPRUY+uTGW4Tx7qd/m5PAK8GjygRVf0AkVySyUz86Y6rTaMcgul9cTrQG+0G/h2lvNFA/PeSpymU0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNWP287MB6109

From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>

Add bindings for Sony IMX576 sensor

Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/media/i2c/sony,imx576.yaml       | 114 ++++++++++++++++++
 MAINTAINERS                                   |   7 ++
 2 files changed, 121 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx576.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx576.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx576.yaml
new file mode 100644
index 000000000000..c82efd17eb7f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx576.yaml
@@ -0,0 +1,114 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/sony,imx576.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony IMX576 Image Sensor
+
+maintainers:
+  - Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
+
+description:
+  IMX576 sensor is a Sony CMOS active pixel digital image sensor with an active
+  array size of 5760(H) × 4312(V). It is programmable through an I2C interface.
+  Image data is transmitted through MIPI CSI-2. It supports RAW10/RAW8, COMP8
+  output formats.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: sony,imx576
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: INCLK clock
+
+  vana-supply:
+    description: Analog Supply Voltage (2.8v)
+
+  vdig-supply:
+    description: Digital Supply Voltage (1.05v)
+
+  vif-supply:
+    description: Interface Supply Voltage (1.8v)
+
+  reset-gpios:
+    maxItems: 1
+    description: Reset Pin GPIO Control (active low)
+
+  port:
+    description: MIPI CSI-2 transmitter port
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            oneOf:
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+              - items:
+                  - const: 1
+                  - const: 2
+        required:
+          - data-lanes
+          - link-frequencies
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - vana-supply
+  - vif-supply
+  - vdig-supply
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/media/video-interfaces.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera-sensor@10 {
+            compatible = "sony,imx576";
+            reg = <0x10>;
+            clocks = <&imx576_clk>;
+            reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
+
+            vana-supply = <&vreg_l3p>;
+            vif-supply = <&vreg_l6p>;
+            vdig-supply = <&vreg_32m_cam_dvdd_1p05>;
+
+            orientation = <0>;
+            rotation = <90>;
+
+            port {
+                cam_out: endpoint {
+                   remote-endpoint = <&csiphy3_ep>;
+                   data-lanes = <1 2 3 4>;
+                   link-frequencies = /bits/ 64 <1017000000>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index e95fc6f2ddc6..faf5753be337 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25437,6 +25437,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
 F:	drivers/media/i2c/imx678.c

+SONY IMX576 SENSOR DRIVER
+M:	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
+M:	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/sony,imx576.yaml
+
 SONY MEMORYSTICK SUBSYSTEM
 M:	Maxim Levitsky <maximlevitsky@gmail.com>
 M:	Alex Dubov <oakad@yahoo.com>
--
2.34.1

