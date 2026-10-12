Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F0843DEAA
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 06:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791787536; cv=none; b=Xv4uHVOB3xg7YWn/rHIhCKzlSthBpkYJAATqrfnLN4JPg0+97kaJqvYcoANAJxmQ9owRCJPGkeQvJ3y5jbHVUmNWF1Dp+m2xwuU38ONN14SpbpyAXoEv8wAPtYl0bfVwtPhAwQ+95Flk2K8klnJINETRmnweC6X2QmUEk5NTDMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791787536; c=relaxed/simple;
	bh=NORLgpnQkBmH9YIsIxH+loCGmEq+ih/mS1MHTJtXE2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lNp3JaejJhCt5Cu7TKX+0DUGTMqMFd08Zl+uSJkEm/ETaO4zeEe8vetpQRvKy201u/+DCugG4CR4CsIav31mxApxuFFr425LJTrf3iG57zPMnSbG1gB2xw77IgVoKwbA71MEy4mVRq6TT0JtBsUrvXlzHQUCg20p5HbvW0StaIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VJMxGqPQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LsWVlDaY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VJMxGqPQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LsWVlDaY"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55g32750870
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 06:45:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RXUsa80x/1w7XU09zAB/IA5nFL6Qb4lFQWBwrWEvNZo=; b=VJMxGqPQL3IttEW5
	XI0RDFQPEOoUU71wmv1IMV159kSFJvBoeKUJ3+Pj6lQ/VzNkb8NjK5YZ+di5GI/U
	pFSzYric7y41ITHWWUkvL5tSuQkcfsp+o9OT1EnnpRpTZ68E+B3g3992mHjZfHse
	gNW/ibhYpk87iKDm8WqdpJJY4XP+u5Yicf6KvAy3QBkDIOcBs1NxQObo5MnAy1qA
	50b1KW5K7we80rdhpvOVTxsDcj0kTAbR1EP55xdMeaQgpy2Kzs3ClE3+h6EDBAIy
	k8BHo8y8GU7/pft+l5nvUTZ14e878XnDRMr/wiJxVRhBkq/DwctdjEcCxFwLvHeS
	x2pIUA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7e4ed2k7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 06:45:33 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-88c768885b0so1114325b3a.2
        for <linux-media@vger.kernel.org>; Sun, 11 Oct 2026 23:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791787533; x=1792392333; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RXUsa80x/1w7XU09zAB/IA5nFL6Qb4lFQWBwrWEvNZo=;
        b=LsWVlDaYcqKdAVrhr52upEAh79/w+g4Djxw54YMEt9/xK29IX8FQGfQ6bYHphgsGa6
         JQAP/mZldYaPD8Pvbg4YLTmxXzY+7ZvrHc4TIrAE2pR5mwosj9HNZsUklOTxeZCgBMrV
         c5mWkkJ4STtDpMxbOmLSqEkLZnI9QtelwPryTnO3i5kQLNScthFyJ3gpj+bmCwrrnldu
         1Pm3fxZYYVG5CPlk2k2OcswHWxaYEaujJlhJIwOUlcw35hUfRGHXIwv3eQp1/zgmS4Sy
         vRksTtoG/Dj+sdGhTenKf54iW30Y4ZNfqW6+tsLiTJPvijP9DiDEt9dvGrAKSaD0T61e
         uIwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791787533; x=1792392333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RXUsa80x/1w7XU09zAB/IA5nFL6Qb4lFQWBwrWEvNZo=;
        b=rnVvTudfOtrx5zu4mys6p+ZVk1XbUQsNBJj3Vmp24OwmF+xknMvj1adKPxv9ep898N
         JjCWBAGuxsfhDtCMXeLZnYcz5ALYhL8o8bjW8CRty+jgZxaFgKkPBy9fHlsO/gHXHw6y
         lM9zqA/Mm+f3T4P8hmQFO2cNKxyXNHzCcWXBQnsSvpDEmJEesPVn+Owil61QrXRP1ap2
         r9t67wMUBvwD1QeABWOTWYEp9RULry5NG9ogQmJJr1Nl+pb12nePsazyWDd2EI2Gd9Or
         +jU4xRRx5YEjgVWsqPdaAW0VwP+lR4EduHm/E9HvAFa4slErtBAnuy1f8KY2+JGx72YK
         BCUA==
