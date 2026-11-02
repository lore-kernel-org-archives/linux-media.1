Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634804;
	b=4AU2nPaU9ckcPVz68kAfxyF75VPB7Crm3SULlSkafBnm4Li4JZnmAYQKfkdXU9PEM30K
	 9aK2gtHm2sehmIdLiKhzsRot+VmFhvVJyNNzTjovjk1QX12dveefBIZlq6mZF8kl9J4Mz
	 DI/BA5BHWYUydWXnkDvKrrQR/AZLiyIjvdnPcTkuF1btn7fF+oJxs4raFz5ZiHzmqnh3G
	 RUor0AAlKloMmWAQaE8iGzWa+W+BmBcTXa7qvPjZWEWno8FZio6z3BOJDpW7h5/KUO6gX
	 NjqEi+I9gPKv7X31M5emrVxAwpt1P3dML53OHRGvqr6UOLZrArKnTWu+N5jH1PF8z0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634804;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
	b=4fuVGWusMWwFbNI2voRymw5PnYfn/srA70KfdKpcu53KDQuxdzPOhyZWZlEbcrEuJnzP
	 FuI/BNae75by4D3cvrdt8l1q/uZGOPjU2K+//8aKz1BVuOd0X5hU4mf/7AgOECmgZCHsB
	 1GUmOSFRyizqH2lPkQdXkjQrNNZaQE84q7+ZXS2f4eNXYd2cd8N4FabZtXhhoQAFjhwxr
	 8S65LtZtiYFXARmGEE8mxcAFI5TUCLdM89KY3JgpWW+YPupYYxINsD/O7SH2ilHglTOZ2
	 mhqz8TTtGgUehABhawETjFpPWBP/TCmUQ2Ibfz6MfiDzoFCAsGAA3GVXtoPbQgQix4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k3+yOmvj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ffuNNsTe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5E260A34FE
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 15:53:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D5E260A34FE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k3+yOmvj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ffuNNsTe
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2Dp6rY894117
	for <linux-media@vger.kernel.org>; Mon, 2 Nov 2026 15:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=; b=k3+yOmvj6Xrqikrx
	kc5L6IbhXOOlVVPVXq7f5drCBcxeuEE6+1VZ5xPNbADQmYbcMrJ/gtHtswCFf6Qg
	fxF8ErmZzD77wuRDNTbM6vNqKM92NdxxUU7W1Ekt3AdyHufkIcPjcAebuBqVeS8x
	r9ex7S3m/qZtbmiAl0qT3dVbab4hhO7lRzsUwgt6DJDt7ysrGEqem77eK4H7RRRP
	2fUrfp8XUmv9SUZXf8P9pq4LldJHgec4MoqVcemHNU1r+i8Ze89E+7rmD5WR1NZP
	60etYKvupIgrRdtt6cahJaJJSYTpjP8uX3tgV7FJuzvO6wMZ+lAS0yZupO/6AeaV
	FWi8mw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqmvsn6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 15:53:23 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc06b9cb33so526753137.0
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 07:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793634803; x=1794239603; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
        b=ffuNNsTeMyJBYmfXrwtA1pQWLwE8qoiONjW1d34MuI8nJo50nJsu3jDQxJNQkO7Low
         OED0ezD15Fl1z8RtETtwPAiLKKdUp96N9IpRDq9qYyPqoi86NnuEsYfOtKDv/nGBKh99
         TWl7W5AAWvMhyyMLtNEbXV0oB20lwEMh5QM0duI6wvazN5q7pMTGpg9QCZJ2S9QgVE7p
         yCptYi9D5K9JA+QgyUPhRJxlf571Trfnz2upppxjPklQmUMWI5W3PjJnMweXOBsLlfAl
         dSJZFXKPWAk7j1y93D8USVUdhBR8SC8Oti/dvE9tXctmV1AWm0WpKYjVSqvIYiReN+GX
         RsRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634803; x=1794239603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
        b=l8qj48Y6TisvsssqW9NnrvlucTiINdAROhYiA8Pb+KeiBW8faQGSceb0S/aYEdu/XZ
         gcFzh587mHpdyDhvgYGpoVUdEQrXZ6XZgkV+hgUyrQ9oanoOIbddDVo0CKo3OjrSNRtb
         c0Stj5swCRuBtZcK11CXp6pL7Xe+6ibYYKIqUu3wPSpGqLbYD7DUQpODUNX20dezzH28
         LsdynxOzjg2TzvXC35wZZIFvuDOMQqpVT41opImQ1CiQcbe88q98OrKxf4APPLE5TVFt
         B/udAuGZVeyJ75Z/8bv23XNMrMBWcu4+kkRFczKheyxwuMDGNq09nMQFHS8aM5T+vd9S
         1mmw==
