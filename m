Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8FD3D333C
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 07:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791443686; cv=none; b=f++brtk70HW8BL97TEItDgkb7VxSM08wMfnBAsk++q9qKk3YBPtVaYkdn+AtooLS1gpCbkMTy1JOaT0vujZ3W/r2rCltmWkXuoXi4Nv/VPOUhLIYRiCJ9PHY69xe/m9WDt+dvceXiTXjJtWyjQVo5UiNSyTqp9UAh3Mfbm3qC8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791443686; c=relaxed/simple;
	bh=NORLgpnQkBmH9YIsIxH+loCGmEq+ih/mS1MHTJtXE2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UuUA+gTdXJp6gHB+3ajXnNigUM6gAwWhKpqVvqy823CAOOqVK9wBr71Vpql7UcU5SuDs27AfXbZogbTVItjYDZ2XwKNUYYm2GcO0FGTs0MJzxidvFEi4EMpIKiyChSEBws7mYe9jO4W+CZPF3MHAKurgJIT9DH8vSBYZg0nJUHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bq+mKVIZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EF9l55f4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bq+mKVIZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EF9l55f4"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BUGa1775333
	for <linux-media@vger.kernel.org>; Thu, 8 Oct 2026 07:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RXUsa80x/1w7XU09zAB/IA5nFL6Qb4lFQWBwrWEvNZo=; b=Bq+mKVIZwpFHuCnT
	+aBkQ/R8PNFJUaPx4NolHICK7EMNc0FrDQ56yUQydSDyibu5ELTt78d5/jCMJuHO
	H8fyVIVZhkIpTwOXfPH+YuvjlDdfel9ckob9NLmrqjCZkP/nVn7o3uTOE7C0AXzi
	Re92LD1KDmi19Wo9ao4JPrxR+a3PrYwJAEABWik5+dglpyaq56MZ3FOW43x8nuMY
	MyajmYTSwAR66j+2LZ/+FCIBpE/2/2K5cEBpIjAlnwM2zqHsO2z4IgP7SANaEgbE
	a6yOxWy9Itm2JccFOUhGuQDQCEFB8+3OwvjmAx6wh/PvfjmLsTZYQ0oGfrcH4k1C
	wOzqPg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe39kxh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 08 Oct 2026 07:14:41 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35158d674e1so7355607eec.1
        for <linux-media@vger.kernel.org>; Thu, 08 Oct 2026 00:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791443681; x=1792048481; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RXUsa80x/1w7XU09zAB/IA5nFL6Qb4lFQWBwrWEvNZo=;
        b=EF9l55f4Qp5S6gBAIIvRvgFGRkEAWh8uY2GudE4SCE8OA9g+zGERXUwlSvbq4YcgVn
         NfFeEI3SjDJ/f6M06awEZ5MhWKznQv2zGH+YR+EtN6bDC+cCBuDymCB5Nh/nJuCBVVkh
         TEX5/mSMK4F7kR3vaJr2Eybl2y8ybqfvtV+eIzL65UM1Vwro+qB0+vBo40nz3xOYElAM
         kw2xKRtEXK/xEyGvXwbjku+rFiD52Q2o+z7LP6KIs43Y87MHKgaCttaYLWHUtuMStW1d
         TjIGU+HcEl9BeYD5+TyyZMywHs1CPYo8ZKmH9C67i5xJKTvnxTZVv4QItmLCJKeerPV0
         YqWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791443681; x=1792048481;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RXUsa80x/1w7XU09zAB/IA5nFL6Qb4lFQWBwrWEvNZo=;
        b=DINp+T+UyNn2Y4wYYivjSG50Q+j3mjo2nF465mzfhCvw71kbY3OVX6AAnorPy2mDJ1
         MqBUNKAtJ7jIrnAzHqSOnqA/H1mVh/NtPpmWqrDMGNJAMXc41by076Ie90rkUOtG51dE
         j+YrRpuYTTFkU6AVmz4TrJV+8YZ7gxjER52jDXvPLT//ew/jtLGJNfKRzZACWyrzRNK7
         Q9lcC6YKMVp6BGnGcifCvyzmk0/5pcgrP3MkzFjufXx9TmHcEAXevjer8APQL5eB3bfD
         zFCPBvKG/kp5+FnN8oEFbEziBvzVL7shIEUchf5mWpYc9D7lg5Ut/26NzBlr+49d2noZ
         vB6Q==
X-Forwarded-Encrypted: i=1; AKwUvByiamRlfCoXcqldTgnuisQKqDUpYuGh+B0kk3pHQ1lbmad/+YSBu+9WXJuq7Icyriq7qXMhMTqVsYNFfA==@vger.kernel.org
X-Gm-Message-State: AFuF++k8zM2OOQJt6GhzqP8WrDfHL4dNF/+QxYHcncfx1tz6z1XUoSPd
	nOQIRluAZESrq0QEVYhZsfvurSeO9vJ2ZiyrC3ynnotmtJlAhi8FTCCATZmzjdZZzIj8KBtADwA
	sa+AV0JsQq08XsE5OCTBbrnmkhIaow47uREVouSP6hwgc1IVqAav28aWRL8P23fFc4OkS76BuVS
	K+
