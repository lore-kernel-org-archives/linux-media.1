Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742070;
	b=33CffUsAu/A8BYsn/FBzuZPRD6MuYqiBGbNpN8a7p3vao0J1TpcXZKuGM/DG0z0dMxju
	 zMTD6eHCP6vUkGQMTlAUEDN3xdKd+P2mXtLRT/WIiefa2PFztrCD5AJlPQzkZkcQOf68L
	 oyGYkgO8zAgNA/iu021JrOlp/R44sJAkXBH8V/LIxyUmfKEgU47vbB3geUfEbP8MJ0t6P
	 vHBIu3qqF8HxblOKaNK/WIngw4vGtwTGvaEyzhpZfe7/oCoZUK80av5hqEY0f7bl+lrjP
	 AbWtm41u8bxH5pPNZ+7LOdlgbw06S3PMSe/VHJA25yCPLrK72RRYmguHvXHdNLKY3Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742070;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=QoM/IqC1v4fyVgp5mXaugArWmtVnYBKnG59oPWEYQmY=;
	b=iCgyTVBWT9CTx5yraI5pPDq4lC9vMd3iABeI8nE++4QXd4VNg2FmFqXK7ZpEWHy4OoVg
	 uhbeKUHz1/eUM9J2wmlS4Uk1+Z65OyXJe+EVQHPdRQA8XCJqHmHtjz0yosZjFsdWGJIql
	 CKeL2uDOT9674wpotov5ykSgYZ4/z1ehKxxJawO1QvHYttoEkdicXEShvKDE7Q+B+Y6JO
	 GAZ2Y9yH5dNc9jFi1nCBma8Xrib2xVFMsvyS7U+15WsYTCEKuz4BfT0ba4dE5HU1HqpTC
	 ic3vQxQYvs2rG+Gj/HOdCFM3QiE6nKkU4LydFQO/QF0mGe6QBeh8MOZRz34jgSHYrXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pWToFaIZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dnkTojsW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34D8606A32C
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 21:41:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F34D8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pWToFaIZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dnkTojsW
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LKgBv3472798
	for <linux-media@vger.kernel.org>; Tue, 3 Nov 2026 21:41:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QoM/IqC1v4f
	yVgp5mXaugArWmtVnYBKnG59oPWEYQmY=; b=pWToFaIZmO5UuI5rcMdpvaSHr/o
	yBq0Ro0VLdHT5bY+juXr0VJOskZbCxorucOQE9JQv4XiUwV/cKnACEXzWD4GAtjI
	pr8eYaK3bHbpXY56qVRSYgghB1Kb9RMoOBw7OB6u5T3FeMl8qlJ9GK+JNDqt3gU5
	0vQqXFh+fEzKy5fZmZkXX2Jy5ApiioUl8nw549FLKeqvZ68oKHnBO4o0Wu60zON1
	Cy+e4otAst0oBBACkNbQpu3mXvvRW3V6dwHk2ygrFX8FjqFLgoq72t+Dzhqc89qy
	SPgshErcZri3tjVKO0FJM2kIiS8SMtkvmfPBHlDtM5K9tRotyomnUuRbfKA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8y0ju0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 21:41:09 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1663fb7e005so105809c88.0
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 13:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793742068; x=1794346868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QoM/IqC1v4fyVgp5mXaugArWmtVnYBKnG59oPWEYQmY=;
        b=dnkTojsWtqTJGCBpt1W9vqaKo/dtGHFHrYEoIKhq0qbgT6ezXnJOmbS4Ep5YujWpD2
         azTAkaTcz3GeoZv6OF1lvYoRuSeo0tzOtbWDqGwi9oo0HNQa8TCfYhjY6uPrUeZdBPOP
         tLprJRGtP8EA/wpds6+qPogIc/p2UTJGR9KkFBjsExm3O2jGfVeuhp/MCUuBI9Cr22oW
         lSPWtgrrt7AfnsDz44TzRNSHoVRiZbnSiDWOnaCrzGiXTAxfceORCNcUxkRS01evWYyJ
         n6FiFPP9V2jv4u3hagndg0IuMx8oF3vo6gT2oVlIxwUmWavu8DFObu4FAj786sv813zi
         LYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742068; x=1794346868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QoM/IqC1v4fyVgp5mXaugArWmtVnYBKnG59oPWEYQmY=;
        b=qIOdfF60dwTKNQPmuCXwglWx9IYUbdLmiP6rrd55Ydeoy+uMRq5y0BGWv0HJY2JSG+
         /NxQHoed2NF5EGDxQ4Qfr7Lu1VrsERmd/TruX1VQj+sh0mkt78gYZlQo6XRFurEJ7XD0
         l4coLFWPH8LnaHDrq64fHYOonq0sy1wEk2oSDzSMBxzyyK/Je5xv421BDs4nk7sR3xAt
         L5SLsWJFrjHjvp17Bl86t+3JyPy4I4YwV2IUi2ErtqXZyJy2mOS5oOCF6f2rYQomSJSu
         +GY0RqLEwuZqvxFjj7tQam5m/qzpBMf7GKMst+XiK5iIsHAhJJdj23WaYdHN4q5Q3JTb
         FgPQ==