X-Gm-Message-State: APuU4Z/C84eJ3n9tpMOPwOF6tGH9KOw2tHx7cvcau3LmyJakZT4kilDa
	PzKTRA8OAEgP2IuaYjXBMTr96hH+WH1C3U53WFsmR1wj7nqPib3CE4Nw5ZEu1N6VmEiK2HBvrXK
	MqgJuZA3F267xeJHQ0rDqRUojrs8ek5XkvE3Q4rcGr4+YTBHD0dYKuSLHkqbHuF+5Og==
X-Gm-Gg: AYBFou3Xn2B7ACvUFPIBJsGdpgyhOEo4pvYXLQgPH/F55eoqjMELqqYS/7834xy+b1X
	9ZxiaWJ+V7+JzLuy9IXzo0YdF7O7naplaGh/OOJ7iSX2G0gn+qau6CozhjcNHpbgAWfY40qXHIR
	lSDgj9+pkyk/OQb6DhyOFxJsGHW+W8O9OvRsDSmkPoyXsWvHAXeKd8tK3b06jNWW3PdgcWFrDHi
	PeiXgZYSjt0ABWfJ63DU0JyHUPZNV/CgVikuCirtuIIWZRBCtt8Nmcud0V6EOGnNuj+WZAAjSPz
	WoYJmqLe/i+FmTxZWq67qOL9M5rjaxavLcMF6hZuwaH/ah7VaoMMbvONBFg6ndlH8NBVZ7RkQ2k
	mZ0hWJ65o5AOMEfAmC4vfJ9DXLgZ38KmABSysWh+XkkRkE5W0djMqYDaBfqByDjdcKXJ6Wc4iuO
	mVAwkWSyHlJzFRtcHAkkvsts9JIAniLEcbuC1wTqZB6qIPFKgwwrFyYREAzC1RFD/I6RCoaB0Od
	W3Hg8fpRz0i7q7PMvI+aG+KsqnI
X-Received: by 2002:a05:6102:14a3:b0:7cc:2daa:90ee with SMTP id ada2fe7eead31-7d0725b54d1mr4239115137.15.1793634802572;
        Mon, 02 Nov 2026 07:53:22 -0800 (PST)
X-Received: by 2002:a05:6102:14a3:b0:7cc:2daa:90ee with SMTP id ada2fe7eead31-7d0725b54d1mr4239105137.15.1793634802075;
        Mon, 02 Nov 2026 07:53:22 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8a7d1sm20700323f8f.38.2026.11.02.07.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:53:21 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 16:47:33 +0100
Subject: [PATCH v12 2/9] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-camss-isp-ope-v12-2-702254689feb@oss.qualcomm.com>
References: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
In-Reply-To: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=TMDQ2Fla c=1 sm=1 tr=0 ts=6ae8b1f3 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=l64rWm3OqFMOLA4dSg0A:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: oow-uQG45XnuYOVBAvkuW4uIgpP-yeWD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX6YwNMuucoM2S
 wjC81enVlnb2yX6DGE51kD/WLBtxmYzBZPOYcIM/7OsxamEEpO1KGCtfOa3Y8b0SjDvl5pjy3or
 e3j/14u3yyQujl4yVZshjIVVy272NSE=
X-Proofpoint-ORIG-GUID: oow-uQG45XnuYOVBAvkuW4uIgpP-yeWD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX3XVoObtbDwFX
 HjDaBGqZx3uzIYWEhzPvax631WR682l0ulFTqCCX79B1Klpg7tgbSe9p2u3fOgEV42pD+Wc1Sp6
 ESn/wVpOYnQFfLPl+GkpeUZJgOQlrlnz16E/VdovTktt3xk1sj87odNKvvp3gcEG2hk0tO//Ihn
 7R55cXAFVj+cEfrOD/G3gHMyo/qacIZugSPYIBamGjdRyEdLJLcRcmh93TUKMkQy7Juqud6hH12
 0lUZ47ht9xfsqlCnMI94sfes97+Hn3lK9jY5iflN9Tvi4WvX8jLhTgXkMWimpXr1sOi9K0Zr8ZB
 tikvSQZniYdUNrcFZhnfoGtpO87qvlAH29koCDEuzRuidd2gzvb54LujIuKO0WelO1SIE9z7PUp
 TAhJBZcV8aohAW77B0EtvDcbsKYL9k53Gb3gS0xqMuoxJ5PR762JsbcNqqZIo//STOidipFEnPB
 WZUZKrnpL4knrWSWkbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020063

