Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0053921DB
	for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 06:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790404495; cv=none; b=IBpE3AazJhv6tFtqiEoShWdSYPz2iTvPDqbxMf+VkWwbXrjmMqULiX+29qNJRcOwm0+CM5NB/ycJI/G19tJWCTxm1ftRusyRZBZG99XRmEIoULrjd7UGzSqJ3BSADbbPmCXzT4csK1hd8fbFHw78yxks3nTweT3ZksbA88hDOS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790404495; c=relaxed/simple;
	bh=PnAbHBLCBhwxjoECu5HtUTAmt7Aan6lX4I7y/GynILA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dkc3gz4w3KBxsC1Vd4gjhfpjvNs0qacdaMKx/gzvQfV4gc7nvqneVP/FYMy3Ee5vGJCr/5jtS5hoNxMmgepz6tcI8WRUvoJkA15LrXM+X4HU754h0g7dLMsdhGnvFCxEXv53OkYBbJIwR0JIdB35DV4E8K/OqT0soYQyHAfkvO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bwUMitwy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jJfxTXrG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bwUMitwy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jJfxTXrG"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68Q6Ocle2790396
	for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 06:34:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UFyVGKvWzfLCM7ZESFhQabAqKjSsfD9BF+7+SB0eaNc=; b=bwUMitwyngnNncol
	PZZSPrxUiX01yP3959sZB6HvN3D3nrHL+HBlh84ijINOTYNmz4FGCek9xQ0FkLJn
	mPpLFRQRm3gKIOLpEsdSqgA+oPtRDx5pWWnh4/ucu3ErtgquMedUSKTC91XbcDr0
	cTLrKPYaGmLN8d8kd5orWirEWmPPy3X9xH/D9fpnxWa90/ppNfXB/pqZRjy1YI/Q
	bUYlGhJpDoWXX2k4IRpShKxOBPXrAxel6Hyy9IHSnwsNpTvlU5JmKbGinHseelFq
	1jcvBzccMtwDRFDVKmnu0ADpE6jBmBcNF0UivrU3GW3WJFydOmdkX/KV49QNsUEu
	CcXdAQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx6teg7hc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 06:34:52 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1431ba79941so848804c88.1
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 23:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790404491; x=1791009291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UFyVGKvWzfLCM7ZESFhQabAqKjSsfD9BF+7+SB0eaNc=;
        b=jJfxTXrG3TBOKzr4E+BchNvBjkNu0HYLE7gdKtkw/CYc5salm8gT7S7Ekka70aqaGG
         1gm1v8UpyCquuOU0DzH8pyXrK7FfCO2quaKLeqizTblFoS0b9osRytx1vHXQHvkUz+bE
         Z/ZMCBA0f13sFNBjk3Q+zhZ+L/MaymYT1KE+ybMqUiHnnaHgbYzuJpQs+Sq98jcyBt+Y
         RBJY5meckVk8/lOydJ14fC39E/O1/v+qDlIhoCWH+QzFSv3P0rYwBV2Okik4aF00LpFb
         J0HvxJ9SXTk27JUUf9zyXdk8tU/UNiRuuTOTlgV1FFOVWJjhyF1ord0fU+A9SK8GbzEY
         TnLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790404491; x=1791009291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UFyVGKvWzfLCM7ZESFhQabAqKjSsfD9BF+7+SB0eaNc=;
        b=T6s1i2yqWVcC2+SVOdVt3UKhLcCkdd8N6gwfzAsJQuUVtmkjdWPJeU2p2g2Wbtc6su
         gY6wZCq6LL+oEJIWTdKV6A3J8WD/ixyUB17KOqh4fatQDWeUWh6AIyhG88MjalV/k2aH
         AMmD5GXMi1iblb83GaaPiGhaIrrx/pZjK/pms3mIndOkChz7q8Yn7lc7vY9yX79DmHy8
         Eh+bbH6JfZ431aTK5ze4I3Yjk8hcB8CuEss1iV6QxwHnIi6t5CZLfGiXC9hlr5zFatHT
         /20/58TRxYkvcv/dl0sCp/+3yqVdxZmStkVCpd0RiDRNMPGv6cnW42YJKY+4o4f3dU5i
         i7EQ==
X-Gm-Message-State: AFuF++lZxUHyu20h+Ja9ZP3NHSJb8gPh0MQuQbb4Pv8OOa4H0r2h2++c
	SxyS9qdAAwUs8ay9QYV/jt9BtOx2WSHPrcE7nXmGDN7Q5n+eleJJ6My045WpWHz8kmpeHHPeQfN
	z7RLy34aUnDCSc5yceo529ANk0ZgW2hUNgZ6SXCYRAD2D6BHHAH70l7VVADQU3wgMFQ==
