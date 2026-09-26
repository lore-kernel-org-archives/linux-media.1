Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B703911D5
	for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 06:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790404486; cv=none; b=eQyAAfVktA5oCD5ENFzK7WNlGcba8IHcnzYpesMdw0uohK3kZzWc8wM0qMkZrXgHrItKQlIfqTs9uJ3BX5IyK8pkidHZepLW15qmFeSnlkDngc/zLhAKTbotL84kdfJdZnpXF7kTDI9ry11hYJ5C/6mPka8K5PrGScqxG302MCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790404486; c=relaxed/simple;
	bh=yHsO30A05MXmUjgWMqhSHRfHlmPgdfem/lqRi62WMjI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SKGInSlmuudsKOOwh0jcVLz0f1m/ndLCgMxfhiVC1K2PxT4SMrwmeJTfLV3SU0BEWIIecX52rFbOxbvn+F/ClU4Vd+Dzpgjj6gOTPFCew+DzvvppsakdpXj4eQcm6Vrkf0L7hruMDjjgVVRXd+4bfwdKVxDlgQzDes/NGfKFHVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G1O8M2E2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T9bp/qhc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G1O8M2E2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T9bp/qhc"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68Q6OQbZ232869
	for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 06:34:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KLaMYwCwOkkTw4yWr611vV0+1feJAqLJ5YJx1fFHMQA=; b=G1O8M2E23Fb8jh5M
	wQNjkVIn8lKwe7CouAF+P79ut0uy8tUQjckBz5on82zsQXRybyc9TqVJoyGtU1vU
	9AfCTXIVp8fnhro6yXiQ+T9w3NuRLr2hmKs/2jEwYiG0BleZrgYjK4gD7fnUh61K
	D2tOQXX9JqSey2tL5iKGPApTF/femUtuc8YIoGJTFccMh3+pBAp+l0uYE5cYXTFD
	Zpx08LKqEqwLCTHQpr6uju5s1gmvQMWXCBNQhtHGEtAGiYuOQzHpxz+kIiNL4Erb
	839oBAxMYbMqx6i+boA6MO9QiXNvwxfUcfb7zWcg+H9j0OAt6ci2ZsntQKXlWGKl
	wLwaHw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx3rfrkgb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 06:34:43 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-342b66c0b06so694985eec.0
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 23:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790404483; x=1791009283; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KLaMYwCwOkkTw4yWr611vV0+1feJAqLJ5YJx1fFHMQA=;
        b=T9bp/qhcuVrDIF6jqiZHie9+th8ibHe/01dVgyuiyg5eD9Vo7o78ATXk3+jjJxhTM5
         va0UGe15dpqjBoU56iHlQnhuiyv3IrzQtz5qOywY6VJx5ytrKncjSOuKWq0y5ksfGXTH
         +KyCmDK215rD7DWMdkUQsfLfxnmUBlj01AxiGsBv9MhTCvJWFISrywIhomzV0OPbM9aS
         q3I2nNsVhr1XaJHppwJjLdvHcnL+iYnDZEyLz4veQ6juZkk24yFk2dQ4GeFdD44fznpy
         /xip1khkSfB8X9nhsQ4djMGCY7+Clgcx+7ORdHAWGmjsSDOXssYPforjCNZ57iKN5vwb
         nLIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790404483; x=1791009283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KLaMYwCwOkkTw4yWr611vV0+1feJAqLJ5YJx1fFHMQA=;
        b=KrR0f5V+cUP6U6T8biNzhnsKyH3jGZ/ojDGnRfKiR8GMQg3z8KtU3zTZydMiz5WIV+
         S2S+XawXgcKo4BXyJL5ONjqTJXjVK6nPeoFfl5b3rR8GW3ME95D1oE1tTe4NYqePywbp
         lOyYAKrPzncOX5U6UIjtoiN6n5lRENMTi9cCfklncIvdvB03sc5lpea+ASrl4NiV8WeJ
         LUeMKy3+NMMw/Blbk+Kt0wUwYmdNgYB4Elty3Q2Gl5h92jPyTpkEhYeqtnmnxtJ1LUDU
         rBIRZ53keZZUkBSEopjy3FKGVr84xY7SGF51r1tUyqAvqM+fGyN+i4AB6B92S5pqXW4U
         xOcQ==
