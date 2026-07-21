Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E06F46E01F
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 17:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784655183; cv=none; b=PsRGNYmGp9IZAjHOFlRZgWsYOedhu2MSso4crj9hG6H/7j8f2IK0ZK2JhBNTYZ9eogCYiweUXTzm29GkhA3CYW3jWC068oIAZH9GPYmXJlTUV+TR551f2bcyM6Pb6bhKNoDBlVn0ZO99+aZnZjUUXCvA2rtP8Tp97b/1P8a1oIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784655183; c=relaxed/simple;
	bh=CggmOQ31MuRitr0vhB2RYDOt0RdlNTJib0BCVSwnUCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=brUTaBZcicmjecTVUWqCCFTdj6a44I46PTiDkTD7jn+9cM90M6M2feDbGV2klMi9AXuyobUeBzTsUz5QjALGeSnRQjqaZNeu9vvo9oOPP7CyakdH+Pb1ASAu/Oj5vTva1RRpcyhMohNuxMz91xtk12HXofzEqkydxzTuuEvFORI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TSkgp2WJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VNFDHv/m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TSkgp2WJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VNFDHv/m"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LHRMd52446039
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 17:33:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3ZV0byA1dI7N48pHPo0h4yPfRaU6wDmRZ7alAnATw3A=; b=TSkgp2WJp765zYf0
	frysoiWLG8iVPGIsYh3MnG7NxpjXOsGeb33Hu4DCse5SAvDUmS102Le5U9bfw2I4
	n1AamYr83PWJO0v7HqL+CdXkr3Pzgqpd+cR4NRRnq40sNm12h1bOG6WvgGdHH6oh
	xIIQObtMioFNYguYVLP1YSq38Yx8R7d9+wi1DHVEInDGkEiKMxDM7teI2r7z2UZn
	eQ7aTPFuoo8e6RrmbTO2uvfOpbFmT/fxlgKckpxx75u7izEOHduZ1cAbe+mpLRMB
	Sbp5/zQdEhIwsY093TMk67fCixULZIWsce4SWYfq+DP/8cOoyiyHGh3VyQc343O/
	ehYwXg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6d00ra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 17:33:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc6dd43737so218759545ad.2
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 10:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784655180; x=1785259980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ZV0byA1dI7N48pHPo0h4yPfRaU6wDmRZ7alAnATw3A=;
        b=VNFDHv/m01MP1x7ygIQi+f4ysp5iOiub1YW7G90CfniTboLJXfu4/Ri6kkHXk80BJG
         i/94man4uBMUbkiHOgqQL9hZzyY43kxvP0gayhjVIQII+Prssa/APnczgPqnKIQM3Zyi
         kJJh+U8bXHAJtTrJ99qPUkf5yO3/mH2xKHV7Xr4pjzcsIE9adoZ/dPlcPGV9BZffEX0U
         JDm5lclHvM/m+wf3fVeNjnyW1PZcflPE5UIwbZOYEnVhfUnBMtQX8M/uB1s3B9wsEsVi
         KW3J+obovNfO4oXEjI/JrA/09d3W0wHiTIVF75sLQqCA+VrOnozPDusMB6V0Tk714y3e
         5mxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784655180; x=1785259980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ZV0byA1dI7N48pHPo0h4yPfRaU6wDmRZ7alAnATw3A=;
        b=b/PbhsMp0/gKyrnMs+knu+tcQ+w+PYYBBLo92lMEqNSpX5cRYLpgZNGKqlfrfQ6He5
         sAYVYgfiRRhXKhT491o2g7+HEhYE3SgO01S2uHt2F1CfjDBQ/wAqwnBvn2juri9UDoTd
         IOs9yA6xyuTPbqKwwivixJQUvz+eE2aIN96aCWvMez1VIHJb2SP0EdEXtao8vutxNuan
         f+ANvaFZjIr6PxUJn+5LmzhGdsP02d/W5JZnHAqmsIkDqa06L+gsuu67/73Uu7ZPLqQQ
         TKKGU9JCq97CJPXTA+LcKS7ufFOim7FgHtI6CBTuTP7SDviVjVf+9spvIn3lCjxrYa6w
         Cu/A==
