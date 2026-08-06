Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341993E0C5F;
	Thu,  6 Aug 2026 07:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.183.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786000280; cv=none; b=GQPFP+yBeGLBiMrmHtnCAKoTV3NnaJzkPXQl9AjYIsIxd6oVsZNxgQXNsmIqEUAfka08kbetLLWfV/FfVk2gRIfTdWszya3ilpfvj2j4HEfOkzKI2eFi6xQNO0eh0Ng3dkeA3bNQvsDIFszMbi+PWdWfdlquSt+neNf26hwnkz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786000280; c=relaxed/simple;
	bh=kUw4Wz632yJky9ulU3Cr6PcnP2FkKOGYlkCoNHZpKH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ds/ZEJPBhChzJCLpWnmqzDow2HV6g7rOhbQK+Rpi3749Oy8H7Qd+oBV/VzCtqg9mSTOxS3njFM8MbXUJAxo/6kYw7xGyZuSoi6WdDmGk7v5EN6GrtPn1cQglioYhhgUKuiOrzsa2PHhvWnFNXZlMmIBp30XKTvb9PXFIBoyNlnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=cAxQn0Vo; arc=none smtp.client-ip=185.132.183.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="cAxQn0Vo"
Received: from pps.filterd (m0209324.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6764tiW83996241;
	Thu, 6 Aug 2026 07:11:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=p1; bh=M/BXNQAMy0M15YH+lv
	KK+UpbQT5UgLANJU+qivYIDGU=; b=cAxQn0VoDNoE7zeL6UzxHW2AHtQn9iZeC7
	Sm/LPM/o4TlQZo/5tW5ZZsemUrG3jNODj5fGiMqgHFB4WdhrdF5op8naC102x5Q5
	k4ewlRHJCgCgtoupFjEBTXSkMuK+oc1x+WgNAjjOybMq+5v88UsD58NaDKP/206c
	iRIXU87KKalWBiprRsJsd1o7BN5dZRX6Fkf7Z5MYFYSIxGEbZzimyeL5YSZUR4ai
	SPc5Ntcp0x/AftFHvkp6lcpABNnFUoq8J7wq+ijmXuRDREOEenVDn1rt7M8YVo1u
	QOUOvJn8lxGz5v7S+wnlIB0SUrIjod2qVVAYFh1tkC5XzAY5daaQ==
Received: from sgppsea01v.sg.gdce.sony.com.sg ([121.100.43.225])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4fs5y2wsm5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 06 Aug 2026 07:11:10 +0000 (GMT)
Received: from pps.filterd (SGPPSEA01v.sg.gdce.sony.com.sg [127.0.0.1])
	by SGPPSEA01v.sg.gdce.sony.com.sg (8.18.1.7/8.18.1.7) with ESMTP id 6766CbSk000473;
	Thu, 6 Aug 2026 07:11:08 GMT
Received: from sgppsba01v.s.gdce.sony.com.sg ([146.215.113.218])
	by SGPPSEA01v.sg.gdce.sony.com.sg (PPS) with ESMTPS id 4fs9vhbgma-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Aug 2026 07:11:08 +0000 (GMT)
Received: from pps.filterd (SGPPSBA01v.s.gdce.sony.com.sg [127.0.0.1])
	by SGPPSBA01v.s.gdce.sony.com.sg (8.18.1.7/8.18.1.7) with ESMTP id 6765ZQEw017477;
	Thu, 6 Aug 2026 07:11:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by SGPPSBA01v.s.gdce.sony.com.sg (PPS) with ESMTPS id 4fs9vgkabj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 06 Aug 2026 07:11:07 +0000 (GMT)
Received: from SGPPSBA01v.s.gdce.sony.com.sg (SGPPSBA01v.s.gdce.sony.com.sg [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67678jCt025361;
	Thu, 6 Aug 2026 07:11:07 GMT
Received: from localhost.localdomain ([146.215.113.251])
	by SGPPSBA01v.s.gdce.sony.com.sg (PPS) with ESMTP id 4fs9vgkab5-2;
	Thu, 06 Aug 2026 07:11:07 +0000 (GMT)
From: Lachlan Michael <lachlan.michael@sony.com>
To: mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil+cisco@kernel.org, laurent.pinchart@ideasonboard.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        kieran.bingham@ideasonboard.com, jai.luthra@ideasonboard.com,
        Ryuichi.Tadano@sony.com, Kengo.Hayasaka@sony.com, Tim.Bird@sony.com,
        Kazumi.A.Sato@sony.com, linux-kernel@vger.kernel.org,
        Lachlan Michael <lachlan.michael@sony.com>
Subject: [PATCH v2 1/2] media: dt-bindings: imx908: Add Sony IMX908 sensor
Date: Thu,  6 Aug 2026 16:09:33 +0900
Message-ID: <20260806070934.21764-2-lachlan.michael@sony.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260806070934.21764-1-lachlan.michael@sony.com>
References: <20260806070934.21764-1-lachlan.michael@sony.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Sony-BusinessRelay-GUID: NMR0NLixnHnrUdOdPdAujd_xoG0cpEOl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Sony-EdgeRelay-GUID: mKJNGiZjph1iJ5A3LDug_r45b7lHgn9a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA1MyBTYWx0ZWRfX/NN0rJuP6yDQ
 gbwTbgLRRvjQLlmlCSCt8Y8y85s6zssxz88+vNQkIShOF5NEGczOc9B1oZb0gzPt8KUnCIro0e/
 FyFo8xK2giU+F1vMjWiKFXsqaDZUMNYi6i7hEqsyT8J3gvldmuoLTV23dGsqwNWAXQznjzFQyTg
 rURkFUOSDiVOCjSFrk57YkrS9REMQeTOhK8aIavvrzb7V4J3i6RoIpAJHxHBMxYV5uxYCdSTVRX
 LvhtYGgbU7GQQmUnyLd6wpc9H4+d6J6/b44YSYflbPDfUTGwdAgt2uTYel6ZU4cyOZNYYexMZr/
 zYbwVUGXZrnCV8YhJTIXLO3vQiWxBmbc0bPD7fbJxZHCbgrtyqEQnWdB8BSd+sslEjdEDjGs1MI
 1IDn6jDYWehPfWxcF1haDX6CfYK0hExZqdQyfjjPygqFL5kCo73vpeOzxCrQ/iqzeU8rnP3pMyQ
 CW/EArMQUFId/wciBSA==
X-Proofpoint-ORIG-GUID: 5nbADXkeS_YHNj7wLD3LwGk3CUQWow3R
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA1MyBTYWx0ZWRfX04S2Yb6Ve4do
 aZy1dmkIaB+KQR7/I8mPjxXgv9l974IkG9H/SI1xgrw2/gD59nNqdcaKvdZPOkSw+AgPqF+yAtP
 15SZZmG/WE34gKYIvOYLjbM1Og+jA0b9A8Ru3gy6rJIdWOsAs71C
X-Proofpoint-GUID: 5nbADXkeS_YHNj7wLD3LwGk3CUQWow3R
X-Authority-Analysis: v=2.4 cv=ZaMt8MVA c=1 sm=1 tr=0 ts=6a74338e cx=c_pps
 a=XNW8778QP6juiAqijDMnrw==:117 a=XNW8778QP6juiAqijDMnrw==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=KAb5x4SsHD3PzxGk7EmX:22
 a=I_Y4LlEPCAdqsIK1J1Zo:22 a=gEfo2CItAAAA:8 a=z6gsHLkEAAAA:8 a=xq3W2uTSAAAA:8
 a=pGLkceISAAAA:8 a=CjxXgO3LAAAA:8 a=lY-_OrKQD4GgB9sdOL0A:9
 a=sptkURWiP4Gy88Gu7hUp:22 a=P5L7wpMTXyg1GfFA3Gwx:22
X-Sony-Outbound-GUID: 5nbADXkeS_YHNj7wLD3LwGk3CUQWow3R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01

The Sony IMX908 is an 8.39 megapixel (3856x2176) CMOS image sensor
with a MIPI CSI-2 output interface, supporting RAW10 and RAW12 output
over 2 or 4 data lanes.

Add device tree bindings for the sensor.

Signed-off-by: Lachlan Michael <lachlan.michael@sony.com>
---
Changes in v2:
- Reword subject to drop the redundant "bindings" suffix.
- Reference video-interfaces.yaml for the endpoint and switch to
  unevaluatedProperties, fixing the remote-endpoint check.
- Drop "link-frequencies: true".
- MAINTAINERS: drop the L: line.
- MAINTAINERS: move the driver F: line to patch 2.
---
 .../bindings/media/i2c/sony,imx908.yaml       | 105 ++++++++++++++++++
 MAINTAINERS                                   |   5 +
 2 files changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml
new file mode 100644
index 000000000000..885aba692c60
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2026 Sony Semiconductor Solutions
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/sony,imx908.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony IMX908 CMOS Image Sensor
+
+maintainers:
+  - Lachlan Michael <Lachlan.Michael@sony.com>
+
+description:
+  Sony IMX908 diagonal 6.42 mm (Type 1/2.8) CMOS active pixel type
+  solid-state image sensor with a square pixel array and 8.39 M
+  (3856x2176) pixels, supporting MIPI CSI-2 output with
+  RAW10 and RAW12 formats, configured as either 2 or 4 data lanes.
+  The I2C address is fixed to 0x1A as per sensor data sheet.
+
+properties:
+  compatible:
+    const: sony,imx908
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: Input clock (24 MHz, 27 MHz, 37.125 MHz, 72 MHz or 74.25 MHz)
+    maxItems: 1
+
+  dvdd-supply:
+    description: Digital supply voltage (1.1V)
+
+  ovdd-supply:
+    description: Interface supply voltage (1.8V)
+
+  avdd-supply:
+    description: Analog supply voltage (3.3V)
+
+  reset-gpios:
+    description: Sensor reset (XCLR) GPIO. Active low.
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
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
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - dvdd-supply
+  - ovdd-supply
+  - avdd-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+         camera@1a {
+            compatible = "sony,imx908";
+            reg = <0x1a>;
+            clocks = <&cdce913_cam0 0>;
+            dvdd-supply = <&cam_dvdd_1r1v>;
+            ovdd-supply = <&cam_ovdd_1r8v>;
+            avdd-supply = <&cam_avdd_3r3v>;
+            reset-gpios = <&tca6416_cam0 5 GPIO_ACTIVE_LOW>;
+
+            port {
+                imx908_out: endpoint {
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <720000000>;
+                    remote-endpoint = <&csi0_in>;
+                };
+            };
+        };
+    };
+
diff --git a/MAINTAINERS b/MAINTAINERS
index 4b592cf49746..666c90e100f1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25256,6 +25256,11 @@ T:	git git://linuxtv.org/media.git
 F:	Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
 F:	drivers/media/i2c/imx415.c
 
+SONY IMX908 SENSOR DRIVER
+M:	Lachlan Michael <lachlan.michael@sony.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml
+
 SONY MEMORYSTICK SUBSYSTEM
 M:	Maxim Levitsky <maximlevitsky@gmail.com>
 M:	Alex Dubov <oakad@yahoo.com>
-- 
2.47.3