X-Forwarded-Encrypted: i=1; AKwUvBxz4X7TPgUELAubRi1BHKJUof4y2f0q80HBUgwo63LHPccTwywJt6jhdq3oXc2P8Un/pd8gx5mwOShoLw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/OVEEAVDE9L9mIEMpiRoSY83RP7h8ZkIh0eoYJ/d74WsikcUSa
	pTu+PG+cW6cp9sf4PVxSrVKe7VnaDqlIVBv1DhQZIaIzHP7tY+brmRUI2FD7mD4ibuFoHnyjCgh
	4E3MF+5rwchA5lMcs+pXochesudp0CCWVvcRk8h2S589bq3nvqpAHaQrmLgCXQbCcxQ==
X-Gm-Gg: AYBFou0oaCrL4d4qr2j+GUvEMQoW+eXNcBptTF3MTOB7BwGKlJq1XfKgneQaRjdKGlf
	KarYKWR+H8tg00gfhv6N9aQUF4QT5i/4iDLvB/KXQFlXKeDn7cYlKVQhZch2DbghihN2kcDQ96J
	EHI7ElwZkQZnGlrbzShKw6ILn7HoAaKXRRUVt/oPkLpZBXoFYpRf2Blud0IRmV95IFdtHijgq0A
	PIr9TUsD72pDGCt0cJcGPh1qL/ouzsh6kOWhh8wLGkSAz2SddbsaAxUR3UUG82porgsKdyO62o0
	x4YPHxHHrNnk7YU1vQNMedOqSMkdUi4Jrba2a9a4pI/JRq76EYcFBHFtbeOhj8Ozgvgzv9AYq+w
	mG3seiQEmTArSDTTy5FHlGMzou8Zkd4mo55AzJbHza5T2EAqfS3zvE6dLNlH0aPXqZeh2ES8EEY
	HdLlKlALBSo7/1ijdP1gEmyykJWKU=
X-Received: by 2002:a05:7023:90c:b0:138:30b1:4c00 with SMTP id a92af1059eb24-1ac56d95448mr23891012c88.3.1793742068381;
        Tue, 03 Nov 2026 13:41:08 -0800 (PST)
X-Received: by 2002:a05:7023:90c:b0:138:30b1:4c00 with SMTP id a92af1059eb24-1ac56d95448mr23890961c88.3.1793742067759;
        Tue, 03 Nov 2026 13:41:07 -0800 (PST)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm1537440c88.8.2026.11.03.13.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:41:07 -0800 (PST)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] dt-bindings: phy: qcom: Add common qcom,csi2-phy
Date: Tue,  3 Nov 2026 13:41:01 -0800
Message-Id: <20261103214105.3605181-2-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103214105.3605181-1-anusha.nandi@oss.qualcomm.com>
References: <20261103214105.3605181-1-anusha.nandi@oss.qualcomm.com>
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
X-Proofpoint-GUID: HXj-Xe6nGy9ZQUkMfHFv8AJZ7Sm7A8yE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4NiBTYWx0ZWRfXyx6RRQwHffLP
 6UK0NJ7UMUZQJAMMBZfi8ppFCstsUB0CyrrQSbrq5XqLbAw0FWdDnh2fWmzukaAhsjLbobg5Adm
 WF46ynkSlXkHfLrFoToyoiBCroZYJ16HCclUWfVtJL5ymFIhybS3Y2AzBzgZ0llmZwlllbel+Gs
 QanLr3wPoZk8C6aG/0yNBtkoLZ+s7QFGGqHD0jl/13e9H71vl8D++r+jbw3zEMyFm5Pn1+9zGrA
 JpbrNdKLgkRh2f5SFfZREqoVDdy2WHnaE+mRVHxIQT8GDktvPoxWp1TwKhGsCgOttgN60mzo51T
 7wr3g+5q5vaMHKUbGobYN/EZexe70JjbF6rpGAYzCHaSEuv8AzciL0b5VqfJBWWwvHSHJJ7mZDY
 QtjhL1uPfMcvC6U2TI4r7f2XRuXoQdBgn//22fxz/KCGoWAO/7GK2g6ZTUzWPFxcNG6WvDamEDx
 RLedQXiaRfybednqjmg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4NiBTYWx0ZWRfX+5E4vc5cjxcC
 OB4GUxblVoP6Wn+x9FWDKqCLmuO8YMj8ZK54KxphTGHQNdYTmpkKus0vF+kph4ERvXoCQuf+s+H
 nR9sfUrn3MKTKC9cb8Am6aM1Ysx6dTo=
