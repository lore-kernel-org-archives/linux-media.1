Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674576;
	b=O6DmfRJMCRpA1MTQtdYuz2FN+7yYp34Y6pvundnXJ7fuuarQPG0hjtZnLL/rn53TdATg
	 mlBMH5BDQTq/YtCMX/UpIMUQ42ND1JsMTlJ/ByAsGNSDNYdhEDCrRJzzFBQbFmlgjB4ti
	 uVgR8w0oYyurOsXxciajXaope+/mpjB05tNrGxXP9WBjS7MPdy4w9Gssaxfl5WgWrjsFx
	 e/XrKt6vTO4/VL2pJULTVHXD1izVyW5yoKQBysJYE7IcEoHhHD6gyoFEvzydZC0Di1MVg
	 L+KBTghtS3tLlUpaaF9KgEVCC9NSZZBwm+5eFGSJGpkBMvwRhG5RsgOS4fVUQDaBm/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674576;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Y78skdnXDcn/YdXAR0v/cW0FycySwQB/bgImMnR6+To=;
	b=V+VZvLKSl8Rl8Ch888XNUqt1AzoieVe+zy6dvGFe5Ulv0IiWbS+P5Gkrlz9NYWDltJIt
	 RBpPzoEyvGKggYd6CgwWgxfpQymHvK3UEC33+ZrMI03a69BohquGcOH3GR7eksl/3DQ+D
	 LOxsVCQdsGPjtiUTqOv5WM1dkydYjRhfjWDT/WgiclNdww2O++S5cscbBuN96gaZmNTZ2
	 mX7/bQdufYE0YHPT1t40raB24beV+nlQ7g0VTVQqhv+UvCChCrrIIpLVNuyQ/znS3DWr0
	 1Xlk8bp0RDSdlxkJQHmmQubg0NELfvFkOue+Pa/ayMq6e1jHh+rmQm42i8q2T/PvY7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BCqu1GYw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JW8xomEt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33480606A334
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 06:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33480606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BCqu1GYw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JW8xomEt
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36VfU394198
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 06:29:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y78skdnXDcn/YdXAR0v/cW0FycySwQB/bgImMnR6+To=; b=BCqu1GYwyhMRar90
	F3tVAfRuWe9jmCt7/sQOhllTwblDM5If+TL5KTf3iXNiK7hU/MVyu7VbSjcPHMwL
	cPi0ftAJDIAChGgzV0OXc4+WbMRed9k/hsCfQo3lLZ1uVl6Wmkq5FYQM5hMD4xR2
	/xsoRCDVMkvV/u1sj23elw3ZkA2kT0lieoXFrV7+fP3JCwvWi5EgiUPcSLsfrAcH
	tYW+aiM5m5dvcsSDwO6cEs1Tf+xgdAlYp6xPUxu8//ydVS+FXmIwy5Mg9gIpZCX6
	BdhiriceQrr7W1gtAIzbmOmUz1/UewB1Q1yGA8mQcRMYMl2YBKTSjlIs9TC+vePL
	aE35Yg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y1qb6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 06:29:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f0a5868265so38133505ad.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 22:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795674574; x=1796279374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y78skdnXDcn/YdXAR0v/cW0FycySwQB/bgImMnR6+To=;
        b=JW8xomEtCRXqVe8b/Z+pQTkGfoyR42drhULCuBqcFbVHoojLhHmDTUIfmJILdiYUD8
         DUvM/wmPVec03Hs1tpco5bVHP7DJL2w5VV2AclCnM8nBGRAdMTEoHkFN/IX3jKGGMUPG
         2VhAFoD3oTiHH81CFP4/0cSXw9Wvd1H9qxu/rBAGjUHB2EoumbwAldNxlXYR2BYCEDhP
         2h4s0rpQyjSSCqpxQDcDKSod3fSdse8Abl9Pq1JGt3aaRJqLHv6plGLUsikP7o5wZIEh
         GMZpOxIOajjj+6T6xdQnORqRdUjU/NJOG2zEXDy50j/OYVLBgWHdRyCp6ul1SteiE751
         CK3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674574; x=1796279374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y78skdnXDcn/YdXAR0v/cW0FycySwQB/bgImMnR6+To=;
        b=vP8aXcmSS7+d2zCChUXpPYpI0Pme814d61iOhRu7DQEOMQtMsOiTEhdeKrIj1EBFx7
         QWtf5B1ieFOSnFb22Wpvx6vmaIYEcHvC43Lt7RnTVPWBXcr433nrLyt1t5ssCAkfeysk
         VCQVOiNPsmj7S+NIsA5jb+JSrf/c4/AUII5/PdQzl2BxWv2qNbQKyciuFCUmjDyCpevO
         vCPaW85qx00MWhAG+gPRsCPdo6f9vPX6sEgseQGwJ3GxQb0GHAwixyXtveh2V0p8kqgK
         0OvO3IUJbvef58nqnyV3KLR+uI5NULXGjO96ZLvH0VMfbzoqL+BFv4QcLlY8ZpDLN2Vp
         Xq+g==
