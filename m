Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B768F49EC40
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 07:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792049953; cv=none; b=JbTns7oZ49rX4qXIXoiyWekUSBZctcasef6lEx4cHlqk+H1OSpRXm6hjQJ8fs4KTC8TgRjwWVFQu504OQZ3WzMaogXA2shX+/Czz6UJeNJO1O/p4haLHGNOulabCK+HzORyXt9sCbf1/gfLeYGzsraFMh8miNxKsCEuQXsOFimg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792049953; c=relaxed/simple;
	bh=TLBJP8SeoQI3wL4Uv+WS/xB5MwIFcnAFu5CR8nc6eYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uz+ZRBVmW80B7FyvZmbnta4IrQ5YrmqlZrNUjeKVlHbl4lZl/biXyNjBdy5q2CKcOl1tBlkpD2yY+14EqtldyzKyr0eYelhFwWQnFbV4p4umQ4fMbIWhk8G9+4vzXJUs7PVw3uibm1w9EH6trygX/pT3ps7XKprujkAl7oS7Hj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sp0POdzV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ibTEMIHQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sp0POdzV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ibTEMIHQ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F71sTa2122209
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 07:39:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZvFYLfipcLVoBfHgUOI0+DbMhkvcbOeJfRf3ILufwjg=; b=Sp0POdzVEsBjoQNP
	8f6jOAJL/WtdgOD3Ckr9jQEbcNWxjippVpuLGkN8GrnmW0PJwbbjz/VO+mGoi95R
	v6KGoF4McmZjUrAlk1TNNW6SJACIJ0lq+ByBLtWcKL6fvNuhovzG6ilp3TyTJi/i
	ex7gjLoxdj0zbJugyXyg/1xaF7bH9/AQc/0hOB0fRhAJXnj/ygyWat19gXAGjavc
	6gKKflzz34Vk35v/CaiMdYARezyuQGggthQG9fupNb+zh/EopaNCuEHGMUoYPTc9
	4vH7DsBWefoKBLkVqxILDrSDCp7t4HzfQ+WltAF0JVH6sOYdTaf4a9bjiy+QSi/P
	/fF6Lg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn1gax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 07:39:03 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e95f8543c9so4158105ad.3
        for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 00:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792049942; x=1792654742; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZvFYLfipcLVoBfHgUOI0+DbMhkvcbOeJfRf3ILufwjg=;
        b=ibTEMIHQU/OYZiWcxnwVy+3oHuNT5yDrCWm3fsGI+n/iMw3Icpc1Iao8owWdNgwS7h
         vZkPVn6kGuAgAaSsaA4+8+XCb0zWLv4/P4GeGYjpzhvXr41nOxqumcTJah8lDx1pZFMH
         1iJAiL8dhap7fZZzAIearvuUa0ObIUjivzQALgw86tVsoIiWy8Hzu2o75sI4doJHvMsh
         F2J6th2Hbg/UDbdmGE4C1yO5idWwB6F7l4HoPfJrvqXAxbCGezCz8zO1tJGt1KV9i7XL
         wzfkhHKtG2KxlMRGfvVpWrvRmEnme11V60v1GNu+x0oShNGBYBG5VJ+P8q3clfW/bjdL
         tUyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792049942; x=1792654742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZvFYLfipcLVoBfHgUOI0+DbMhkvcbOeJfRf3ILufwjg=;
        b=v20hYFgdmpZu89WmZVpE1j8eNQ4EUP96RYqQUx7Jjh0vwUTy6QGTE4+nUYxDfst49i
         pf2EV2SqjdQZNQtdYZB9iZ7/lWZ5bLD/TIQ2uYmnThgHRLsoVQHet1ifVj9afbndHXMK
         W+2SBn6kI+yh1jNzM4jFT/pzx/lqWwa6xaZG88ndmvciPmgZZJmUQi1jbq29sH6U+r7z
         g3+cNexT06OmFBW21HorG/Su3ppgEVNPiVfdDfDM+4+odi9NTuMhB7B+H8YPI5c3zWT3
         KzNOlN0z9/kQ5mPB1ng0yVmXdvClMv9WuAPCp+1lAu0N3xPyEHu0tFYdkbLveeHEqXAz
         97ZA==
