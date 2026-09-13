Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEA23F327B
	for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 18:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789325418; cv=none; b=EAFN0EoJxhgpYwx3WrjKdIKfu1Lu6lfHxzcFMDVH42jGtYe0rL9HOKnPrCdTFAZwufRl/1yRyo1gG533REjqvvfZV7GhBQMCFfCZ+bNcD1qFX2lCoRXKwVs3nCHqa8B6MnK5Nmh8C+tKnhaflfbTFUQPwi/llEg2OTY8wZsfqmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789325418; c=relaxed/simple;
	bh=Qa2Zp3mtOCmlv43McNFjBc1+0AJv4pRvdWQWwZsWNKA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lozA4iwu/W8kFUpcd8J1leyrFAT5Pmwvo1JdQ/52EswSswGH7ZJqrv+SwTW3gXk70Eh6C8T7OEaAbG7FlfMoIeiH64qCtFmZpdi9UxZ7F3BBlO0/o0GLjWxQpefciuX8ZC3qRta3ZBGPYdwxzA9hQu6qUka72z3YNKYvFZOnHpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f6fqQAGT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bt1nf0qE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f6fqQAGT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bt1nf0qE"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DI2qWL2395810
	for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 18:50:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aDXJrtGXbNQEY/5xdA10m94DDaprg9EVDMwPUbR8BWA=; b=f6fqQAGTN7OMA4qJ
	xIxk8mrcknnfqkJ6jQgWFkuDq5UyxcQT6rlGPxYm68EnESAArus4TYKzM/D/Ac6C
	NEEviq37sA0YNltC/INEqZSPOzvhTF28gMS5iNqyG0h8iYFF89XJdjIOGlli4N5I
	+uLm+X4UbPkGHHy251nozwXOX1hC7asPstwkuDe6Tq6M1bDykFANehMx54gRGD5k
	D5bzZw7Yprt/ODeOmgntKpF/OIrFcczaunlJB4scW8F+YBGLLD7WhAmKptTB9O30
	dfrkMh3bfv/5f1kIEqTizxZWwXLNM+vDcwlAioxZm8yIsETB5iXhLUjZ8k2+y+KW
	gbgu3w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c3x6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 18:50:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2db8c152622so24757415ad.2
        for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 11:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789325410; x=1789930210; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aDXJrtGXbNQEY/5xdA10m94DDaprg9EVDMwPUbR8BWA=;
        b=bt1nf0qEy8lAyA6FNvO7euu1VCdFSNmmBbF90cfkTZZOwYu05xfb0qKUA+tRN4SysF
         wKln+0n2T6r8S7NRFMq86aORIkhvvdAsG7K93sfWSsmxZHCdIfAV7yyD9/bNGX+d2c+U
         pHoqzDSYovioDF3zM8KZLg8V8X7qbed7hc3nr2IvxZ7iB/hSEVWgZI+sGRMFRgo1ca8q
         nNPCKdlx/sfYTQOwLJ3fScx1lrHMX60TnLkgbR3mqx2quxZD9VM92eKeykPXaXnPaWkO
         FH72NOPfrPbWkGU8xnxupqZr3e8/2d1yqR1/b7Fqt+AAE5CO6obVGASg542iunNC8Htw
         pHSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789325410; x=1789930210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aDXJrtGXbNQEY/5xdA10m94DDaprg9EVDMwPUbR8BWA=;
        b=EhnZSAX3HijZkrynjMF+t8BJLMIJqeXMXdv3gtAxDSd2c9NXVza/iLNbYDBgJTQtN9
         d/zKTqnHa5BC9HtMn23LQhTu02qFooOiQKmC9Iwmg66vql5OvIsxamxPpWNO5xcLwlXQ
         Y4d1z7znwWtsPYV6WlWEkz++6Gis+A3Ag219bGiCBPZeC9HdJQiYmS1eDXHD7GKewSjm
         t7R7bae/NzvrNPXNMfH2p9irphmr9ol7ZUW19T5/ZeBBRcHvHh9FDb2nON/ycii0oVri
         NeqvKM+tzUFXtPoR+/HdLceTmXzX6BWLq/XSD/KwFaJpbbRVt5hOx9km0qM57S3SYJkf
         2hrQ==
X-Gm-Message-State: AFuF++noTyNvAvptFMXTexcUm6MlYudwom+q7MoHtKha/b7AEOzR5gam
	rkniD69YKru/Zwq8Mu5CI//0tG32i8IRz447ZLm3KpdZwdnAFtujCB0+6K6WuiXtRTcuCrEp/+8
	ORvi+qQVk84WHv9/dchJPtA30oKZLx4inWcHajkADol+1YiDFqRIwl0wrczaY95Qxew==