X-Proofpoint-ORIG-GUID: HXj-Xe6nGy9ZQUkMfHFv8AJZ7Sm7A8yE
X-Authority-Analysis: v=2.4 cv=NP5AaE6g c=1 sm=1 tr=0 ts=6aea54f5 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=sx4psc2xio7dPLQVwlEA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030086

SA8775P, QCS8300 and SC7280 CSI2 PHYs are bit-for-bit identical in
devicetree shape (ports, bus-type, data-lanes, operating-points-v2,
clocks, single "top" power-domain, vdda-phy/vdda-pll supplies).

Describe all three with a single qcom,csi2-phy.yaml and a compatible
oneOf, rather than one standalone schema per SoC. QCS8300 is further
required to be paired with a qcom,sa8775p-csi2-phy fallback
compatible, the same way other Qualcomm bindings express full
hardware compatibility between two SoCs (see qcom,qusb2-phy.yaml);
this lets the driver bind QCS8300 nodes via its qcom,sa8775p-csi2-phy
match entry rather than carrying a duplicate one.

qcom,x1e80100-csi2-phy.yaml is a separate PHY with a different shape
(3 clocks, 3 power-domains, different supply names, DPHY split-mode
support) and is left untouched.

Reviewed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 .../bindings/phy/qcom,csi2-phy.yaml           | 176 ++++++++++++++++++
 1 file changed, 176 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,csi2-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/qcom,csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,csi2-phy.yaml
new file mode 100644
index 000000000000..5d25547528bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,csi2-phy.yaml
@@ -0,0 +1,176 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,csi2-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm CSI2 PHY
+
+maintainers:
+  - Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
+
+description:
+  Qualcomm MIPI CSI2 D-PHY. Connects MIPI CSI2 sensors to Qualcomm's Camera
+  CSI Decoder.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - qcom,sa8775p-csi2-phy
+          - qcom,sc7280-csi2-phy
+      - items:
+          - enum:
+              - qcom,qcs8300-csi2-phy
+          - const: qcom,sa8775p-csi2-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: core
+      - const: timer
+
+  interrupts:
+    maxItems: 1
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+  power-domains:
+    items:
+      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
+
+  power-domain-names:
+    items:
+      - const: top
+
+  vdda-phy-supply:
+    description: Phandle to PHY supply.
+
+  vdda-pll-supply:
+    description: Phandle to PLL supply.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description:
+          Sensor input. A single sensor is described by a single endpoint
+          with one to four data lanes, numbered 1-4. The clock lane is
+          position 0.
+
+        unevaluatedProperties: false
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+            properties:
+              bus-type:
+                enum:
+                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
+                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
+                default: 4
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+                items:
+                  minimum: 1
+                  maximum: 4
+                description:
+                  Data lane positions following this endpoint's clock
+                  lane. Positions are a per-port logical numbering, not
+                  package pad or ball positions.
+
+            required:
+              - data-lanes
+              - remote-endpoint
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output to the CAMSS CSID controller.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - operating-points-v2
+  - power-domains
+  - power-domain-names
+  - vdda-phy-supply
+  - vdda-pll-supply
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,sa8775p-camcc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/media/video-interfaces.h>
+
+    phy@ac9c000 {
+        compatible = "qcom,sa8775p-csi2-phy";
+        reg = <0x0ac9c000 0x2000>;
+
+        clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
+                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>;
+        clock-names = "core",
+                      "timer";
+
+        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
+
+        operating-points-v2 = <&csiphy_opp_table>;
+
+        power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+        power-domain-names = "top";
+
+        vdda-phy-supply = <&vreg_l4a>;
+        vdda-pll-supply = <&vreg_l1c>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                csiphy0_in: endpoint {
+                    bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+                    data-lanes = <1 2 3 4>;
+                    remote-endpoint = <&sensor_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                csiphy0_out: endpoint {
+                    remote-endpoint = <&csid_in>;
+                };
+            };
+        };
+
+        csiphy_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-300000000 {
+                opp-hz = /bits/ 64 <300000000>;
+            };
+        };
+    };
-- 
2.34.1

