Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432114;
	b=tUdycoJibZrN9kNuk28I/cKBkHDx6kNKyrwmKDJBOZAyXaVi4aPxEvObdn2wslx4lWR9
	 rWUy3dwzAZrX09NmEDAj3XGXn2NY9IQckIAH6jBSOmtgHu0XtKgc6ElLHeWHym/flzTLk
	 Xs977FFIcAmlJUvPf+qYZ7r7VzwE1U/ixyw76xoYvgvEBuoL7ea9Pv1BSxW0NeJ3sJ7nk
	 3e2hjpAkDHgCnd0NGvyWpuPw9YtxM1nvX7z55mJwywIJ9p6JedR01LA6QlbG8rOD08m0e
	 jMMQ0DfxBTQ29FWnDePUk0CL9AKMOeBpxrD66w0PeEQA9a8wWjJ59FuDI0FIVagF15w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3qI+mCyJNRelKwLCc2C0inNZM4PZfqwRA/mGvnNAgm0=;
	b=Apj7dmp3HMwyPTLOh2btJq66RXKFV/ir+xDNO8EvsNlcEwmaAR+Ibobpt/MAhKKQ6uje
	 XclpK34LlRevG4kfVpAvGdsE2nHckMX7mwt/5Gk/CoO5WcGKHu9GaGQDaCI5n2YAqv5du
	 F3xGZ4xLqZquRrrxe5ErXhwOFNoAQo23nJBFkdLRNB7kS+8fzZNuqx9DatopPZFxieJp/
	 ccXL7R5vkJfJTIGJ261bwX8zSTgoN4O44jEmIC8e18nW3iecPySma2fYioTL1RT7vFfpK
	 whV4p397O5Z2+vxbp1JxND7/Muby2MvGSyPbMv+L64AWNSHOJoQKBkSsXtjF4BHEsXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kdMpA+3X;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2895B606A31A
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 11:08:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2895B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kdMpA+3X
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so3807489c88.0
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 03:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432113; x=1796036913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3qI+mCyJNRelKwLCc2C0inNZM4PZfqwRA/mGvnNAgm0=;
        b=kdMpA+3XEIpWJhRS0Cf/pmEdcgIkOQFvMDyFXDhVHlrltr7setMvk12Eq5Fw/oUozO
         ARismXyoNbCSoI01ed6CtEwAy9cYw+tXXBPhv/0+Fr6Tu5sxBskpG7CN5/+XS2alDltZ
         sNDYUqnOc5ZXU1EAOUmUooKZgc/OKtZSTGBDRgWf26KYnmIgGVrvbP2lT/n/n5iWEqIH
         c/nmBEfIw0e1dCac2inrtRLqu5kewWHzHfWn1euJZedgvxfVLOcNnrGHCzc5Geo2LAmX
         vCzjk9trv0j8wKgVzqsSU99Zvzy0q/AR0s6oDGOiFiC86Hzw8Qr6VQDdaZmegnZT1hgm
         xVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432113; x=1796036913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3qI+mCyJNRelKwLCc2C0inNZM4PZfqwRA/mGvnNAgm0=;
        b=GK43OW/GnKC7mYQfwF6gF9T2F4E3o92Riaih/tpeJHlowUm0qDnw85VqcIe/AUWeAH
         10GKeuNgXpDCdhTIUuhrb5sy2z0HVa82IgM1Yir7/mYhn7Z3izTk/ASeXdgbUmuS9Lf8
         QOQBeZs57JZCoKCUepiILQkG2BykTTizPMA6rTlxVMbmJk3g+9Dt6kz0uTMRm1ucJBWH
         mxfbuK/XMWUIwaw4mpSggdcKhmkfmSiDcevKGH/DYQj4QAWN0C9XyH80ZGrdUfBhsmcc
         QWcpcaQeceaTw/BojJiNnNASXHDKsJ8k3gnV55wriLVu1yyE5MbxDDS0EdGWfJsNeka/
         2rAg==
X-Forwarded-Encrypted: i=1; AL+hErEJFK2ZV+zm2qNhP4qyKm/Ug2WKwbhK64bx1Gm8s9jBCEwDD57FDI007TuIZ/nJWd++OBYS6+a1ew2Qrw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+CBPks6CQx5jFWyq6X599dA+Zje4WPuGEQLrfyd4+eveITRGZ6
	y1wDMoDTBosp9pCIcg4v146z0JXlsmJZkFKwV5XKSCpBHq+AVhxbzJaKzs1OYvTDDJU=
