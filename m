Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609965;
	b=blrzGi4kBUDivpg72FDUMetQCPOC/Iu19mEdRddf6PeuoVkILtDOGL9cz7eyDlZzYzld
	 89jBJrshVz/xPoc4k+pGTMQRAYWwdftdPEPt5azQgOizx6eHAW0wRjOSw1qUX6yar2jFQ
	 BOoj7rpBKthDIfJSpOSAmngqWJZjqQprXIEwq3mD/E3MGiG1nBi/gSpbkYD0schwCV1xC
	 7e+0Vn5ekAQQhAEvOIOE7upNEVykcwHPgq3OaDXBefcDSC3hrr+Nf/X9Bza3Hqo4i605s
	 TPzk7Qhv2AxdniXHLFElPJS2M/jIetPxDdZyYVTCM9dd9t0O8ceF0mzPcJVJvjXdwlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4pF+Ou2aaG2HAoOOE5cGua1SJMvhnFZGEE47jSLez/g=;
	b=CIc0ItZLrht4E64bSM3U58MB4i/5IlqBVdi65NZ8bL8cKIaor2ggGtq7/nFDML/ZPifi
	 vQXu1rGw1cgHzcAHIjN/0YMbslx5OGHYFmwYSCS+ZFRSH3oc/PqUa3107Ktd0VkV17tmn
	 A6V06zyWB7XBOZZ7ElKJJ+AxxDbyV2l2vVyqQvcwktXNNjIqwcPAJAZC+RyC3TKkxvuaF
	 IOkhPPVp7EwXkiRO9gCTf7PU46Zzf6IOd8zG0ija9vwYgp5eJHUNr4oyTMXT78QbmANrN
	 SBPQEjvZtQteJ2GUkw6Xlk/MEEy04FJ5ftIkpoZXALhzQgSZJkJ2XJ8XZDofmvNw3uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="NANt/KWh";
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60481606A32A
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 12:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60481606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NANt/KWh
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdb2893531bso2989342a12.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 04:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795609965; x=1796214765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4pF+Ou2aaG2HAoOOE5cGua1SJMvhnFZGEE47jSLez/g=;
        b=NANt/KWhIDdvCOeY4utjDOeqLYM4twhmFG1ItWWr3HFT9jCk4yOM+BgBGWNOd5ahZu
         etyEMApCd3o8OOE7+A7McFA3J75fbpLKjLtKw4hs8S5XrQQ3oi6X0ow3zlWFZzwAzFtI
         wLCY/cPCP0Bb74osRlvhcYTbXoe7C86voPzvRciY/wVa5IvEHzGTJpVQwj9Os04aI/v+
         FDcmPfmq+U1YC6K73kI0mm49vPu2QV4pucYa2aEF4YvQWHV23zNY1kpx+bFRH1NOOu3K
         zYibLiQlcmSvn3TzewhtK1BOYPKuemoEFLkGTqdUtQcJKNSFWRXHvmddFInF3mz273cp
         cFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609965; x=1796214765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4pF+Ou2aaG2HAoOOE5cGua1SJMvhnFZGEE47jSLez/g=;
        b=1K78+hP0H0uNd+iQp1MQ5zBDZ04xEv5iaaiwtviQZNd2caLZ80rpBVHsEq15aHebrC
         h4mPgVzMWohz1lly52CdAoWzoeM6+CvsRNWKqCAzuvkFlgWLQDNBwhpnUAOYB6GaA+Sw
         GwgnS+q30pY9pE4AOzpI8jVyaRfFESlIJQ3up6zltY27yD9wP4epiLlXdRyn1oZRUPl+
         wgZ6NMMspujNWCfaS22NqzRSAIH34euOF72KOFo0R9iXziXy2MKUCmHlyeGyTBsMpfiR
         4ZcTjKhE/9jGdOGvjV32+JWClNrIIXxZFS9zy7ruAcpEBgqISlYBiYWZQEzMOa/LLKu9
         +5qg==
X-Gm-Message-State: APuU4Z/Cje21RWOJiZ8jGcHArfSUdo5qGo6gKmM1V3aWFBOHtJMEXvDt
	OHuzbAoFaUX8J0zoDxV3hKWzWyI32SCSlzvS/Q8CtTTD5bFGW8ve2Fr53kVZemTypuM=
X-Gm-Gg: AZFdTZeHEzYOYwPSPaU8ht+rsUFDCSmirqC3k8tj8WSX9yyeQ1oY42ZvyZnasxXDXTf
	t3RuSyT8l81TQ2Xzsok47AMIGIj1rfYO4QPGqIsjRmeIB1ut9gAWRJ/Eyddq+rdAA0zl/aYmulG
	Urzhpe29vknAZjs/Dbv8fO9si/Os+BLYlOyE5hy5HiUIX7eKWRTRHY2A4SwSjp9Ebxj4/3hJXpq
	6YcMr6t516YG9QWCHM9jlus+Mxl7PETmYjxOHMp/LA7SoqoAXM2wMMz+FCZOZmlXc4um/ccmhkF
	nzyHoAH+UdheiYgGedMZCdVFvX2nbb8OoeCY6fJvgsjKAk2/uo7t+1Qr3b7bizMJBu4SCqhtlw5
	nlKwgfelhqv4NUlc3WjF4z1yYdl6py9QDC0rxqK6tihsZFaiCuAMHYOwRiJZ6427/tJ8M0dniCE
	5v+TCUWHENLs+wfyGrPzsAFv6jdeSM2D2RhJHIfe+EmcHLoKCpOEsMZ5XyufvIdoelpfrETn5Gl
	unb8uNHB4pUoCC9ur97oZoSyVyn+OdBmx7ki6qmusXsPVYENYPItA/PJ3rw4vSmpLkMRtbL07XI
	uVYI0zvXSrRIlUQ8K7xu15RRQRtjwuQeVGWOT294UktoPg0=
X-Received: by 2002:a17:90b:380e:b0:3a6:e99b:bbdb with SMTP id 98e67ed59e1d1-3b41c9493ccmr17317487a91.50.1795609964791;
        Wed, 25 Nov 2026 04:32:44 -0800 (PST)
Received: from localhost.localdomain ([103.118.130.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b792474sm12698366a91.3.2026.11.25.04.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:32:44 -0800 (PST)
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
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	u.kleine-koenig@baylibre.com,
	Hikmah Gumelar <hikmahgumelar@gmail.com>
Subject: [PATCH v4 2/7] media: dt-bindings: media: i2c: add Samsung S5K5E8
Date: Wed, 25 Nov 2026 19:31:41 +0700
Message-ID: <20261125123146.379057-3-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125123146.379057-1-hikmahgumelar@gmail.com>
References: <20261125123146.379057-1-hikmahgumelar@gmail.com>
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

Add Devicetree binding schema for the Samsung S5K5E8 5-megapixel

MIPI CSI-2 CMOS image sensor.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 .../bindings/media/i2c/samsung,s5k5e8.yaml    | 103 ++++++++++++++++++
 1 file changed, 103 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
new file mode 100644
index 000000000000..7c538e48ca25
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/samsung,s5k5e8.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
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
+              - const: 1
+              - const: 2
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
+                    data-lanes = <1 2>;
+                    remote-endpoint = <&csiphy2_ep>;
+                    link-frequencies = /bits/ 64 <418000000>;
+                };
+            };
+        };
+    };
+...
-- 
2.47.3

