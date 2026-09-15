Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D04647DD48
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 10:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467021; cv=none; b=NpV4QRen6FQFTOau8Yf0I8H2Eu8EMiaxyTLKcDXdejWolw/4CynmE2SZAO2RVn2+6UjGMQagIL98AVDnvO9HKtcDtEv0Srlxn/dZPI7PybnRyR3+lx7qD5uMTCgAJyuEKWwkKEefF93ckP5Lg2u7o/VWlUgVYfpcfGXk3m4deXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467021; c=relaxed/simple;
	bh=++1vDawQ37rKX8PMAVjbJ49fyjiqQioaaUsKsuUebv4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lGO8f1Z1lt5WyyUW8VJYJl0Gq0269pujYQY4OnUTutzt/SWYC3VF6420CAFtrr5R9hJOu7vlhrFdfTXRTxYZHdPpH2b/TQV9TBImAkqfs6lhJ6EHuX7hK0E44qI3YzIUECRDDC/51ZYC9QyUDAO+LJ5CQBcPhL+RuX4pppOVkX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ey/6/I1K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TRDtriH3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ey/6/I1K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TRDtriH3"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hCCC064547
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 10:10:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5GiwkvjajNGX92lSUpJTym7q9yh7Ym/IU4uxosaT5X8=; b=ey/6/I1KJRr5nRH3
	ofcBcPjAExJKN0w/KvHeUddOUXf9Fo8AX2kxuk3pdKsSW6dmPbX5NfvnaMuUuynh
	HUca1gmIVGrCO15PLYwnmtAB+92qYjyyApja3Rju/+d61xwocYiubwAo7fJEHqVk
	Yyd1RQWDqhFvS8Kzh8aH6HXrVGjIFbx8GxQAD+h/9YeHueSCwMkfcUSGCvtNuDU7
	zewbei+3Mrc4dAKX/48/RAp2yXHi3Z1gL1DEfKUDPWNDYyR/lyVEbhTUWpqEFiO8
	8Wi+S/YI+Qj0Bh97f6SmIms/K8e0LOHPXZjbwG660IDyHWkKJmEGMu+Fo0UGZjky
	w1r6ig==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpn41uvs0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 10:10:17 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8627258ef12so9204182b3a.2
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 03:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789467017; x=1790071817; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5GiwkvjajNGX92lSUpJTym7q9yh7Ym/IU4uxosaT5X8=;
        b=TRDtriH3UFk6dog9ukZr3mDGcZ/jDYxRn5ZJsIbBFC42jcfowktUg+qX2i8fLpQtr1
         1H/+IikkTw38SOcZvmiP20fnseh7AZa4LlHsah448as5RQ1vhOCFD6I6HkCPGwNp9myO
         OXdsQtp/28vfuBLRQvkqy1DEi0njs/WfHGD6OMkiFwzneNGUlxVFgfbiO5zsIAvpV743
         m1j+p1+QvsH6BdHyO5LTOIN8PyNUDccjjaNApEMS6NlDsxNo0S1mR1CVx5SXpGzHi7bz
         gWZQ3Jjypdm2eLRUKn26XMm1h/3A1iL3eMbwfK3VWwsdQJaxQ+hCmawxKQv8Y+p3V2rY
         Rwlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789467017; x=1790071817;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5GiwkvjajNGX92lSUpJTym7q9yh7Ym/IU4uxosaT5X8=;
        b=EZwRBdEkpbYcNqajApgZZN2FK9UbX3YbDhAF7Bdh/hB/dse7fXAR0VAqZBWQQ0LRdG
         xb9kiYvcFZNh2AVYgzb2vYWTdOI4VF1Gc1RuGFk6V/omW4MlbJeJ851yCcgRduOYvADI
         NqIrBk8pp0Srg9gMZiLrs1rw2iegFLvYPjeiNjdXXZMHSY3qu/5c6EeoWvjZvCnPAnWm
         PdeCaqMT1rzoMvRNcIrcduhCVh3cFcEjpomcVIbB7quJZEVUTR/qUd77kxDJjmGnzEYo
         ZfbkVjzEwh3jUoTuo8a6GHpCgKvktoho1BQRl5qNTOonAgDIewxcCi6FEUOyY0v/iH6z
         UKsw==
X-Forwarded-Encrypted: i=1; AKwUvByC71f67kglKGZCCevY5p08pOMfnFgsdGSjq45liIJTXja/tC7FUoeNFstx9Vs0eE1KWcpw2YhgB4C4Ig==@vger.kernel.org
X-Gm-Message-State: AFuF++nvgSNC+vZPKPCEM32U/rlYd+06qfjDZ6WSunWPzkv9e6jIBYD2
	uYNDklx9kXrw61FB5yC6d0PClCaV35UykxQUqAn8lyBj2q3IXufvh6Jubt4ro2ILUPhxTYjFDBo
	ufRfCqaCEjgRljeRCkCqp6HM8xr56wl+2cXoAHdDOhWaiaZrzztJfPxDURZCaTxQQaA==
