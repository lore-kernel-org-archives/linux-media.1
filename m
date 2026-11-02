Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616153;
	b=YPyBixEqgR+hcQFH0xFVPHv2ABMHoiSplvRuPBZVGVXKPWzIB46TyGQYOPkiCCtYPeRE
	 ZPEzuF38RcEdzZtbRDPruS4puqGNZvcFIbB+R9wfzrOKxelBLtjmXpb3UEqDCzx7bu60w
	 gVdShJ99T7IihsGeJwssVKRvVHsWbfkXj4EX3hOM2r2TlUztUPtbLKaGrWw8r5bfiqbhk
	 agMsP6Nm9hfaek3dVGWgmMCIxzX3xw4RJrPayYtAgV63PfKnQze4ILHCt42A5lKyCtBHN
	 EUkRXCB05D/cUYB6Gcg4xKjCYj7bGXImszP9Z4qfzMXe/AXySp6viYE/HDjG0VbFYjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616153;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cn4iBg+xzn7OmHstqqp/y2jUxX7t+xPFAar8TrRHGe4=;
	b=iPT8issSmkQKRgKduSRVaOP2f35eil46sdVIrkaUuQhMIIBJJi33rx2L+nSEc0ZYH+1i
	 VJx7VWkGpgRrvLvhkpRnMR+MFzHGcTMcWFJXmFvhrO1WhzoSMsRCOx7pv7bKHR48AXRaj
	 BCKvlH0shruVXa8isTqDTfAzHz4Duu8vGn7npJVN07QoOEdsc3gZLyRHrTLvLhdR7BGit
	 E56NOetR4n/VDW9pizPv+LCFv2UvtyAJcVIyI6WJzBUtQwIvHG532nf93eqsJ3dNCjJ49
	 VvWy/k2CqFGEwa2Jwy5lbS7tNXjN7Nn6mqhfnwm8enQ31CtmstnT9YA5sQyJj6vP+VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hajDjFh+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AoAh2HWD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0696C60A263C
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 10:42:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0696C60A263C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hajDjFh+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AoAh2HWD
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A299xol3430281
	for <linux-media@vger.kernel.org>; Mon, 2 Nov 2026 10:42:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cn4iBg+xzn7OmHstqqp/y2jUxX7t+xPFAar8TrRHGe4=; b=hajDjFh+a6njRLz0
	C3Zysr07Qx2tEj0CisP5zj6Jd2wFWaxzhPznuq9KPkimqNjKG9gEwx/agGeFPxyV
	3FjOcG5pDlgqWFBwzPhWc+MeQDAirT6VqPIIIgEaHhDW9NyXzG3tc1xw55vLQMiO
	Tu2yp0P61bGT4MHsUwdeonWAaoobISCBaM1gKPl2hJO5blzBHnpn/WT5mFN0Pz3Y
	+NWtdmTBFQUMdK40nOnF+u5OK0fk0CMtvvxGE2Tv5oJGE5GmvH4ho1GAX7LKCvaI
	kbLb5j6jL+t1Op8hrxQhyUHCQ97KUNtwNJEiZfnBWgVYzCJj7Kcx7EzMDvVq8cWl
	UvLr9A==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpnmervxh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 10:42:26 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-5640a2d9708so3936848b6e.1
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 02:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793616146; x=1794220946; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cn4iBg+xzn7OmHstqqp/y2jUxX7t+xPFAar8TrRHGe4=;
        b=AoAh2HWD7+zJMppFU+fGTgICuUNWBp0yuHV6RWEXtzcicNZQY6/KbxahYh245HK4SA
         30P+6Xx1Woxln7RBSJ2MA9psX+vOF7WZlHfD+J96wZ+OIJ0Pjzg/9Hv/iw0TeNqlCYc3
         BMW4H7J+f5sMBdO4rdni1vkhwDS5rq8LBSmcaIrpoq7G44edJVFTZakNRmwlJ97xJDRy
         UcPMGJPoWSEPXBc4eXnTfWeGvSLnAZhgpdmjyTyjnuPn47JSIt2oTevEZYnBiojME9qU
         3QY328HSGuGisyPVfxDCRYzGT1pp0F8QeT5ufS7W+WmeB+hFFeP7Nj1gHGm+POvw+lMN
         JFzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616146; x=1794220946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cn4iBg+xzn7OmHstqqp/y2jUxX7t+xPFAar8TrRHGe4=;
        b=jY9eDCwP59cEi0XjRSdRjwbxtrP1JPWpdLMEZGnGZ4Ej3lEXV1Z7LkhrK9fUl7o5AX
         4o2U/WVhHtg/QcnsrgUmGf7kKDIxI89vi1XHdaysbzp6M02/fLO625X8NDLR5WHmXnX9
         7zD0jb8G2+KkEzmIRjVeDNRfOneXZWRnBYUW+UK1giBtLF7r0slbAjAudA8jxPCjMnmx
         NKHiORdkklZekipxStAff0LcvYUkbwXQa7Nl8dEFPoPmgyMbznoxzM74BVTeHdXflgOJ
         U4v0geAa+0pYx4/xLGMm72SsLELxarbN5iEuPNHviuPvc6yJYESeHOZuH/K6t6l+ni5c
         N5mA==
