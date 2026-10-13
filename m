Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94DD47253A
	for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 03:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791862118; cv=none; b=OliWclMgv8NXIlHhkpA8iQWuylhEBXn8Gcr2feJFuwhB35VfNLLln+thFVKJamzM9afRwx9ocFOuq11htdN09V2hUv0Hsm0vT5nSyXczYhj8LPx8Pdm1C7bvgvJTz5OTr2TxQEwMpYTYgOkMdaNHL7skyUy2zxDM54uavQYYagM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791862118; c=relaxed/simple;
	bh=1596ZXtdhvZVs+Tdnu6Ajw7/QmvSTVTcByw56Brktwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JmiA09vXpHeNYN9/J45DhKrdBdK0Nh0rCepL9G/5QUWcMpXAzwQlyvDoUtSjNX0tieREnJhj0WmNz3mTwoNKuoIxRFfuD8IQ/2TmnFBDrEwK7QaHNcJZMyfJlVreYlg1vu+JAlUxbxLZ3Qs29R3dzxsUTHL7zBP8OGSBgnsDQTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W91FFlHc; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W91FFlHc"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3550c917fd3so3547120eec.0
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 20:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791862116; x=1792466916; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+8wCm2Nfy1YlIAb2uRfBFA3ucdNuFD+nuit8STLj3RM=;
        b=W91FFlHcUkJSt2HrR9od60ZMxoiq4czabMLAHTBvIZKvZXtJ2k87DyVzvWa52Thp+N
         yEIdIFeiR7iGGqj+dyoFxQu7P2SHxSfg9cAvr8i5vEFx/XeXr8CmmHy9keFdUzEVOlH5
         ZmFRsml7GRBmCobiUiOW6wCVv9/0+xCjrWXPsfDvoq5HAgjkb/Z4Gyhsbn2QODvuBY8k
         7yNHYPCtKLtC5SuibL0GpECx3nrn+Ny9IIPI1gKhzxxybM6aHlTcyoyJbfyUrcwIdLJ+
         Z8lf6sEglefQO7jumuItchredFVLyOrbkQ43ZsxCNN3qySIUtojrgM1m6kSj2Vl7UaWW
         rgLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791862116; x=1792466916;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+8wCm2Nfy1YlIAb2uRfBFA3ucdNuFD+nuit8STLj3RM=;
        b=KIU/Pm1V4gDyRdbfP/YO0e1m45hPVPeIdoz3iTusoY0qLdaUS79sEbj1Z6GjBlP6z/
         MYlaFS7ce0OgLFU3cRYsApfGdB/0djn9Go1TaAi+lDR9i0DK/Ylu2Jy5PPBQSfP/LvBR
         Z5pkYNSPxtohJeUiuI51sDJYjbodsBleUSAHyUwwNrpmgkRek1xCfiQI1cclA0JX5xhL
         B44kHI/odT/vi6KUlEQPs1ag2erUOn5dmB84YZ9EYwSvjdeeCkcolVujteV9MgFKgko1
         CuBGJ2D6v1uqk49O4GFFKnYns4F5n/qiSPt4cXO7miysvoEixkuH+pRWMqBR6z8WqANO
         CXyQ==
X-Forwarded-Encrypted: i=1; AKwUvBxL9nlR+jptHwSDWRFAzGuic8UwwSMz3t3yxE/4OJAtizZ7uMgk3Ef+ll6cQ2kDoZ5bei4JHugJuAUZwQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYL7CEuRJrmFNv13HYATYqu3P90Vxas4PJ6iVeC3KyKcnmXLY9cM
	xuH8DUXHR16YLGmM9avTZRTQsdz67GjYl7a5WByoLHh+K65LHG0yFbRu
