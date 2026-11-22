Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795319225;
	b=h5IHYynWexuqfdHUqIIttp0h6YijAOmhshPIv4WWhwvDRUZAHGCXl2d0DO7pI1LzBsmv
	 9X+BcGeEXLf9CBEMbYSu9KP5wvHMjmEdUu1nk8Y5BE87Y3P8EUPl9p/3HLEKk4qug7I/I
	 uzLSV7OGnmGD/FVeLn6dLVUfpcgFcG1kOYlahXRtA1Bic1UXTTd/MxS1NLtfwUXqv+6O1
	 jtZFzs0tYGQ2Y89suFmde+oWQi5cvF87vW2OitHeVJO80j+TV6AKr9HgRRzSLf7uQSXLE
	 HqZWOJElFxZXQ3YDAL6B2+SUge76tk7tNxBV2WAZXODE2He2I5rCDAyQPIMRdxfTuhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795319225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xgEf59wW516NgPmfsLZmDRO6dAOrXpUhyDeSMZa7qDQ=;
	b=375Ihw4OU7j3LPk4r3CB9rXlaHrvRSJ12PLFlRyGq/xYdDVuoBGSO3ADpJ7MLCck9XSn
	 Twte52Ju/rjQQEeCBpwUkSjkTY+k6DJc4y1sZr/7OgvMfSh0b640H39VpPyJMDyCHho3E
	 pVplXV/JuVPQHe//+A+Z/R5oDuJo1H5UYOpRsfSbXSIW2Yh51IOIUfNCyNy+jZioBGE9J
	 foHXJp1Gj7LQw6LYPi5l9meqoGokBx6mr3AJ32VxRHmyaUUwqUvdYw+yePUxI14Ra+KFa
	 43BDSDOclaXAOzJlxhc42dD+7BP8fVXv6p3AU1auMlID2BQEuHDWoxCGCcc+2zHXDPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U7+KuGat;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A707606A330
	for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 03:47:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A707606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U7+KuGat
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b421e8d111so1419651a91.3
        for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 19:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795319223; x=1795924023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xgEf59wW516NgPmfsLZmDRO6dAOrXpUhyDeSMZa7qDQ=;
        b=U7+KuGatBQ2Ti1dwmiNQUpfbYWGVoNkgEVdpVGe6L+kgG+4Zi3VJSNV3NxUT2flsft
         KO12/u6c/lL05p2Hbc8T4nM1fzopwOtQTYh2NocLitrRCRZjlo/hY8Ph4YcluFv2VDbI
         Eba0eyvkGvU9NRPEFhzB2Y6uEmWkyoR7zkv6qH0t067qBdvZaccc/A4wvnAXCteuRPCf
         8JVCm1Io7/M/HZU9g2CWRkvPsc9q1tzyIEzLRhGgqDR2P7hkFyyu7CFOIl/IUPw+fQaH
         POh3e72ZrCI/YYu3f8i36SJVKeTnwVIZx+BgR07EiIWqpJmcoGAm9P82+Fvq2trx/gde
         Nzuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795319223; x=1795924023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xgEf59wW516NgPmfsLZmDRO6dAOrXpUhyDeSMZa7qDQ=;
        b=zMN1YkUa1Y2bqYmPsqU0C/uppFZRi6T0OKUAKqdlL5+nVCX2UHI+Odf05JH/52ZUgD
         muPBPDgHk/yYFheenpCjOJ0A/Abdh11ogXiOxgMH2kUr6xBsfPIq5QNFCqJ1DF8YwP6Q
         fkQeMhSv8LZAHLHyjxFurBFDZTmN0Y2z6pLVBsii6s/55yme2GY9qSBaswg6CKKJmgwj
         sKwFtHKfKQSKFN1Vqt2p8WTAPAub+I9PxcZlYDdqwlh2lXZKMS52acKkf4etlJtfRTUZ
         C7+QOpCzZeBqswFWiCFaAs6iaw33loJu8Y7gNO03EqKU8hqFVSeU0i5XGSH5FsakG6s1
         75KQ==
X-Gm-Message-State: APuU4Z/gV2QuEc7PSSe8Sa+6vTym4iYQwvXzD1HK5SKPlT1WxzJtqhHO
	CRgt0yJEbezNLPQJ85xgp+d7+3Hj+VQ3SadYQQr2i4ZqIctsNjIT/0Np9Kj134e76Gc=
