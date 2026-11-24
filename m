Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795502653;
	b=jJBH6Fmej0lIEk4NS4w/ka4JnE5LYrdkctqy/xv8z231QxfPB37Q+95ghKknQzhECQwi
	 0NlqTYJ84WFd1cM+QtUktJ/v0xfTcKm2KSLWsrPOipfvaybxnsIJ+8kqdFrG4lhfAJNGk
	 v4EzB9L7ll4jOXMkuY5Z6gyDzZDsQpjYWORDB35GcLlYRnD1rSIfxkL0MIF0pZcyipLnn
	 2YFQmUU7pwmmPzWrc8SoCfIe/3udtRVKmdItTi+cdFtTqzq295uZExXM9mkJ67Ps1+ENa
	 9YhNSDUjJQ/+BeC4dpnfpeVYj84XKkFj6nrvNg4vNP5VKHDFnSfkn0YYCDtV4tU1wAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795502653;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=y+MAKsZr60+prZqfFWCiEEpb7+zhU2afC8WbZLetcmw=;
	b=QesPTjrbSQ8LAvrnHe2A/KliHJd0gr+mWdY1wYsl/9AHtWd/IF1+1qLWw0ou0XBebIoh
	 9rarbDpPXJfb4NVxwGfGOoy3IxEIgwVD8b/lxdfmoIXFZSLCpcBnHcLZFdcDtcznDLYKx
	 n21O4X6cWvWpwvrN9VXLO09ZfVH3zxhgXYok8j5j5i21mTOYlFzMJS8OYYZOEfAV6Iaah
	 TX6kymrLcY27Uheed2jT3+Q5NhyYqmhDN9AfARDsgJhvkr2KyZAckw8xCkKKYKH/AH3dR
	 PaMRbI6wdYZP0i6ctLPBEN59nvNlhKrHDfr0JsWLhf0OhcKWg2GZvrV8XykpPsBgB4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="He5xRn/n";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Li9M7cQM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B64606A33D
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 06:44:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57B64606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=He5xRn/n;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Li9M7cQM
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2kBSd196998
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 06:44:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y+MAKsZr60+prZqfFWCiEEpb7+zhU2afC8WbZLetcmw=; b=He5xRn/nharClOih
	NM1DKIvNuqNyShAMG0AGcX0zM15wrsd5Q8kr9TE9a1REL09MZRxhWJduEwoWAGjI
	V2xm1/1iQcBDkfLYoWZsb5ht2N2F/NkEbBIeRK6BY2Sb3vwkFzi4/jPGi2rSTZd2
	MMKfAxnoaCgXjMCULq4kWixr8NKsLG5oHV53H190ktN07pRTezjF/2I6qYJDTjg2
	h5r4jFUt4k6VM2NUKmy/bw333GAXNGhlQG60iOZrXuxuyFeWsvOz0nDVSmC3i6y0
	7fEfUFlCkiYA73mBY9u9iD8mln5HomVFhB7/O2RsUpUediqX0nLYn0lhw3aeJcpz
	g0d9IQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukra6yt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 06:44:12 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386c4e8b81eso23438eec.3
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 22:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795502652; x=1796107452; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y+MAKsZr60+prZqfFWCiEEpb7+zhU2afC8WbZLetcmw=;
        b=Li9M7cQMPR1NJ3T9pnyMd3vQC5Gdg1Tc3+UZqTuuImS3JxycexltzLxZSaYD8F6KPn
         VBvX8FcoZEIPF4+aOBP89DL6mVjozebEci9/WnNkkn4cG7JlR/ixQ+apxZCrlu6Vskoe
         rY04B3ljfMxWjEVm72tu4K8bJIrFrjXDlZwhOSvNPi12xq8kO6fcta69yRTKwKvUKx8I
         HzcGxh2tOHx8W6jNZ4j7HtLDJIz4cHjD0HQb8yr+yut2JnP3RyePJL81z8E0US6TsidU
         qiHrWIJEnZVWzOXv0EJOSbIxBtoHJGzdvRfAYK/mIT0GrbffBbgeFMRvvuhEGZWsNHee
         uOSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795502652; x=1796107452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y+MAKsZr60+prZqfFWCiEEpb7+zhU2afC8WbZLetcmw=;
        b=aOE5ew15RsJFycWsIOoeG8D62+ebK87PneMtLBo8nOKH3uYDfDacjfjdX37X/R8t94
         5VlRvynD+SH3sJ5Cb52OTY9aqAJRcvtSEf58oWycOXkCUyWCsvOIl22RyoJQGR+NUaEO
         mTcjaPgEUVlA5JpfaQfSv5lpIG9E/vpl6V407pY1PBXYr3A4bIOGvS7HndfjV87tDwAK
         e4DO969TKaYaYamrjtw0CFNHGtlEJ79XPLqebqlwii3U1rBtc1xnrNPpQRHPjjzvzeAr
         omfAFVMU5WfU2O2/PXEnsFGilyPY/KAM4X59YcoeqA8euLmTqKEH+Kq+EP5/SEvWH/Ho
         CEKA==
