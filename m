Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11020119.outbound.protection.outlook.com [52.101.61.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456AE386C1C;
	Thu, 30 Jul 2026 07:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785396389; cv=fail; b=bj3yHWyx8ux5VsSdzV3Enic7okEQOmjVxcpDPk71OpzwpgMLDvAfS9HBKg+pFM/gLmLC4Q9Aiia43AQT5zY1GN5qSfN8eSL7r9Q4qExl2tJBXhhkh5i8qXMrg/XXIqH9vQtyQnUbuI4ynDPJpyAQOJNOOanOsaSL+qTsAksjPRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785396389; c=relaxed/simple;
	bh=1UHeLIuiN7uloBHNzw+q1+g/XoHrp/1GWm4Es9E5q8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t4xDQyoFuctEMhCMZCpJnBNVfKJngO0idvHGMO7pGxx6HIgVcLEslJOGBG7ZRcOa/Cknj20BAYtd8WfcZOpBEXPi4I+XUDYI4RRobbDc0eVlDozas+kbCh4vaK0NfLxHfxGpqd0f8ZKkp94RAgMmneEYdSVzl6mqv2OVs6bnWto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=TmEqO+dd; arc=fail smtp.client-ip=52.101.61.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="TmEqO+dd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vIyYj4EcvS97ePEmCwr7y4vZyyIt9bPo+IACNa3jenfeu2dUhbHjBmHcfzLN7DnToxtJPWKY2QfdZ7l0JXxKr90PoV1UNpS00yeEIMkjHgY0H9Y/upGD6/tEVXd2cK78YHWTsKmZMXEuuxHRiDGQfBEsGhMaxtv57Qqh3JlZKdYHURte2lUiXGDzuCgHRvEYVpXfhctHb/x04KHCz8AV3Dlm7yrmxDukjeYEXgYW2BIr0jQ6KAexdOJ73oTAevZ47LkJL4McH8+U7obQAxlcaQinGpO38GR3oa2+der+F2JSKNBIPDUclONjW+CX6DuzmMBZ23999rtBW/0NQzJ/mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vBVMtJKInimAdj9YPA6SiNHXIu91mSwXe9zFpdhd3ks=;
 b=jQDRmFgagPbKrwBAqSKdYpYvUJ1C25XcEB/bw+16FZX3Un1ZbZvpaCq6fHNO945uQAP7h/YErlixTUz+ddBKXnECz+i1Uyba8qqKtmrcvkHBfpPtbxinGfKHlg509vmkhpBXAKduZkhoVaydeCjbNVnZXsqTM4gqp+oBViLtoWhsX1Tfg/eclQjqLJLI6YW9TcqTro2F4Q0Qzw9WxGJyQJQa12gTHlnTLhymsfIC94fHH75tFsCACQXsO536BK7yAhFdMt9OsklkAcByTicAzBotEyz9+wslnTQeAWx0T/+NRPDxYY4BLY4QUVxwp9XsRzmixyuoJFskzyurjeeciw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vBVMtJKInimAdj9YPA6SiNHXIu91mSwXe9zFpdhd3ks=;
 b=TmEqO+ddzIf8hzJaUtiU04orf8Nb0ybEwZdu06+89OeJSVZpuStv0JzvyYgf5cU/DqHGSes4Q+dORcMyP4cfMbqpkCi0eatGxWgwLMwEdgkdGEymgfxXcI9fgegtqL2+YcQO6gd6ARkT5CNfq2Uxa68ysToHXPCnOzZzgysjTH/sPKaHPrGq+Dxz9Zs5QKOgnMBNkm7NhvGINKUyGB+o9mrccrLrD1mIuh7qoXLCogUQKL6bnN4LyOJGfGnc2jm8VOK5tn1/XURWP8a2hxaLOmuKR2DX0gm1rwlP236tvYfrenLqgFjrSjx6M22VtP3hElMdFW9NiCdWGcY5Ra0QAQ==
Received: from CH0PR04CA0108.namprd04.prod.outlook.com (2603:10b6:610:75::23)
 by PH0PR18MB4542.namprd18.prod.outlook.com (2603:10b6:510:a7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Thu, 30 Jul
 2026 07:26:24 +0000
Received: from CH1PEPF0000A345.namprd04.prod.outlook.com
 (2603:10b6:610:75:cafe::34) by CH0PR04CA0108.outlook.office365.com
 (2603:10b6:610:75::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.13 via Frontend Transport; Thu,
 30 Jul 2026 07:26:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 CH1PEPF0000A345.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Thu, 30 Jul 2026 07:26:23 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTPS id 90EAB4186B5B;
	Thu, 30 Jul 2026 00:26:22 -0700 (PDT)
From: Tzu-Hao Wei <twei@axiado.com>
Date: Thu, 30 Jul 2026 15:26:08 +0800
Subject: [PATCH 1/2] dt-bindings: media: add axiado,ax3000-video
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-ax3000-display-driver-v1-1-4fbd4d0c85d3@axiado.com>
References: <20260730-ax3000-display-driver-v1-0-4fbd4d0c85d3@axiado.com>
In-Reply-To: <20260730-ax3000-display-driver-v1-0-4fbd4d0c85d3@axiado.com>
To: Shubhangini G <shubhangini@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Karthikeyan Mitran <kmitran@axiado.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Tzu-Hao Wei <twei@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3052; i=twei@axiado.com;
 h=from:subject:message-id; bh=1UHeLIuiN7uloBHNzw+q1+g/XoHrp/1GWm4Es9E5q8Y=;
 b=owEB7QES/pANAwAKAXgQMF3EWvHXAcsmYgBqavye3GAVB6YQqxXLOTwQrSL6EWLx9yLBDsrYf
 NkNH8CX8riJAbMEAAEKAB0WIQSZyWINOowtFmDvdYF4EDBdxFrx1wUCamr8ngAKCRB4EDBdxFrx
 14aVC/43dI6qDoJQ/lphZ/A6SRnzls83njJj1AQR+xcpEopdLnFwoNhq/vYeN0ApvJPmuKT7msC
 raIeeT33WeqRqXDuOZlT0XiFuwSDOF0jLPXwvXTXpR5rfHnc8XWrf9Tcy8+SXxM3ZC4gDefg4TW
 XkavVBlCXjNSRtZM4pY8/u00Wo/Bar8sQsb9nQc2jdzTWTZRjb8jg4j7Y2fLPX+hVI7hnehRBlD
 eeWx7fdRy7Wd189rNlxzTcIyCb1sQyJ3B3SJATKbF6tUCyDODfAFGAv8vfNH9Wi2IpgLdyFy6e+
 UMUk1uzewml3C6EtLmqkHMrhjSONI4u9xzkNEOY+2Ifr8bJ3obo+AmKMINOc4mdTs9m0AogGe/D
 U3DpevLMjAkviz0c4LSEsKMyAxxlXLVruh3O4yHfUcqkU1jIHvmJs71x3Pn5rpCyuMF7RH37lYe
 hWpb9NM31gvfmfOLiQJqXeOSowb25zsVFj9QeYCYIHl4GV0/YySeNQEEL/DHaGlwhdVek=
X-Developer-Key: i=twei@axiado.com; a=openpgp;
 fpr=99C9620D3A8C2D1660EF75817810305DC45AF1D7
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A345:EE_|PH0PR18MB4542:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bb6a4bc-e861-40d9-8acc-08deee0bdbdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|42112799006|1800799024|23010399003|376014|36860700016|22082099003|18002099003|56012099006|3023799007|13003099007|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	rmXbikxNrlzvXRzthn1qQbNvxUzzyUuuzWMm6/vxJCxS6zJFDWGh/348kLZTJawcgtBBltQg7aqnInIkyNZVGvaiAboC5cVAOvSwEOS1EqSJlqM7T1XCjTrjBsUMAc/I/LjdlyMmXun28hmpDcmzq3vGXkWKNZHrs9ngxLacCJ4zMmOBbkcLGne+mksahSeolxxUcVyfQkVBWqkFGzLikqASIz0xc+vjHjwq14+kZ2Dj41eIWD5U/DlW2OGDC8JHURnHk5enGaOWKq3PHSqZtUgU0KmgESbDR3fliYmIvmemidSFu3BDwV5h5PucvxSbfupv6FfS0hCozpbPtTdXSzUNm6V8i8ly1GQNhxv/1p38s8njmN+EQdGJ2MBplcnK4hFfwT6peeAYDmwih1bS7Q4RQCseqjtiY/5u2Z3RDCBX4aiAxIUyn8blley1snMyYiI0h1DRDWNnYuIwjC9cKPuxgF8fYzst0YXlOP/ygqwaBby9HaN1a3qhB7ns0VkIHfXd4fzQeEpqAU4LTt5tMAMfDP3SCVjr0yy/ctrnpoKtBL/xWRgoNVSDjzDJMqxwQbi+v6mAYiriC9drA2llhKHC+1ZNkbg8PGWhPemkcRZj8Hr6hKrCsNPW0sHGkJGDKDJNr00Ogkq+UJkxz/JHvw==
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(42112799006)(1800799024)(23010399003)(376014)(36860700016)(22082099003)(18002099003)(56012099006)(3023799007)(13003099007)(6133799003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kfyntsrmPjCmhHFBWjzrAfoMESU+J1OK4VcpOTDIPwDhF0gH8CWlQQpkyBXTL6f8MLb3RZregNu5FRAxXUWcwUdvmc7cxvolMYxZottvlkgCRVDqFNYkPFkq3/0ih7efhrfJ2WZM5JAQLBbqDl6CEUn3+L0ho3Som5hEeTHwxV/8eV7apdEFAMts67/FKOo+WzPVH1WOSYyUJ2SNKI4/vlbmKPdSfBHnRY3b6Ys1s8tV/HNt9gePnDOf1YJXoo1v9ZilS+aAGgvkTA4BjI0Toom8hYepT5c+/YTpUKvt9NqDBsY+0Q4fhujSvP4yOcGXo5QF6rHz3N4vSMFOvD6O2u0b0y5WVH9NzPwli3Dxu091lGoq8xwPYMOvhihRmspmNRiABGrq7bIqaqit31p8RLLv+KTsDnVv16o/Bri/sF/aQw4VE7NMQMOuAmw2GdW4
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 07:26:23.2520
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bb6a4bc-e861-40d9-8acc-08deee0bdbdc
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A345.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR18MB4542

Add a Device Tree binding for the Axiado AX3000 and AX3005 video
capture path. There is no local register interface to describe: frames
arrive asynchronously into a reserved memory region written by the
host's display engine over PCIe, and this node only identifies that
region.

memory-region accepts an optional second entry for a host-written
control mailbox, letting the driver detect the mode the host is
actually driving instead of only echoing back the configured capture
format.

Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
---
 .../bindings/media/axiado,ax3000-video.yaml        | 44 ++++++++++++++++++++++
 MAINTAINERS                                        |  8 ++++
 2 files changed, 52 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/axiado,ax3000-video.yaml b/Documentation/devicetree/bindings/media/axiado,ax3000-video.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..c6d8d1843aac9f42869ff90a550b92d0bed7c16f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/axiado,ax3000-video.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/axiado,ax3000-video.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Axiado AX3000 Video Controller
+
+maintainers:
+  - Shubhangini G <shubhangini@axiado.com>
+  - Tzu-Hao Wei <twei@axiado.com>
+  - Prasad Bolisetty <pbolisetty@axiado.com>
+
+description:
+  Axiado AX3000 video capture controller. Reads frames written by the
+  display engine into a shared reserved memory region and exposes them
+  as a V4L2 capture device.
+
+properties:
+  compatible:
+    oneOf:
+      - const: axiado,ax3000-video
+      - items:
+          - const: axiado,ax3005-video
+          - const: axiado,ax3000-video
+
+  memory-region:
+    minItems: 1
+    items:
+      - description: video frame buffer, shared with the display engine
+      - description: optional control mailbox, shared with the host
+
+required:
+  - compatible
+  - memory-region
+
+additionalProperties: false
+
+examples:
+  - |
+    video {
+        compatible = "axiado,ax3000-video";
+        memory-region = <&pci_ep_disp>, <&pci_ep_ctrl>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index a674e36529f7579a870d2a80954aa04044a383af..16e3acc3b870949e6d78bfbf337b78a73f2cddd7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4427,6 +4427,14 @@ W:	https://ez.analog.com/linux-software-drivers
 F:	Documentation/devicetree/bindings/hwmon/adi,axi-fan-control.yaml
 F:	drivers/hwmon/axi-fan-control.c
 
+AXIADO AX3000 VIDEO CAPTURE DRIVER
+M:	Shubhangini G <shubhangini@axiado.com>
+M:	Tzu-Hao Wei <twei@axiado.com>
+M:	Prasad Bolisetty <pbolisetty@axiado.com>
+L:	linux-media@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/media/axiado,ax3000-video.yaml
+
 AXIADO EMMC PHY DRIVER
 M:	SriNavmani A <srinavmani@axiado.com>
 M:	Tzu-Hao Wei <twei@axiado.com>

-- 
2.34.1