X-Gm-Gg: AZFdTZf81/uSOwW3YbNLC9C+KAHIood2x2B1sKUbTi4KqZ1ZHjL7xbpmcWTrHl2WQ0n
	XkSTuvDGqxf1e6kfu5/PbLp5Pk+6yyGeE/ihH/zQ342j9ulfyYMuStiUbXt3md+rm369hC3bVRJ
	RyB6HLrmdCs4mLDDsA2x4+qMdAqDruMj1p2898DMfqLF7o05ZqeIgGypJ4bWiEFIXuagcjOVsAg
	OzTxdEb7oQdV0cox+FCsok9jwvE4wrDBAYDpyv14eolyCFF8HxD9tw5wZxy1VGgwzen7LJBxAsd
	vHnOTM4yFVQuupNE3OgksS0DTRoK5VoPcSrT8oCQ0W6OgIQ4/PN1XDVjRdA35JtWwkFSgrDimmD
	gxZAwudgTYq1eu/TvJUzCHaE7aL3iAIdEKSK0yEo/v/tN+Av0q4xD23h9EogZCuYL632Dya/3oK
	+MZ+MEIfG+onT67/36MOVq1fDoLZwPpNu6bo0vGm+YSuNRptoxODIjmGDHF/P/njpuZK6XyrFYW
	edxRkqKq6vJazMi8mYaVYePisR+5cAbQz2uv2tRCz2fdLMGkPt9aq3cyHAHNFSjJFRaO3A69mqa
	wH/zrj0hzItHEcqQv38JkICRrV1EPKs5JuWV0E6GzCJOTMl5kl8y4nrHsC1n2BNyZzz14toTLp/
	6E7R+9eqSF0eRfWC+YVI=
X-Received: by 2002:a17:90b:388c:b0:3b3:c04e:4b74 with SMTP id 98e67ed59e1d1-3b41c9b2becmr7746348a91.15.1795319223311;
        Sat, 21 Nov 2026 19:47:03 -0800 (PST)
Received: from default-vnic.degu-barley.ts.net ([161.118.211.100])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe16sm11040018a91.17.2026.11.21.19.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 19:47:03 -0800 (PST)
From: Tuan Kiet Huynh <huynhtuankiet33@gmail.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chernyav.a@gmail.com,
	Tuan Kiet Huynh <huynhtuankiet33@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: media: i2c: Add Samsung S5K5E8 image sensor
Date: Sun, 22 Nov 2026 10:46:55 +0700
Message-ID: <20261122034656.1093369-2-huynhtuankiet33@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122034656.1093369-1-huynhtuankiet33@gmail.com>
References: <20261121120731.2028810-1-huynhtuankiet33@gmail.com>
 <20261122034656.1093369-1-huynhtuankiet33@gmail.com>
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

Add Device Tree bindings for the Samsung S5K5E8 5MP RAW10 CMOS image
sensor, including required regulators, optional reset/powerdown GPIOs,
and 2-lane MIPI CSI-2 endpoint properties.

Signed-off-by: Andrii Cherniavskyi <chernyav.a@gmail.com>
Co-developed-by: Tuan Kiet Huynh <huynhtuankiet33@gmail.com>
Signed-off-by: Tuan Kiet Huynh <huynhtuankiet33@gmail.com>
---
 .../bindings/media/i2c/samsung,s5k5e8.yaml    | 109 ++++++++++++++++++
 MAINTAINERS                                   |   8 ++
 2 files changed, 117 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
new file mode 100644
index 000000000..3aa50bd58
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/samsung,s5k5e8.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S5K5E8 Image Sensor
+
+description:
+  Samsung S5K5E8 is a 5MP CMOS image sensor controlled over an I2C-compatible
+  serial interface, outputting RAW10 image data over a 2-lane MIPI D-PHY
+  interface.
+
+maintainers:
+  - Andrii Cherniavskyi <chernyav.a@gmail.com>
+  - Tuan Kiet Huynh <huynhtuankiet33@gmail.com>
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: samsung,s5k5e8
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
+  powerdown-gpios:
+    description:
+      Active low GPIO connected to the XSHUTDN (powerdown) pad of the sensor.
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
+          data-lanes:
+            items:
+              - const: 1
+              - const: 2
+
+        required:
+          - data-lanes
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
+          camera@2d {
+              compatible = "samsung,s5k5e8";
+              reg = <0x2d>;
+              clocks = <&camera_mclk 0>;
+              assigned-clocks = <&camera_mclk 0>;
+              assigned-clock-rates = <24000000>;
+              reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+              powerdown-gpios = <&gpio1 11 GPIO_ACTIVE_LOW>;
+              vdda-supply = <&vreg_2p8>;
+              vddd-supply = <&vreg_1p2>;
+              vddio-supply = <&vreg_1p8>;
+
+              port {
+                  endpoint {
+                      data-lanes = <1 2>;
+                      link-frequencies = /bits/ 64 <420000000>;
+                      remote-endpoint = <&mipi_csi2_ep>;
+                  };
+              };
+          };
+      };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index f72ce07a4..10b7bf57a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25013,6 +25013,14 @@ M:	Andrzej Hajda <andrzej.hajda@intel.com>
 S:	Supported
 F:	drivers/media/i2c/s5k5baf.c
 
+SAMSUNG S5K5E8 CAMERA DRIVER
+M:	Andrii Cherniavskyi <chernyav.a@gmail.com>
+M:	Tuan Kiet Huynh <huynhtuankiet33@gmail.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
+
 SAMSUNG S5KJN1 CAMERA DRIVER
 M:	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
 S:	Maintained
-- 
2.43.0