X-Gm-Message-State: APuU4Z9VZyUux6FkPzL+OBmrTRA4yhLt9dAhxVZvKTtC/znC4SR+W585
	LO3DuLevs8et/n9LByji7pKCoDIWUHiLWaF6QRlPMCPWbB5YGk9zabiAZQwLcxwA+URpmcqcgZg
	8mHw5iCT38BhhVF73QYGk7/RXGOe+KOfIED8AsOpv0kMOxpsjmIIcyU5PIuoyDojoAw==
X-Gm-Gg: AZFdTZd7RkGz8VLfLk+jf64SIBCchJ0wAlV/PTvzGuFgePFUPDQdZgup22UqG3uqaG+
	+3+fXVmyLYQ8YXUxFuvYy+voKkh2U4XsoZhajRcaSUKOf/lVjIplXrTtc/fIPXCkDN7P0Dd+v4P
	wh1/OzyoJPCSYI6UwaasS9urwPgKmSamDikiDcSxL2xC7iV+cJBPu0eFVruhdCO18Kga6FM+W1B
	IFadAiDadnmDioIGeHH3qzA6R4xch4+uXc0PSOXqVvKZnVwg31YQTgBUqHL/a2qcPyfVHP0jOj2
	sC9GNeAHhbXG3h7ducbcNb83xM7zfS9i+mfvG/C4zeBB/wbqC4HBQ0U2Nl08A+AlPcu1v+6zY3A
	30NCE8LVMk6GfbjbNibtrl5XXv+C8Xf8k1TpW6IpTA4OrlSTZaJtiorMJuM17D/I64KoYq7areN
	Bw+eyxe8+76y0t4NT6TBo6Syf5azu9QuSGyg==
X-Received: by 2002:a05:693c:829b:10b0:386:c3c4:b914 with SMTP id 5a478bee46e88-386c3c4ba54mr1173954eec.0.1795502651724;
        Mon, 23 Nov 2026 22:44:11 -0800 (PST)
X-Received: by 2002:a05:693c:829b:10b0:386:c3c4:b914 with SMTP id 5a478bee46e88-386c3c4ba54mr1173903eec.0.1795502651063;
        Mon, 23 Nov 2026 22:44:11 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567ea2cc5sm39265484eec.29.2026.11.23.22.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:44:10 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 22:44:03 -0800
Subject: [PATCH v2 1/3] dt-bindings: media: qcom,mahua-iris: Add Mahua
 video codec
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
Message-Id: <20261123-mahua_iris_enable-v2-1-b1a16b16afca@oss.qualcomm.com>
References: <20261123-mahua_iris_enable-v2-0-b1a16b16afca@oss.qualcomm.com>
In-Reply-To: <20261123-mahua_iris_enable-v2-0-b1a16b16afca@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795502648; l=6361;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=Fc8skBo7z7hLivpSawfUjpXsn2XbQN/qt2VC9DVAmnU=;
 b=2tcTKnEstG+Z88u0X4btAnAcKX5HqImX6vv2y62h1A/BKl5eOcThPxgDor8Kzeb92vS/bEgu1
 W1xgBAQgKIzDQNDL75qVfKxLwiKxx0IwwUzkUutzgP71aVKCUoMFokK
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyNiBTYWx0ZWRfXz1oxIGxw4Nwa
 2eaTqvGNBGQs56SPkcHTdmlSW5TWuMv9WEYEHUOmQc+6DXtogMy3YaDKrGiE+RAHQoTGOgTfQEY
 jPWtCoPRz/rHKx0EV/TTMK36kUKFGa8=
X-Proofpoint-ORIG-GUID: L8TDV3S7cBo4GevKQEv_wIqKLJMkLnU9
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b05323c cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=ZjsRUOjYzCQhN9IHvjYA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyNiBTYWx0ZWRfX6fr5tqiZSZIV
 1Cmi3h5AT9heTohb3AvFTlXI9SZod6Qrcpi+rpkxqhsGOLQrXpj6Ux0Unu0XNLwC5HhNpyJjb3f
 vqM4iA/iYxdLrp/l65F+wfMAkqxa1y6CTWq/HbsArYBzN/r/ig7sK193a+vFY/ZUvriZAz/XsU2
 klkS/EaloZMYo1Ghb7h314gU1nwdpvPIptBHY3urAleA6dn55rkKJtnJ6CJnZ/b8fZ3PoUE0AKE
 7geYLYmymIIUxGBVaT4DKB8SiuXFOuJLTcSQzEI06CRlqxpm/dgkuEVufMMzr9YYBKBYSWdKlzz
 CCpjdlHKSfctjDT6zBKh3Hxvpg/HdI+C0U4uDB2V3YZIQBBcXbXKohaQOUBYXLta88iOEK9gTj9
 PLJqgAGsOGH+DNNdwvI6d0IAfteR5ZD4IvIVNqcwzKbTVoAqLH4zq7CsKJpqKGEcFvuJT7Huw8Q
 ex0fr+8HYQ8REvrrEcQ==
