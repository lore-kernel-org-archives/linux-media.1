Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7009F495AF3
	for <linux-media@vger.kernel.org>; Fri,  9 Oct 2026 08:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791533526; cv=none; b=lIF0Ay0Yq6daAtXBpLixQpwJclAhVDTUMZ9AAfwpWCbEqUn5s0JeR1l8r1Ba3cw0NclVa2zd+uUIqj0Lk3exHrHLzrWlkBKVdATvI2jpluG9i9iI8bcEe9bEZpC7SnBYS5B8A99X0h0HRQVtecsztJACA9xXYB2XzGFqUBYHxZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791533526; c=relaxed/simple;
	bh=UOrkDJYQJYd6kOzydkNyLHija7UYmYMjcdt3XAcLsl8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iTyTcB53V0TtJIuSyTRpGhmdDdWxe2Y743SI2d2qxvbhwikpoLyjg1GeV8djTEolJ8CGpbwy4NB48jFQaAqIveSmHn/MsE5eYdKrNpKH7YJ7cjRifkgG+k2+gAxPCCxXw93GEeIEHvjCm4LD4hApgKv7KYME3/QtVSB3EoCXmHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kmhIuaFy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=An3ODVmB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kmhIuaFy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="An3ODVmB"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HIcf564671
	for <linux-media@vger.kernel.org>; Fri, 9 Oct 2026 08:11:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RmJP0GhDQoD1XIG/rVhRjfc8NwcRuCcO9rBQihU1/4M=; b=kmhIuaFyKxXjUNl4
	7l9JZcxOa8poDIDQOxBmiz+q/tXMS8c+jraApRCVb9bD7bTMmFasDK/by4TTvGql
	ficGyYlv3dmJ5JtHfeRbMpH/frDJvjn0s3c9Jq6eEKSDcyKDEokTk3LZwKU3gSw3
	MXpJw++KMDuPOdxvT3uhWv7trF6H18rkCbFsNd8VN46/0akPQ5xS2lxZVO0ldMx7
	G1Nj57IgKmaxyA7v+0hfN/mGHlqBsadN20abeOq+AZsnI05gLn2oipzs2VHkUglL
	Bm4EpQGd0jFXZuY2NR0qwANFToTV4XkNYSSMDNUXIhKWagmQ42IeTFVvtw+RgaSd
	vrkXVQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxkahew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 09 Oct 2026 08:11:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a082c014aso459957785a.0
        for <linux-media@vger.kernel.org>; Fri, 09 Oct 2026 01:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791533513; x=1792138313; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RmJP0GhDQoD1XIG/rVhRjfc8NwcRuCcO9rBQihU1/4M=;
        b=An3ODVmBsX7pXVZ5MibmdX9hkTXQEejmpRnC/LNHd9AyJ8eVzO06NuwCWQpGaRZtlT
         +QMbnvrvpywYEEk7xzQTBVwt/+jHbP5d0QhLYNH5kFD+h/SLu404Y+rH1TRkdZHa3b4a
         ds4BWtVeShhMw+UvnoxeiBUrWWY8yD3icNzL2KQYde6us2Na325kRxXyPPAfbow3A0mQ
         MFWFaAa4HIro18zOm48NNcAeDzlr3c908Vb434MsgJzVQrefTySvyJtotytqE1quyB/T
         5oRENNw+4ccbIHp0WYN4k5XevwlgZoeVSWiAnO4tczxTbEVOSTNpM3wX+DDev+7oF3rE
         LxNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791533513; x=1792138313;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RmJP0GhDQoD1XIG/rVhRjfc8NwcRuCcO9rBQihU1/4M=;
        b=YWl+YWOg4gpdi0AFDT/cMZIP3gLc+XC70GKZPGqQLUzg07vl+WGGH3bhRHlmsuKUD9
         ugJURvFsby+z4F15uIRAHIFp99GLs4NL+ovQcSXCcjZWj/W2Zb3PbtQBeqc1IXbabPJ1
         SqqYBj/7bPkRDZZp0BRVMzhuY8TLzhQDIVtRvakSf0xi2cgBczotu1mdYzDoyZdcLtu1
         z59XQDEXZIm1DaXOmcwyR7DAEjdNZE7vj792XdlqtoHpus+Em/5pANrD9oEri8NC1gyu
         jszxhcl9Z2pV3+hSNJixhX/i8rPJPIkIuT/2YiEhaNri9RZbYDvFoOcHgik36nqls+7d
         ZQXQ==
X-Gm-Message-State: AFuF++kM1qhG2r5YQVRqY8q6jNGNMqmr1JwgAM9GoLgQJ9v2xOboQ3+w
	mYT7DB3bDArDGyJSLHT1yry/gIuyIlx17LlOiXD/sgH/mzaY/pe9ZgFhyUv7ulVWByyOEsdQl76
	vKgVk7Uh2MoE4Ry0J58l9n2uNBtJO1dQ9ud2b1pqqyUoUEq4EJ0EHWCEL+rvcXXugyA==
