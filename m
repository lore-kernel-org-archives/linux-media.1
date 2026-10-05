Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78AA372B58
	for <linux-media@vger.kernel.org>; Mon,  5 Oct 2026 07:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791184242; cv=none; b=lAiR9HsD+pYHeC/ufDXMuaSNYuPqnbdgk+DWxcvGI8UFaehjpXStrHqDQ/+VgD/VzHswSjCyZJmfncgsGaOEU3KjY5oua2syJiAdSvu+ZkYRxDQNZXTNOV4YctquhuDRxNKITzkz2F4/XiogZBYwzE8skj66Cy4yN2yLObk+cTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791184242; c=relaxed/simple;
	bh=g9L55NSZTjbF7DR8qLdBD/MseUaTAj2QqtyFJ7AK9Sc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gt7Gbbnc7WTNpaxPK+xdSX8JGxuInPx6JEFaG0XDUbl4UaZI/A5Lp9Qm1heq7dHiyqCH4MxSG44Ibc8+IFQssodOnAcIGdRo/wTV8vkJycRhC3a0cm5ptQ7gq38rWJcC6GubFg7McSHLh+gBCgdnYEnyK3LkwUoPP3oXY+xHhQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=coTZ3kc7; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="coTZ3kc7"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a0977b9c20so19283685e9.2
        for <linux-media@vger.kernel.org>; Mon, 05 Oct 2026 00:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791184238; x=1791789038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N6xKUj60fP5HlRPnblfOGOYjQo1YTnSgTpi29S2wERA=;
        b=coTZ3kc73YAlhxDe344hpUJXqQCSQ1ILhAUJv0Drevojrn2YnmnCt41e5tDObOAdCg
         jgaOJ7IWZx187cfqYrFjRVykfeDPJtX6Ijrjb725QB3m0DIFURyg9Xyeb4wbYNCNjos9
         HG7GEqK3+ShJamQXxeJiHTn1E0J1fZBjuRdtbaxGtZrPmNjTsU55WqyJMrGsgFrJXAcg
         iTpz/LwbOqCoP5TCpvC20vQ+raMKVn3YHwM9d459syQyQJyjQTkYhMz7dnrGgYdDmT9F
         dYlLrLrZMMeCBrS2skA7+VU0+c8zyfQjPLUfdb9+wkHDZakVW5u10y/uk+a/Uo7JzCCJ
         e/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791184238; x=1791789038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N6xKUj60fP5HlRPnblfOGOYjQo1YTnSgTpi29S2wERA=;
        b=tkJV/5pGZijyCtBnmFRCATPBDRBrqNSegcG87T4IQ3B84a0fh4wq7y4yenZRumRJXH
         T84GY1NPsMtj6ctnZvxJroEh1kksJVrwuEqo4pkwQJri/7abKiV7QeX4Kx92wnOxoLzF
         ZCBzsfcRCL1L7sijqMuhaAm5HT9UAIIgXODWVrLl0xQl+2PrhLJx13gfPjwwx8zXQnRy
         uFQpQl3QTCiUCrWoH0FfnTtinxSw6rukW6LsINu3pZbuW0sxPGLhM2tNh4n+adIt7TWP
         Wte2WxiDuuarREFrKgbw0U2ZTPTnqoQuUjvUdBc4Bslx8Vh9xaDxCZM1p+NpTNVpmQOu
         aWvw==
X-Gm-Message-State: AFuF++lDJkXe+6XDtnL80T9dExXiH4nlNZwms8YhSA0d0WzPm2q1csHC
	0TMp8x2WgOtL/2lcJfHy6cEPjUQGOgwE627MbcmAIhHa5mPKySJhjiq0vSvo5LFk