X-Proofpoint-GUID: L8TDV3S7cBo4GevKQEv_wIqKLJMkLnU9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240026

Add a devicetree binding for the Iris3.9 video encoder and decoder block
found on the Qualcomm Mahua SoC. This is a single core derivative,
leveraging most of Glymur data with the clks, resets present only
for vcodec0 core.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,mahua-iris.yaml | 200 +++++++++++++++++++++
 1 file changed, 200 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,mahua-iris.yaml b/Documentation/devicetree/bindings/media/qcom,mahua-iris.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..5a96fd4ea08422daf3eb0fa832a75a4994e86ffa
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,mahua-iris.yaml
@@ -0,0 +1,200 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,mahua-iris.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Mahua SoC Iris video encoder and decoder
+
+maintainers:
+  - Vikash Garodia <vikash.garodia@oss.qualcomm.com>
+
+description:
+  The Iris video processing unit on Qualcomm Mahua SoC is a video encode and
+  decode accelerator.
+
+properties:
+  compatible:
+    const: qcom,mahua-iris
+
+  clocks:
+    maxItems: 6
+
+  clock-names:
+    items:
+      - const: core_iface
+      - const: core
+      - const: vcodec0_core
+      - const: vcodec0_iface
+      - const: core_freerun
+      - const: vcodec0_core_freerun
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
+  non-pixel:
+    type: object
+    properties:
+      iommus:
+        maxItems: 3
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
+      - const: mxc
+      - const: mmcx
+
+  resets:
+    maxItems: 4
+
+  reset-names:
+    items:
+      - const: core_bus
+      - const: vcodec0_bus
+      - const: core
+      - const: vcodec0_core
+
+required:
+  - clocks
+  - clock-names
+  - compatible
+  - dma-coherent
+  - interconnects
+  - interconnect-names
+  - power-domains
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
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    video-codec@aa00000 {
+        compatible = "qcom,mahua-iris";
+        reg = <0x0aa00000 0xf0000>;
+
+        clocks = <&gcc_video_axi0c_clk>,
+                 <&videocc_mvs0c_clk>,
+                 <&videocc_mvs0_clk>,
+                 <&gcc_video_axi0_clk>,
+                 <&videocc_mvs0c_freerun_clk>,
+                 <&videocc_mvs0_freerun_clk>;
+        clock-names = "core_iface",
+                      "core",
+                      "vcodec0_core",
+                      "vcodec0_iface",
+                      "core_freerun",
+                      "vcodec0_core_freerun";
+
+        dma-coherent;
+
+        interconnects = <&hsc_noc_master_appss_proc &config_noc_slave_venus_cfg>,
+                        <&mmss_noc_master_video &mc_virt_slave_ebi1>;
+        interconnect-names = "cpu-cfg",
+                             "video-mem";
+
+        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+        memory-region = <&video_mem>;
+
+        operating-points-v2 = <&iris_opp_table>;
+
+        power-domains = <&videocc_mvs0c_gdsc>,
+                        <&videocc_mvs0_gdsc>,
+                        <&rpmhpd RPMHPD_MXC>,
+                        <&rpmhpd RPMHPD_MMCX>;
+        power-domain-names = "venus",
+                             "vcodec0",
+                             "mxc",
+                             "mmcx";
+
+        resets = <&gcc_video_axi0c_clk_ares>,
+                 <&gcc_video_axi0_clk_ares>,
+                 <&videocc_mvs0c_freerun_clk_ares>,
+                 <&videocc_mvs0_freerun_clk_ares>;
+        reset-names = "core_bus",
+                      "vcodec0_bus",
+                      "core",
+                      "vcodec0_core";
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        dma-ranges = <0x0 0x0 0xffe00000>;
+
+        non-pixel {
+            iommus = <&apps_smmu 0x1940 0x0000>,
+                     <&apps_smmu 0x1944 0x0000>,
+                     <&apps_smmu 0x19e0 0x0000>;
+            iommu-ranges = <0x25800000 0xda600000>;
+        };
+
+        pixel {
+            iommus = <&apps_smmu 0x1943 0x0000>;
+        };
+
+        video-firmware {
+            iommus = <&apps_smmu 0x19e2 0x0000>;
+        };
+
+        iris_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-240000000 {
+                opp-hz = /bits/ 64 <240000000 360000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-338000000 {
+                opp-hz = /bits/ 64 <338000000 507000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_svs>;
+            };
+
+            opp-366000000 {
+                opp-hz = /bits/ 64 <366000000 549000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-444000000 {
+                opp-hz = /bits/ 64 <444000000 666000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_nom>;
+            };
+
+            opp-533333334 {
+                opp-hz = /bits/ 64 <533333334 800000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_turbo>;
+            };
+
+            opp-655000000 {
+                opp-hz = /bits/ 64 <655000000 982000000>;
+                required-opps = <&rpmhpd_opp_nom>,
+                                <&rpmhpd_opp_turbo_l1>;
+            };
+        };
+    };

-- 
2.34.1