X-Gm-Gg: AYBFou2W9m0564cbefsB4IWWRoGGzxIcsGgWKPzi3x8UOPH9afHT8fYoehZZzziEDpt
	oNnbMZXvce731M3cYTPJSJOrd7yZ5j0GBWezDfJ3Sa0MsFm90xZMxYVzfCQ9R/JY9VWR94Tzqtj
	i0euxVB5xdJAcirixMns59KjiV96yNQQ8y9gRTvNuNejqFqLcAFab74YKp07rqMLkIugdKgl3Ug
	mMVSk1R/uVfGGbT+POJfzZDnt/nhHKRWwBvXLDKqh9FkwEsbKdDlUyekapMH85F5OYBCSfc0QYk
	nDKsyumnoh6EqgNvduf6OLSccRFL9rfy6t2H7HPDnzSTDG7+FTvb+f3eEaqVfALjZgmjOBmQcJX
	lTaRunyqjMxhRH2eMMwxmjd/fMfWZhLaR8gMQuirR86/PJ1D8fIDkHPPIFgUB27STz1/jJ8P7/S
	XYZo5kjpJRPn8=
X-Received: by 2002:a05:6a21:400d:b0:3d3:ae50:97c8 with SMTP id adf61e73a8af0-3dd52a1f617mr1026225637.21.1789467016937;
        Tue, 15 Sep 2026 03:10:16 -0700 (PDT)
X-Received: by 2002:a05:6a21:400d:b0:3d3:ae50:97c8 with SMTP id adf61e73a8af0-3dd52a1f617mr1026185637.21.1789467016629;
        Tue, 15 Sep 2026 03:10:16 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14382741839sm14244091c88.6.2026.09.15.03.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:10:16 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 03:09:58 -0700
Subject: [PATCH v16 03/11] media: qcom: camss: Add Kaanapali compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-kaanapali-camss-v16-3-c9f3f6f4180c@oss.qualcomm.com>
References: <20260915-kaanapali-camss-v16-0-c9f3f6f4180c@oss.qualcomm.com>
In-Reply-To: <20260915-kaanapali-camss-v16-0-c9f3f6f4180c@oss.qualcomm.com>
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
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0NiBTYWx0ZWRfXzidccypjJwFG
 yuQXCNt/hI2FMDal3KxjuiOQJX90D9a817pdqpP+z8myiCEThQJwWv/NmjIrdu1BwL8w/9AOem5
 mWsL2x45Ukz/FgUHxnECR8YVZlQTpyS1hwayH+UYuqDkrBQoelaB8gTo39+COwhKU4dKVAtFjaW
 WNJSez8mVGPGg60/I5uSd8Rt1e1frF5ccGEaVGyfLPlvBgPkFLQpkbWnkNgInAy/mMde11mqcRl
 1fFgXGHTAGOlgq4raR/2/K2cjFQtOYNbTSps0gxmjmsEvnQxje7DDO1zy77WHHnonsV+i9TzmQo
 KMIM7zSqB4RyaAq3xaW1dtSacuRNIvK179cm2oY0+ttfz+daEtXcDTPqDLKdr8W5+80JZ/Ca7s0
 vnuQwv7npRah3+8cz+Z56EGU2W7Wv2uRtZL9JbX2ty2aIJFW8fz0Ugnc3wjGkDlkvYDUwGB/qm7
 YrEtx8Rf1MGaYHIw6yw==
X-Proofpoint-GUID: 73fWHFG4X17paX7sXnTqrIwIya3KOy6R
X-Authority-Analysis: v=2.4 cv=cqQOAF4i c=1 sm=1 tr=0 ts=6aa91989 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Eph36bqoL6-XvbZcx_wA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 73fWHFG4X17paX7sXnTqrIwIya3KOy6R
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0NiBTYWx0ZWRfX0ySvSR5pgQyi
 MsSDDzGrXnwNFae9Yejbumi6shh1MVp/cjEHCDHnPNVdvyK6Bds4+i9Hso4/OeLGYEEk3x/4z5N
 ioXUizNPVA1xfz39MWsTTy8tvsxsooA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150146

Add CAMSS_KAANAPALI enum, Kaanapali compatible and Kaanapali CAMSS driver
private data, the private data just include some basic information
now, later changes will enumerate with CSIPHY, TPG, CSID and VFE
resources.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 07b3cddca584..2c9f02bca809 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -34,6 +34,20 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct resources_icc icc_res_kaanapali[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 150000,
+		.icc_bw_tbl.peak = 300000,
+	},
+	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 471860,
+		.icc_bw_tbl.peak = 925857,
+	}
+};
+
 static const struct camss_subdev_resources csiphy_res_8x16[] = {
 	/* CSIPHY0 */
 	{
@@ -5596,6 +5610,13 @@ static void camss_remove(struct platform_device *pdev)
 	camss_genpd_cleanup(camss);
 }
 
+static const struct camss_resources kaanapali_resources = {
+	.version = CAMSS_KAANAPALI,
+	.pd_name = "top",
+	.icc_res = icc_res_kaanapali,
+	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+};
+
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
 	.csiphy_res = csiphy_res_8x16,
@@ -5829,6 +5850,7 @@ static const struct camss_resources x1e80100_resources = {
 };
 
 static const struct of_device_id camss_dt_match[] = {
+	{ .compatible = "qcom,kaanapali-camss", .data = &kaanapali_resources },
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index ba3d51d9c0bf..fadba57c5efa 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -96,6 +96,7 @@ enum camss_version {
 	CAMSS_8550,
 	CAMSS_8650,
 	CAMSS_8775P,
+	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,
 };
 

-- 
2.34.1