X-Forwarded-Encrypted: i=1; AKwUvBzQACSMWhbeZPeVM9hI1aGEm1xwMrZWt5py81t5HoKlxTD+ad412Bkav7hDmrRhschODm/xxMPRZ/Xa0w==@vger.kernel.org
X-Gm-Message-State: AFq9FYL1NHpmC8EgfT/xNAcoKWuaukV9CfyoVQV3tUHCZqxyxzKHsB/E
	+j9FjSsq4TSaZjMyvCuHc8C27wngelSekGuzJJh5N4Zls1hbnYBhpqWSvsEqr1Y0micA/+26SZa
	pZH1aMRPcU9j4uJlWmQJ2HCDWXlIKYF+FwNJZl0duR4IXilpy27FvuBdmNg3mUyfqS3CVslsc0p
	I5
X-Gm-Gg: AYBFou0id0RCR/GavZKRoVYA4tUO1UV6X07NzIHyIpl5QPPwIC15+BQUpocA3C3VJ29
	048PNHV1HYUlp/+6iZZYFCcIJsQOiULvwUX78XCKGu2Fvtvu6D1nHv0tOhjN5qFDsrvg4P+z1JH
	/D3UhXW44X6Rqh0Z/hb8PnsCmA8Ee/frsKgV4iqNKwCCB1ZBOViy8DKqTKYNgNoeh3t3WYhVPa+
	yazZ8lEo6bBmK25GP0+lFOPFGDcCAfqfjyZJQ8Eor02jdX/dlQYpoqtQsML9T54/PPL6dIHHRjn
	r6niXWs/9CzeN7qLChWHyN/QAEl6WXhCm9JZT4WoHF24Xe2VVz85ITbJkJpe9sDOU40rQeGFOuo
	tQlj8bn3kJySZxY0z7Y8sd1PCtvCUbIBvJGM=
X-Received: by 2002:a17:903:3886:b0:2e8:795d:34f5 with SMTP id d9443c01a7336-2e8795d4702mr141414245ad.52.1792049942174;
        Thu, 15 Oct 2026 00:39:02 -0700 (PDT)
X-Received: by 2002:a17:903:3886:b0:2e8:795d:34f5 with SMTP id d9443c01a7336-2e8795d4702mr141413985ad.52.1792049941637;
        Thu, 15 Oct 2026 00:39:01 -0700 (PDT)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e944c23f17sm14014825ad.27.2026.10.15.00.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 00:39:01 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 13:08:21 +0530
Subject: [PATCH 01/13] dt-bindings: display: msm: Add Qualcomm DCP bindings
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-jshekhar-drm-msm-dcp-v1-v1-1-48aad0fe4f72@oss.qualcomm.com>
References: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
In-Reply-To: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792049920; l=10253;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=TLBJP8SeoQI3wL4Uv+WS/xB5MwIFcnAFu5CR8nc6eYo=;
 b=eNxcsc69Y8Jo5l1qC3TRVrdnDWJBcU/OMw+5y9ixMTGjI+fxA+/LkdFlDxyedlHibtsx/oh5O
 dhzn4+iWQT8Cp5RfMWhA110+xEzgxMYJ+ZO1Bj9kzTMzhXA5UBDSpMk
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzMCBTYWx0ZWRfXwxGS7A1Obyv6
 wj5fDsD+21M8oPt85P8lN7o27mt1Q7E71Vbdwr7ILFHaTPdC78bh2x2IU46sUFyNIm7puaBum7e
 I7cCjABSc2ILus//w7+OCfIxiInk1pUBNQMOZHxiZoQXCOJeFmVK0yB/GVZlso3B9+pyVSqfmI+
 daaCSkWHvBScGpVGd9tPVE89gyzGkqAjLIt8tOE9yE75Bp5UtBi3K8AIuFFb+VKHpjHCDjHzEqR
 nrTh8+sKVbVS0BHFwdz4MXdkgcsWpVZ6wbE4IhY6o90jZfl2ICAzpOMr3EdYBLBiJdGvKfabNvF
 fN94Mjt/FXZS06BjUlGPiZIwAmgFw18A3yvHY+HIG4PPq/JmZvzEhqcPJBa0EHt7zFEC79d60CF
 YFsgPfyOHjbcW21I0hyg3NHkOaF25vH7sjS8dGeTqfLFxmU/JY5MfTz8vLpenjWQrLc2kX2c2lj
 X9Qk/0SNHJmqGstJMIg==
