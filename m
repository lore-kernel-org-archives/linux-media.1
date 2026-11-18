Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994922;
	b=WzHrAkbfpKSHMwXSPZIG9yoN/rvUAT7lOYWfEXXj4W43EmwOsJfi/X+wCaQrQ/773NID
	 BO1gIBHz7n5+u2CnTXxpFOoccgRvTgFS1rZKLePQVSgcV6MF5rZvmNkEi/1d+btuZfnaw
	 ijOqjocv2pxubHLTdICYiRNLTFxCIIHcD0pUQIg+q0xVLeryyYTwPRKw+pkphpT6toIce
	 JR/fZIK2uRLT+mlWJc5wBdG6bqO5sYTGN13xXhvP8vQQon04m7E90+xa48PDCGJyPFXQt
	 AaxS8GWVZMFgQDKi2rm/+EATJmfy3erMkqvLbmFeAkY5MupSnPM+ae3ba1nnVIPGuUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994922;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6QHaFIDZx7qovoKETDKtt+j1Cug7B4ShsOzETEfDwns=;
	b=nm6xSiuxeXXlNnncLpVM4JR37OonJCPgITf+3Wbd0U8J3F0T9afYEzgmM9VukQh1qndf
	 FQmN8MWXNWfKBBxZcPyRks8P4wioo7dmB+SDctUVAnCORbU6ZmXNXwOby1JZ8E5d0RpdQ
	 skKOTvvrfCDc/Vxjy4zc6Le4te2c/cD2IzPSEbNjCaFTBFaWq36HTajxLuYMISTMe1deQ
	 yhm85wcCBo3HRrMhL0xQvKmoUpzV8qigHgqi2bGbWqtcFGH1/zvP9Aods0SnL7PpShH63
	 7Jras3uGqTE/WL9kLIBIf/DHH7oDSUQqlNPlUvJYZX70J3h25qEuSBjQgdjNEtoBdzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JamLDpMk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ROY1ide4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26828606A334
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 09:42:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26828606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JamLDpMk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ROY1ide4
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8Kvc32602438
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 09:42:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6QHaFIDZx7qovoKETDKtt+j1Cug7B4ShsOzETEfDwns=; b=JamLDpMkmpHOtkP1
	8WN7iZ7WeOmXVcV96Su/SsZXREuGJSK3Kn0xtrLI8LukiaY/F79XyOLmHKITnN5+
	YSEc+BAgLF1v8HwL4HKNKRpCu0GmLg/rEJtRoyXVqlX9k+MYI0Q0sD2wqB1/zlxU
	J+tf4qZGs6REeRUEHqpUHj4bxv4rE7PA1dbHxENdXLNDeKbdLmSkSO1LU+CdVgdP
	FK87Do7/EH0dt7b+tGh/X9HE+19bc4UOQgOYCajJ4m74CsT4wKX3KlJ6nAdqohMV
	S5h94miWL1tBHivtS+74bxaSw3tsBhdUjMxrA+DtAh8OzQd/nML8CidrZ1HaSpgs
	RR4GgA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv72e18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 09:42:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2eb5375cd68so8583185ad.0
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 01:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794994921; x=1795599721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6QHaFIDZx7qovoKETDKtt+j1Cug7B4ShsOzETEfDwns=;
        b=ROY1ide4w4NGLvJxiSEuG1eEw5wD4zJLGLZTsnV2L29dlPzK/DKzNwgJyzaMEMej9u
         mENBb48PdBX5WSJdQc6xGHEijThgFvu1Zv89L967pHHbni4WBUWXe4w8sm/sgH2aE7vu
         0e+D7aBNVC+P0DkKabHakeZcP/VKrHRf6Pw0trd+X181zZZTbiThmORhZBw/9twRyG9n
         nIdbl/Pc8CrZbDcmkKoiA27LweLu8yRFpDOF5o2Xzubv+QcgCG2mqzK6tQQemnK8eyXu
         3Jx4Hv50jRE8WMn3AtMnHt0WA5yQ3bmUEnarDrJzKO4hJBJy7QZAjfjGLCJtHYpuAsTz
         oVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994921; x=1795599721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6QHaFIDZx7qovoKETDKtt+j1Cug7B4ShsOzETEfDwns=;
        b=LqJpcWAUnGcmw4hfZKHkX5UQe5+8QeKpK8/xcxaOLSzm0OjsuCIIu3etmfTt6q3TDN
         kAGNs+E9Xlh0KCL66cuzJVbLqGB9XQs7N9RuX47j6PSNWrHtGj6OVjm/91XASX4lAxHh
         OP1VZNLZnmZ9cpbrnw1Q6QL8rxIzTSLTePWxT3svnRadZMvDyQBPWkMOYVGIIOAkhbZz
         QlGNOzuS2In3PkygHATI1jiOb4LdBllpkrrwRgK6liRTeO/2vuuU8oDSsPzzutqP/WkM
         Gg0Wd3TGhQchztnHr1BeZGtEh+bbrHZyZipr3j/opRb0Carhqn6gGdv2IoNpyj/UW2HN
         ZoVg==