X-Forwarded-Encrypted: i=1; AKwUvBx4Q/ZtUpV4inTX1759vloQXCV5FpQWZbzEjb2hh6wDuxgnkBCTB8pzyguUgLqX+C3dLrYo8e/BWngHRQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLjcVOhPGGsTXH5IrNmQfT1JF7KU45CQimPImahnoaOJNDImivy
	EnTMvLRgGtCMAkX4i//aly7a97bYolU+XlxCV7jwt284DIq3db14XPEIzAgfy/MFkgkn5u2XlwO
	PLLV5FrIddP6t4xfh7VWf2Os9Wx0oAa/G4tV9IWBeXekQw2J1aQi9jGWgn6bV0thYOA==
X-Gm-Gg: AYBFou34Ekj8N30TtJtgmqME4Uv63jo7JADqdlpPKXA6XvW2PmclMC0H/AKvZ5oWAm/
	Ex7L4Ae8IrWQKke2VqtYjTn9xsymnXLNYIw6rs0L2Vg33nD2sR1sd8h+qR7dCRy1fXrBBczIgGU
	xZIMOiurkPYE9pgznyV5UiVRYVndwGq8zwJSDtREOeXcOerPAGyA05WjXo/WPBa3xTfvipCi24Y
	RlqPnfxibty5QXH6TrBaoj2rx1YE3BdNcRxzIkeTHCbDav2T6ePErZJtRQcav+JiW5dYvTvgr8p
	Rg9IZCPFcc8oZCcAvzbd9+PA2oxO16AYdt6DsG7aoF1PZm2KmbVAwas+QBCroC8vCpFmk9ozwJh
	EXcQBvbrMWQFwYleY7uAbtwL5sbTlFqQ3IfdprRzpjmJnJxx0KJWY3hfGMhb7oULbzRz+/+ktAQ
	9x7f2OVoWRbOOUZtqUWEW3S03KQ/MwXDAttNX7yf67cDfay/KU8XzxfiXk3so=
X-Received: by 2002:a05:6808:670d:b0:4d6:90f3:74a4 with SMTP id 5614622812f47-5640def68demr6480944b6e.47.1793616146116;
        Mon, 02 Nov 2026 02:42:26 -0800 (PST)
X-Received: by 2002:a05:6808:670d:b0:4d6:90f3:74a4 with SMTP id 5614622812f47-5640def68demr6480934b6e.47.1793616145594;
        Mon, 02 Nov 2026 02:42:25 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe0fc77sm7447171b6e.12.2026.11.02.02.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:42:24 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 02:42:13 -0800