X-Proofpoint-GUID: q6LXFBxe5u37JVMXvX5cKyOHbBCyHnMC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzMCBTYWx0ZWRfX2mn1nbehFxDE
 VWzrKIZDZX2goohewLaO253i5NeTcme5ClU+RBx9/+XJqTrMjSXQ2t2YmPO0d2xPJf8fDdFpiLA
 nUZCG2v2qNfbBwHUqyCwDZkhZDvRqf0=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad08317 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=Mqdkvc8JU3O6ZvK96OYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: q6LXFBxe5u37JVMXvX5cKyOHbBCyHnMC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1011 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150030

DCP platforms place the display pipeline under firmware control, so Linux
cannot discover display resources through direct register access. The DRM
driver therefore needs device-tree descriptions of the firmware transport,
display topology, IOMMU contexts, and panel connections.

Add bindings for the Qualcomm DCP VirtIO display function, including the
INTF graph and DSI host outputs. Document the framebuffer IOMMU context,
IPCC power-notify mailbox and interrupts, firmware display topology, and
firmware-visible IOVA window supplied by the parent VirtIO-MMIO transport.

Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Assisted-by: LLM
---
 .../bindings/display/msm/qcom,dcp-dsi.yaml         |  75 +++++++++++++
 .../bindings/display/msm/qcom,dcp-virtio.yaml      | 113 +++++++++++++++++++
 .../devicetree/bindings/display/msm/qcom,dcp.yaml  | 119 +++++++++++++++++++++
 3 files changed, 307 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,dcp-dsi.yaml b/Documentation/devicetree/bindings/display/msm/qcom,dcp-dsi.yaml