X-Gm-Gg: AYBFou0xeLQ1Gf+Zoxz/+mvaIcXmSIFcJu+LpVkhZOmGUKglNB4rjHBcPvnycsa4TpP
	26mhOO3ouLZi9GRvER/+gn5qVmfvTxJkP/CQqeZW3/YSCUn3JqjsDEGaLkfKthBsqlQopBNv2zS
	5i3JeVNwNRmmtbx5szLZztAFsVdtMvsLk2sg2Lvm0O3rhj0RHU9dqG9/neVpMuCnadVThfmYqpc
	Ey4IpaMqjsonzQx80OFNZRodWJ2WUYHfOfuijUzrZqTmBziAYxgnNqkT88GZhUOYdxGw9s0qQFy
	qY0mIwaIxOCrw213WgVyqDUM6v78gPGMS+H3cWvgBHD7V6rcQiNxaxI8qUHwbz6Ysv59YSgb6XV
	87pkNQu+D/NjuRgVRGur4oAxI5qJUfWMZyKXP+wFlkeFEkraM2zHNlFajiT3ZfarrAjHG
X-Received: by 2002:a05:620a:7117:b0:93e:98a0:f9e6 with SMTP id af79cd13be357-93eb9668452mr255942585a.30.1791533512993;
        Fri, 09 Oct 2026 01:11:52 -0700 (PDT)
X-Received: by 2002:a05:620a:7117:b0:93e:98a0:f9e6 with SMTP id af79cd13be357-93eb9668452mr255940885a.30.1791533512524;
        Fri, 09 Oct 2026 01:11:52 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb986c0c4sm130780685a.18.2026.10.09.01.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 01:11:52 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 16:11:20 +0800
Subject: [PATCH v5 1/3] dt-bindings: media: Add qcom,x1p42100-camss
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-purwa_camss-v5-1-58c13dc7c4d2@oss.qualcomm.com>
References: <20261009-purwa_camss-v5-0-58c13dc7c4d2@oss.qualcomm.com>
In-Reply-To: <20261009-purwa_camss-v5-0-58c13dc7c4d2@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791533502; l=9089;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=UOrkDJYQJYd6kOzydkNyLHija7UYmYMjcdt3XAcLsl8=;
 b=igd+U5VNLwojR/eHLJ+ZRxOJtJUIxCtCEY9pLWdV6Yv0M9QRnEJGWrM93I4eo8TgSwJhfvrp6
 Ve4ONN5CB2/BMFpyCiDHhrTCGey3OOByOYFROJNidj8+3y7vApnFZk9
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: YHvvYUzef_xHFv5I25ctuEvUb6Scf8Hf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfX/+2Tm0VZO5+g
 6b3yuk8uZbr5pQBc5acLSPHA1UHiEB30BSeHr1a7WcKN15zG8Df3xGCVjHRGIl/Cm5P5GhRyeu6
 YD8cPRzMWoKNhS79y4c+Ba3DkCS92PI=
X-Authority-Analysis: v=2.4 cv=Cs0q4X4D c=1 sm=1 tr=0 ts=6ac8a1c9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=2DfPVCEIPBpRJJTYYFsA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfX6ui+u0W+pICJ
 bKXJZNZk0yI46keEOBSshNOi8eYC2pdIZ4+V2BYLml9RUDWxdMqUJPUx+tVPwpbXgAeIVaQTvSv
 y1ujxEPLXG9cwLb5ezk5iFM42HNPUe6E9YdPKHu0HYrbIFOW5EM4uBabk9RT+sHx9labJsxCX1L
 8EqGk+wXLI43BqkIoytB9eXAbsy5G5Hs7ARggCFWMSIOkkfUA8j38hCKV2E8tooRmMo6Tt3LtT9
 RNQcH9zHRR+KCgVPQgA8iBohH1XxKYZSxy+nM7QIBdDgXf3DWZMeQC3HHR1TgAmLiA7k5c0qnIh
 IlDEuLBWtFN8npL4qPrZYnPxtdjyVWa5Tkrt430LfmD26u5efhd5xuqgrl5k1lsK88nzqd9JLRh
 1ysINqWNr2Q6mvB7xb37Qg7MyAc8GcuO2te+olpvs7kP/ifkLpgxmuK8ws5/w+JDtBUODmaKkS3
 qFvnMwxwRgxenmbSHRg==
X-Proofpoint-ORIG-GUID: YHvvYUzef_xHFv5I25ctuEvUb6Scf8Hf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090032

Add bindings for the Camera Subsystem for X1P42100.

