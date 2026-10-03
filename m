Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51FD396B73
	for <linux-media@vger.kernel.org>; Sat,  3 Oct 2026 09:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791018157; cv=none; b=Y7xX/Oa/WJmKmKoVBulyFUujIZepbrXpaslOFdGM4Kle9FUMc8QlKiz++Aw5f1JFZY0ial7iiABAEvUH8BsZCrkdRaZh1dP7c6bKTiiTwRsbWkD0y6pr369czTiExuV3oBNGCJpgRtx3V1LlmRbtos2D0PGJib9dkKp1D7d50Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791018157; c=relaxed/simple;
	bh=NORLgpnQkBmH9YIsIxH+loCGmEq+ih/mS1MHTJtXE2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uCQOeTVGxo2vnCset8H0qa25h2BBHRccUfClSfAxi0uJ3/vZuqH7hHT/tsBbc3tIWXo0YIYr9DujXRzyCqDQCBIIuLqsnna/gVS1nWLNKZ3IgGTBUvbgU71U39CkSxUdE6+WvXnEeeLweA8pZz3V48WOwvqoJy5DI3P9ZP6FtOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q5v453Tf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O+q/4k4Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q5v453Tf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O+q/4k4Q"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6933Pw4V2957199
	for <linux-media@vger.kernel.org>; Sat, 3 Oct 2026 09:02:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RXUsa80x/1w7XU09zAB/IA5nFL6Qb4lFQWBwrWEvNZo=; b=Q5v453TfNXUD4ACi
	zk0jxYD3aXdA/HOCdsE7bWH417RQuCRjM0JN8+xmmnRCgdGbkFdQBhfYsOhlUH/D
	40w4azfsDgR9VKy2wwodlPS/y/0Kmph4IBvRCtsnCkY4FdGOeJFYbm7r+9cBT3YL
	Lycop4U2NHnW+fKpSM0ZuPNvPdH9sFaFJaMskdPnDnGRErSwCaRpejYu+27b5nho
	tioJu974j1uK4MzhW4bTA2ickdGmmJtrB8YmSY4E+3F2nvgKx31K6iUKuY5ae3RQ
	OGiUs0P9unFSbFK7lBq92kR4F4IYz4y31yqgnCe3Pk5rMKv/rcnMzCDpaN+Iu9AH
	K5mkhA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ssu0h62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 03 Oct 2026 09:02:33 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3425098ae4bso125139eec.0
        for <linux-media@vger.kernel.org>; Sat, 03 Oct 2026 02:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791018152; x=1791622952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RXUsa80x/1w7XU09zAB/IA5nFL6Qb4lFQWBwrWEvNZo=;
        b=O+q/4k4QVQG7Or/l/V+IC0ochgEJiAXSUBpQ0m7xkQ+1C09dpMMty7UL629u7oWVzr
         /3xeJfRnwNERGGKeK+bz2o92sDJzSJ/c0rAU7DfYF348Hshp/8yZZ4h7fFJLi7/5xsaA
         Pu7ChYnHKQqquqLo8DItcYRPt1HEs5wkeve7kv5Jkw354oXO2lu65XA/Gzgpc9J33Bn7
         5xsjHmSJvh/ruRL9IUVOpCVK7u5AMh7GcUqbpTQoFquu7VKt54SjPyk9GUYRVoZP/gO+
         nv6YvbiS84xBATY3k4fZJQeLafXusmOHPWYjtxGaHbPoOFpXnVK3nXcqS96MeWFsJRpE
         my/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791018152; x=1791622952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RXUsa80x/1w7XU09zAB/IA5nFL6Qb4lFQWBwrWEvNZo=;
        b=aQlA+owfa3Qm5127GvJaF1YHYRm7AjFrS9HtFZ8lB0DqMqkDoEiLTYg1p4zVgRzdz4
         dUzr5GBBT1PDxWbR29iu0cWwJ++pA9dWWs0OLHkyx9rGpmJEpkW19SlWkoxZG7EenkFU
         jC2FdXP0KF0YuPVlt3L3TfR3V3QmMQOZXw9zvjuFpACSUU+L5dcsSuRj7/00SjKs82JW
         ihWFRB5ppzkb13Ql+LN/17YdOyISVLDTGAKd+fWU5PB6yVkn2Ud194hF2Q7son3fLtVs
         hr2twJjopYa9C9F/Jxzh8kBi9wrgSRY4eDE5HpzCFabyN4CjsWDEekR4qA9GLZ2CXuQd
         apXQ==
