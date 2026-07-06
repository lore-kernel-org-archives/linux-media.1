Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8692E75809;
	Mon,  6 Jul 2026 22:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783375561; cv=none; b=nspS9d1S1rhCzpzxm+91MOKEYUNalzDonkfBTkkVpTvWVi9RO9V3nA0/OuCs71tpSrE0qUPq9zttU9EtAxjY2tDoPO8I2L6xAasDkZ2u7ft4k0tH5JT45yhJs924FwIhin5tWzWUgO+Xcn8BqydHPcjM5rZXga3nLgTrhVA9Oyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783375561; c=relaxed/simple;
	bh=d+1veSMMNhmMknc4U5tBLbwBt8Cc5m4SNqcJtqh3z/c=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nWdEFxPus5ZaEpjWWQTvS2jDKIDOuq3vTiVNj13CvxG3svkwYBK39JWjXkiZalqs7He6tBw+Eg9e0Q9K4nIz+i1TTW9r06+2LvNP9F4eWL3g+VOKxSnaAwXszQdsuumulT3zJEaF6HA70MRNgufElYJO0AtuCsa70WljvzSTkTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=dMZ/2erA; arc=none smtp.client-ip=79.135.106.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="dMZ/2erA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1783375553; x=1783634753;
	bh=NwhQeFqh/lqgtoLPEMKrAqFCbpgQgElRtomSXFaHFkM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=dMZ/2erAzCh64hEGN7BXzjEl7MSqiijyTAirSL9SAtTyPLFYd8zxLrckXZOP7Abel
	 UefsxgY9c/lY/jrhbM2LvaFsoF3cNPOH6JeKKvb+kJ0cJI1p+sqeH+c7Ll5b93koCI
	 eaQqhdFwanAXplG1IZnCM5qfQPoFOuFiYmRLgAJmgJgrwgBTrOYX2m7/fGuU3/ynMc
	 V3Iqzc92Zxwr8jVRAqzYVsMwFGUp/7dOEN8Dn+RCJtPQTMpMNXf8q9TIIifJU/30vG
	 pF447UQkx2tVIqH3RJODFLCADozLSrjBj95RWe+rusdKd/uI9Jj5w7CVPu3BAEO8vj
	 GmZONjC+s0fuw==
Date: Mon, 06 Jul 2026 22:05:49 +0000
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alexander Koskovich <akoskovich@pm.me>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/3] dt-bindings: media: qcom,milos-iris: Add Milos video codec
Message-ID: <20260706-milos-iris-v4-1-119cbe0a7262@pm.me>
In-Reply-To: <20260706-milos-iris-v4-0-119cbe0a7262@pm.me>
References: <20260706-milos-iris-v4-0-119cbe0a7262@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 2d7d2a5243d4b776945d0d26225f55eacf940eb6
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add binding for Qualcomm Milos Iris video codec.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 .../devicetree/bindings/media/qcom,milos-iris.yaml | 166 +++++++++++++++++=
++++
 1 file changed, 166 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,milos-iris.yaml b=
/Documentation/devicetree/bindings/media/qcom,milos-iris.yaml
new file mode 100644
index 000000000000..b0b0355ad52e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,milos-iris.yaml
@@ -0,0 +1,166 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,milos-iris.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Milos SoC Iris video encoder and decoder
+
+maintainers:
+  - Alexander Koskovich <akoskovich@pm.me>
+
+description:
+  The Iris video processing unit on Qualcomm Milos SoC is a video encode a=
nd
+  decode accelerator.
+
+properties:
+  compatible:
+    enum:
+      - qcom,milos-iris
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: iface
+      - const: core
+      - const: vcodec0_core
+
+  dma-coherent: true
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: cpu-cfg
+      - const: video-mem
+
+  iommus:
+    maxItems: 2
+
+  operating-points-v2: true
+  opp-table:
+    type: object
+
+  power-domains:
+    maxItems: 4
+
+  power-domain-names:
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: cx
+      - const: mx
+
+  resets:
+    maxItems: 2
+
+  reset-names:
+    items:
+      - const: bus
+      - const: core
+
+required:
+  - compatible
+  - dma-coherent
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domain-names
+  - resets
+  - reset-names
+
+allOf:
+  - $ref: qcom,venus-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/clock/qcom,milos-gcc.h>
+    #include <dt-bindings/clock/qcom,milos-videocc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,milos-rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    video-codec@aa00000 {
+        compatible =3D "qcom,milos-iris";
+        reg =3D <0x0aa00000 0xf0000>;
+
+        clocks =3D <&gcc GCC_VIDEO_AXI0_CLK>,
+                 <&videocc VIDEO_CC_MVS0C_CLK>,
+                 <&videocc VIDEO_CC_MVS0_CLK>;
+        clock-names =3D "iface",
+                      "core",
+                      "vcodec0_core";
+
+        dma-coherent;
+        iommus =3D <&apps_smmu 0x1960 0>,
+                 <&apps_smmu 0x1967 0>;
+
+        interconnects =3D <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_=
ONLY
+                         &cnoc_cfg SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONL=
Y>,
+                        <&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
+                         &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+        interconnect-names =3D "cpu-cfg",
+                             "video-mem";
+
+        interrupts =3D <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+        operating-points-v2 =3D <&iris_opp_table>;
+
+        memory-region =3D <&video_mem>;
+
+        power-domains =3D <&videocc VIDEO_CC_MVS0C_GDSC>,
+                        <&videocc VIDEO_CC_MVS0_GDSC>,
+                        <&rpmhpd RPMHPD_CX>,
+                        <&rpmhpd RPMHPD_MX>;
+        power-domain-names =3D "venus",
+                             "vcodec0",
+                             "cx",
+                             "mx";
+
+        resets =3D <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+                 <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
+        reset-names =3D "bus",
+                      "core";
+
+        iris_opp_table: opp-table {
+            compatible =3D "operating-points-v2";
+
+            opp-240000000 {
+                opp-hz =3D /bits/ 64 <240000000>;
+                required-opps =3D <&rpmhpd_opp_low_svs>,
+                                <&rpmhpd_opp_svs>;
+            };
+
+            opp-338000000 {
+                opp-hz =3D /bits/ 64 <338000000>;
+                required-opps =3D <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_svs>;
+            };
+
+            opp-366000000 {
+                opp-hz =3D /bits/ 64 <366000000>;
+                required-opps =3D <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_svs>;
+            };
+
+            opp-444000000 {
+                opp-hz =3D /bits/ 64 <444000000>;
+                required-opps =3D <&rpmhpd_opp_nom>,
+                                <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-552000000 {
+                opp-hz =3D /bits/ 64 <552000000>;
+                required-opps =3D <&rpmhpd_opp_turbo>,
+                                <&rpmhpd_opp_nom>;
+            };
+        };
+    };

--=20
2.53.0