X-Gm-Gg: AZFdTZeUZKTng8ekY2CPJ88EbEQLGWayJg5hgGAWEGjWQmSPuXJfkwTmvYNrcMzksj1
	8oH5vUZKh8VK3nNVGoGQQfWEVCTggn8gpy6+G3RHVZT7qLnOd1r0YQzhigbo8JBvTe6WG8QnDU9
	b0vqX6IaCOyPDgpzstvIuhX1o+WfRA+9EW3LIdCfRCRdApEMBUECFrXKIMEikX8oBgbSqygd5TP
	hyUfo1CAJrQ9At/Sm+CMg/Q3xL/O67SaOR9P+evpvr8fs5fwTaFW2v/gKqbZoZuKy8s2nAuO7IO
	8sz+aQIxzN6qV4cob+CMq3lzCnPmXDLHo52XVQ3vSWM9azcmVVWlnRfB4phJPRQzLXXRetb/Mnl
	r43qvHnwzbBx3zempI4jVa+gUUz8aw5O2yMCiexDUscz7E2QRwzMaYh4UQKV3ToCPva3hOZ/4gP
	weVOSy5wA4vGbMv4mSa3+EePsOhuqCaUudAFh2d5kV4uVUGNnNAfR/fHE+2PrFaPJCD9wtDmXIt
	0mZdBIs+0v+ahNyIRwJVQY1W4h43DdjxzF4sAMOu1mlZ17eBcV+zdBoCQgraySVzWjiVqk03zDr
	Xs0myOlZilaqKaoA8y7iAm3KQW6/5cB0DUWPQoV6x4iVmw==
X-Received: by 2002:a05:7022:3b8e:b0:1b5:10cf:c402 with SMTP id a92af1059eb24-1b5568a17d9mr12384482c88.10.1795432113393;
        Mon, 23 Nov 2026 03:08:33 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5568592adsm27061102c88.15.2026.11.23.03.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:08:33 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 2/6] media: dt-bindings: media: i2c: add Samsung S5K5E8
Date: Mon, 23 Nov 2026 18:08:01 +0700
Message-ID: <20261123110805.119610-3-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123110805.119610-1-hikmahgumelar@gmail.com>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
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

Add Devicetree binding schema for the Samsung S5K5E8 5-megapixel MIPI
CSI-2 CMOS image sensor.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 .../bindings/media/i2c/samsung,s5k5e8.yaml    | 103 ++++++++++++++++++
 1 file changed, 103 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
new file mode 100644
index 000000000000..0e440209c3fd
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org
+$schema: http://devicetree.org
+
+title: Samsung S5K5E8 1/5-inch 5Mp CMOS Image Sensor
+
+maintainers:
+  - Hikmah Gumelar <hikmahgumelar@gmail.com>
+
+description:
+  Samsung S5K5E8 is a 1/5-inch 5-megapixel CMOS active-pixel digital image
+  sensor with a 2-lane MIPI CSI-2 interface and I2C control bus.
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
+    maxItems: 1
+
+  reset-gpios:
+    description: Active-low reset GPIO.
+    maxItems: 1
+
+  avdd-supply:
+    description: Analog power supply (2.8V).
+
+  dvdd-supply:
+    description: Digital core power supply (1.2V).
+
+  dovdd-supply:
+    description: Digital I/O power supply (1.8V).
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
+              - const: 0
+              - const: 1
+
+          link-frequencies: true
+
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
+  - avdd-supply
+  - dvdd-supply
+  - dovdd-supply
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
+        camera-sensor@2d {
+            compatible = "samsung,s5k5e8";
+            reg = <0x2d>;
+            clocks = <&camss_mclk1>;
+            reset-gpios = <&tlmm 129 GPIO_ACTIVE_LOW>;
+            avdd-supply = <&pm8953_l22>;
+            dvdd-supply = <&pm8953_l23>;
+            dovdd-supply = <&pm8953_l6>;
+
+            port {
+                endpoint {
+                    data-lanes = <0 1>;
+                    remote-endpoint = <&csiphy2_ep>;
+                    link-frequencies = /bits/ 64 <418000000>;
+                };
+            };
+        };
+    };
+...
-- 
2.47.3