X-Forwarded-Encrypted: i=1; AL+hErE/c/Yd2u0mGYTTxUv51NRb9XUsDCYwIxa7Bfqwo2xN7F0Jj9kf+1O9qNoYE8bE7P/PDNIlu954PNgWlg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8g8YcaJrELrj7Py3iDET81j171V0GEZ47ZUnpuz+UH5geJtv0Y
	ridsIcK8SgA6iZU0JKSahEvN+/OWc5rGQ1Ww63NkwiOG0oJq9kEeTD9E9t/vhPqROSiAHDPXAu5
	HMmvDXPoR+rF8lKIiMxCNkSSBuHHc2+axu7LCJTTap54MkJF9ACZUZSUF/AWC5OgagA==
X-Gm-Gg: AZFdTZdBk0BwupOxKvg1iSqv0inuIKSw/XeEOPrqeoSD1mAAGfCIzm54yL8ocwhZENU
	j8vrYnglaq0vSc5mPAynwUwpv0I11m8rJ6acJc4vVsSEQAjIxlJXpruQuQgT/3eFV6fO6LWU0C1
	YMZXoDdEpr1g6CpSBAK30YgkMVmoO0XpUv9o2gzwyFEQ//kJiPMWnJhF/BHktDOVY0jcj7O9lM2
	Y6B7SNMr/w8C7Bpq89EVvuOu7Jnb2a6aM37tQQEk5QheBGSlXZxomh6subx4D89pejdHOQGaKpz
	ot/h6bkDuOIriw+3qP68ly/pj11GLkWmMjU6Kw2omxR+Y26f+APoYeGwCHzw9w/ZFGZZJiaBiEB
	eF57GLyT0VHiqRfyXqlxR03IEZYAHfyfdwME+9PIbTq2LUL1CvrxP1hSK0kivh+1BL+AxhHCrnq
	mx2Z72lvevYzl4j4O5599BUCMyNuqrdRE9sjrC14+LpLhJTf6C
X-Received: by 2002:a17:903:41cc:b0:2ea:7180:3aba with SMTP id d9443c01a7336-2eff741d7b0mr18635965ad.39.1794994920561;
        Wed, 18 Nov 2026 01:42:00 -0800 (PST)
X-Received: by 2002:a17:903:41cc:b0:2ea:7180:3aba with SMTP id d9443c01a7336-2eff741d7b0mr18635695ad.39.1794994920060;
        Wed, 18 Nov 2026 01:42:00 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f008044f26sm2947575ad.70.2026.11.18.01.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:41:59 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 17:41:42 +0800
Subject: [PATCH v3 3/8] dt-bindings: media: qcom,hawi-iris: Add Hawi video
 codec
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
Message-Id: <20261118-add_iris_for_hawi-v3-3-51786f6d4057@oss.qualcomm.com>
References: <20261118-add_iris_for_hawi-v3-0-51786f6d4057@oss.qualcomm.com>
In-Reply-To: <20261118-add_iris_for_hawi-v3-0-51786f6d4057@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794994903; l=8957;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=+rmEOu8jwbySGTgVv5UO0yGs2DJOOwC3xcgHzPVUKHI=;
 b=AT9to/y5B3LwZz9hT2ySQVpJABakW8H+zm900MEzmaQsTUanB6HHZlINeXm0Bxx2tQk7dOe/Q
 HO4okzqDztrA+VPMtywyDsWDUqKSwyjGC1uLD1ZMeW1s4uirkeNZ1Uv
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: kSF6PRQVtFzhh24qpp9pNNERA_PQlKmH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfX7ly++16y9xQs
 SWcpKcltWTC4VjfOzH14QGDENkjaqzsGnANTaAxWjVKfmoSKryBn+ka+45gHvOZy2AUJgLW7xNf
 M6NyKX5mW493q9l3Qq6h7c8pBBES/JRqo9lFSmnsJ8EOr7Rk4xABKm2LXCadbppx4vbB5gQ9yj8
 KrKQQj4Hv4J8CtOi4qs7KEj5qTMk0OxjXG9qlXY14C8Ebslc6eGxd+vflWgbXUz2tmFU3FOyT3a
 VMBCI+lj9HKKGzD/m2qqjNwmycXNz8u0Ba8+ZFvmTXRzT+ef4cqC06lQ9cyLxiW7vmaXtHCgTJj
 x5X3jvd18qcnha8fSWu6vrX7EkRP6RYcy0fua9FtFTNHNtuTwDDUupFfSKt3vxxfZysQ9yeX2JN
 0Ym3S26ZWGfldHeUVVukfndlhQJgjbeJSamQ8BUW3i/iqP9UPbt5cpHiOkmORT0sAnU6YlOkYcn
 /49JlgzakDfwcn8t1WQ==
