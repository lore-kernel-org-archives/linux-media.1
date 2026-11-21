Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795252753;
	b=Kn9wC8IPWFkSn3y+Jc8gY10mbvEqM2wUOmPYWj1JBh6smLRmFGQ4OmP8+r1/uzfLjcgo
	 72+zeevc9znQJcC+VREipnX/m6pMYMK3rcXY87eZSyHU0+sXAsNHe7RnE3V+/Bj0M/bEd
	 18gBp+WY6s5CzMFcrECsbBXuWt5TB/kdytlEFfjaMiWAG3DR0SgQEDEI28dKrgxsjVMzd
	 tB2tj0k/6IjrK3TSe7ZY+oRnocMybYLzHyaf7hQtJEq6NsLLTM6q+qrwuu4aHnbPL/IrW
	 2o9Uvllmk/zk4OTYPOv+fIQ1ebTi0/fB5qSD4UOSdOBzQi3LsPsMo1baqaHVxPb45sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795252753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=JOOW8rwk0fxLyNA5MGe5otqpgV1eEvzk99HIB9Qw9QM=;
	b=oNcw6aQ+z42tNVW84Y0VULdIuXS8GF/VBRIlX17ZCykPm1YxDhvBZI76EP6BiNp0Dffz
	 wSHz/8+Vib7CGZujsTEfS95sdyFJK+fZVbFQRdXdFZEf8qXTNlBtn8qRjAuE9kIjX6Rpr
	 HJ2JqCNze3l3WEeRAeRoihXyZO4WXaGq9AU5iyMdur695OAshhxEo42rekNDKk8k5T9TB
	 dBoTciWzFyMgbu0LuH42QCmzqe1fH36R4LmmyafnGK2u7RXTfnEnTqcArrsT1boGWH7lM
	 woq4fFwD3bbUdJTLqAMeLXkH9W7cEyIejB87OvDD3yTlAmqZwEgPaIqhKJiJ4zpJcZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cX8Oyko+;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C03606A320
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 09:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70C03606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cX8Oyko+
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cde0daf3a2aso754412a12.3
        for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 01:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795252753; x=1795857553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JOOW8rwk0fxLyNA5MGe5otqpgV1eEvzk99HIB9Qw9QM=;
        b=cX8Oyko+9BUJ/LRlYYfIwfgInAZ3izQZGGnx1hum+2acbpMVS4IYjbzQzd9pKpoV0f
         44Wpq79tf+r5VYD19ARiwSugHU8xOe6sQOtDChKtZi+KjerM87VVcXC6M0z1q05qGsV/
         WqMydRz4AkYBRGL2jnVs3EjOUKxIUUAh+C6e4iIn+0c5x9KKOfr0c4EYFtNIaSiY3R5K
         NW/pWs2guC4Q2psx/sEgNlnZnel9Dgy5sJW1VOr23GKKfk3Pt5HMr3iNVGeV9olKqqtU
         UAlE3dUMzqzEYhvHzAolx11xHKYJXre9woJXGXi2JXj0DgKTvYH9wqhqQ/ZQdq0AYdVx
         2FSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795252753; x=1795857553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JOOW8rwk0fxLyNA5MGe5otqpgV1eEvzk99HIB9Qw9QM=;
        b=gwfKtIkduBMxoe1q+WSKvXifyQnSyFQgdzc+6ert50k1jJakveIIenYZvUMEuZwFqR
         Hq82bayb2UWx4s1dBQU2+gkdSEj71MYHVUD/w1jrfVDlPE3h4GMp93ECeOh/YHF/SHMJ
         SaSNRjB93MLbHX4M0f7cxivVbcpPkF0P/8XIl6XksV42+Z5aJWRr8KrytLFCR9oSCB7a
         96ASOHakjS2E66SUZ+f/OooKfajYtgFmGCsaSN0T9bAOsXkER+Pi9oPRIRoNMqet49y8
         b0emv8Q2hoEwAUMyG0fjYfgH3DZ+YiuOPOiohbXg+90wwd7+87QqfAmzQCAhJtFbftNM
         HedQ==
X-Gm-Message-State: APuU4Z9Z1seKVx5wtz26c9rMXtA89mGP7SPOURDf+AgbJHgghhWHlOZt
	2IDH9LiP01ApjKoEQBKjYlyWTEbiyCIVsRcfviWMjVZ9takIxe6GuLkl0fqjitGf8Cc=