X-Forwarded-Encrypted: i=1; AKwUvByeQUIqmgr37AH67SoQrTnxmIau3nnyAUHoKfUkosUWtp+SXoAGt666by+iy69oZwrwZ0exzbW0VPixNQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kCv0Eg3weji/LtWB0j9v1EHjAWar3NJfJOETxVpxOSSqQ/T4mJ
	BjB+7nmmlxDSIJO14aU2BnPjJeDf4QPhBFT1q+VlbEW44q05FcQoUsTsVnQ14jPwbFdGwf+LaOI
	iFcs5vAYj6W9EoJpIe2qfg2f9wZSEG6ajitgzw8duNTbGO8oVD9qwsQsKEk69ST0glQ==
X-Gm-Gg: AYBFou0sfvB48T+o40Qlglv6fwWy/EvaFyU1WmOCKdEJt+Gso5OZp4Wgs0F7K18sZKt
	q9gnztQ/IIA0R5zFxcJQ1GPmn73uXRfmfnOpDhCEWP4taEnZkAWghNBod5ohV8SmbhvrH/RcZnB
	ARxR6IN1yYBfEcWObgu7Gf02RyhILyJvPcDw0ieqaUx2NnCXlQ3e6OEpqlomeSN7lhJg4xWeCbU
	9Xj6opshajZh9uuf0yNKUJZ7IChCd/yRrbf3gUcBYoDIVjub9RO09P604KazN3qU5f+HU9X7LuQ
	gOYuDwpC5EtBWnnc6gJaWRM5PgWojyyVyTof5H0YF0Eba9xvEG/z7h23uiijXwAobp0y3eM6j/o
	LLCL2jjGl7hkDUcYD2pZUW36Oqy5ekSG0onxTTjgvQhCNzVqxaY0XcbqY5pfQwoS7DJebTq/v/X
	njSfvS0YbMyA==
X-Received: by 2002:a05:701b:451c:10b0:151:ed93:e273 with SMTP id a92af1059eb24-151ed93e5bdmr1698408c88.19.1791018151973;
        Sat, 03 Oct 2026 02:02:31 -0700 (PDT)
X-Received: by 2002:a05:701b:451c:10b0:151:ed93:e273 with SMTP id a92af1059eb24-151ed93e5bdmr1698384c88.19.1791018151403;
        Sat, 03 Oct 2026 02:02:31 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14f9f2afsm29278695eec.18.2026.10.03.02.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 02:02:31 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 02:02:14 -0700
Subject: [PATCH v18 03/11] media: qcom: camss: Add Kaanapali compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-kaanapali-camss-v18-3-87ba4ebe0db1@oss.qualcomm.com>
References: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
In-Reply-To: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAzNSBTYWx0ZWRfX6eqYRM3bWSBu
 Pv6ZgQ7VfmKuU6/zyLl3v/O57XezU/7CtRrZ/7Pm2bvMPUVzMIpxH0TgYwN8pAWKrfwrshYy3Rm
 oRarBBbKmbk0zwxg4fpHlCjBYbEqhFTaxLsWb/ed0EWhm2XVWElk+dv6kImlPdT61vb1wFQKYMA
 tqK5gm6ItGg1kiRn3LGy0e2b7Kf/8UAlOn0mRMgHNjZbyCApiY2SNlxRx6L7M++3RfVtiFMXRQh
 drxHDYxViQO1o3hTzdtmXq0l4B6n2QSeyD9iXBr670t8VKRywXgNpxPyrhCG0OY+svcaIr/WfjK
 BbmrdchuJANrs2/AbnnaDQw08f8tthx5Q8wRBa4ppLzo3NzSn0bYQzWbVHgUAaIpkoE3MGSbqRI
 84WcOeCh4OtwE2O2R6vUtfzpgDzWAyTsNd1+NoF7+dDokFO2ZczngUhlkpm+JJExeklmbkNVsWE
 XrmEuv83YYvLcQrp/JQ==
X-Proofpoint-ORIG-GUID: 4R8bMgRzynHlFMorn2Lsfu7Qifkmp2tu
X-Proofpoint-GUID: 4R8bMgRzynHlFMorn2Lsfu7Qifkmp2tu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAzNSBTYWx0ZWRfXzIwv3Z6Aga4G
 G/7ITm/B7EjS9B38VhiyuJG534gYbk8SPRJ/if4JUFS9Ihd4M82CpAOglyN3n4w8y5ieOnlVPD2
 ySAZHDW2SQULMDboEBwShbdSL2edNiI=
X-Authority-Analysis: v=2.4 cv=XPSl2ghE c=1 sm=1 tr=0 ts=6ac0c4a9 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Eph36bqoL6-XvbZcx_wA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030035

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