new file mode 100644
index 000000000000..f7178c66c09e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,dcp-dsi.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,dcp-dsi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm DCP DSI host
+
+maintainers:
+  - Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
+
+description: |
+  A MIPI DSI host exposed by the Qualcomm DCP VirtIO device (see
+  qcom,dcp.yaml). DCP is a firmware protocol shared across multiple
+  Qualcomm SoCs, not specific to any one of them; Hawi is its first
+  platform. The DSI host and its connection to a panel are described
+  using the standard DSI controller and OF graph properties.
+
+allOf:
+  - $ref: /schemas/display/dsi-controller.yaml#
+
+properties:
+  reg:
+    maxItems: 1
+    description: Index of this DSI host among its siblings.
+
+  status: true
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description: |
+      port@0: Input from the DCP virtio device's DPU INTF output port.
+      port@1: Output to the attached panel.
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+required:
+  - reg
+  - ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    dcp-subsystem {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        dsi@0 {
+            reg = <0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    dcp_dsi0_in: endpoint {
+                        remote-endpoint = <&dcp_intf1_out>;
+                    };
+                };
+
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,dcp-virtio.yaml b/Documentation/devicetree/bindings/display/msm/qcom,dcp-virtio.yaml
new file mode 100644
index 000000000000..018694310dfb
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,dcp-virtio.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,dcp-virtio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm DCP VirtIO host
+
+maintainers:
+  - Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
+
+description: |
+  Qualcomm's DCP VirtIO host provides the generic VirtIO-MMIO transport and
+  the host-side IPCC channel used to wake the DCP firmware.
+
+properties:
+  compatible:
+    contains:
+      const: qcom,dcp-virtio
+
+  reg:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+  iommu-ranges:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+  interrupts-extended:
+    minItems: 2
+
+  interrupt-names:
+    items:
+      - const: virtio
+      - const: dcp_power_notify_irq
+
+  dma-coherent: true
+
+  mboxes:
+    maxItems: 1
+
+  mbox-names:
+    const: dcp-power-tx
+
+  dcp-subsystem:
+    $ref: qcom,dcp.yaml#
+
+required:
+  - compatible
+  - reg
+  - interrupts-extended
+  - interrupt-names
+  - iommus
+  - dcp-subsystem
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/mailbox/qcom-ipcc.h>
+
+    virtio@9be8000 {
+        compatible = "qcom,dcp-virtio", "virtio,mmio";
+        reg = <0x09be8000 0x1000>;
+        interrupts-extended = <&intc GIC_ESPI 956 IRQ_TYPE_LEVEL_HIGH>,
+                              <&ipcc 13 5 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "virtio", "dcp_power_notify_irq";
+        iommus = <&apps_smmu 0x15a3 0x0>;
+        iommu-ranges = <0x0 0x84000000 0x0 0x04000000>;
+        dma-coherent;
+        mboxes = <&ipcc 13 5>;
+        mbox-names = "dcp-power-tx";
+
+        dcp-subsystem {
+            compatible = "virtio,device34";
+            iommus = <&apps_smmu 0x400 0x2>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@1 {
+                    reg = <1>;
+                    dcp_intf1_out: endpoint {
+                        remote-endpoint = <&dcp_dsi0_in>;
+                    };
+                };
+            };
+
+            dsi@0 {
+                reg = <0>;
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+                        dcp_dsi0_in: endpoint {
+                            remote-endpoint = <&dcp_intf1_out>;
+                        };
+                    };
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,dcp.yaml b/Documentation/devicetree/bindings/display/msm/qcom,dcp.yaml
new file mode 100644
index 000000000000..0ca00a567e9e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,dcp.yaml
@@ -0,0 +1,119 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,dcp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display Co-Processor (DCP)
+
+maintainers:
+  - Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
+
+description: |
+  The Display Co-Processor (DCP) is a firmware-owned display subsystem.
+  Linux communicates with DCP over HFI through VirtIO and does not access
+  display hardware registers directly.
+
+  This node describes the externally connected display graph between DCP
+  INTF outputs and DSI hosts. Firmware capabilities and internal resources,
+  including pipes, mixers, CRTCs, and clocks, are discovered at runtime.
+
+  The compatible string "virtio,device34" encodes device ID 52 (0x34). It is
+  a provisional local ID pending registration of the DCP HFI VirtIO device.
+
+allOf:
+  - $ref: /schemas/virtio/virtio-device.yaml#
+
+properties:
+  compatible:
+    const: virtio,device34
+
+  iommus:
+    maxItems: 1
+    description:
+      SMMU context used by DCP firmware to access GEM framebuffers. This
+      is separate from the HFI transport context specified by the
+      iommus property on the parent virtio,mmio node.
+      The child context is used for framebuffer DMA performed by DCP
+      firmware, while the parent context is used for VirtIO transport and HFI
+      queue buffers. These contexts represent distinct firmware-visible DMA
+      address spaces and must not be used interchangeably.
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description: |
+      DPU INTF output ports. Port number matches INTF index:
+        port@0: INTF0 (no bridge in this series)
+        port@1: INTF1 -> DSI0
+        port@2: INTF2 -> DSI1
+        port@3: INTF3 (no bridge in this series)
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+      port@3:
+        $ref: /schemas/graph.yaml#/properties/port
+
+patternProperties:
+  "^dsi@[0-9]+$":
+    $ref: qcom,dcp-dsi.yaml#
+
+required:
+  - compatible
+  - iommus
+  - "#address-cells"
+  - "#size-cells"
+  - ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    dcp-subsystem {
+        compatible = "virtio,device34";
+
+        iommus = <&apps_smmu 0x400 0x2>;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@1 {
+                reg = <1>;
+                dcp_intf1_out: endpoint {
+                    remote-endpoint = <&dcp_dsi0_in>;
+                };
+            };
+        };
+
+        dsi@0 {
+            reg = <0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    dcp_dsi0_in: endpoint {
+                        remote-endpoint = <&dcp_intf1_out>;
+                    };
+                };
+
+            };
+        };
+    };

-- 
2.43.0