Subject: [PATCH v24 05/15] media: dt-bindings: Add CAMSS device for
 Kaanapali
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
Message-Id: <20261102-kaanapali-camss-v24-5-d6b8f3f6f66f@oss.qualcomm.com>
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
In-Reply-To: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Authority-Analysis: v=2.4 cv=KZ1HIgYD c=1 sm=1 tr=0 ts=6ae86912 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=yzr0uxE_ijXmPgLYsrIA:9 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX1EpmlRHg6hd0
 QzSLW3vCruXwDZQ55AmEmHxl+urTJx+CboVFwDtWQUGtvzldBNi1FukrpOBjt+VKCFo7cDEunsF
 2ykiunicZ07j7YeNuVfLe1aPnnYWeiM98Z0ce/N/UIA/kzZunBFI+coBw3LRSszn+jl+Og2b723
 Le0synFCgYvoaEBLVX0sMtdEd10NAf92rf8ealwHjQuW1KIkbC4R9OH9JqcO6uwMfeFHj5Ix9zG
 4fblO92rsF9iY3v8tcf3nbiGkr6HEkWKCLuQE7hDNxhMO4XOjdZpmaIN4E5OQu2JE9yAI0PyRxB
 HofqCoMMekN378vG1JAsRL5DpFoX94iTUS+Q+Gu8wMIfLkJ7jlx7SCIGbdMZ0qK5/ipSb+PtsYN
 G202PVlDcN5wfSfbMJpTJhfFCSR7TVekn4+0ynceU+lvzQjjMmA7DHV58qCBTzGRIXU9E1OLtmU
 p7i3bujMoHQhKIi+7NQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfXzoYnIXNE8eOb
 3MfTZcZyKW7PKs/Zqvb9vUrWj8CvRTlwuypPPXt4dk3GNXIijvaq/yIBcTbHyf6QTawoyeCjkPi
 Uax4CeNqf27aBgo0GNTsRZFUZHn01Ew=
X-Proofpoint-ORIG-GUID: cqcMNp_bHua0UA06BnhepMX8YsyDr_0e
X-Proofpoint-GUID: cqcMNp_bHua0UA06BnhepMX8YsyDr_0e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020042

Add bindings for Camera Subsystem (CAMSS) on the Qualcomm Kaanapali
platform.

The Kaanapali platform provides:
- 6 x CSIPHY (CSI Physical Layer)
- 3 x TPG (Test Pattern Generator)
- 3 x CSID (CSI Decoder)
- 2 x CSID Lite
- 3 x VFE (Video Front End), 5 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE Lite

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 .../bindings/media/qcom,kaanapali-camss.yaml       | 303 +++++++++++++++++++++
 1 file changed, 303 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
