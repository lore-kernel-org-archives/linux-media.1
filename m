Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794946806;
	b=5KTLJIIQyFG15hk4CdVixAldl1wmRAYxzs/sUIzD8orIFIMpsjpgQUf1YiuyaxNeLj/7
	 cCORadPNpEefjMaI6hfxB7aciNsVsMzvuXt7aAocO8v3dgQXDsT2x3i08pRqiFg62VxHD
	 5rrj9Bb13STD+AjotG6GaXSTfd9bhbbM1hRsrjbYXgNPWbDXZeLtSj7csaqMT37oKEVDx
	 Nt1tllQ40uyZgxs5ZGFOX1tVfFm4Zr4lsL3NFXHrjCRGCdxkDcjgIGDXv/AnzZOHVr3ye
	 utQ+UZJ1ljtn/WK9Dyn6ViGlhAD6KHWwyv21ncTF2/UnPB00gXzqslhNn3IHTMWjEsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794946806;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=wqrsZBFTEgGy+HYB59OU+78hDrcZgqtGFfMhSqQFz2U=;
	b=wP8bULCK9c2IhuhGllzLPa89aERRY9WrXpVNUlei/NNcBqUhEsXGS2OWBOmQqKMKC5tZ
	 F8azlqOr3VrQR1GHOA0jxY+VZ/etePDUQU3s6OEPme6L8leg0VWhLrIMvz1K/rKr9xN4T
	 aCfuNGcGdzMRW+nfeq+hP4y90qkDQYF8Dt/HaTmtCCHdTeM08XBnrNeeHD11dPDgdO1M1
	 NWAhfscMxJwPmiJ+wNMcZdcSPTFAcSxAt0YpWQm7phdEF5QgcHGNanPd5m8cPR6sBkjwo
	 G20DLWuaFvmioLXGKu+rRQ2r7KfAKYeqVKndeBN5q7j4U/C7rMNjZStgmFiPCfvNnpg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AEKXEf70;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164F2606A332;
	Tue, 17 Nov 2026 20:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AEKXEf70
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794946805;
	b=yzsAxrQ/XSaW9+d6aVzBd5XIuNs7GD5VppegWCyyudI88oWrnqEWNGKmOA648FHWDf/z
	 Hw6h+jHqU3EMtU47zGiLQ7AzaocKjV/5Y6Z4XFmZhwn//SWim2nOD/GBxg2kY5fcOjAIW
	 LUSojX1NwFyXOyjss5vkwBtE5f/Ec8FarLgoG6j2fgNGE+9Uw+AvWUPP2DdcW/ljXANZL
	 hK3NI4UIAaDSP+MRm5Kr7t5kshkSQYEplD6/8u6pzPoSnX93CGVxk91kXe9/yBbD8WIiJ
	 q3nyLqGu7MnIo+VkNQcHbkMUiQHIlrEEZDqZ8kWQJLTOfy9xsZIU9bGjpEFvkhc6TmQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794946805;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=wqrsZBFTEgGy+HYB59OU+78hDrcZgqtGFfMhSqQFz2U=;
	b=vyzzHami6S0EoNjYUfa4bY3QgSZ3HPttlSxlR0ysNnXyXCqbT3HqJb3zb+DdY+0aCYTz
	 nxWv8Ox9L5nblVDnng0/B+ikdR5Ku1mFBqsuCwCjx4dDadZYlaIwgumh9gvwRM3WwamKp
	 A4gGW3RsERCPrbxAs7lxxNVBOY14O4WlC69XCpNNFhkRcM9I7xVSHLYm5Kj5Jtb5iyjT6
	 q2Mqs+MIc4L2AV+Htoe2aIKpQJxkCv0BFcI81X/7zkldbYUkNfVedIJtE+2DR0xoT9M8j
	 f2VPycomu070DGj0UzesG4OS/PSB7lMHtFoy0ocAQXQlTLhnhvUkxWfu8kbucpalcqw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 417061F000C4;
	Tue, 17 Nov 2026 20:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794946805;
	bh=wqrsZBFTEgGy+HYB59OU+78hDrcZgqtGFfMhSqQFz2U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=AEKXEf70cfQUxwlsLr4+O9x8PJpUGMmZjjbx87M6IyR5wn+zxC8RrGLo/07NPA8Bs
	 TyzTVpaHTzBZmW3/jNuOxjb0jFp4GxAgoFeFeWmd0x0N4y31/rMAe9n9TggXJC46Yk
	 w8/iWxLjmlNpBviZlFx7sArJV+e93qTEM9mtXARzB94T9TP/cSrVzKW3yzet0U2VLn
	 HDtpNRafzoFZ9ha8SGzSea25lEGXrXn4K4RDaSaY0rd7vb/OrCWMUqbi4TNp95ZPhl
	 XUN2l3cOJUAZxLrDcTvnlZ4DjIAD6ld6G1n08TJu5ZTJR57cac5gaopBgnshWyjoH6
	 etrq4x5Pse5LQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id AD4B94AAC6;
	Tue, 17 Nov 2026 20:20:04 +0000 (UTC)