X-Gm-Gg: AYBFou06Go/f8NQbCyv/pheCugH2eaMraVOSrvEHrQ8qT8M9+qy9Q1Rpptm3SdWQ/CV
	skomaKOQ/WPgRBvnX3aB4FuVfYrlONiyTnCQfk/b02LAu5nzXYq9KeWhCo3xOKFmjl/aU0gJsJH
	OJPHCTU6fre4dUCbEg3tMUJFERSHcpmvG/6XAz93Vshi8+F2LjBnt6MMR1euu1DK1ZdmiUfsErS
	qMOupajaGeZZuOWGFaU1GmgSgSzZONKVTFbq+O8VYexiXFq6A4g5oUhbMYaD7ki2nysqEEehXd9
	qny7yPjHQjF+v9evPypQ0h9KPSUcjoRLR7UsIhOoprCjnl5IoV91hKQq/Bxqwxhs/fB1e4JHcyU
	PYdLoX9Q1UOY6b6xoUE3AQoql/WlNGJxEdQ==
X-Received: by 2002:a05:701b:42cb:20b0:143:8188:fafe with SMTP id a92af1059eb24-146d077b0c7mr2169267c88.41.1790404491317;
        Fri, 25 Sep 2026 23:34:51 -0700 (PDT)
X-Received: by 2002:a05:701b:42cb:20b0:143:8188:fafe with SMTP id a92af1059eb24-146d077b0c7mr2169212c88.41.1790404490429;
        Fri, 25 Sep 2026 23:34:50 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acc45f03sm9700691c88.7.2026.09.25.23.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 23:34:49 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 12:04:02 +0530
Subject: [PATCH v5 03/13] dt-bindings: media: qcom,sm8750-iris: Add context
 bank subnodes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-vpu_iommu_iova_handling-v5-3-0322ca5dc10c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790404457; l=3890;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=PnAbHBLCBhwxjoECu5HtUTAmt7Aan6lX4I7y/GynILA=;
 b=966U/Cf9rqiDOeyw2sHM5srfNuYx9ZLAtNA2e0HDMDSJ4mum8d5koMqmF8TD2r6GQWP7BIXzm
 AzgrNKWcB5UDlJxMaXwmtC2wx5yPgmWgCmeRJlzePWVN83NDV5ooRQc
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDAyNiBTYWx0ZWRfXzn05gxMPPWRo
 ImTSuDzcNyZILwTreudIphb0fkQ3DlVN3g+qIpUX+RvRZMNQlTDHU2oGuJopEcpzn2wl6KmzqxZ
 Nl2ee9EBgTvMJxrG7vl+IxIVYNL/Pveo/hUJVng/E0hOsQtmhLTtcfVjybDGZNyI2h4ZGWV03BH
 rbvOcuns7f7gglxJXhs84NRfz6CpSkQAu7DnGxax710t8q/wz9yR9yCBN/A9zXVUKhqk3uwV9WO
 M9tuiMgFlD+7BfHV7JQ44j7y1KAwrnPCFyh/ZUKJdT6gT+hMruYaFy7k6R9Oz9YPgr46P7jSPSR
 kRgdz7Ezu3ORuKRYVIb/ucMo+NyzJgFxxVBeoxlRBgoud6kcaLcBFNuUpYaqAQFMpV0xHpGv5ng
 LW6n9iMRyntKhD+wyCzIvNaWHkiJrLKCo/UhLXCpuW0tRKIKGF/iwfj0p+OPTUuU+vEhtZzvtOP
 3FzGpJAtD4Lg0K1aquw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDAyNiBTYWx0ZWRfX2j2IPFc/l2fI
 1aNU18bUGfO2hJqVT7x2kFgn8HG5AY0x8fStTa2nNKyWC4Q0pp55QPwu03delIp819htm/zrOXU
 xuhqGt4pP89jR/2wZPyY+I9kS475eSk=
X-Proofpoint-ORIG-GUID: s1u-LSn8Kw0vo-mnkL6q3zGfZUqqdgEI
X-Authority-Analysis: v=2.4 cv=X9LHu2Te c=1 sm=1 tr=0 ts=6ab7678c cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: s1u-LSn8Kw0vo-mnkL6q3zGfZUqqdgEI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 impostorscore=0
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

