Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020115.outbound.protection.outlook.com [52.101.225.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C47E304BB2;
	Wed, 19 Aug 2026 12:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144251; cv=fail; b=oGI0cAFWyyo/sJh6tQbauwgRvG+LJcPeDgOax5Fh1I7kcQ8ajc1u7/oG++Wp7y1bUCSZj5akZiQ3eTcgiiAiUlQ309o3GkejAV2RF9aBXbXLXkUHXjhHwLKamgMYOTEtqxjTZ6PDn9CdQSOzqJpoUZw82W1FW+RNjgPjcJfyYLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144251; c=relaxed/simple;
	bh=A/P5WQAWWzUKfW1O2YhAh33KI9HbfRknlA1DSC5Piew=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VfdsO8xa56L4RtD+S+9Asl7/dTeoNsBOTnbBzfY2YnlDaq7kAGHUjoFfreyTP6R6ePs28e4fXM8U/t7rzplh7QdB6vPz2CNot2fZRsFeNr52QznpQTC6MYKCwx/Fu/F6jHUMGr6+ebEVzvh/4iKa9ifgEsyOsI4umapf+JiKz6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=UeKIumGI reason="key not found in DNS"; arc=fail smtp.client-ip=52.101.225.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="UeKIumGI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=egoGACPu26p2NegVTOgNFA3ZXVKPj42t4baT9kULsMR9RY4P0x4X9UsEZqBBK3ytL0RaL2xdpBxX2TitAZhTd689MPnP/PHr+Po5cLbJ1VUAUHYzrxwtKK0B7nrgAfEVUOC5u3MBBX/ZNRBkel2Tl6Mj11jiR2+oRIh+OB5k3CbaQxAyxBWcgOfMxAAEBp/YST75nzrPwnw1s3k2cnTcuYWbSCSaUVJorV9QK7NLEfUZk9CCUyKIk73jjpLhYYFWnHgOKFPsHyQbAlakethyeFAuxTgN3rPEnHbnS+GiwywjFj+Gm4HvwuFoqZk4pbcjkT8VarrwzpYMJRoJq8IBdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bTK9naZrA7aePspAy5n7eo10Vgn/Q6tzmo0PEQjGgnI=;
 b=mm5i3dgBY30lrfNaJk3jnVgp6/jSPhvdENlbVVPpUFiW+/KopLsPFt7DAb/VZTHtPOIJ1bpy3/t643KRfbdxC/zJLcVmmrtzJGAj31LrsR80qI6jLw0vtaj0KLLbRGjmEZtZb9LzuQfPgtrc6gdMVjdpJTVxexijec+7Lo5mp50pHUuniQQcof1Mb/0hulZ29zR3aW2HnbdcVGNzHy7kM/by870JT59m8uSiwapOT66d4pjLdAW7V2Ya5oiYSHoU5XEuEnz+jwSwMqNvQL5mcfQgdok7Keq2NwKxgiwcZnk7uUTcKKiiqIiiELVE9vy+1e2WRavDniwK1kfJdMVNLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bTK9naZrA7aePspAy5n7eo10Vgn/Q6tzmo0PEQjGgnI=;
 b=UeKIumGIpWEM308H84KGPwUe9uBrfrHHo/+D8F9tt6mQMo9dz/JQ35KwxVvR7DC9HVOyEdDmstkIxRK379SFUzC9gWjOdgUD7zH4hitbwwUKb00cEdwLE3PPApwm38PIf2EsIJKrvUZcf5fuMcMPTmqUE3UmOtm9YbqYAEq34xcol/zCYGS2idgHkQcN7sG8gJjprbneg5cjo4iAaS0CD4aHqxx+L+ztK4ZYpYCQnYJ+hJXr+bUFB1RZytH/+MAgoThGWMSErevCdQqBMrxREdVhxQq2DHpKwGbuFUGclVbSzIb4UUpdYBXUY3JXKFVY6ZYKRbjuhhr8C4G5t7CTaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by PN0P287MB1762.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:188::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 12:57:25 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%6]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 12:57:25 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: jai.luthra@ideasonboard.com,
	tarang.raval@siliconsignals.io,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Kate Hsuan <hpa@redhat.com>,
	Walter Werner Schneider <contact@schnwalter.eu>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: media: i2c: Add imx576 sensor