X-Gm-Gg: AYBFou1wFDiZa3EkG9CVaxjMx8QXZjhPfetVWokGqQIsb9m+Upxq99Ad29Q6cP8Z9MF
	VITwcJpo7asi/0dvFZ8NtE8jOAbkvRqceewDqxzu8OobARvT0WLcUyaIgmmCE13Hhjg4agTBau6
	KDe5kkkNQyIwUncm0TexsYeoMYjyXS4F2zQ+q8WxI8AOlrRyekMM0AnMaq2z6432XsiKPE2uYKR
	4wKmvLEm0m15f+Mfw/Zv1afQjnQxnS1FDqbpuN2l+40I9a5OqAmhdi1mRam3yPvU/Bv9uX6Nh5X
	2pkXBcGAeQdmGwUp/22VPfGxAwh805pW8QWLo62vWJ1QTum1+vP/MKjyaFDbBL1Eja6+JZfF+0h
	u3RsNTjb4eJhYdUaCCxBJusbGSH18bDcvR+FXCPgVwZ6P4NKN8ZD9hZ48/QdjLrzRpXk/180ovm
	1XPNkv55wJaA==
X-Received: by 2002:a05:7301:7d16:b0:352:4f11:8118 with SMTP id 5a478bee46e88-3524f118159mr275074eec.40.1791443681288;
        Thu, 08 Oct 2026 00:14:41 -0700 (PDT)
X-Received: by 2002:a05:7301:7d16:b0:352:4f11:8118 with SMTP id 5a478bee46e88-3524f118159mr275030eec.40.1791443680585;
        Thu, 08 Oct 2026 00:14:40 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515af155b5sm12251625eec.12.2026.10.08.00.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 00:14:40 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 00:14:35 -0700
Subject: [PATCH v19 05/12] media: qcom: camss: Add Kaanapali compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-kaanapali-camss-v19-5-b2c583ef50e0@oss.qualcomm.com>
References: <20261008-kaanapali-camss-v19-0-b2c583ef50e0@oss.qualcomm.com>
In-Reply-To: <20261008-kaanapali-camss-v19-0-b2c583ef50e0@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ac742e1 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Eph36bqoL6-XvbZcx_wA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyOCBTYWx0ZWRfX/nn9OeLEGNx1
 0yjKsB+oIC7hkeXvkzXEELXkA6UvEoU0pszpaGmqVbA9OBA3/eEKHoSgE3EUHnqwqCYxMbHkN2T
 8/C7NY+idmz9xF7Y9h8flaHP8oButiY=
X-Proofpoint-GUID: F3-YwacMY2rUOhJWc8JUJxTET3xLKbOC
X-Proofpoint-ORIG-GUID: F3-YwacMY2rUOhJWc8JUJxTET3xLKbOC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyOCBTYWx0ZWRfX+Y/OKfd3iXgo
 nVdzfGzX/IWTw7b1+JiEBfVO/2ypAYrZ21p+rzRcZg2Mz+Ciw7bhbDrDXy/EUZ9RaqebnYPcRIG
 qACaNkbVeKPAZ9x7DceT2kcuW3AbQOvQmD7ngIlMTT3Dx8kRmKjwwopkteJ6iwiyOVS/RclPhs6
 Jsye5gwI3zDwxAW87l6Q/gauJKLg/xXcSC3DyM4aQY7VenLCkiyKpHj6lgNcRE0n7C1Op2H4Qn7
 Eg/3x0AGVHwNbFChofgSmj2rShotxfcUqLI7XfnvtH9HogFQRVZROc5us4zSsRRh8OQ5vhvaJUa
 nxNVeUcT0cnOZ15o8q7MWZ78HqX5+eHXYHKvrkZ2cXb1ig3zPgbU7jHy9UtTTiXXPjKEDqbsU9c
 H/EHpTjf8iQq6jy3k/LCr2LxrIkJFcs4g57zyT9jqxVHrf3OS6pvr8k7FdcOTwbCxEIaCJEjZvk
 zkr9TGpEQIe5B/QImpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080028

Add CAMSS_KAANAPALI enum, Kaanapali compatible and Kaanapali CAMSS driver
private data. The private data currently includes only basic information.
Later changes will add CSIPHY, TPG, CSID and VFE resources.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c54185c93a8a..fca3de214a92 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -38,6 +38,20 @@
 
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
@@ -5576,6 +5590,13 @@ static void camss_remove(struct platform_device *pdev)
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
@@ -5810,6 +5831,7 @@ static const struct camss_resources x1e80100_resources = {
 };
 
 static const struct of_device_id camss_dt_match[] = {
+	{ .compatible = "qcom,kaanapali-camss", .data = &kaanapali_resources },
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 7dc2fd9f03e0..0551211f7948 100644
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

