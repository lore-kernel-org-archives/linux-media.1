Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.225.109
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795445725;
	b=fk1EDEowDjKYNKvsvcXgElt7ei/wpRhCi5IQ/JBCchoMX86UYhXhVdL1/96bQOkFt9dv
	 acyD3UW6c6cy4g8DYzly+GULKk/FjZ6OCScTjGNNs2wGJANpfADRE3sUCaBN6iND2hxtx
	 NbnGYyPUzzVNBW0T+b9CosciN5pzSUZsjMn5RfLgmu+jzW/oJFBR4bs9hBSkN+fR2bhSY
	 NEgTaFmo9F5YpWYak9szEjmHIQUG8b9SVMnzA/Zd99zao677XZLGpDIsnIamh5odzPA0M
	 qxvRKChPEYjG7Hzmb+s7oYQBYEQm2WkPH9fNrZqDRNJudWX0Q1NvXC020W0VRXDhkUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445725;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=GXQHxkfWqLdAAW0y6S8i8a9oOHt9PDctRUNyGjja4PI=;
	b=HhBl9cqz01FT7nVsuMYMQ7GFSR8MWUzfkQ2Ty3Z6ZWpk6111p9aOLOD92a1gpTQH5lrW
	 0fJhHrHPmQNnQ/qarqIvmij0pQ4i0orbzCz2k2hUvC8iC9EB15hFKusuPlz/wGmtdMbSd
	 A1vmsnif/vwlH2hgzi2bh/Yk3/rEds5Kj+FUFqkVnnwQqmAP6dKE1QO0DGQoNxInXMLUN
	 Lqcdc2fhpO8RxXoyOK8rDJcycgVQ3tFG9D+P4uJQWbT6UOEWpqXPr5EPfsrXgswb3AWYM
	 n9n0DgXd0AOn1c8WBZ+K30iF5iDKkl+evT411BjAYPxBMgTyH8hF4LwaHDZbHrO9Jlg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.225.109
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020109.outbound.protection.outlook.com [52.101.225.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D99606B0BB;
	Mon, 23 Nov 2026 14:55:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37D99606B0BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jRrPVULNTi9ZZUKaA2UYqGoTEdVidqpDPEIiKytzGK3295M0TdRqeI9EWlcMS5r9+a713rP0W4ku45C0Od6dazIDpt8LwVL5aVKspJXBYIBfjqLBsB3IHHW52/Oluoq9lNE3R9pPc8azbd7WfUhECDr6BQ8HIzMttxwqoctltQPqzlIo7r/MAH4VhL/CqDFVX3NLCrmh/HCTWvy/1W+KPb9IGLucS7J0f1xM5YT9QbJ+tMbLWpaokE613+QgqW1AYUvdpZMMmGwZ+aQOReBRGOlMa0x7Do+WVyPbpDV/GNAWUvfRnwwszDc783R3ZxlWoY2MISetJpRYo+cRERWEbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GXQHxkfWqLdAAW0y6S8i8a9oOHt9PDctRUNyGjja4PI=;
 b=I+X+uRxHRZ6vfnctwj0egpRZQFZHSBNHKtRJawTCcFVzLGmngO87UFblp8RIfDkrwL/yca2FIEvwanwuudX1wGBVcSuoz6bRxn0a015kbIb9eybt4l/UKB/nrRN86biW+1BCLcOwi+SWST6i1Nf8toFqn3xMpmrqvOtSOFopIKtQb7YXF33aMwdEo8Moe6RhS2xAkQMsHavfjNPEgupbM+rwnJ80eJckiql/Zl/oKZy5NDrKV/if9JhLqVty+PPlWbwaIZT3CIMkbXL6PVLhT48Fk5NRih0DFNbLZsmIvK7kzIgJb6U3w6J3nXp9HJ0DggkEDxpHnzkprK/L2Rgvnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PNWP287MB5428.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:320::14)
 by PNZP287MB4106.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:282::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 14:55:20 +0000
