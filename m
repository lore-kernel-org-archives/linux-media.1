Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437377;
	b=JqkRx4Mrsdx9+lnmUQKAL4GnEjRncJlpuD4P/RYB7+1g7Tzacgu4vjwlGyFwWtRGQXNu
	 79gpb4msPzG1mFPv2whyZLV/Dnq7v5fzQFgz/6WIAxdkxR77yS6A9gv8/++NpdGfwgb9x
	 2BSGSPJiE5RmX9R//UUPj7kweMkpX/6uphxBZn9Vw8mENzV2eEsMC7PCnH2JO2V+io+Rr
	 hzHIe5ZpjnOhNWijG+bMjK100Q/7sGZ2G3KlcE6kdQjoKlsxgUA70iGlKts3eBPsVanmt
	 jKBdFCC6aExqKR5sLLdxO6FKwlKu/EhajuSwW0cy9cxq53w52VstQX64+EUUEEXLw8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3qI+mCyJNRelKwLCc2C0inNZM4PZfqwRA/mGvnNAgm0=;
	b=jg88alDRcR0qTH8+jNYpgKg41Ux1+TPCTQG0Qqb1pqHEK95iv55vgLqziErNdmhpK2uy
	 2bshsuJT9gyhM6Nabi6H8XC+YSjRXxNGm34cpzOXMi2w09xWJ6D8qpDek9AP33k6Uc6x1
	 ajbr0Cfi4s9Q012tNAOsyaWKuNolA8n1rWFWzQkrTB9p0TVKKOy2CK3eGN+FCsiy6OniP
	 V24h7O+4LPRKqk4PN/qAN5Rt7cAufmUedpL4NZDWBOxns+ULos/RCEqVl2h9W2SsmKWMp
	 YNm8Qx7qBzxyfpB/9blC1vCYkztoc+bfbim/FUcuKvEIWb3CNDxjlYIrIg54hRm0Z2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R6i2UD+8;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E00606A68D
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 12:36:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81E00606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R6i2UD+8
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-385c497bf94so1909828eec.1
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 04:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795437377; x=1796042177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3qI+mCyJNRelKwLCc2C0inNZM4PZfqwRA/mGvnNAgm0=;
        b=R6i2UD+8+1SWXf6raMYqaGU6H0ZivEnYsZ600TnGXzjRiBt2okNAeVKSlYBYOoW5Nq
         sTjhq6t3svnLQy8/KKx48rxekAp41/oU8wMvLXcUJHSlB5ws6nby/8WiCuiIEWqZLPUr
         6OGGhhdkAW1bGGOeS9cZHZv2TtjQaATT+kczHXZnkMDVUZZZvTfIXWopXsEX6nkGPNCE
         +7IuT+u4Ag53FHsuExyb3aJTlEaKFfKiNEBtMP6fFKFDY5fqs9/0WjfiJDyXqyqAxzcp
         2ShqeKYlzL0+vd4juk0LrKZE8XEezjB3tuvKz1g483yqW+hjXYLFccv2syX2DSBi9/YX
         lD8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437377; x=1796042177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3qI+mCyJNRelKwLCc2C0inNZM4PZfqwRA/mGvnNAgm0=;
        b=tINLoRDEU9cEuw/7uDzmUTTfoukJsFgziTHQllcokL0tX769aiOoNIGNqQgG95oaOw
         vB30fCp5IUmtupC9Y+ITrEFZXKj0zhAzMimF03Hou+13lAYuCK6nI3LSDBDtT+cOyZ9U
         VSgMK/2kHPIu0zDBBZAJyz/aQYuRNomTTj9QHPZdJdfewhmH4bs/fsV3jm1h1OIdF4R4
         2tm1vA84oVAsJR7QBHetdeyyoZ+T1chF29Ht06J/05qSCo5s1nqHVfTQGWODj/YzueXS
         sRz1SzqtCf6EIjrvVRhQH3UgSg6IMGvxx/K32aMKwY3MhDCSxuovCSNIFtbe8iYYgoCa
         L5EQ==
X-Forwarded-Encrypted: i=1; AL+hErENsaXRiSCqGdQhkZ+3w6AFHDMAp5vaM537xRFKRuLK2tqp5HZkUT1h/avagkXThFmx5GhfAVdaeMlzDQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/TXRcvzWt3kT63tVzbD+B9VIwxbwHCCq46vf8Mzlq6DPXQVIlW
	8oFIqiv2W8sniZzNJjPQU/EMde4gTCcQA5NbQMzIrOy5nGyRYxVPICeJ
X-Gm-Gg: AZFdTZcuwLQQqL/c/uPSettZj0ZFQcj+puNzfIVGhYKy9mnL2dNyM+Xfd9BjYPkJrlK
	QLIxxCD+BcPqpSpqAgyvc/NWvh5+qlMSkuoqX/eGEQNdDjBJvnBq+meuLkCMTnTEjvMjWxA/cwv
	QHVjzNwgF47iK5kt4X1Qym4TfbwFikaHhZTtrW2vyouUvnaUdyt9YJr9vY1nOBluSil/dEG52OC
	1cJMdZwiVHjZRbbpj7sB7ZYzlRoMsvELu5X6TWMNKjoJsqWIyNmXae9JS08eWqWEliUbNNO36O0
	YJtrjeMEVa+//vQq9LKNaXsjwQGrTloIiVjNrPMe/VLQdzNywKrZ4JBiNUwX7p+sjcFSgWtHfKL
	V37Anlf6EaMoBCWkbUiWASOUlLOMO5tI568qNqqnELKmCVsQ15VGJMTN3dih5dVBS3m7JJhVpnf
	akTGbJiM98+IuMc2I7p1SUfrj+U9Xw9CSdexZ70C7dupu4re8YfbUu0JEIqKuTauG6HACsw2thk
	lhh0JxcT/CySy3AJuk/u7vrvvWT9DhZ0bohvIwi2pQgh2gfKSlM/navfCIJWvpDvRWBc5U6LiB3
	yy8sGP6RUvo60DuNzB7HGphY5+83u7KCtiYB/pqbY3+nRhd1jntr2i08dg0+AWwU1VA=
X-Received: by 2002:a05:693c:88cc:10b0:386:b306:4ff6 with SMTP id 5a478bee46e88-386b3065916mr2485851eec.21.1795437376602;
        Mon, 23 Nov 2026 04:36:16 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm32854353eec.13.2026.11.23.04.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:36:16 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 2/7] media: dt-bindings: media: i2c: add Samsung S5K5E8
Date: Mon, 23 Nov 2026 19:35:41 +0700
Message-ID: <20261123123546.152162-3-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123123546.152162-1-hikmahgumelar@gmail.com>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
 <20261123123546.152162-1-hikmahgumelar@gmail.com>
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