X-Forwarded-Encrypted: i=1; AHgh+RrZkYTCt9o1UYHpTVOdaQxXadBJnY5y8SOSMsTlaVvsNGKsaX321MZIVApw/W/Dkq/y8hWznSRUQDtq3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLNIoZC/OGL1ZvvIkeiDZz4rPREjTcwF1QF6PDNXR4mGmM5foB
	A6X+exE8yx7QrjX5ZIv1+XcW4zcufVj5UM08hxiCOzqDKfEwvh4vgV+5st9ZCjDAfpniJ5jh1P/
	bjN+sgOo4rF6LY4y7vNOgaMynfl04WEMTdYTpxWvSNdUuWYu0Lo/fbnyhtTvnlPkv3g==
X-Gm-Gg: AR+sD13/6YoCubJafiejSOH6Jn3MBDebvuY3LUqnh23FstNp0WvouJZY7W46iNlawXK
	DS+EHmCfTQjkw25vdopJUwn5SIn+4aKTgOYZU7yOLcJBDc0uyF/WCm8QQ2gwo35eiZuP24KWG3h
	j+HLkjqTsr2qv3f0oigYvlj/+Xo5KPJjw5T2PraL2shv6ghPc9yXXmOwi7f7zPBPfBThiLHdTp/
	28mEBKoUrLj7ZjqWz3+dHT/e/71spRdM+ZYMvyMzRAk+RhsirQC4voFtpPIuS/DImDYnBX1ECvH
	73R9eqW1GCRB7qU5HJmvmRn5ARIyhCsCLshvqjvzkRSQUPz9ir1iw8qqujJatFP1/SVxd0phXDm
	Pndup4F2ZnZpJBPoIeFe5eYPTxRGoTz84q28=
X-Received: by 2002:a05:6a21:9206:b0:3bf:c223:4640 with SMTP id adf61e73a8af0-3c3ad807e3dmr20042604637.32.1784655179719;
        Tue, 21 Jul 2026 10:32:59 -0700 (PDT)
X-Received: by 2002:a05:6a21:9206:b0:3bf:c223:4640 with SMTP id adf61e73a8af0-3c3ad807e3dmr20042309637.32.1784655174241;
        Tue, 21 Jul 2026 10:32:54 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1bc886sm710881eec.26.2026.07.21.10.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 10:32:53 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 23:02:25 +0530
Subject: [PATCH v4 1/3] dt-bindings: media: qcom,qcm2290-venus: document
 shikra Iris compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260721-shikra_vpu-v4-1-6dc5a8999b73@oss.qualcomm.com>