Received: from PNWP287MB5428.INDP287.PROD.OUTLOOK.COM
 ([fe80::13c8:b6b8:e4e6:ddf3]) by PNWP287MB5428.INDP287.PROD.OUTLOOK.COM
 ([fe80::13c8:b6b8:e4e6:ddf3%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 14:55:20 +0000
From: Bhavin Sharma <bhavin.sharma@siliconsignals.io>
To:
Cc: tarang.raval@siliconsignals.io,
	sakari.ailus@linux.intel.com,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Bhavin Sharma <bhavin.sharma@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Kate Hsuan <hpa@redhat.com>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Hermes Wu <Hermes.wu@ite.com.tw>,
	Walter Werner Schneider <contact@schnwalter.eu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
	Miguel Vadillo <miguel.vadillo@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: media: i2c: Add os05e10 sensor
Date: Mon, 23 Nov 2026 20:24:37 +0530
Message-Id: <20261123145445.66636-2-bhavin.sharma@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123145445.66636-1-bhavin.sharma@siliconsignals.io>
References: <20261123145445.66636-1-bhavin.sharma@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4PR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2ac::9) To PNWP287MB5428.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:320::14)
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
X-MS-TrafficTypeDiagnostic: PNWP287MB5428:EE_|PNZP287MB4106:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bb5826c-b78a-497a-4e21-08df4971cb70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|23010399003|22082099003|18002099003|3023799007|56012099006|5023799004|261009223027099003|261028144727099003|261102123227099003|261026140227099003|261022115727099003|261026121527099003|261022075727099003|261022105027099003|261021121427099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info:
	qWR77Oa7Z4uDp3gRLdughYxSicdSe/dzBEuJNr85vOSTYBumrJpOSamEuGylqWixu6DQCPC7+ImZZlIELk1QkF/Ua7TJLc9oTOeEAu+4jKErqwb3qWfbInqeGGsZ2T1cltFSSbPeq6UdBuSMKhRVLzgKLVNjueW/mHxVKR1AvuNngwDoxVC2zyZqvQwGD8xGvhaB8RROMeKMtvSJAOBHKSJY8HW8UbDB90AYsigTob1uivTl7IvaR4NC3gM8XsSPoJDi7nWVnLf3Mbu9TNqsPqMSniA2Af7QATnHu2fN5AbN49lY36NegMgBkVSzZ4hP5qSJalwY2KHRnMbr4fKsIGUNI9n5jAFURoE5mjDxtMpOM/edOFqpKkHIeE6886nS+ooYd1OXjx9GM9xlO0TEmfhqZNkqFs8oiaSnMYd7vMvlDDvCyqv5yDq1VRyfyj/jXnfYImDOG7akc+pXKFNAVYa0D1wC7Qlqegy6eLsap0nURnsnqifZ/VG0Lb/R89LugxFjWTy80F9BMMxNW3vd8lI7oVNdeSESz08xTlLJJLs3fRYImukDORsrC2JsHJHWQ1W0uWVhZpRM+ij/CiJ4hK2mUq4p/sLVv77hHUvWROXNyM1tDBQw1tnvoviJgEO5DecwfLVZVY1ukxe4QTtbb4tqX3CI2rNa7GdmNd7vXFA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PNWP287MB5428.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(3023799007)(56012099006)(5023799004)(261009223027099003)(261028144727099003)(261102123227099003)(261026140227099003)(261022115727099003)(261026121527099003)(261022075727099003)(261022105027099003)(261021121427099003)(38350700014)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VeWBiBt82Hd6cxX/TI9yoAIkC/BBQHK+UddPkoKKTyjYye/Ms8IQNuBZQ729?=
 =?us-ascii?Q?T0FcDpDyhCOKOApEQT0EoV44Jwi3n5gx8YbQHEk7G7bNbsK0niFgUXBDURJJ?=
 =?us-ascii?Q?VOXTFXMG9w4jgxxN09BOLKxwjOYwdCfcyPXrCFMnW7iIbHugD2x2rzlxcwNO?=
 =?us-ascii?Q?3hYS61Iwy627leUKnxmxluobwByWfLTvULhwW0en/r2VJP4HKKc4aFqBPDid?=
 =?us-ascii?Q?l+JcPgDAsal8Rx4UEkQNF/QH3Q8D4hndwvW5cGDhhpoqioAibkdxUrPAghHD?=
 =?us-ascii?Q?H1CRAvD8yP9e+RroqAvb/LPwEH9Wj5V2yQ2/LKyxXSNmP2xF05mVbea/p4wp?=
 =?us-ascii?Q?R3AUH6COwb/nhMDnLk1g0SZt2FydTmmROVlrfQXZGzgdriVJXfqPMRdu+V8c?=
 =?us-ascii?Q?WM3SjJcRbws0wdKJi5i5+865HfKnrhMYm5MudHpFS93TpVvZgIDPS74dmI3c?=
 =?us-ascii?Q?X7/HL2GbG3SpfvEO34j0Ek3axxW8bmQE6Rllb8K7rlM0jYKhWDB24bNn5l4U?=
 =?us-ascii?Q?yHa8kUg+9PJgfD05e1jpdMGi96MpwDAJ8xKCzWglrs6+qoetX803ZJIK0Oy8?=
 =?us-ascii?Q?6VVjH8HteL6sPEtTLOzMxSXFlTv25l0qFWqek+YBkIHSqQeAgls/V0rbYpuj?=
 =?us-ascii?Q?acQNSxI0BshCEzj97jgWXDxleEpMTqCawL+w+QzLR0LgOoMJltqyjXwx1tAx?=
 =?us-ascii?Q?XDNLCbimM8f0EqetF5L6eDa1iymFk0YPwSDCA28+FIwvyXu8fNah/9STwaNb?=
 =?us-ascii?Q?so1KU8FHX6lTbMcqKCRqcF9VDjbY6WLDqWRPdUQO1E9ElZZ/38wUhCtSYOGA?=
 =?us-ascii?Q?RE+NHQfDO9P+jQw7TuQEvV6HVMVsW+y8T/7ru8quq3tfEWw//CG+vNvi2Wf6?=
 =?us-ascii?Q?VVlgOgYNhwjlSrz6isQPoOrM0PnfLSeFlZe4BZImhvSXIERbL9hrumsVvrWU?=
 =?us-ascii?Q?8btUmUaexxwcER54gFMMc/JEDLlLmYy4QHCP+UI1Ng8S2kC2Z3ePO+kK198P?=
 =?us-ascii?Q?zwTZmZULxG1rzoXnKqT0VZlxdhMuSlIvyl6RHoeChDLvNJPOJoTut/VOWeiA?=
 =?us-ascii?Q?8WZWNJRRbXWCv5l7uX4wYuHPpVWzSMY6LCwB/ywxBBRoAxDTxLr+Xv6IQ1RQ?=
 =?us-ascii?Q?AJjVxdf84DsYed8QqHLFC2N0/Ax43IwvSiBvc3K0ZIJQPnHe9roqM8dNGhO2?=
 =?us-ascii?Q?tXwR8ctB8TkFcPY+NOQcXcWuLVCsIDpS5C32Nic0StcTF93zO3r3hiGKhMwu?=
 =?us-ascii?Q?V+o/fiOhCtYGtLXUcG2s/2e6xhOuyw0Jktyw1yT8vNYxsksPzPhs+YLS+g6T?=
 =?us-ascii?Q?ZyJpDiR7fiJw5oTsHyQ2OU+kOUfxd53HvShbUU6aGh7x3oUBSgyeHuiz42D0?=
 =?us-ascii?Q?Y3HJOz565QTSKOgAIqfxmbLb/WTC7TX+wedap/KFLoo4fT5QOo9k++D0Q+PP?=
 =?us-ascii?Q?gIDspikndRpO0cy97HlcK6V2DIaNiLUam7G83CJlblcu/fOh7ReOKcCl2H6l?=
 =?us-ascii?Q?lf6ASFfZusld61n7lpn0ofmWGo5RgmFBVothYrNkSBopWrNX9p3thDtATxpU?=
 =?us-ascii?Q?Lnly3V/k2rJ6lvPtltIp8NEcSv18wQt6RWM2bMQ4XsD4dfuAu9tQC6l/HcwH?=
 =?us-ascii?Q?H/+8F1MFKqGkSxRrCagd33N04IE9D+yn3RK1xW9YsgvmjLp0ot/R98F44AR9?=
 =?us-ascii?Q?vNOKcL8a+a3wtRki8JoobG7XuTcwlUFg0SHqntdJUg0w6jOTaMscg17Cy8y/?=
 =?us-ascii?Q?9PXhG0BqvL5HJ3cPz6ZUWekT4lr1TE4=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bb5826c-b78a-497a-4e21-08df4971cb70