X-Gm-Gg: AZFdTZd9DhVaAEwQFRubH3ksF9GX84zpy+dnfWqPdVJH7RUljb+NiSZpcXP3H4XGOsq
	gWAx2cbUOyPVKo9ab4tnGDgLJIzQTpgSBmBRoZRsUBYU3hq32GPucW33NaL1MjrHcuAR4OpiG2N
	ZV1KBSfgH9DX07JkA0VfunmhjclO7A/l+OmT0FxVGMbREzvG7V+eSa09gCveEExBcg13v0Yax1F
	xOK3s0zlDRFDLANstjgd8P1nlsAiTWT9phZyj69EiXr/J3zWRKqIH3q36iJTOOMou6dfrOrc1Wy
	Duo/C2CIjy8OTkNyl/6c4ll9DUqdFGtqAQrlMEQ9Ky4ChI/7LGwc0zg07IuPL69rP8EopzskeAk
	YqMe5UCesNhD498W0cBQNzrbGhYsrCQSiwjpGzXKfYz0KSCyrxTI0QMvNaXJkOZodXDWnhBro5F
	PxEBabygwBOOwhGoLItkj2CXS5xSvqHNU6byq4Ms88e1oI5HylxdK3omvWw+1QhQPAhvRpCPG5t
	3kWC76xNGHKuAXDizcTJWRbj6wPMviAOt/VGHgO9+W9JjkWUBEC7MrJRb5hqHdFMCPp0tVuMTog
	jvk18FyP84KQD6dPclPL9TZHEMShZql3wfd8H+YmIsZbVv25P9PyF89py2RYZen/5fMShjMLcy+
	ddo9B+p5gRO5rNulHheA=
X-Received: by 2002:a05:6a20:e68e:b0:3fb:1640:c504 with SMTP id adf61e73a8af0-4014db5856bmr4796813637.63.1795252752623;
        Sat, 21 Nov 2026 01:19:12 -0800 (PST)
Received: from default-vnic.degu-barley.ts.net ([161.118.211.100])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d05c0cfsm2379895a12.26.2026.11.21.01.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 01:19:12 -0800 (PST)
From: Tuan Kiet Huynh <huynhtuankiet33@gmail.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andrii Cherniavskyi <chernyav.a@gmail.com>,
	Tuan Kiet Huynh <huynhtuankiet33@gmail.com>
Subject: [PATCH 1/2] dt-bindings: media: i2c: Add Samsung S5K5E8YX image sensor
Date: Sat, 21 Nov 2026 16:19:06 +0700
Message-ID: <20261121091907.1190346-1-huynhtuankiet33@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrii Cherniavskyi <chernyav.a@gmail.com>

Add Device Tree bindings for the Samsung S5K5E8YX 5MP RAW10 CMOS image
sensor, including optional standby-gpios and MIPI CSI-2 endpoint
properties.

Signed-off-by: Andrii Cherniavskyi <chernyav.a@gmail.com>
Co-developed-by: Tuan Kiet Huynh <huynhtuankiet33@gmail.com>
Signed-off-by: Tuan Kiet Huynh <huynhtuankiet33@gmail.com>
---
 .../bindings/media/i2c/samsung,s5k5e8yx.yaml  | 102 ++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8yx.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8yx.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8yx.yaml
new file mode 100644
index 000000000..a70becba5
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8yx.yaml
@@ -0,0 +1,102 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/samsung,s5k5e8yx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S5K5E8YX Image Sensor
+
+description:
+  Samsung S5K5E8YX image sensor is a 5MP CMOS image sensor.
+  The sensor is controlled over a serial camera control bus protocol,
+  the widest supported output image frame size is 2608x1960 at 30 frames
+  per second, data output format is RAW10 transferred over 2-lane
+  MIPI D-PHY interface.
+
+maintainers:
+  - Andrii Cherniavskyi <chernyav.a@gmail.com>
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: samsung,s5k5e8yx
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: MCLK supply clock.
+    maxItems: 1
+
+  reset-gpios:
+    description: Active low GPIO connected to RESET pad of the sensor.
+    maxItems: 1
+
+  standby-gpios:
+    description: Active low GPIO connected to STANDBY/XSHUTDN pad of the sensor.
+    maxItems: 1
+
+  vdda-supply:
+    description: Analogue voltage supply, 2.8 volts.
+
+  vddd-supply:
+    description: Digital core voltage supply, 1.2 volts.
+
+  vddio-supply:
+    description: Digital I/O voltage supply, 1.8 or 2.8 volts.
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          link-frequencies: true
+          remote-endpoint: true
+
+        required:
+          - link-frequencies
+          - remote-endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+      #include <dt-bindings/gpio/gpio.h>
+
+      i2c {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          camera@2d {
+              compatible = "samsung,s5k5e8yx";
+              reg = <0x2d>;
+              clocks = <&camera_mclk 0>;
+              assigned-clocks = <&camera_mclk 0>;
+              assigned-clock-rates = <24000000>;
+              reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+              vdda-supply = <&vreg_2p8>;
+              vddd-supply = <&vreg_1p2>;
+              vddio-supply = <&vreg_1p8>;
+
+              port {
+                  endpoint {
+                      link-frequencies = /bits/ 64 <420000000>;
+                      remote-endpoint = <&mipi_csi2_ep>;
+                  };
+              };
+          };
+      };
+...
-- 
2.43.0