X-Forwarded-Encrypted: i=1; AL+hErHqneUUZTgQSA0OOBqfQ0hUmaHq5JSz85SkOqY/IjZk4g7ERX+Oqn4N/pog77yHXyHiRDmWe+5u/5zNWw==@vger.kernel.org
X-Gm-Message-State: APuU4Z95kCGWZpaBiXO4q1eJTT1Fv642pj+8aeT9JGM/po7Upl1dLWsy
	HGpagC26Fb6J1rJS3LibKrM13X04Q7/87VN1jA56ahg+eqy7hF0bH2iSDY+U1PsqkPh3AqI9qfk
	3SoAr3Eo0ilVrEpPyvVT7baxKm/YEbjlWxwa/f1FSNZz0zgk89sCT2gXrEcnXRP3IEg==
X-Gm-Gg: AZFdTZe+uradp4vDk53MToItv8SZksQXfxqJT+MVkc42Y5NVf559v6VzRZSP8l3izLl
	NXkpQ3WGqCm4ZSHL8VIfSbXA/a1k/Tbi+ooiUBVjmhW0PnM3WBPKs8RBWSsi7y3xvNi8/BW3PHT
	YNoEsGwSVG4uHyHv246FzDg1x7PU1/SEQMibex8Qvc1208a3aiUToCteeAj6y626w/83U+I2snv
	mDxBx7ncmsAyhUmtqXqNWhpZ8+gzXA7mQtcCavjZ59b0nUU9ckuWhLcot91ISVjeeb13eVqXv8O
	gfb2MrJCJOLNp6CONRXKMcLGyAe9ggodpGBg5dVW1C+HOd/s+1Ps+jHSVQQm820yblp04+w2KTx
	XRAXzxmtCztTdlVr0gjfDy/5zIwUKhxC3ewZV654zK5f8vRTJQHk6cInGyXBbsptPimAAh/IZ6r
	KvJp0VfAtn
X-Received: by 2002:a17:902:d4c7:b0:2f0:4f8a:c166 with SMTP id d9443c01a7336-2f04f8ac351mr173957585ad.56.1795674574424;
        Wed, 25 Nov 2026 22:29:34 -0800 (PST)
X-Received: by 2002:a17:902:d4c7:b0:2f0:4f8a:c166 with SMTP id d9443c01a7336-2f04f8ac351mr173957405ad.56.1795674573906;
        Wed, 25 Nov 2026 22:29:33 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f147a9esm97159715ad.72.2026.11.25.22.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:29:33 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:59:09 +0530
Subject: [PATCH v3 01/21] dt-bindings: display: msm: Add Qualcomm DCP
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
Message-Id: <20261126-jshekhar-v3-dcp-v3-1-f1e9d7505039@oss.qualcomm.com>
References: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
In-Reply-To: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
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
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795674555; l=5709;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=U6TxkZ8CuOVRovKLZXYMgwd7nNnUigtqivShqty42v8=;
 b=KuI+bWQmRi9fvCvyVl7QjCUcVdHutgwKIzjrubWNefS9OEYZxBFON3Km5R3thcyiMHA7PXxmT
 WKjkb3y6K+KBYV4YX/BDa3TZ9zBK3HKNHPikgH3FKzcrN91K6c3qPeh
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfXxvrXJsjEZSKw
 ME4ja/kHj3fC71WtKXpi7re/0+qTNHG66ofMe8PLh32W59mUGVKDJgZcWZCnxLRzwLQmREYXpOe
 jRuXFsAlbAnzfYJfSnhkTvho8i1Q97RX/oOFXXijtFN/9Usp3Ap2MbpZmqly8/Ta5hfMP/QTvjL
 bfgGZiJGQaYEb67sE5GkLPJcv2hOkxu6Vm71ccmNR5Z8gc4ogcQyGofA0F8fYZbT3t/h69sVp7x
 VtYF6KrQw7YXI8BOEARMWDkAM+tj/AfzB29Ua2V1Y31FeOL2RD2gML6wVIs9GdL/tbWCrgoyIyx
 oe1sZgKPAfSte2P/mkZmhYdOVXX9m7zU4Xn8GB6MYjnylS4UU49QjaY+hv6IWQ9jQKpzCw/y4xN
 HtZHCPdmaw4Kyi9MwU1xdqB/1Uiow+ABx8EwL6DjxxqVcTw3F2NWN5pI4LgFAolbJS7uPzGV+OJ
 1NyGj7Y1omy8pVRGLFQ==