X-MS-Exchange-CrossTenant-AuthSource: PNWP287MB5428.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 14:55:20.4783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m4WVd+X9EQowKKgch7p8Qi+m9r3pEstoFU/RIqh+TSlW+OIQFUAy/Wo/TDL4NYoOnvv3wKNMrsdfRpIGIARx3ya9pvfe26Tmj4WiSpMLixM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZP287MB4106

From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>

Add bindings for Omnivision OS05E10 sensor.

Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
Signed-off-by: Bhavin Sharma <bhavin.sharma@siliconsignals.io>
---
 .../bindings/media/i2c/ovti,os05e10.yaml      | 103 ++++++++++++++++++
 MAINTAINERS                                   |   7 ++
 2 files changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,os05e10.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,os05e10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,os05e10.yaml
new file mode 100644
index 000000000000..d5b361940f05
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,os05e10.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,os05e10.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OmniVision OS05E10 Image Sensor
+
+maintainers:
+  - Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
+
+description:
+  The OmniVision OS05E10 is a 5MP (2592x1944) color CMOS image sensor controlled
+  through an I2C-compatible SCCB bus. it outputs RAW10/RAW12 format and uses a
+  1/2.78" optical format.
+
+properties:
+  compatible:
+    const: ovti,os05e10
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: XCLK clock
+
+  avdd-supply:
+    description: Analog Domain Power Supply (2.8v)
+
+  dovdd-supply:
+    description: I/O Domain Power Supply (1.8v)
+
+  dvdd-supply:
+    description: Digital Domain Power Supply (1.2v)
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
+required:
+  - compatible
+  - reg
+  - clocks
+  - avdd-supply
+  - dovdd-supply
+  - dvdd-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera-sensor@3d {
+            compatible = "ovti,os05e10";
+            reg = <0x3d>;
+            clocks = <&os05e10_clk>;
+            reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
+
+            avdd-supply = <&os05e10_avdd_2v8>;
+            dvdd-supply = <&os05e10_dvdd_1v2>;
+            dovdd-supply = <&os05e10_dovdd_1v8>;
+
+            port {
+                cam_out: endpoint {
+                    remote-endpoint = <&mipi_in_cam>;
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <720000000>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index c25ec2ba4027..638cd82d0fd4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20480,6 +20480,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
 F:	drivers/media/i2c/os05b10.c

+OMNIVISION OS05E10 SENSOR DRIVER
+M:	Bhavin Sharma <bhavin.sharma@siliconsignals.io>
+M:	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/ovti,os05e10.yaml
+
 OMNIVISION OV01A10 SENSOR DRIVER
 M:	Bingbu Cao <bingbu.cao@amd.com>
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
--
2.34.1