X-Forwarded-Encrypted: i=1; AKwUvBwXpP+RSKe+poYOshdA9+iwcJuLzgFMh822YmZIXNs9+tGbOuXK5h04p2wgxLAVRUUM1fTl0C/cf9J58w==@vger.kernel.org
X-Gm-Message-State: AFq9FYLqUlvgbGByEs3r36z5esM8ZaSPdezishC2du1vGp9Orent6HsZ
	h22LGZuhdHcqvusBdKXVKH7SWBsSBXEXphgj9x2Kt74o/YzxLfGguO4kXKaJS/RUE8oIN5r86D+
	3UrXqcWQWsAAEy2gDFLadJ0RV5v5qxRYuhIJllmoSMqx4mEcV6qC5sksrizmpkHf2Vw==
X-Gm-Gg: AYBFou3Pbg57XehJnXMMosLeLl7zXl2O4GTJGRlv8MKpCdibWkBZPL0pE/FCaCaAdct
	YQA3tWUnwaC2rT9bsHdUEX450aIQIZHea83B46gUidhT/Lp4OaonrDsW6HJd6qXUlJDaMj8l773
	/kmrU8xl6J4lyy5Pci49mB09c1LUjkK8qKbCHE2cknKTGRbK0aHd7p+eXwmCh8Uv9Xo/uqMOUAb
	oSTuTlmVWezwU8GOmwLcumqMzoWgEnoxjyIbTaw/aSTH2Yb589AvLauJvLxJLgmsLPkWjSghZGL
	pobNX6lrnXzLcDPucN2dLnztw1RyzoiNgfHm2H4PC1BoczET0AIMJs0uEk1IbcAIpPyCTXRGKP1
	XIP/LoDrvlhegV3i6/kvi87l0OAfe+WA87zXePj+cKfQDjj6d8X/yoWhuad5ur9sT9O4R14SZpJ
	eTjcothMczDQ==
X-Received: by 2002:a05:6a00:9504:b0:878:6ee:671c with SMTP id d2e1a72fcca58-897c700e769mr7277393b3a.30.1791787533084;
        Sun, 11 Oct 2026 23:45:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:9504:b0:878:6ee:671c with SMTP id d2e1a72fcca58-897c700e769mr7277364b3a.30.1791787532600;
        Sun, 11 Oct 2026 23:45:32 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3dc6c93sm3534420b3a.33.2026.10.11.23.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:45:32 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sun, 11 Oct 2026 23:45:08 -0700
Subject: [PATCH v21 06/14] media: qcom: camss: Add Kaanapali compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-kaanapali-camss-v21-6-04fd28d815c6@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
In-Reply-To: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfX47RXaGIehyXR
 pOBqtepBngU71epyPNTD1IIcYeiYSUBZB2nSFBWO5OgBpNtalbCF13vV9qNkAURKUVgEUtXGlvg
 NCokD1x+/YXRp/tU6tsdVt4j+l24rkvYS+75BIaX1ZDdlst9ICG8nzufTHxgyzV1mtZ2F7Pz/Y0
 JSS2zZcILDHoEfsuawgY9XwHdxoRkpeFRoRrJOZykqy6Jk7rTVg3H48LnYGCJetS4bZhSUs3LkB
 y1KgToOijz02etq8fb3B4Z3ucXd/j2bu2lyKZHrsAuRuUvOsEjAjTGUWsyVM/Djz/Xlv3Wmmh8y
 qFCeKz9Gumy6cz0X6k1izddeBaVm+WbRP2jUyDLyfUcHTLqprDAPS614mzBA1G6rWYle8CqI2/b
 tptjT30P4BOU8fVG+um2jI6h1jsdPkH/DCXJJbWAIUE4Tfg/uZ7gXNqX7AfY9zv596D7mueDzRG
 amHDBjd8naKU5NCgX9w==
X-Proofpoint-ORIG-GUID: VdaNSV4zhAXFJ4YAwcGwuE-E__yhQqmy
X-Proofpoint-GUID: VdaNSV4zhAXFJ4YAwcGwuE-E__yhQqmy
X-Authority-Analysis: v=2.4 cv=W5utxhWk c=1 sm=1 tr=0 ts=6acc820d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Eph36bqoL6-XvbZcx_wA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfX9EQl0TI/eo5+
 i9PQvBJs+UudikuCT0JUrqk0xPKLnXhWq5sBg7U2qMnK0yaEbUjyP2Hrg7T/CPZ2SYFgULE6x82
 ZtiN8DUWDz/ypa2zr6gYbjDNmqZMIk8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120026

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