X-Proofpoint-GUID: FcfXBQGgNLlVdlAV6G3UBGa4sVBYpRkX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfXx6tgo8mFKUDQ
 cbYM1Xs9hX8lGNvrA4YB9RkLC2sbaJY7VdVTPuxujE+ZmP9UDvlNLu/xlGiIjAa2ugQomtUUfp5
 kFpaQa9VauJ09gExY1hkEnigf383KkI=
X-Proofpoint-ORIG-GUID: FcfXBQGgNLlVdlAV6G3UBGa4sVBYpRkX
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b07d1cf cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=odQccb9QLjelfSTPidkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260024

Add a binding for the Qualcomm DCP VirtIO display function.
Document the framebuffer IOMMU context, DCP INTF output graph, DSI host
indices, and connections to the external display chain. Firmware-owned
display resources and internal paths are discovered at runtime.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,dcp.yaml  | 159 +++++++++++++++++++++
 1 file changed, 159 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,dcp.yaml b/Documentation/devicetree/bindings/display/msm/qcom,dcp.yaml
new file mode 100644
index 000000000000..ff7dc4e5c5ee
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,dcp.yaml
@@ -0,0 +1,159 @@
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
+  INTF outputs and attached DSI panels. It is assigned to the VirtIO device
+  by the Qualcomm transport driver and is not independently enumerated.
+  Firmware capabilities and internal resources, including pipes, mixers,
+  CRTCs, and clocks, are discovered at runtime.
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
+      iommus property on the parent DCP transport node.
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
+      DPU INTF output-only ports. The port number matches the firmware INTF
+      index. The corresponding interface@N child has a reg value matching
+      the port number; its protocol-specific child describes the display
+      interface. The graph endpoint itself connects directly to the attached
+      panel. Each INTF index is represented by one interface node, avoiding
+      duplicate reg values when different interface protocols are used.
+      Unused INTF ports are omitted.
+    unevaluatedProperties: false
+    patternProperties:
+      "^port@[0-9a-f]+$":
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        properties:
+          endpoint:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            unevaluatedProperties: false
+            required:
+              - remote-endpoint
+
+patternProperties:
+  "^interface@[0-9a-f]+$":
+    type: object
+    properties:
+      "#address-cells":
+        const: 1
+      "#size-cells":
+        const: 0
+      reg:
+        maxItems: 1
+        description: DCP INTF index matching the output port.
+    patternProperties:
+      "^dsi@[0-9a-f]+$":
+        type: object
+        allOf:
+          - $ref: /schemas/display/dsi-controller.yaml#
+        properties:
+          reg:
+            maxItems: 1
+            description: DSI host index.
+        required:
+          - reg
+          - "#address-cells"
+          - "#size-cells"
+        unevaluatedProperties: false
+    required:
+      - reg
+      - "#address-cells"
+      - "#size-cells"
+    unevaluatedProperties: false
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
+    #include <dt-bindings/gpio/gpio.h>
+
+    display-subsystem {
+        compatible = "virtio,device34";
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
+                    remote-endpoint = <&panel_dcp_in>;
+                };
+            };
+        };
+
+        interface@1 {
+            reg = <1>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            dsi@0 {
+                reg = <0>;
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                panel@0 {
+                    compatible = "novatek,nt37801";
+                    reg = <0>;
+
+                    vddio-supply = <&vreg_l12b_1p8>;
+                    vci-supply = <&vreg_l13b_3p0>;
+                    vdd-supply = <&display_panel_vdd>;
+                    reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
+
+                    port {
+                        panel_dcp_in: endpoint {
+                            remote-endpoint = <&dcp_intf1_out>;
+                        };
+                    };
+                };
+            };
+        };
+    };

-- 
2.43.0