new file mode 100644
index 000000000000..f64eb925b641
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
@@ -0,0 +1,303 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,kaanapali-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Kaanapali Camera Subsystem (CAMSS)
+
+maintainers:
+  - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
+
+description:
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
+
+properties:
+  compatible:
+    const: qcom,kaanapali-camss
+
+  reg:
+    maxItems: 14
+
+  reg-names:
+    items:
+      - const: top
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: tpg0
+      - const: tpg1
+      - const: tpg2
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  clocks:
+    maxItems: 22
+
+  clock-names:
+    items:
+      - const: camnoc_nrt_axi
+      - const: camnoc_rt_axi
+      - const: cpas_ahb
+      - const: cpas_fast_ahb
+      - const: cpas_vfe0
+      - const: cpas_vfe1
+      - const: cpas_vfe2
+      - const: cpas_vfe_lite
+      - const: csid
+      - const: csiphy_rx
+      - const: gcc_axi_hf
+      - const: vfe0
+      - const: vfe0_fast_ahb
+      - const: vfe1
+      - const: vfe1_fast_ahb
+      - const: vfe2
+      - const: vfe2_fast_ahb
+      - const: vfe_lite
+      - const: vfe_lite_ahb
+      - const: vfe_lite_cphy_rx
+      - const: vfe_lite_csid
+      - const: qdss_debug_xo
+
+  interrupts:
+    maxItems: 10
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: ahb
+      - const: hf_mnoc
+
+  iommus:
+    items:
+      - description: S1 HLOS IFE non-protected stream
+
+  power-domains:
+    items:
+      - description: IFE0 GDSC - Global Distributed Switch Controller for IFE0.
+      - description: IFE1 GDSC - Global Distributed Switch Controller for IFE1.
+      - description: IFE2 GDSC - Global Distributed Switch Controller for IFE2.
+      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
+
+  power-domain-names:
+    items:
+      - const: ife0
+      - const: ife1
+      - const: ife2
+      - const: top
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    description:
+      CSI input ports. Each port receives the CSI data
+      decoded by the matching CSIPHY.
+
+    patternProperties:
+      "^port@[0-5]$":
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port for receiving CSI data from CSIPHY 0-5.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+              bus-type:
+                enum:
+                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
+                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
+
+            required:
+              - data-lanes
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domains
+  - power-domain-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,kaanapali-gcc.h>
+    #include <dt-bindings/clock/qcom,kaanapali-camcc.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        isp@900b000 {
+            compatible = "qcom,kaanapali-camss";
+
+            reg = <0x0 0x0900b000 0x0 0x1000>,
+                  <0x0 0x09253000 0x0 0x5e80>,
+                  <0x0 0x09263000 0x0 0x5e80>,
+                  <0x0 0x09273000 0x0 0x5e80>,
+                  <0x0 0x092d3000 0x0 0x3880>,
+                  <0x0 0x092e7000 0x0 0x3880>,
+                  <0x0 0x093fd000 0x0 0x400>,
+                  <0x0 0x093fe000 0x0 0x400>,
+                  <0x0 0x093ff000 0x0 0x400>,
+                  <0x0 0x09151000 0x0 0x20000>,
+                  <0x0 0x09171000 0x0 0x20000>,
+                  <0x0 0x09191000 0x0 0x20000>,
+                  <0x0 0x092dc000 0x0 0x1300>,
+                  <0x0 0x092f0000 0x0 0x1300>;
+
+            reg-names = "top",
+                        "csid0",
+                        "csid1",
+                        "csid2",
+                        "csid_lite0",
+                        "csid_lite1",
+                        "tpg0",
+                        "tpg1",
+                        "tpg2",
+                        "vfe0",
+                        "vfe1",
+                        "vfe2",
+                        "vfe_lite0",
+                        "vfe_lite1";
+
+            clocks = <&camcc CAM_CC_CAMNOC_NRT_AXI_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_AXI_CLK>,
+                     <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+                     <&camcc CAM_CC_CAM_TOP_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_CSID_CLK>,
+                     <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                     <&camcc CAM_CC_TFE_0_MAIN_CLK>,
+                     <&camcc CAM_CC_TFE_0_MAIN_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_TFE_1_MAIN_CLK>,
+                     <&camcc CAM_CC_TFE_1_MAIN_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_TFE_2_MAIN_CLK>,
+                     <&camcc CAM_CC_TFE_2_MAIN_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+                     <&camcc CAM_CC_QDSS_DEBUG_XO_CLK>;
+
+            clock-names = "camnoc_nrt_axi",
+                          "camnoc_rt_axi",
+                          "cpas_ahb",
+                          "cpas_fast_ahb",
+                          "cpas_vfe0",
+                          "cpas_vfe1",
+                          "cpas_vfe2",
+                          "cpas_vfe_lite",
+                          "csid",
+                          "csiphy_rx",
+                          "gcc_axi_hf",
+                          "vfe0",
+                          "vfe0_fast_ahb",
+                          "vfe1",
+                          "vfe1_fast_ahb",
+                          "vfe2",
+                          "vfe2_fast_ahb",
+                          "vfe_lite",
+                          "vfe_lite_ahb",
+                          "vfe_lite_cphy_rx",
+                          "vfe_lite_csid",
+                          "qdss_debug_xo";
+
+            interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 433 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 457 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>;
+
+            interrupt-names = "csid0",
+                              "csid1",
+                              "csid2",
+                              "csid_lite0",
+                              "csid_lite1",
+                              "vfe0",
+                              "vfe1",
+                              "vfe2",
+                              "vfe_lite0",
+                              "vfe_lite1";
+
+            interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                            <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+            interconnect-names = "ahb",
+                                 "hf_mnoc";
+
+            iommus = <&apps_smmu 0x1c00 0x00>;
+
+            power-domains = <&camcc CAM_CC_TFE_0_GDSC>,
+                            <&camcc CAM_CC_TFE_1_GDSC>,
+                            <&camcc CAM_CC_TFE_2_GDSC>,
+                            <&camcc CAM_CC_TITAN_TOP_GDSC>;
+            power-domain-names = "ife0",
+                                 "ife1",
+                                 "ife2",
+                                 "top";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    camss_csiphy0_ep: endpoint {
+                        data-lanes = <1 2 3 4>;
+                        remote-endpoint = <&csiphy0_out>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.34.1