References: <20260721-shikra_vpu-v4-0-6dc5a8999b73@oss.qualcomm.com>
In-Reply-To: <20260721-shikra_vpu-v4-0-6dc5a8999b73@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784655163; l=3397;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=CggmOQ31MuRitr0vhB2RYDOt0RdlNTJib0BCVSwnUCQ=;
 b=MWCowY1kQ2kxAw0RZGU0Chv54inswuKbhMIKhUN4uZrq6bPkgvij4T2piou9UvSMQVNDYyoK8
 86IPQ1i43GhDcqjYYflMBrqR1PqEgQjRUX5YwF6wPtC2EmxWbS2GhFX
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: aOQFfrjAbN3V8KuHdmavy8RCnfZtX1ky
X-Proofpoint-ORIG-GUID: aOQFfrjAbN3V8KuHdmavy8RCnfZtX1ky
X-Authority-Analysis: v=2.4 cv=XaG5Co55 c=1 sm=1 tr=0 ts=6a5fad4c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=qEAlSW1Pjbp0CoYiPpMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE4NSBTYWx0ZWRfX9PumJZfmHbfi
 cdBzb4ZZfvl+d/mgm16+KszcyM8my/vlwctwfV+qVTXaATOg8I5ykXnYIrQQvBsgQbxV0lE50DN
 oAxSgonHKefQz8g2GQovgF4CMQruYDgK7Ve47I0xdG2pMNltF/W/R1xv40WsjJid15Pm3iHMKR5
 gqVpfUaxqAh1CB4MnRldPeGGNLnxbCZT/z3hF6pXnoXHOIgZIakF4DtCQTKNcRsLHuNMkWTBf7g
 VXEgDfw9PPspRlPanjn7KpBeWKPMrLyI8tohjf2tpVB/l4Q7fSD5h9Lr0GcudSeRtPTUZBQE3Al
 LZI4UsD95gmBTqdENxgT0+Ij3ZoN831v/DLLNzi10J1Qo35hNZmckW3nG1t+mnMcgsnh6oo38XB
 RTze2N29KCKL4tIP1r6vGPiKY0HT86K+FryYKwOvDwCmsfiV3uHPB0iP5dOuiqraIj9bzFRqMoW
 rrFT+oKUKZ9ei643bqg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE4NSBTYWx0ZWRfXwXQcI06WCDDR
 xF4QznOKFh3wlC9ATBDp2fwi2juTtKJ13WQoRpOFBnMZNq5MHDDsMNb2NkthWn2r+qy/wOhUeM6
 jxMEDZwqDKZ4xL83021mxWbzlvC6FG4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210185

Document the iris video accelerator used on shikra platforms by adding
the qcom,shikra-iris compatible.

Although QCM2290 and shikra share the same video hardware and overall
integration, their SMMU programming differs. QCM2290 exposes separate
stream IDs for the video hardware and the Xtensa path, requiring two
explicit IOMMU entries, whereas shikra uses a masked SMR to collapse
equivalent stream IDs into a single mapping. Due to QCM2290’s SID layout
and Xtensa isolation requirements, such SMR masking is not applicable on
QCM2290 platforms.
Since shikra uses the same video hardware as QCM2290 and shares the same
programming model and capabilities, it is added as a fallback compatible
to qcom,qcm2290-venus, with conditional handling to allow either one or
two IOMMU entries.
Common schema is updated to accommodate the iova restriction of 600MB.
VPU restricts usage of 600MB for specific streams, which could otherwise
lead to device crash.

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../bindings/media/qcom,qcm2290-venus.yaml         | 26 ++++++++++++++++------
 .../bindings/media/qcom,venus-common.yaml          |  5 ++++-
 2 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
index 5977e7d0a71b4fb5681f1c2094439c251366f01f..b27899ebf164229ceff1ca5cda50ee30d875e953 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
@@ -13,14 +13,13 @@ description:
   The Venus AR50_LITE IP is a video encode and decode accelerator present
   on Qualcomm platforms.
 
-allOf:
-  - $ref: qcom,venus-common.yaml#
-
 properties:
   compatible:
     oneOf:
       - items:
-          - const: qcom,sm6115-venus
+          - enum:
+              - qcom,shikra-venus
+              - qcom,sm6115-venus
           - const: qcom,qcm2290-venus
       - const: qcom,qcm2290-venus
 
@@ -45,9 +44,6 @@ properties:
       - const: vcodec0_core
       - const: vcodec0_bus
 
-  iommus:
-    maxItems: 2
-
   interconnects:
     maxItems: 2
 
@@ -65,6 +61,22 @@ required:
   - power-domain-names
   - iommus
 
+allOf:
+  - $ref: qcom,venus-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,shikra-venus
+    then:
+      properties:
+        iommus:
+          maxItems: 1
+    else:
+      properties:
+        iommus:
+          maxItems: 2
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
index 59a3fde846d2196ab1e4588eb396012ba6860712..0be2f9119e78233928d23af86836ac294aa769ee 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
@@ -37,7 +37,10 @@ properties:
     maxItems: 20
 
   memory-region:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: Firmware-loaded codec carveout
+      - description: IOMMU IOVA reservation region
 
   power-domains:
     minItems: 1

-- 
2.34.1