X-Gm-Gg: AYBFou3+SGJ+g8w5N/6B6tuEFk9K2Hl2aCL33AGDkPO9ufAXKIfbnbjX+VTP2UgfHgs
	+34ZfR4T03llCNo8BR+mtF525Cv9PKsDA2OL9OSpqTtO1khmzyQBV5DEkQ0JkCGrMb+x1FDXoDV
	TtR1rimaApOLVQ9b3zwXlAKFF8z1mdYlRzLYkhXI5c1Zwc77MjfgATawW+2T+egn1bV41CiT8R9
	/R5ck5YdJv/l13+muucpPhd53WqizjCh20MFXc7kTsOfw4rMzIUBtTZtx+rNcP1krbV8mVfkMBR
	x+p5pDff/WGhsLXXGfW2HYsIxXKGulhqlKbJ5zzk65ejgtBgU7ImKK1kznMmyow6xzvYyBRki59
	xoRKtiFct0cvOOkHGUAjevyKo41hNYAL/N9rt8LcCFew42AfNAXLyqgVS3Y2qeNocpaqNyfmhW0
	jkzsPInW56lSnI1TsHaSiSIGp3K+WoM+slRaYV5IWFWlw4tHAeAOqxo7YuX4EZYP6PzXc4D8pnO
	AYrDiuyYkcZfRDfpJdZt/qyS/xmkuKXNdbs0GthZNrGAg==
X-Received: by 2002:a05:7300:d205:b0:35a:22a4:133 with SMTP id 5a478bee46e88-35a22a421b2mr7256994eec.20.1791862115599;
        Mon, 12 Oct 2026 20:28:35 -0700 (PDT)
Received: from [127.0.0.2] ([2401:4900:8900:441a:ba51:e5f4:3ca4:4b87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-353814b556esm43617106eec.18.2026.10.12.20.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 20:28:35 -0700 (PDT)
From: Ramshouriesh R <rshouriesh@gmail.com>
Date: Tue, 13 Oct 2026 08:58:23 +0530
Subject: [PATCH v7 1/3] media: dt-bindings: Add Himax HM1092 NIR sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-hm1092-driver-v7-1-d81a9b152ffd@gmail.com>
References: <20261013-hm1092-driver-v7-0-d81a9b152ffd@gmail.com>
In-Reply-To: <20261013-hm1092-driver-v7-0-d81a9b152ffd@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Jake Steinman <j@metarealtyinc.ca>, 
 Eduard Kulyk <kulikeduard89@gmail.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ramshouriesh R <rshouriesh@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2

Add a dt-binding schema for the Himax HM1092, a 1 megapixel monochrome
near-infrared CMOS image sensor used as the face-authentication IR
camera on laptops. The sensor streams 10-bit RAW over a single MIPI
CSI-2 data lane.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Ramshouriesh R <rshouriesh@gmail.com>
---
 .../bindings/media/i2c/himax,hm1092.yaml           | 101 +++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml b/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml
new file mode 100644
index 000000000000..e0a8bee62afc
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml
@@ -0,0 +1,101 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/himax,hm1092.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Himax HM1092 Monochrome NIR Sensor
+
+maintainers:
+  - Ramshouriesh R <rshouriesh@gmail.com>
+
+description:
+  The Himax HM1092 is a 1 megapixel monochrome near-infrared CMOS image
+  sensor with a MIPI CSI-2 interface, commonly used as the IR camera for
+  face authentication on laptops. It outputs 10-bit RAW over a single
+  MIPI CSI-2 data lane.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: himax,hm1092
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  avdd-supply:
+    description: Analogue circuit voltage supply.
+
+  dovdd-supply:
+    description: I/O circuit voltage supply.
+
+  dvdd-supply:
+    description: Digital circuit voltage supply.
+
+  reset-gpios:
+    maxItems: 1
+    description: Active low GPIO connected to the XSHUTDOWN pad.
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
+        required:
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
+        camera@24 {
+            compatible = "himax,hm1092";
+            reg = <0x24>;
+
+            reset-gpios = <&tlmm 109 GPIO_ACTIVE_LOW>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&cam_ir_default>;
+
+            clocks = <&camcc 1>;
+            assigned-clocks = <&camcc 1>;
+            assigned-clock-rates = <24000000>;
+
+            orientation = <0>;
+
+            avdd-supply = <&vreg_l7m_2p9>;
+            dvdd-supply = <&vreg_l7m_2p9>;
+            dovdd-supply = <&vreg_l4m_1p8>;
+
+            port {
+                hm1092_ep: endpoint {
+                    link-frequencies = /bits/ 64 <180000000>;
+                    remote-endpoint = <&camss_csiphy0_inep>;
+                };
+            };
+        };
+    };
+...

-- 
2.55.0