X-Gm-Gg: AYBFou0VpAfx70rjJCDrqCw0u493mS/3ZbEF6zArKZmH1lyUg41ZpTMS7LT0qCErBKP
	6ipVj7iYpTgtMt0gLFu/I0tuArV2V12H8ySh/Y6ps1cwsrbiIG3xFhca+hfQwnTAgu498T/GN56
	NNtgxkZVyBz7yvT1Q1cLU7xWrE8Oc2vvQVIWI4GSde8ZHS1bW3eY5ILE29EUpTuzAtd330b5vAA
	7eSRZjfyBg2zcVpVPNzYb7xvUh6Ce+acpQTRYwaqvu4s/bcJ/6Q8axFZulun0boXpdZ1mT2gdND
	noELRGFgRGo5wgD6C0dl9hyAkz1qJEVde0DsAua9NWAgmvvOtmyieKumECPfqqXKMVZW/derau8
	C0N5iW9uFtVeFHI3beyxwTVs1KIy/JuhnSFS9RVBJAY5n9FovQnxGRsxrInAVYXlaErunQBCaZ1
	wWWWfQthtIcsuH+OoZkIqIrHoE1iCb0qJiTptbCLW3Tsk5KcjS2uqJyfHZSb68ZWoHCw8tdA56L
	FAxFvDwxhtP/9/y0fkQISBo/f+aQIIGwkmI9tzS/xT8+HEBmD0Qhy0mRoPNF3QfT1b0mDs8rCS5
	6lmyNk8UQyJ18tT0Jpom2sMO8MguB4Z6wA+F
X-Received: by 2002:a05:600c:1c08:b0:4a1:722a:d2a3 with SMTP id 5b1f17b1804b1-4a1722ad405mr36499765e9.23.1791184237829;
        Mon, 05 Oct 2026 00:10:37 -0700 (PDT)
Received: from robert-83cx (static-dsl-191.87-197-115.telecom.sk. [87.197.115.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027741586sm316749855e9.14.2026.10.05.00.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:10:37 -0700 (PDT)
From: Robert Bozik <robertbozik@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Robert Bozik <robertbozik@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/3] dt-bindings: media: i2c: Add OmniVision OV32C4
Date: Mon,  5 Oct 2026 09:10:08 +0200
Message-ID: <20261005071010.7191-2-robertbozik@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005071010.7191-1-robertbozik@gmail.com>
References: <20261005071010.7191-1-robertbozik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a binding for the OmniVision OV32C4, a 32 megapixel RGBC CMOS image
sensor with on-chip 4-cell fusion, a 4-lane MIPI CSI-2 D-PHY transmitter
and the standard SCCB command interface.

The sensor ships in laptops as an under-display camera, where it is
described by ACPI; the binding follows ovti,ov08x40.yaml, which covers
the closest relative already in tree.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Robert Bozik <robertbozik@gmail.com>
---
Changes in v4:
- No changes to the binding.

 .../bindings/media/i2c/ovti,ov32c4.yaml       | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov32c4.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov32c4.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov32c4.yaml
new file mode 100644
index 000000000..804307cd0
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov32c4.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,ov32c4.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OmniVision OV32C4 Image Sensor
+
+maintainers:
+  - Robert Bozik <robertbozik@gmail.com>
+
+description:
+  The OmniVision OV32C4 is a 32 megapixel RGBC (red, green, blue and clear)
+  CMOS image sensor in a 4-cell arrangement, with on-chip 4-cell fusion and
+  binning. It has a 6528x4896 active pixel array, a 4-lane MIPI CSI-2 D-PHY
+  transmitter and the standard SCCB command interface.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: ovti,ov32c4
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: Input clock (XVCLK).
+
+  avdd-supply: true
+
+  dovdd-supply: true
+
+  dvdd-supply: true
+
+  reset-gpios:
+    maxItems: 1
+    description: Active low GPIO connected to the XSHUTDOWN pad of the sensor.
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        additionalProperties: false
+
+        properties:
+          data-lanes:
+            items:
+              - const: 1
+              - const: 2
+              - const: 3
+              - const: 4
+          link-frequencies: true
+          remote-endpoint: true
+
+        required:
+          - data-lanes
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
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@36 {
+            compatible = "ovti,ov32c4";
+            reg = <0x36>;
+
+            clocks = <&ov32c4_clk>;
+            assigned-clocks = <&ov32c4_clk>;
+            assigned-clock-rates = <19200000>;
+
+            avdd-supply = <&vreg_2p8>;
+            dovdd-supply = <&vreg_1p8>;
+            dvdd-supply = <&vreg_1p1>;
+
+            reset-gpios = <&tlmm 111 GPIO_ACTIVE_LOW>;
+
+            port {
+                ov32c4_ep: endpoint {
+                    remote-endpoint = <&csiphy0_ep>;
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <400000000>;
+                };
+            };
+        };
+    };
+...
-- 
2.53.0