X-Gm-Gg: AYBFou2r3xVR6VuxY+/1/nLlfprwgHKD02D/ZDHpymEZFirl/ILVVbGMulauM2jbwoQ
	/o7lGuogFgumEM6DULNaNUy8EvOTcsUju2Dou+s8UyjkDG0ZzazCQ/vNWcqgzuDq9Kg1qoa6Nwx
	RPFINFWkxzlz4o8y1F0C8H9Ejw3D4BAabhBCgjRnUOddsalcNp8895dNdYwsNiIvwz2su0V9DKP
	WIr4hRogwxsNbBopbNayzPypF1WDBgjRdcXOotQpEQwS24lbzsu6dwMfbxobFt8bTCAjadNdvZm
	QCfT6dNyLJ87PsF4WbIaJiuo8o7ASedGCFBJaym9mq2cLWHNxPRjrXk9otI+UvIjt4SpIOjBvH0
	6Ufzlh2JNe0/qEki0Gxim6pPdL3RkEWpHuE0=
X-Received: by 2002:a17:903:2985:b0:2da:e67a:87d4 with SMTP id d9443c01a7336-2dd2a35dabamr255818815ad.19.1789325409444;
        Sun, 13 Sep 2026 11:50:09 -0700 (PDT)
X-Received: by 2002:a17:903:2985:b0:2da:e67a:87d4 with SMTP id d9443c01a7336-2dd2a35dabamr255818375ad.19.1789325409013;
        Sun, 13 Sep 2026 11:50:09 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm22473130eec.24.2026.09.13.11.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 11:50:08 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 00:19:20 +0530
Subject: [PATCH v4 03/13] dt-bindings: media: qcom,sm8750-iris: Add context
 bank subnodes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-vpu_iommu_iova_handling-v4-3-9b9074a73c41@oss.qualcomm.com>
References: <20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com>
In-Reply-To: <20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com>
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
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789325376; l=3817;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=Qa2Zp3mtOCmlv43McNFjBc1+0AJv4pRvdWQWwZsWNKA=;
 b=xKgMcGQDCsIW7jwgLM4Vnl4Qip4e1w3iS81Ohhu+3VzMXymIU74xzNdhZBAkJA7C6TXdaknjW
 J5oxiSK7hAiDI3mR8Qncd3xzM1hf1Q/GSpQx6fmrXThtgLeHH1qS4eD
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-ORIG-GUID: cRY_LXW9ieC06uvMMso0ZSn716TXvey4
X-Proofpoint-GUID: cRY_LXW9ieC06uvMMso0ZSn716TXvey4
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa6f067 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDI2NyBTYWx0ZWRfXzmNt09d1+SFt
 2JfCvrG7vHsJ9aCp4DhG48CelZRHJcsjHsZymr/st171ZKL9MplgJ9/TBmynYqpTpXNGQQ7wrqO
 LYgrn8Y1vt3lX/jDE+aMP7Nt+SoZnYLUp4Y3j8NYVDeR5Kea2GlRHo7tOwaoAN5jpN2IVlM7Pam
 VdGvM+goUuYhoJaQOnaQweI4DHTwSDX5LKZwBAw7WGtP4xXTPuTyan6WBRvANn0psg5op2mv+Zo
 M1c0Ythbkk47fasRO32QkTePSzR0RmgkxOhnbCFplspN/eJDkqj35YgPKL8yo2sK99h50lfevr1
 /KiBWnN+Mk7gRxCjqVqLPNaVLFf2QklMv3qM3b9EvUzH65usV+KPQ0fn5NpssLVuQy8eV3+AuNU
 V0Jdbn5n8BspPlzCeXSDc9dxouaMM98AuHBaqoeWiAjnqNwSwmaznWUxIi5QU8Q/4a5yqf3h/7A
 EFZnPWo09DnlYHy53Aw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDI2NyBTYWx0ZWRfX6NEp5Q+XF2Mr
 YciCQU3dwnsCRfHGSo697rGE9zjazAtgyDd2L3zOKs5jyyAr45NsmZ2Ud80k9MpM+DsQ2orpgYm
 sIsN3U3XRwke3yViFzbK9rDRPx9Yn8M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130267

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
associated with its respective addressable range. The design was discussed
and agreed by mainatiners here
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org

In the past, this limitation was addressed with an iommu-map approach,
with the iris driver dynamically creating the devices. That approach
was later concluded to be a hack to avoid having subnodes, and was NAKed
by the iommu maintainers. It was discussed in detail here:
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/

Update example to the subnode form. Doing so, it picks up the supporting
properties needed on the video-codec node, address-cells, size-cells and
dma-ranges to declare 1:1 DMA translation into the parent.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,sm8750-iris.yaml      | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml
index c42d3470bdac796cc878090e65becf6b62bd80ca..b6d5ded1aae6a1a6836c2c24b1dae548cdc6f9d2 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml
@@ -72,7 +72,6 @@ required:
   - dma-coherent
   - interconnects
   - interconnect-names
-  - iommus
   - power-domain-names
   - resets
   - reset-names
@@ -110,8 +109,6 @@ examples:
                       "vcodec0_core_freerun";
 
         dma-coherent;
-        iommus = <&apps_smmu 0x1940 0>,
-                 <&apps_smmu 0x1947 0>;
 
         interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
                          &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
@@ -144,6 +141,19 @@ examples:
                       "core",
                       "vcodec0_core";
 
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

