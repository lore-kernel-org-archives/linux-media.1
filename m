Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9500A34F48D
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 02:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774317686; cv=none; b=TX9oHLawQa3lvWagdBmyyG/pqvE8EaO013IJl/cU02AfDn+6hOr299/Gt1e3PWrRQ3I3eRGJWo2x+MYAiI7uMMnLsj7R3jqOLar/DkDoOFqpIZ2s4Jh9XDhFDaOlSQHD94tkOi0S2NV4DaRdRM+HKVlk7CtSq4m9JO55rIW7PvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774317686; c=relaxed/simple;
	bh=6mwOA0dPC+Xr0uI2n1ZFZV+bR933rcuFFj/RWST+Emg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h9hxYmWXCUn/FpCRVqbUKfzj2M/uHFpRF0pqLmu7YtOHZ/w/wId+ZPT6szPDToNqQeq+ktpy9XvgWAfcsTGdxYLjhcKCDWBlZKukQjcYW/EZyeu2v3/xCXg+GQgVhYn8EeJMQoaPbIIZ72w1e/y6Hgcx8JaEtvgcuFmTY6+iQHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B2Tyq0Mj; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B2Tyq0Mj"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-89c6f61020cso50577846d6.0
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 19:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774317684; x=1774922484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5iup6qDNhA3Ov81Mqulz5I0c3UbxOYNMRh+dC/qq+Kk=;
        b=B2Tyq0Mjo5qwE4xNJakvafiBzSzQ4My+KzzLos+M7vQwptg2VEREFlN8ENbDU0pyLh
         aKEKm5iIP0EbgBqTMSfbflB4rq8TdiAxfCQ7LGpFkoC1lVC7beDMxyBc0iJ43rQracSh
         uz0sp8ezn4RxqpjVv1ho0eFrRe13dxHRNn7lT+HWAf8wCkzekADH9ivvoe+p2u0f+KDq
         Db6Q6rB+bhTEwdwUgrsLpfmvf4EV/WNVv4QVeaFnEbexaPqQfPNognJjC2yT5m64aX2M
         UPCMP9wbpRPsRuVyq+p3GIXYV5P570OffDEVLWJp2te8laX6CJI81erCxeaOQsnCoQj9
         DlGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774317684; x=1774922484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5iup6qDNhA3Ov81Mqulz5I0c3UbxOYNMRh+dC/qq+Kk=;
        b=Ih2l/kMKg5D19UZuPMUS6EULb3yDlHHDlimitqRmnwCjhEUEovVMpX2Nx6qdiUbQou
         MfU+4ykufHN18Qcuz4l8nTceMZ2lofuNjUYCPwNDVWamo6o76dTXnaBhVqKWam9GB4E0
         nKa2uyaH9Uq16D/nMoS4RPlssTbW2rhVvNMhY2jW3aD9G0mVYWydbCP/+EKSzmbly1Qt
         GxtRtwEV9PYHFGvRqldhr7EscLF45Ww6gABG9Ez5sBbOQOZP8eIlg3FzfRJuPGOsny7X
         SF3qOvB+HA+GLBYyB1/PfQN8FWzltU7jOvl2V0+lBF5/45yxibdRMQJZ2R8V7dqsgmKj
         tfGw==
X-Forwarded-Encrypted: i=1; AJvYcCUvgIKmE6TWq0a2GS+GZaxP2Qvz2v+yKO4Gg/DajSDMXvMOWklseVyvqvf34NkU9bcyopgGyvmifPMhjg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo+8CvNdnxDwc/EI/dbvrVBhzpt5O4JMmYRM9f2hQFmAyB65aM
	r9F7UnVP5/Vob9MxrId4VBzCSY+0oul+/yKwfqggKcMar8TSSqXbG1XP
X-Gm-Gg: ATEYQzwX0r4hw2iU4eJQpmaGykieAGUtMj/0iG10G1GHkWYCU/lGCZJR+mzZYMiBgnY
	yfDrzNcWC9vGl5CRdPMfKA5I7pkWzC3xjCpKZXAuh23ZdCvPYm4pJMHaCLKKEGDPEP3uCufGmLm
	NkDTPgpZ7ld7HBz0IlWdR4wu/y32wiEG0TWnuKlDcECOVd5rPwAjXYn7viFyxpmXOEDj0iea29V
	NSuoeBafQY2lekalXcv8yxsjwqHj113yX4peTcHoRkWPiwRsiWKHLTp2X1EJmh3jguh+Lh6bhKT
	4ErJUL2rWw94aJ5G3n9qQafT0j7NhGtoq7XSM6sUA8DvrgQY1xGxP3lfFn1lffu83MMQ74Sy2Zd
	UuLuHstC4B01/AeH+2TV38fD6e2nF8uE9ew4kysrBHmuJIH7YO4JfnXntc5JA6PbaTdY1LkCrhz
	9XmnL01799yIm+AtT3kpW62FNibw==
X-Received: by 2002:a05:6214:f0c:b0:89c:869e:4972 with SMTP id 6a1803df08f44-89cb4e2f12bmr26185946d6.10.1774317684343;
        Mon, 23 Mar 2026 19:01:24 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c85334b61sm103267146d6.26.2026.03.23.19.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 19:01:23 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v11 2/7] dt-bindings: media: i2c: Add Sony IMX355
Date: Mon, 23 Mar 2026 22:01:27 -0400
Message-ID: <20260324020132.8683-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324020132.8683-1-mailingradian@gmail.com>
References: <20260324020132.8683-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IMX355 camera sensor is a camera sensor that can be found as the
front camera in some smartphones, such as the Pixel 3, Pixel 3 XL, Pixel
3a, and Pixel 3a XL. It already has a driver, but needs support for
device tree. Document the IMX355 to support defining it in device tree.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../bindings/media/i2c/sony,imx355.yaml       | 111 ++++++++++++++++++
 1 file changed, 111 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
new file mode 100644
index 000000000000..6050d7e7dcfe
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/sony,imx355.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony IMX355 Sensor
+
+maintainers:
+  - Richard Acayan <mailingradian@gmail.com>
+
+description:
+  The IMX355 sensor is a 3280x2464 image sensor, commonly found as the front
+  camera in smartphones.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: sony,imx355
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  avdd-supply:
+    description: Analog power supply.
+
+  dvdd-supply:
+    description: Digital power supply.
+
+  dovdd-supply:
+    description: Interface power supply.
+
+  reset-gpios:
+    description: Reset GPIO (active low).
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            minItems: 4
+            maxItems: 4
+
+        required:
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
+    #include <dt-bindings/clock/qcom,camcc-sdm845.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@1a {
+            compatible = "sony,imx355";
+            reg = <0x1a>;
+
+            clocks = <&camcc CAM_CC_MCLK2_CLK>;
+
+            assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
+            assigned-clock-rates = <24000000>;
+
+            reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
+
+            avdd-supply = <&cam_front_ldo>;
+            dvdd-supply = <&cam_front_ldo>;
+            dovdd-supply = <&cam_vio_ldo>;
+
+            pinctrl-names = "default";
+            pinctrl-0 = <&cam_front_default>;
+
+            rotation = <270>;
+            orientation = <0>;
+
+            port {
+                cam_front_endpoint: endpoint {
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <360000000>;
+                    remote-endpoint = <&camss_endpoint1>;
+                };
+            };
+        };
+    };
-- 
2.53.0