From: Armandas Kvietkus via B4 Relay <devnull+armandas.kvietkus.proton.me@kernel.org>
Date: Tue, 17 Nov 2026 21:20:04 +0100
Subject: [PATCH v5 1/2] dt-bindings: media: i2c: Add Samsung S5K3T2 image
 sensor
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261117-upstream-s5k3t2-v5-1-1f7f5fde9e2a@proton.me>
References: <20261117-upstream-s5k3t2-v5-0-1f7f5fde9e2a@proton.me>
In-Reply-To: <20261117-upstream-s5k3t2-v5-0-1f7f5fde9e2a@proton.me>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, 
 Armandas Kvietkus <armandas.kvietkus@proton.me>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794946803; l=4123;
 i=armandas.kvietkus@proton.me; h=from:subject:message-id;
 bh=tkShdLWwWiHuVSzgY4OOZGB7fJdUgKDkchfsedpvqsU=;
 b=6lBcQuvsgAoXaB+c78F6t3ai/BZ0KxJSoVsd6uHa1zAFslJxPfwu5CeD8/poG1XZWT2B+JJUr
 U/IVpnDyO8zAjiICnntvChKuo1xCbu5lJZT5URyjqv+IS/GNgUANYib
X-Developer-Key: i=armandas.kvietkus@proton.me; a=ed25519;
 pk=wuqmImJ9sKlDVcwALOvfGhjj7G8EBjjM4TpCdmlrAf8=
X-Endpoint-Received: by B4 Relay for armandas.kvietkus@proton.me/default
 with auth_id=974
X-Original-From: Armandas Kvietkus <armandas.kvietkus@proton.me>
Reply-To: armandas.kvietkus@proton.me
Content-Transfer-Encoding: 7bit

From: Armandas Kvietkus <armandas.kvietkus@proton.me>

The Samsung S5K3T2 is a 20 Mpixel CMOS image sensor. It has four MIPI
D-PHY lanes and an I2C control bus.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Armandas Kvietkus <armandas.kvietkus@proton.me>
---
 .../bindings/media/i2c/samsung,s5k3t2.yaml         | 105 +++++++++++++++++++++
 MAINTAINERS                                        |   7 ++
 2 files changed, 112 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5k3t2.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5k3t2.yaml
new file mode 100644
index 000000000000..74a1aa23249f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5k3t2.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/samsung,s5k3t2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S5K3T2 Image Sensor
+
+description:
+  Samsung S5K3T2 (ISOCELL 3T2) image sensor is a 20MP image sensor.
+  The sensor is controlled over a serial camera control bus protocol,
+  the widest supported output image frame size is 5184x3880 at 15 frames
+  per second, data output format is RAW10 transferred over 4-lane
+  MIPI D-PHY interface.
+
+maintainers:
+  - Armandas Kvietkus <armandas.kvietkus@proton.me>
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: samsung,s5k3t2
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
+  vdda-supply:
+    description: Analogue voltage supply, 2.8 volts.
+
+  vddd-supply:
+    description: Digital core voltage supply, 1.05 volts.
+
+  vddio-supply:
+    description: Digital I/O voltage supply, 1.8 volts.
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
+          data-lanes:
+            items:
+              - const: 1
+              - const: 2
+              - const: 3
+              - const: 4
+
+        required:
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - vdda-supply
+  - vddd-supply
+  - vddio-supply
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
+          camera@10 {
+              compatible = "samsung,s5k3t2";
+              reg = <0x10>;
+              clocks = <&camera_mclk 0>;
+              assigned-clocks = <&camera_mclk 0>;
+              assigned-clock-rates = <19200000>;
+              reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+              vdda-supply = <&vreg_2p8>;
+              vddd-supply = <&vreg_1p05>;
+              vddio-supply = <&vreg_1p8>;
+
+              port {
+                  endpoint {
+                      data-lanes = <1 2 3 4>;
+                      link-frequencies = /bits/ 64 <448000000>;
+                      remote-endpoint = <&mipi_csi2_ep>;
+                  };
+              };
+          };
+      };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index cc3cae2e378b..1924dbd20b57 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24380,6 +24380,13 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/samsung,s5k3m5.yaml
 F:	drivers/media/i2c/s5k3m5.c
 
+SAMSUNG S5K3T2 CAMERA DRIVER
+M:	Armandas Kvietkus <armandas.kvietkus@proton.me>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/samsung,s5k3t2.yaml
+
 SAMSUNG S5K5BAF CAMERA DRIVER
 M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
 M:	Andrzej Hajda <andrzej.hajda@intel.com>

-- 
2.56.0