The X1P42100 platform provides:
- 2 x CSIPHY
- 3 x TPG
- 3 x CSID
- 2 x CSID Lite
- 1 x IFE
- 2 x IFE Lite

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 .../bindings/media/qcom,x1p42100-camss.yaml        | 263 +++++++++++++++++++++
 1 file changed, 263 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1p42100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1p42100-camss.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..c5ea7a7d9fe5025bb15cbddd85b915d136083447
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,x1p42100-camss.yaml
@@ -0,0 +1,263 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,x1p42100-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm X1P42100 Camera Subsystem (CAMSS)
+
+maintainers:
+  - Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
+
+description:
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
+
+properties:
+  compatible:
+    const: qcom,x1p42100-camss
+
+  reg:
+    maxItems: 12
+
+  reg-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: csid_wrapper
+      - const: csitpg0
+      - const: csitpg1
+      - const: csitpg2
+      - const: vfe0
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  clocks:
+    maxItems: 14
+
+  clock-names:
+    items:
+      - const: camnoc_rt_axi
+      - const: cpas_ahb
+      - const: cpas_fast_ahb
+      - const: cpas_vfe0
+      - const: cpas_vfe_lite
+      - const: csid
+      - const: csid_csiphy_rx
+      - const: gcc_axi_hf
+      - const: vfe0
+      - const: vfe0_fast_ahb
+      - const: vfe_lite
+      - const: vfe_lite_ahb
+      - const: vfe_lite_cphy_rx
+      - const: vfe_lite_csid
+
+  interrupts:
+    maxItems: 8
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: vfe0
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
+      - description: S1 HLOS IFE and IFE_LITE non-protected read
+      - description: S1 HLOS IFE and IFE_LITE non-protected write
+
+  power-domains:
+    items:
+      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
+
+  power-domain-names:
+    items:
+      - const: ife0
+      - const: top
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    description:
+      CSI input ports, one per CSID. Each port receives the CSI data
+      decoded by the matching CSIPHY.
+
+    patternProperties:
+      "^port@[01]$":
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port for receiving CSI data from a CSIPHY.
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
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
+    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        isp@acb7000 {
+            compatible = "qcom,x1p42100-camss";
+
+            reg = <0 0x0acb7000 0 0x2000>,
+                  <0 0x0acb9000 0 0x2000>,
+                  <0 0x0acbb000 0 0x2000>,
+                  <0 0x0acc6000 0 0x1000>,
+                  <0 0x0acca000 0 0x1000>,
+                  <0 0x0acb6000 0 0x1000>,
+                  <0 0x0acf6000 0 0x1000>,
+                  <0 0x0acf7000 0 0x1000>,
+                  <0 0x0acf8000 0 0x1000>,
+                  <0 0x0ac62000 0 0xf000>,
+                  <0 0x0acc7000 0 0x1000>,
+                  <0 0x0accb000 0 0x1000>;
+
+            reg-names = "csid0",
+                        "csid1",
+                        "csid2",
+                        "csid_lite0",
+                        "csid_lite1",
+                        "csid_wrapper",
+                        "csitpg0",
+                        "csitpg1",
+                        "csitpg2",
+                        "vfe0",
+                        "vfe_lite0",
+                        "vfe_lite1";
+
+            clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+                     <&camcc CAM_CC_CPAS_AHB_CLK>,
+                     <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_CPAS_IFE_0_CLK>,
+                     <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_CSID_CLK>,
+                     <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                     <&camcc CAM_CC_IFE_0_CLK>,
+                     <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
+
+            clock-names = "camnoc_rt_axi",
+                          "cpas_ahb",
+                          "cpas_fast_ahb",
+                          "cpas_vfe0",
+                          "cpas_vfe_lite",
+                          "csid",
+                          "csid_csiphy_rx",
+                          "gcc_axi_hf",
+                          "vfe0",
+                          "vfe0_fast_ahb",
+                          "vfe_lite",
+                          "vfe_lite_ahb",
+                          "vfe_lite_cphy_rx",
+                          "vfe_lite_csid";
+
+            interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
+
+            interrupt-names = "csid0",
+                              "csid1",
+                              "csid2",
+                              "csid_lite0",
+                              "csid_lite1",
+                              "vfe0",
+                              "vfe_lite0",
+                              "vfe_lite1";
+
+            interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                            <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+
+            interconnect-names = "ahb",
+                                 "hf_mnoc";
+
+            iommus = <&apps_smmu 0x800 0x60>,
+                     <&apps_smmu 0x820 0x60>;
+
+            power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
+                            <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+            power-domain-names = "ife0",
+                                 "top";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    camss_csiphy0_ep: endpoint {
+                        data-lanes = <1 2>;
+                        remote-endpoint = <&csiphy0_out>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.34.1