X-Gm-Message-State: AFuF++kHPm3j85wxwILUr1oYTsyKMpRnqfWvqQ+0G37Ov+iG1Y5rQ2Qq
	3CvwNDF/0jBxQPmkJZ1Pfh4+kFqsMSk59nw1MF/urS1Llu7KD7vdm7tr1/UvYPClgOA4c99DcI9
	GOIEc4hlLe0FabrdokpmaFd1Ji2uhj+JlzxUg25jC/W7MZFQl6v+9W6ri+TRKz3Xp9w==
X-Gm-Gg: AYBFou3d08n5ywNYyNejRL/JX5KccIJscDPd+8T45fOwKFBkTYZktWIqxtI7sT5TFnX
	7MVWWwZBjgmOUvaeMvzbz380XSkdwMjyTWW0cINVHfrHhJs4UXneUKX+ImhhaLEApyTzw60XY+2
	m587AXCTtWCb0sie8Ckp7J3X57X0rakDzgfpC5GRKBWAtnw/ol/s36SGfbhkNOB91vHv5qmPNQK
	MxZLxzDjLdv/EYSyW/+Z8pz+yc7qHJsWPNIyT0rFIs6hg1gToWTyTHoB/AS9XPTMHE/yFSAKqj1
	98SMaZNwTcZV+A1ewWU1jN5CCotmtRvU3c/6jkmjZgnAFI6dntSNYxTbzvRb7atCLmZjwrEG6Z5
	AA7NbmEBpXbmeiC9NiBqQhkAKQSCVO3uG4g==
X-Received: by 2002:a05:701b:2313:b0:13c:d071:f97c with SMTP id a92af1059eb24-146cfdd1e92mr2105110c88.11.1790404483103;
        Fri, 25 Sep 2026 23:34:43 -0700 (PDT)
X-Received: by 2002:a05:701b:2313:b0:13c:d071:f97c with SMTP id a92af1059eb24-146cfdd1e92mr2105071c88.11.1790404482112;
        Fri, 25 Sep 2026 23:34:42 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acc45f03sm9700691c88.7.2026.09.25.23.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 23:34:41 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 12:04:01 +0530
Subject: [PATCH v5 02/13] dt-bindings: media: qcom,sm8550-iris: Add context
 bank subnodes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-vpu_iommu_iova_handling-v5-2-0322ca5dc10c@oss.qualcomm.com>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790404457; l=3779;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=yHsO30A05MXmUjgWMqhSHRfHlmPgdfem/lqRi62WMjI=;
 b=Uw1Qs/lJhKz2n+Iqf/32r+jf3RsWE/D+ILHjzPTeNblWJtvhjnb0BixOmaLf6X9abqrXzVla8
 L20LeQ/KffjBLGuBF2ao34Oztr8oc/uF4diWgkFI/1CPdxXl0fPBcvg
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDAyNiBTYWx0ZWRfX//9K8iL54Jl+
 jwP0h4EYoz3qqEele46+G1U+PGRJDAW95Gii+Vw8y9zLL/lEPA5TUAfflD79ddQiJUzNjFRJo1F
 vpujg40voTPu8TO166B56zT4AYDFvVw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDAyNiBTYWx0ZWRfXxJPG55TCeMR7
 7t+yu/WKL/S7KNjQ5AVGZ2tLvKLF1PmhIoYAXBaI36sDrK78ta48wAC8p5J2VP3BZ7q0St3/rkV
 Qd6iXAHwX46t6iWWsXoe+nu2TJVyPjR+/xI03RBwPkw06DcOapNIFkBy8SGllU85tTdZmOd0zt9
 DEzn+e54pj/cy7v5GQAu0JMq43lbcrFeLLXXNRGc2iHCRPpoXhiRMzKrT9O7AhDiOlOp6ilGfi2
 Y/CpyUxNUz5WjJDKeWSpkQyfvIY2562e11wm+hsXxW+4W/r+sXMcJd+TuS0UZltSMOSxw/LNt2A
 Al51Lc/yQG6KP2veGcowrGfmL+awQM/KqZ8lvPHjGL31GNfzMwBOsPWuTqrVHPv5U55wgJCQ9HP
 rzYTFuHeneg8Ah75Yl0RD1k0AGQyNs2FWAqIjTQOAh274bYOU3kMH8LGvXSg/2amKmD5+ri6cLo
 BUPoMsBhLWYttv8Ok6Q==