Date: Wed, 19 Aug 2026 18:26:39 +0530
Message-Id: <20260819125647.68910-2-himanshu.bhavani@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260819125647.68910-1-himanshu.bhavani@siliconsignals.io>
References: <20260819125647.68910-1-himanshu.bhavani@siliconsignals.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0074.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::8) To PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1b8::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2019:EE_|PN0P287MB1762:EE_
X-MS-Office365-Filtering-Correlation-Id: 19e155c9-9a70-46a9-0abc-08defdf16a96
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|23010399003|10067099003|56012099006|3023799007|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
 eOthvFrC6LnQCCHO9lgUMR51L9RkYjlx8fMaXQCYvD0gHS4jJUHU/IHzNaYQPFXwZeeBLNDu7rNPFDo7fDBnWNmtG/hD+r+1Vfp1E5Nc6LduLf7quUvMyv9c8P8A1HJcIZueH370ehnaMEprisUc5VFoIIPdzAaVxX4EFZQJMwZswd8MoB/WrqQpTiUqc9FGc1pTW+vDoTrojUIOSvPSckGbOZJXz9PkhIh36SGQYLdTrmQzo0kDSCcIj8cczHMXTEXWgX8N6Cv1+OC3ezh3TRmgWhYi2rIzx3qCWkRlGuxwpACA7tfp2VNRscSrn/5Nt3piMmbjKZ+Wc9+c8n5mIRDd2GMNeR82o/0alZp2aED0O6F3pj5VxOQ86kden89utjQMpkNzzVuobpcE+pIQxO/nwrHsa0L2AFpd+DLRtcljOlpUSmEJt7vREp/SErFvCy/IU2VakA5dP+cujpJEckWzayz7k90nzwkDnP2Ave9DCkA1o3padYTqJVrXsdobnZiP4Bw+kB4sRUV9cjTrBQi6icm2o7PUkfJB1VgF54ymp12P1TmHVwMLXVSI6G7UyvP1qSQfWhBFDqZtR62FPq0qUAwvIKEtRo5SPSBu9zdVUTcEs6aKsNA73/CfFEloh3Hfd7ngyOIFgMzPEGRFEKhfCTG8fXqTv5cbk0dGUlE=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(23010399003)(10067099003)(56012099006)(3023799007)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TnJDa3d5L0pKcUF5Z3ZCTjNLbk5FWm5MdkxOV2pVN0ZaNHlsTmhHOHVmemVB?=
 =?utf-8?B?VmN5ekVpNzBOMzBEcnBKTVBBOWRRcUthRDJtT1crbDk2bHhIMW0zdVlvVnFv?=
 =?utf-8?B?Q1hrajB5L1B2Tnh1NjNWeVgzWldsM2Fkb2ZueU5KbzMxZXVjdUd4OVU3dHd4?=
 =?utf-8?B?MVdNZFJza0ZFOHlGcTVTejVoZ2puQ3kwdFc3Yi9GcWtiM0dmYjYveko0a3Rz?=
 =?utf-8?B?UXhaSTFLbHdPN0JkWnJ3MFZJMDhCZG1lNU4vTG9HTmM3Qks0QTR0RzBjK3oz?=
 =?utf-8?B?L0cySDBvVkVoVUd1aTJ6YU5lRGN0dUhZaytlSXRpQlA0OGNKbGdpVFJOR3Rr?=
 =?utf-8?B?bWZ4Q0FZVm1uWUFLc2dJM3JkWU5qRkFXWEJReTVxVHIrR3F3SDFRL0tDcnBU?=
 =?utf-8?B?elJhd1pXVjRHU3l6TnZXVUczNVZxMHlJR01nWXVWakVrR0hDeG9WMkZsUll1?=
 =?utf-8?B?TGRtTjZ6N3F2RkpNVmZnZVRQSUk4bHF2K2d2dG4rbXYvMEZLZFF3REZmNDlX?=
 =?utf-8?B?Szh3Ni9VYXJPQUFDZFZxOVVjSWJCRGZDaEJ1TE0yQ2lWTnl4RWFvWG55RUpk?=
 =?utf-8?B?WjA2QmpJZWFWbjFtK2p1Sk9JbFUxMGpueTJJaWdNQmhXQ2Qrd1dCeE1TY085?=
 =?utf-8?B?QURZT3pIR0pzMDhQOGtiVTBHS3JvTDZPOTNXa0k4WUtyWmZGQmVCUHhLSXFp?=
 =?utf-8?B?cGY4UlBjUzVDVFkxYmFoaHVGY2RuSVVSazU1SkxicUxhMUxpME5INHVVVUkr?=
 =?utf-8?B?dXJPTjRpUDZRR2c2NWpremMvdDVVeGRTY1luTHBxQ1laeExWa2IvdWNNZ3hX?=
 =?utf-8?B?NXVXYzlFcjgzVnNTRk83R004OXI3bVgwSXpMd2w1d2phRHRsSWZZbE5LdGtH?=
 =?utf-8?B?bHRPaXNENEgxUlhmL2huTUJIUEhRTkZLa3d5R01wc01obXpnbnNRSVpOQ0N3?=
 =?utf-8?B?aUF5UkVJeUNXQjlMblMwNXB2ckdpTDJEMFZ4YTZob2hxV1dXNFN0UVJHY3RP?=
 =?utf-8?B?UjhIRTJITHZ3ZlIzK1cwTWpOMzZMUHJsOGNXWWlseHV2bU9uSGFDdFRyUTJC?=
 =?utf-8?B?MmZ6Tm9kRkhWRGlWWmVOSFRnVERVNkUzc2c3cHBERjBVekZLL1BlQmNPdk9S?=
 =?utf-8?B?M2psUnlRbmJxRjRkWHVROFhaSlVkaUtteTBYOS93RmV4M3VQZ2MrbkV0cWNJ?=
 =?utf-8?B?RE42YWQyblFIbk5ONnpJbGlRdEZIdTJEYnkvdWhUQlBNcXE5ZU9JVVpOYnps?=
 =?utf-8?B?UnRBWVhJQjB5K2hEaDZaTlFqMUVpZHZTV3dtV2cvNFBJVjhuUXRtM0tlamdR?=
 =?utf-8?B?bXRPaVlVaGx0dUprVVp0cXlWNHQvOElNcWZ3WEtQRk02VHl2MWRnRW82UVVT?=
 =?utf-8?B?Mlp1TUprRGxLeTJHakpIazZwOHBaNzBkUjR2UFFuc1R5WjhCOFhmMTFWZXZ4?=
 =?utf-8?B?RHF1Lzhvb2FvcDQycFpqL0FGQUJXNGtnM3haWEZ0K0E5akJwbHgrWGlDVjFy?=
 =?utf-8?B?VUZLUU1Tend3S3JINWMyVmFXcXMwbmFyUjBGUjkvcjAwUmxIYjQvU0RXOFRL?=
 =?utf-8?B?eHFZNmM3YlNwaWRUMWM2dzBZaTV4NzFSNDRLbm9UWXhrQ2cxbE5CUk05V21H?=
 =?utf-8?B?Sm1Cd0VzWi9DRWhZclhjQkE3NlMvZksxcW5SMzN5U3d0TWJnUWZZZStHdlk1?=
 =?utf-8?B?QnVtTWJSZEwrNFh4NW9FRFc5TzFXdW5KbWNCUElRWkFPMGh0NnhIZFd5M0hq?=
 =?utf-8?B?WGNldXFHRm9PMXNnQW9LTHNEZUdPcUtXYldUQ1JQdTZJb3NFRmNpRHQxd1pJ?=
 =?utf-8?B?ZlZLV1JydHhCTkYwQzBEQ2F5N2d5T0oyN1BZVkd1UnY1MVIrZVZ0R2FWM21m?=
 =?utf-8?B?U1UxRkhGY0hGYTEybVpEb0orbXRNZmk5SlJIVFEvTGIrZURzSm9zS1NKZzVj?=
 =?utf-8?B?bHYwNGxwSXhvWlB0aCtJQWQ3WklqcFZPbTlMMWpRT2toZFhuVUdHL29ROFRM?=
 =?utf-8?B?bE4wUm4zOHJ0SVNLSTJNQmFMQmlPRHhabHo4ZHp0V3ZKZEE3ZWxOOFVibzdK?=
 =?utf-8?B?Nnd3eEgvSjh3ZXluRndDZDBwanVaVGNWcG9DZXg2QkdrV3JNN1RiMUJDelhK?=
 =?utf-8?B?WVZOT1diRDgyOUVQdk5tY0JHMWc4U1ZFTU5JZnRTUEZaM01SM0VIVXk1bWR1?=
 =?utf-8?B?eTlBS01mV1NXWHpyeXBaczMvdy93WDZVaG56djFNR2hLcmlhQmlqeGFtQ2Z6?=
 =?utf-8?B?UVJ4Z3dWSmRuRnRvM0NQbXdRTkdIZGpsdlgxSlMwWVZQMnAyU3Uvam13bjVH?=
 =?utf-8?B?S05sNmNmZnRRRFlXeThwQU1zNGhzUk4wYWJUb084dnU4a1pXOW56WmV3UzJQ?=
 =?utf-8?Q?+W8JgguhZrl0qE34+RnukJdxKfDA739DXlRI0?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 19e155c9-9a70-46a9-0abc-08defdf16a96
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 12:57:25.1702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j8g+82y0XCfagbPzYuSEhNwMF5hlLn4qaIKnDVIevg3s7egvuobTTH5gmTKZktbJuLSt4FYqVSbQARcYn9YCsj+bmr6jKg0ktboG6VKKJVUi0T0wMG5ZDMZD5TbChJpI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1762

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

