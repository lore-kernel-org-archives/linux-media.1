Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C173603D7;
	Thu, 30 Jul 2026 02:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.183.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785377776; cv=none; b=YeYRkay4nCAfEBznWbTsqHTYv92FqbeToTeTZsezsRy4ZbLt7lni/rrcQNDZpw0Fg7kKHluqs00gxf8bSPDkT9vrDyPBOZi3at2PxF9OW4bBYGLQkFpwfM7PgySn4BgxeefJRC3hCvI6aNexFHJeLW7nbHYn4QPfD9fJa9ezTy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785377776; c=relaxed/simple;
	bh=KhDPfYEKlTAAUBH8oPwbjp+jajJfnmmj1OWJKoay0tc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QamXHE7IjPT2gBnJmvDRBbAiJ2/hu815hCt7sQNC4hpnGgjJSFdBG673euoj0FPNh4tlFxhVXf7/elM1Clyz6KgWwB3jcFTaTOvq2WvpYr8pWFDqSVHO5HXqJWxgK/Js0tkHhp+TM9WXlcbDolf+6hYJtCfa59fARP4CvspxUfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=q3v9I+Ol; arc=none smtp.client-ip=185.132.183.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="q3v9I+Ol"
Received: from pps.filterd (m0209326.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U1taPJ2512008;
	Thu, 30 Jul 2026 02:15:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=p1; bh=obKeNLJzOCINSgZdFR
	382XBeAtX6irrbnV5qn/weOaE=; b=q3v9I+Olmfhx2c5Ud4oLiOLl0L0OHycd6c
	hX6bHotbeha0ljUCA9ZyQ16cMMSapeb8sO/RrOnIEVsClhC7cvjc1lFnCG2ugZ1Z
	1012QsfHZcq8a6kRiRkbk67mbelyv/Lx0FvJu94pWHAFckXpCIlxOUzGaLSqKx+t
	iIeT55kx83x/bcpP54LBED5Tm7HWh0xYZ59d27KJucvMkPV6VlIDWThXEtvLHJR5
	AOD79UeiKqlQb3S2A0OnGhuoJNhEboKSXTMbdPXeL167ZxCtk71dJATDnXWNqFlj
	tz2NQnDanS+x1ZCoUR/eLS5vivXO9YOMKKhoqGMce33R0mJLrYPQ==
Received: from sgppsea02v.sg.gdce.sony.com.sg ([121.100.43.226])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4fmnbg5ge4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 30 Jul 2026 02:15:51 +0000 (GMT)
Received: from pps.filterd (SGPPSEA02v.sg.gdce.sony.com.sg [127.0.0.1])
	by SGPPSEA02v.sg.gdce.sony.com.sg (8.18.1.7/8.18.1.7) with ESMTP id 66U0iNZd028281;
	Thu, 30 Jul 2026 02:15:49 GMT
Received: from sgppsba01v.s.gdce.sony.com.sg ([146.215.113.218])
	by SGPPSEA02v.sg.gdce.sony.com.sg (PPS) with ESMTPS id 4fmp7h8m89-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jul 2026 02:15:49 +0000 (GMT)
Received: from pps.filterd (SGPPSBA01v.s.gdce.sony.com.sg [127.0.0.1])
	by SGPPSBA01v.s.gdce.sony.com.sg (8.18.1.7/8.18.1.7) with ESMTP id 66U0jOYj009148;
	Thu, 30 Jul 2026 02:15:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by SGPPSBA01v.s.gdce.sony.com.sg (PPS) with ESMTPS id 4fprhxbxjy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 30 Jul 2026 02:15:48 +0000 (GMT)
Received: from SGPPSBA01v.s.gdce.sony.com.sg (SGPPSBA01v.s.gdce.sony.com.sg [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66U2FfVN002867;
	Thu, 30 Jul 2026 02:15:48 GMT
Received: from localhost.localdomain ([146.215.113.251])
	by SGPPSBA01v.s.gdce.sony.com.sg (PPS) with ESMTP id 4fprhxbxjn-2;
	Thu, 30 Jul 2026 02:15:48 +0000 (GMT)
From: Lachlan Michael <lachlan.michael@sony.com>
To: mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil+cisco@kernel.org, laurent.pinchart@ideasonboard.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        kieran.bingham@ideasonboard.com, jai.luthra@ideasonboard.com,
        Ryuichi.Tadano@sony.com, Kengo.Hayasaka@sony.com, Tim.Bird@sony.com,
        Kazumi.A.Sato@sony.com, linux-kernel@vger.kernel.org,
        Lachlan Michael <lachlan.michael@sony.com>
Subject: [PATCH 1/2] media: dt-bindings: imx908: Add Sony IMX908 sensor bindings
Date: Thu, 30 Jul 2026 11:15:24 +0900
Message-ID: <20260730021525.166811-2-lachlan.michael@sony.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260730021525.166811-1-lachlan.michael@sony.com>
References: <20260730021525.166811-1-lachlan.michael@sony.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Sony-BusinessRelay-GUID: Kj4gvZ4QCvC0-2cQ45Wz3E3kh7WaQu0p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_09,2026-07-29_01,2025-10-01_01
X-Sony-EdgeRelay-GUID: Wm8G1hNJWTT45rNtOP95PbX-WcyfRtQp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_09,2026-07-29_01,2025-10-01_01
X-Proofpoint-ORIG-GUID: 9pXu2xYG1D_dswelVIhq8pc8uSR8iwuv
X-Authority-Analysis: v=2.4 cv=O7MJeh9W c=1 sm=1 tr=0 ts=6a6ab3d7 cx=c_pps
 a=6mgWUpd4vGE96FGw1JXD8A==:117 a=6mgWUpd4vGE96FGw1JXD8A==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=KAb5x4SsHD3PzxGk7EmX:22
 a=lmptg-Pxpg44AF-n8Qp9:22 a=gEfo2CItAAAA:8 a=z6gsHLkEAAAA:8 a=xq3W2uTSAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=CjxXgO3LAAAA:8 a=NTLQiP0OeAUCudzpKyMA:9
 a=sptkURWiP4Gy88Gu7hUp:22 a=P5L7wpMTXyg1GfFA3Gwx:22
X-Proofpoint-GUID: 9pXu2xYG1D_dswelVIhq8pc8uSR8iwuv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDAxMiBTYWx0ZWRfX6ZqUJ8SqUFK3
 0kIsP/oWF185FXfVJf4Dl1Fjmm9V3AedFD5OwROKsbs02kYuT4dTDkKV6x3FuIlaWndkAy0E4CU
 KJgLp7RlzPa+yzkRURslXII7Z1AwAkI5YbWle+7s1XSshtslNaWN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDAxMiBTYWx0ZWRfX6FdgJGBiEs+o
 jObfgezvqYJd+PwCwCovd6La2cCJvKoFBXTj8ABFfC6XpuSpLVFNPKXHzn5uTMTMZztZ/J/LR5w
 7No98ptIP/GQlq6f1+bmJWxh3to961wHe8L9CJAHcdIc4VnpxTpeovpZWm2SXCuq5Gfl1/gm3cy
 6ne7Q0lwhhrBjYeS1TCFJJEtzp4GiF6SvC3dWzMM5g1eFFBE7brGvgL0T5pX5OU/wkCLTgGzY+e
 KQzAuQrTekX12Y2iE9N4mbU/dVtRy+L604msnkPVoIcqJlAn7LModDN5U1REhIaSIM/q7Qpk2YD
 ngUZoXezyCWj4yUTtVCayAND7D3klANEOw0+jHxoYEIzsxMrkRTsR3RknBmUbqBZ8vAOz7nnTQg
 wUJbHPCFYKEcpUzSWG/4e93ekZpeBol+A7nnTV3vgYVyoVmvvPMMXEoYfzPiqJuZak15YdU33ef
 RUQRL0aNz9E7QXPtLhw==
X-Sony-Outbound-GUID: 9pXu2xYG1D_dswelVIhq8pc8uSR8iwuv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_09,2026-07-29_01,2025-10-01_01

The Sony IMX908 is an 8.39 megapixel (3856x2176) CMOS image sensor
with a MIPI CSI-2 output interface.

Add device tree bindings for the sensor.

Signed-off-by: Lachlan Michael <lachlan.michael@sony.com>
---
 .../bindings/media/i2c/sony,imx908.yaml       | 107 ++++++++++++++++++
 MAINTAINERS                                   |   7 ++
 2 files changed, 114 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml
new file mode 100644
index 000000000000..6ab382d1cf34
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml
@@ -0,0 +1,107 @@
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
+        additionalProperties: false
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
+          link-frequencies: true
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
index 1ab8736850ea..41b39aa24bda 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25264,6 +25264,13 @@ T:	git git://linuxtv.org/media.git
 F:	Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
 F:	drivers/media/i2c/imx415.c
 
+SONY IMX908 SENSOR DRIVER
+M:	Lachlan Michael <lachlan.michael@sony.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml
+F:	drivers/media/i2c/imx908.c
+
 SONY MEMORYSTICK SUBSYSTEM
 M:	Maxim Levitsky <maximlevitsky@gmail.com>
 M:	Alex Dubov <oakad@yahoo.com>
-- 
2.47.3

