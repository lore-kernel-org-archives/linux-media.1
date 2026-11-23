Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447693;
	b=XsUsICb28qMKe4NALokL5zuI3/p1piNwQdQOXPaHyqqiJEDWOCmBl7V6BO7VIj0nj//5
	 pMKSPHhl3UHzgH0ZErjqGUT3QK0nC+jgewVn7Gxc/najwqqNiu0LCWy5Z5z3Ap8Pxzk/D
	 jFXe8Ny3GgkMemF3IqsO5Wd9Mlc0fnCoTc7vPvxlKbdXG8AkfskadxR+I5jXjer5bw8zI
	 3DSNm0DRCmhiDaLJeu+OXkmVi99B5sByPFi5aijZdTOurX1EuRA0seMzwikxeW2A1/zly
	 bhG3PHa994bZOMEMTX3LPkyhi0u/moFiQbvJ8RW3PhKUHJkjAMZOLdmPqEplIkZBuIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JHQcxU+wIWklcmL8z5l9MQwsDbaWbhPYpwQ5MUgrJqU=;
	b=jCvbkumbqjYvm/KuhDkgZ+oB06VV3SlvtKB1pmUDKr0CmgznAujI+nTIRp7HZFKpo3+I
	 RKphcgMhYntvD+KEODUzXIl3LRqPQBuX+Vz2suGz2PKOfTQ7MoVzCKi/4W0lIqJEnECFV
	 GsvCUKGeuEnP+dHbzcSWHtAYz7M79AYHy8FfqlJ8dbCXqQwbGH/Ai5TME3Ph/Opu+Dt9e
	 WUN84QaRSXROM8O+wdTN/NJnTNjERAdHcaLvA/gsQx+PzK7gE2bAUvz+4ULFv3aiRomHU
	 CXvrE7KVx/nZ58BqDXgjEuGMPVRDmKv/4K+nuHL+OhBiFTbNWaSzA069UHO4aC/6ykg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fuKkteo1;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD655606A32D
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 15:28:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD655606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fuKkteo1
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-380c28f9e35so4541253eec.1
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 07:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795447692; x=1796052492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JHQcxU+wIWklcmL8z5l9MQwsDbaWbhPYpwQ5MUgrJqU=;
        b=fuKkteo1U3dppxRP2dfHZJlaJGXVfzk7FUDnXt8LXhm8fvRhvljLUCN7f18PvukRPU
         WWDpbqYrzmrS5+PO9OZTwcY/Y+zcoZbDol2fisOndc8AkOhk4n63tiyyp8khhsZbSFYz
         Uk20qp+Ms6uRkWeEuv1pAZOzSg8x3zA0PNd6YMcfxGvwxLCQar58MFTeiqu5hvr94TaH
         P0p1/W7tMLT7DLuBxYK6tVAoIIeP2XxRCOXdyHU6uJwrTVyiDpqMLFS7Y+hAnrJO2pKR
         LOU3lWmb0cQJnm9tz32aC3NKKysBMksBDm66doIzP+z2/Ai9KT/lYg6QBoD3jW11k27I
         uE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447692; x=1796052492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JHQcxU+wIWklcmL8z5l9MQwsDbaWbhPYpwQ5MUgrJqU=;
        b=QGW7QamVgtlxHZjqG7W0YS5n4JpYdwtxJO5ua/Al/D4tD7lrjGK0fypRi7pL/QUnsn
         BCI8SOsDc7epdU5IDdUFA61L/vMHTd1fjiVpwUvR45+tdHrkB9m7BRtHw76/L4gXwnb3
         ojINtsZQi2wZJOHj3fwU3l/rI7cNNAbtJXVF8ntemjOMriBKQ4TXLCsiuazlkucfSWv3
         +e30qar+Yc5vhy/IHxeLTmC891oQq9xHRihAalrfJvbCwnu1rrE3uD4ZE2DcN62GNDYy
         Ix4mCMfO8Kn8ezUPTc4N7a/Ira6/ePwcZ1i9hYTFevgRptyEUZmkWH2YWi0yfDihmO6I
         kggA==
X-Forwarded-Encrypted: i=1; AL+hErE/BQljMAM42s2EyJFK8YW6z9Ffv5g1URz1M4pHwnLFu4C/9v16VN/M1WVbNUradwkMr/BVrENePWv5IA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+ltmSJanTKrUt1G8Sc99h3x3CV3nUuO4cFDkTisXgCdAIsr1xQ
	EKGDzGH74IvzD2nYlGGQ/dw65eSzmhgR+vD4kz/qmDjRnzo2Wu0UxXdA
X-Gm-Gg: AZFdTZdKf+h4bchbQzZ6o6X1kMSW4gG7PhzZPiRBvl3lpt+EyBRmPqhtQuQRWxzbDsa
	j9QwBGCh4vohsAtidEDTE/LAkTWiMkRT3O3LzZfezL8WaWJDPjCJQMzdkISzAKQiG69m7y1F8Yw
	+TvWnViPWQyIB0BodGC2MhsH+j9F6A/VUtzBQSbAwhP8NO+IzZW+zm0hxh8/hYhdhv95DHhRHH1
	YjNM45oXuDZVHsQNEcVRkBsVyBKktGy+wwnjZsmeRCKAiGd0xaRiZNdOM1d6HbmXh6OaHmOF8L+
	SCQ7v/tLtQivospdHDOgVhogVanIWgoo1p/tS6iT4aE7RG0TsF96//cj2U1pbPKaHcbuwc5Sk5N
	M9uTFn7Lu/gweyNYkSWUCEVQ0MasHpPJtBOOQVVEvkt2io3DFL0haQiQJrf36sQFyQtyGCN9LQ1
	jQrOHYIhhJLlX5B+yxNJR5vflwJexVR6DC5j6X37Edub3LLVmwXMkOA4xv2kM7LQYna+KK3RqRj
	kaS6cwEY3yhGyRbTmaNR1LL36aI7YHRH64ChH2Wmy4DWvcGxmV9vOYaNke/M09ePtg+p9NN+PAG
	3JE1Hvp/SBPmiCdHw0ZbSEHCRqezYpfIEB5jq3Howtf/GQ==
X-Received: by 2002:a05:7301:4283:b0:386:96fb:28c with SMTP id 5a478bee46e88-38696fb2022mr10401298eec.18.1795447691706;
        Mon, 23 Nov 2026 07:28:11 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm46569087eec.5.2026.11.23.07.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:28:11 -0800 (PST)
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
	linux-clk@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v3 2/7] media: dt-bindings: media: i2c: add Samsung S5K5E8
Date: Mon, 23 Nov 2026 22:27:17 +0700
Message-ID: <20261123152722.168879-3-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123152722.168879-1-hikmahgumelar@gmail.com>
References: <20261123123546.152162-1-hikmahgumelar@gmail.com>
 <20261123152722.168879-1-hikmahgumelar@gmail.com>
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

Add Devicetree binding schema for the Samsung S5K5E8 5-megapixel MIPI CSI-2 CMOS image sensor.

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