X-Proofpoint-ORIG-GUID: kSF6PRQVtFzhh24qpp9pNNERA_PQlKmH
X-Authority-Analysis: v=2.4 cv=H8xOUOYi c=1 sm=1 tr=0 ts=6afd72e9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=Z9fkTJdRl1zmM-sw7WcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfX2AAkGKf6lnvt
 zHwoDlt68VqPsKCqxW7oaMzUqM11qqnm9r/oiCkirIgIs5tJQSkyNu17JEimok3VB002GnjLS12
 O10zW1erYAkVqxJqEA6ILEZ/k81SP/A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180038

Add a devicetree binding for the Iris5 video encoder and decoder block
found on the Qualcomm Hawi SoC.

Compared to the Iris4 generation, this block has
- additional power domains for internal NoC(cx & mm).
- additional clock for internal NoC(cx_iface).
- additional power domain and clock for apv codec.
- different reset lines.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,hawi-iris.yaml  | 256 +++++++++++++++++++++
 1 file changed, 256 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,hawi-iris.yaml b/Documentation/devicetree/bindings/media/qcom,hawi-iris.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..13e346414a231af9a146076de6a3fa9e9c488624
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,hawi-iris.yaml
@@ -0,0 +1,256 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,hawi-iris.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Hawi SoC Iris video encoder and decoder
+
+maintainers:
+  - Vikash Garodia <vikash.garodia@oss.qualcomm.com>
+  - Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
+
+description:
+  The Iris video processing unit on Qualcomm Hawi SoC is a video encode and
+  decode accelerator.
+
+properties:
+  compatible:
+    enum:
+      - qcom,hawi-iris
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 13
+
+  clock-names:
+    items:
+      - const: iface
+      - const: ifacec
+      - const: core
+      - const: core_freerun
+      - const: core_ctl_freerun
+      - const: core_debug
+      - const: cx_iface
+      - const: vcodec0_core
+      - const: vcodec_vpp0
+      - const: vcodec_vpp1
+      - const: vcodec_vpp0_vpp1_gating
+      - const: vcodec_apv
+      - const: vcodec_bse
+
+  firmware-name:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: cpu-cfg
+      - const: video-mem
+
+  power-domains:
+    maxItems: 9
+
+  power-domain-names:
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: mxc
+      - const: mmcx
+      - const: vpp0
+      - const: vpp1
+      - const: apv
+      - const: mm-int
+      - const: cx-int
+
+  resets:
+    maxItems: 2
+
+  reset-names:
+    items:
+      - const: bus0
+      - const: core
+
+  iommus:
+    maxItems: 4
+
+  dma-coherent: true
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+required:
+  - compatible
+  - dma-coherent
+  - interconnects
+  - interconnect-names
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
+    #include <dt-bindings/clock/qcom,hawi-gcc.h>
+    #include <dt-bindings/clock/qcom,hawi-videocc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,hawi-rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    video-codec@2000000 {
+        compatible = "qcom,hawi-iris";
+        reg = <0x02000000 0xf0000>;
+
+        interrupts = <GIC_ESPI 238 IRQ_TYPE_LEVEL_HIGH>;
+
+        clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+                 <&gcc GCC_VIDEO_AXI0C_CLK>,
+                 <&videocc VIDEO_CC_MVS0C_CLK>,
+                 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
+                 <&videocc VIDEO_CC_MVS0C_CTL_FREERUN_CLK>,
+                 <&videocc VIDEO_CC_MVS0C_DEBUG_CLK>,
+                 <&videocc VIDEO_CC_CX_AXI0_CLK>,
+                 <&videocc VIDEO_CC_MVS0_CLK>,
+                 <&videocc VIDEO_CC_MVS0_VPP0_CLK>,
+                 <&videocc VIDEO_CC_MVS0_VPP1_CLK>,
+                 <&videocc VIDEO_CC_MVS0_VPP0_VPP1_GATING_CLK>,
+                 <&videocc VIDEO_CC_MVS0A_CLK>,
+                 <&videocc VIDEO_CC_MVS0B_CLK>;
+        clock-names = "iface",
+                      "ifacec",
+                      "core",
+                      "core_freerun",
+                      "core_ctl_freerun",
+                      "core_debug",
+                      "cx_iface",
+                      "vcodec0_core",
+                      "vcodec_vpp0",
+                      "vcodec_vpp1",
+                      "vcodec_vpp0_vpp1_gating",
+                      "vcodec_apv",
+                      "vcodec_bse";
+
+        dma-coherent;
+
+        interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                          &config_noc SLAVE_IRIS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                        <&mmss_noc MASTER_VIDEO_MVP QCOM_ICC_TAG_ALWAYS
+                          &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+        interconnect-names = "cpu-cfg",
+                              "video-mem";
+
+        memory-region = <&video_mem>;
+
+        power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+                        <&videocc VIDEO_CC_MVS0_GDSC>,
+                        <&rpmhpd RPMHPD_MXC>,
+                        <&rpmhpd RPMHPD_MMCX>,
+                        <&videocc VIDEO_CC_MVS0_VPP0_GDSC>,
+                        <&videocc VIDEO_CC_MVS0_VPP1_GDSC>,
+                        <&videocc VIDEO_CC_MVS0A_GDSC>,
+                        <&videocc VIDEO_CC_MM_INT_GDSC>,
+                        <&videocc VIDEO_CC_AXI0_CX_INT_GDSC>;
+        power-domain-names = "venus",
+                              "vcodec0",
+                              "mxc",
+                              "mmcx",
+                              "vpp0",
+                              "vpp1",
+                              "apv",
+                              "mm-int",
+                              "cx-int";
+
+        resets = <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
+                 <&videocc VIDEO_CC_MVS0C_CTL_FREERUN_CLK_ARES>;
+        reset-names = "bus0",
+                      "core";
+
+        operating-points-v2 = <&iris_opp_table>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        dma-ranges = <0x0 0x0 0xffc00000>;
+
+        non-pixel {
+            iommus = <&apps_smmu 0x1540 0x0000>,
+                     <&apps_smmu 0x1620 0x0000>,
+                     <&apps_smmu 0x1544 0x0000>;
+            iommu-ranges = <0x32000000 0xcdc00000>;
+        };
+
+        pixel {
+            iommus = <&apps_smmu 0x1543 0x0000>;
+        };
+
+        iris_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-150000000 {
+                opp-hz = /bits/ 64 <150000000 150000000 150000000 225000000>;
+                required-opps = <&rpmhpd_opp_low_svs_d2>,
+                                <&rpmhpd_opp_low_svs_d2>;
+            };
+
+            opp-285000000 {
+                opp-hz = /bits/ 64 <285000000 240000000 240000000 360000000>;
+                required-opps = <&rpmhpd_opp_low_svs>,
+                                <&rpmhpd_opp_low_svs_d0>;
+            };
+
+            opp-338000000 {
+                opp-hz = /bits/ 64 <338000000 338000000 338000000 507000000>;
+                required-opps = <&rpmhpd_opp_low_svs>,
+                                <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-420000000 {
+                opp-hz = /bits/ 64 <420000000 420000000 420000000 630000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_svs>;
+            };
+
+            opp-444000000 {
+                opp-hz = /bits/ 64 <444000000 444000000 444000000 666000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-560000000 {
+                opp-hz = /bits/ 64 <560000000 533000000 533000000 800000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_nom>;
+            };
+
+            opp-630000000 {
+                opp-hz = /bits/ 64 <630000000 630000000 630000000 1104000000>;
+                required-opps = <&rpmhpd_opp_nom>,
+                                <&rpmhpd_opp_turbo>;
+            };
+
+            opp-800000000 {
+                opp-hz = /bits/ 64 <800000000 710000000 710000000 1260000000>;
+                required-opps = <&rpmhpd_opp_turbo>,
+                                <&rpmhpd_opp_turbo_l1>;
+            };
+
+            opp-1000000000 {
+                opp-hz = /bits/ 64 <1000000000 710000000 850000000 1260000000>;
+                required-opps = <&rpmhpd_opp_turbo>,
+                                <&rpmhpd_opp_turbo_l3>;
+            };
+        };
+    };

-- 
2.43.0