X-Proofpoint-GUID: 3LSGVygf_5LgTJBFXmj-HFPadMbb03NF
X-Proofpoint-ORIG-GUID: 3LSGVygf_5LgTJBFXmj-HFPadMbb03NF
X-Authority-Analysis: v=2.4 cv=K6G3jCWI c=1 sm=1 tr=0 ts=6ab76783 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260026

The VPU issues DMA through several SMMU streams, and the hardware does
not give every stream the same addressable range. The non-pixel stream
cannot address the low 600MB of IOVA space, while the pixel stream can
address the full range:
    +-----------------------------------------------------------+
    | non-pixel stream addressable range (600 MB - 3.5 GB)      |
    | 0x25800000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
    | pixel stream addressable range (0 - 3.5 GB)               |
    | 0x00000000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
A single "iommus" property on the video-codec node puts every stream in
one IOMMU domain sharing one IOVA allocator, so nothing restricts a
non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
that boundary the hardware faults, which shows up as unhandled SMMU page
faults and spontaneous reboots:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Given that the address range restriction is for specific VPU stream, it
should be ideally be moved to that stream. To achieve the same, a subset
of streams is now represented as subnodes, so that each can be
associated with its respective addressable range. The design was
discussed and agreed by mainatiners here
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org

In the past, this limitation was addressed with an iommu-map approach,
with the iris driver dynamically creating the devices. That approach was
later concluded to be a hack to avoid having subnodes, and was NAKed by
the iommu maintainers. It was discussed in detail here:
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/

Update example to the subnode form. Doing so, it picks up the supporting
properties needed on the video-codec node, address-cells, size-cells and
dma-ranges to declare 1:1 DMA translation into the parent.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,sm8550-iris.yaml     | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index 0400ca1bff05dcef6b742c3fbf77e38adca9f280..6ee9d23554cffb30c92017ef99de15c2493455ac 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -98,10 +98,10 @@ required:
   - interconnect-names
   - resets
   - reset-names
-  - iommus
   - dma-coherent
 
 allOf:
+  - $ref: qcom,venus-common.yaml#
   - if:
       properties:
         compatible:
@@ -177,12 +177,23 @@ examples:
         resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
         reset-names = "bus";
 
-        iommus = <&apps_smmu 0x1940 0x0000>,
-                 <&apps_smmu 0x1947 0x0000>;
         dma-coherent;
 
         operating-points-v2 = <&iris_opp_table>;
 
+        #address-cells = <1>;
+        #size-cells = <1>;
+        dma-ranges = <0x0 0x0 0xe0000000>;
+
+        non-pixel {
+            iommus = <&apps_smmu 0x1940 0x0>;
+            iommu-ranges = <0x25800000 0xba800000>;
+        };
+
+        pixel {
+            iommus = <&apps_smmu 0x1947 0x0>;
+        };
+
         iris_opp_table: opp-table {
             compatible = "operating-points-v2";
 

-- 
2.34.1