Add Devicetree binding documentation for the Qualcomm Camera Subsystem
Offline Processing Engine (OPE) found on platforms such as Agatti.
The OPE is a memory-to-memory image processing block which operates
on frames read from and written back to system memory.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../bindings/media/qcom,qcm2290-camss-ope.yaml     | 151 +++++++++++++++++++++
 1 file changed, 151 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..f9c31bc88e94b028c241060bbd8e56e0bdc49af5
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
@@ -0,0 +1,151 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,qcm2290-camss-ope.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Camera Subsystem Offline Processing Engine
+
+maintainers:
+  - Loic Poulain <loic.poulain@oss.qualcomm.com>
+
+description:
+  The Qualcomm Camera Subsystem (CAMSS) Offline Processing Engine (OPE)
+  is a memory-to-memory image processing block. It supports a range of
+  pixel-processing operations such as scaling, cropping, gain adjustments,
+  white-balancing, and various format conversions. The OPE does not
+  interface directly with image sensors, instead, it processes frames
+  sourced from and written back to system memory.
+
+properties:
+  compatible:
+    const: qcom,qcm2290-camss-ope
+
+  reg:
+    maxItems: 6
+
+  reg-names:
+    items:
+      - const: cdm
+      - const: top
+      - const: qos
+      - const: pipeline
+      - const: bus_read
+      - const: bus_write
+
+  clocks:
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: axi
+      - const: core
+      - const: iface
+      - const: nrt
+      - const: top
+
+  interrupts:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: config
+      - const: data
+
+  iommus:
+    items:
+      - description: OPE CDM (Configuration DMA) port.
+      - description: OPE read (fetch engine) port.
+      - description: OPE write (write engine) port.
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+  power-domains:
+    items:
+      - description: GDSC CAMSS Block, Global Distributed Switch Controller.
+      - description: CX power domain.
+
+  power-domain-names:
+    items:
+      - const: camss
+      - const: cx
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domains
+  - power-domain-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    camss_ope: isp@5c42000 {
+        compatible = "qcom,qcm2290-camss-ope";
+
+        reg = <0x5c42000 0x400>,
+              <0x5c42400 0x200>,
+              <0x5c42600 0x200>,
+              <0x5c42800 0x4400>,
+              <0x5c46c00 0x190>,
+              <0x5c46d90 0xa00>;
+        reg-names = "cdm", "top", "qos", "pipeline",
+                    "bus_read", "bus_write";
+
+        clocks = <&gcc GCC_CAMSS_AXI_CLK>,
+                 <&gcc GCC_CAMSS_OPE_CLK>,
+                 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
+                 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+                 <&gcc GCC_CAMSS_TOP_AHB_CLK>;
+        clock-names = "axi", "core", "iface", "nrt", "top";
+
+        interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>;
+
+        interconnects = <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+                         &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+                        <&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+                         &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
+        interconnect-names = "config", "data";
+
+        iommus = <&apps_smmu 0x800 0x0>,
+                 <&apps_smmu 0x820 0x0>,
+                 <&apps_smmu 0x840 0x0>;
+
+        operating-points-v2 = <&ope_opp_table>;
+        power-domains = <&gcc GCC_CAMSS_TOP_GDSC>,
+                         <&rpmpd QCM2290_VDDCX>;
+        power-domain-names = "camss", "cx";
+
+        ope_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-200000000 {
+                opp-hz = /bits/ 64 <200000000>;
+                required-opps = <&rpmpd_opp_svs>;
+            };
+
+            opp-465000000 {
+                opp-hz = /bits/ 64 <465000000>;
+                required-opps = <&rpmpd_opp_nom>;
+            };
+        };
+    };

-- 
2.34.1

