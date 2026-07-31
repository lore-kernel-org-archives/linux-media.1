Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8062239DBFA
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 08:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785488081; cv=none; b=gJMeD0ZPa1URi0Lqaiu9VLopxDr7RasLOnEOIBkQdiDNYHx9TFS3u95uf2wa64B5lSHrWIjuuhaQl667BPx0Sz5iAYeQYfz8h0Bvtf2oBmHhsbXbO3vIIpuyk8CwnbbNmWf6xhZ7CLmBMCNJm92q7WUgcSMRTXVT1PqZFkg+CEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785488081; c=relaxed/simple;
	bh=VykZ8O/xbw2dMVu8Q+eqCfOjI1dlEkhZ7YGz2vgl0Oc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XZetrWutGGkc8xRbKoahXUvtTLcsb44HdGBtra7NQi+zWdRiwh7fZvjS20VEiL3wIOAM3L5XZS93I6amUuJ+O2r5QS0i7mrturjgCLINS0+Ams9O1sOz3IQcsJm3rnqLFeUuv4MQvjKizJptMZiccB33SdyhMcqliNoOEqMETHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z9mhD2Io; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Td19vmL5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z9mhD2Io";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Td19vmL5"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V8cBTF3390862
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 08:54:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cpS42MIKJtFVq1EipOr/caVox9gp5lhNAwtI/grgZKQ=; b=Z9mhD2IoVoSm6DVe
	t14awqW6gDSYwIPFXernIbGLnsSG5BUwqFYjLqQ3vY3v/Acq1pkFjQdUX7s05Z/k
	6pmKKJWUkCZj7TQ2iyhfFSkE6R6x+emAZnmSkb9z/0ir4SN/aJ2DVXlIb9mTBXFI
	YEmDP+UUARu3O7XkgughMnKHBEcBx8tNYKK4BcLsS37uUp2apjfHpa3tv2KRaHYq
	ev+mpQLmmGrnv5jOcT9dVCzOoVX4kO7l8mek0UTkhan/36nfE/8NH3ZLrQdhTtiZ
	cE7Hjqo+j1MCNXUVjIwEy5csDb/oD/2vSEfh9DgBlKm5yzwYn9rblFyJy/6QG4xQ
	obybEA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frrc2g27q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 08:54:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0e702df8so6917161cf.2
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 01:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785488078; x=1786092878; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cpS42MIKJtFVq1EipOr/caVox9gp5lhNAwtI/grgZKQ=;
        b=Td19vmL5TrVmUQj9LhPDH9Uy0IA8lrKjlBeFR2zgEcxgET7VMDeBXKei1+knZ8nxAb
         vld96h9TqLSgWMeVqULqAVX/ozW7nh8jKMTa56bTaxGEmaPvkm/6RI6cZ24CkmJ9T2TZ
         pv/emGRApde2Ynj1mOB7BG62bE4/9iUgRU5JHfSWWI/f1XSo5ByuCbzFiveBEHxkkMWg
         JBU80DkvolZFIIQbj3xxDRd1Rs7PUC+QCDnUhUFv7pL+Uc0uCjXu9Einhvpn8ZdPf92a
         N179Su4/g8Co8x3BI/xwfIaJ1N3CRQgXor5kbRQ5+2v0O5iHoE/g36v9tdo3Mn1hy28m
         UFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785488078; x=1786092878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cpS42MIKJtFVq1EipOr/caVox9gp5lhNAwtI/grgZKQ=;
        b=QpnC6abc+2YVwXr+wtwHP5Iq9YZShxIQuXlT6DTWeWLKDvhwHIZ5F3xohkDk2a6fXg
         QrAHy2GkMhOvo1DmNKT3i7/dGkzJ8qaxCPhIk2Gp7cXeNkSk0bB5VS6TTBz8ytAlTgJq
         pJi92Akd7tKHoQ6YcwdhCqYtWSGn3wRTGsAKJ32omZQ8403yJ7URjsjK3SPUTgJStmIT
         t2IFDtownc6RUWwhPaoK9mNgEt1/CMwqKFEux5OIV8tW6bf04e2KwyI6qfJNyNUgXGGs
         UrEhu8p2wPQhKVU84l+VPby1X9LHNUgy5rB0V5KwVrXS+xgy/jUmzwFTxwmOhb7LpW1L
         8Lpw==
X-Gm-Message-State: AOJu0YxQFotQRbOHu+KnXuRoJLNkJdjp+u7mWcjztR6W7fMSlxpMt3/1
	y5mGtezef5+k9iq0VxQFrGeFC/0vrqK3NRA0GKtbfnyltRAViSrHSYcT2HZCKVromwuKFt9JDiT
	CG2gnQN9v5rh2DFDGHc8Dc3FJyrsCcYJaFvVu2DfToHx1lJj1wReCHjUS9smWGtQwvw==
X-Gm-Gg: AR+sD13GHAd+Bq0ng6wpIYBjMUL87yg4uyqbcaiJNLtki+HOEbfnx7qsuElVnEXTCNp
	1gkF6YmqS4QH2fi/aonKJuKy4ipxNbfsVJCKdOPl3crGmuSQLr88O5dXScUi/b78+zOEKu9FatC
	sCoQoa35o4Itrzhqcfmiu1LJyDBks1L/jWVA2foXQIx/xc0ywVwNaL/FlpB26AamYEnq7L/ZvkJ
	iTJnwQtXmJIXBwooh5RPZEiBFiYaMy8oLh8M1A/PvnSgyZ3dz36zv/v3aN8rla9MCQqNSTqu7Zx
	iVlsVKiKQNd+F5EQdu3kncnYy412d1B5FBTMX5Xu3xU3Z5I2mhhKfEsikTFGKq7Kmh4qdBDCo+q
	tkOj4uPOqUaCtPa4sHJ3/REtRvPTDPjB3VtU8rd4mWe0+ndYdWZdkss4FTkcCrfQ8VSxkOOmG/K
	09juPO63r2INsR3h0ds8SPoyvA/E0/NY3tEiVMPSgUf3EWvLB25rHA
X-Received: by 2002:a05:622a:1a90:b0:517:8470:2d2d with SMTP id d75a77b69052e-52b4b053a9amr13980931cf.29.1785488078550;
        Fri, 31 Jul 2026 01:54:38 -0700 (PDT)
X-Received: by 2002:a05:622a:1a90:b0:517:8470:2d2d with SMTP id d75a77b69052e-52b4b053a9amr13980711cf.29.1785488078125;
        Fri, 31 Jul 2026 01:54:38 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd44e9f0bsm61899366b.43.2026.07.31.01.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 01:54:37 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 10:54:34 +0200
Subject: [PATCH v4 1/4] media: qcom: camss: Add PM clock support and
 integrate with runtime PM
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-camss-version-v4-1-be8b716a8c4d@oss.qualcomm.com>
References: <20260731-camss-version-v4-0-be8b716a8c4d@oss.qualcomm.com>
In-Reply-To: <20260731-camss-version-v4-0-be8b716a8c4d@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=Zdst8MVA c=1 sm=1 tr=0 ts=6a6c62cf cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=KmNvnciZBadtvzOit0AA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: 54FUlycaDi6a0jBvWTXCteAvLat1GF5I
X-Proofpoint-GUID: 54FUlycaDi6a0jBvWTXCteAvLat1GF5I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA2NCBTYWx0ZWRfX0ECamo/9M+q/
 gY1rPPQ4SneD029u640JWBHGjK4DPDxIE+mHiTpKIcbya1DHmU41aScVhvDz0sKJZd52fekWwrx
 XhfoGq07TpTU9Gdh0k3KurNO5DUuBxD1J4P1ZxVU9I0qZdYkoNsKTs+uVhrLxnup+chi2EPHgks
 kKjogMhBxPrIusSrYv6xLrwL1zX9nXt2QyYzx+U+NlcmIC3sb8Ij0pLXoTMPhpAM8IuXe2+wU/R
 Z7/4ZfXS1AhZo3x7QighnND/zg34Q8hrii54QjImUF8FaoqtZ0yzspJz/ENlGUHDUGbkem6Cbbw
 w6XueqpvOq0heWosRUzO8tG0PnHedfyr1juApZBSVgL8LJ0HfwHOUxfh+bB64W6eFqdjtNBQGjW
 jHq2n/obxbJ39OXS+jEKzeRoYc891MV8rwDPu0ThhwIRkiq87cyPFGjC2acQgTGzAQYUCf1cVEp
 AV3VzYHL34p2ysl5ClQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA2NCBTYWx0ZWRfX75JG6AJmtupg
 2gLa4hrDj3HTNOJ2HNFWRcBhBU1ttRsO+8X7SSDSsZPGmBiy34StAcCdNqtQpmlhX6gU5S2TgoH
 Evl++cCmmols58fIbZ9P6OC1znwEqZY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310064

Add optional PM clock support to the CAMSS driver using the PM clock
framework. This allows CAMSS clocks to be registered once and
automatically managed during runtime suspend and resume.

This is especially useful for global CAMSS clocks that are shared across
multiple CAMSS subblocks.

This avoids the need for each subblock to reference and manage the
shared clocks individually. A typical example is the set of clocks in
the top_group, which may be used by CSID, PHY, CCI, and other CAMSS
blocks.

Introduce a small PM clock descriptor table in the CAMSS resources
structure to describe clocks and their optional rates. Initialize
these clocks at probe time and delegate clock ownership to the PM
core.

Hook PM clock handling into the runtime PM callbacks to ensure clocks
are properly suspended and resumed alongside power domains and ICC
paths.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 49 +++++++++++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 50 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2123f6388e3d7eafe669efd6b033e22d8eb5cf79..b541071e97fe02f38aebda1d9b096b930d1cfde5 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -18,6 +18,7 @@
 #include <linux/of_graph.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm_domain.h>
+#include <linux/pm_clock.h>
 #include <linux/slab.h>
 #include <linux/videodev2.h>
 
@@ -5346,6 +5347,40 @@ static void camss_genpd_cleanup(struct camss *camss)
 	dev_pm_domain_detach(camss->genpd, true);
 }
 
+/*
+ * camss_init_pm_clks - set up shared CAMSS clocks
+ *
+ * Clocks listed in res->pm_clks are shared across all CAMSS sub-devices
+ * (e.g. top_ahb, axi).
+ */
+static int camss_init_pm_clks(struct camss *camss)
+{
+	struct device *dev = camss->dev;
+	unsigned int i;
+	int ret;
+
+	if (!camss->res->pm_clks[0])
+		return 0;
+
+	if (IS_ENABLED(CONFIG_PM_CLK)) {
+		ret = devm_pm_clk_create(dev);
+		if (ret)
+			return ret;
+	}
+
+	for (i = 0; i < CAMSS_RES_MAX && camss->res->pm_clks[i]; i++) {
+		if (IS_ENABLED(CONFIG_PM_CLK))
+			ret = pm_clk_add(dev, camss->res->pm_clks[i]);
+		else
+			ret = PTR_ERR_OR_ZERO(devm_clk_get_enabled(dev, camss->res->pm_clks[i]));
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to set up pm clock %s\n",
+					     camss->res->pm_clks[i]);
+	}
+
+	return 0;
+}
+
 /*
  * camss_probe - Probe CAMSS platform device
  * @pdev: Pointer to CAMSS platform device
@@ -5434,6 +5469,10 @@ static int camss_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(dev);
 
+	ret = camss_init_pm_clks(camss);
+	if (ret)
+		goto err_v4l2_device_unregister;
+
 	ret = camss_parse_ports(camss);
 	if (ret < 0)
 		goto err_v4l2_device_unregister;
@@ -5775,7 +5814,11 @@ static int __maybe_unused camss_runtime_suspend(struct device *dev)
 			return ret;
 	}
 
+#if IS_ENABLED(CONFIG_PM_CLK)
+	return pm_clk_suspend(dev);
+#else
 	return 0;
+#endif
 }
 
 static int __maybe_unused camss_runtime_resume(struct device *dev)
@@ -5785,6 +5828,12 @@ static int __maybe_unused camss_runtime_resume(struct device *dev)
 	int i;
 	int ret;
 
+#if IS_ENABLED(CONFIG_PM_CLK)
+	ret = pm_clk_resume(dev);
+	if (ret)
+		return ret;
+#endif
+
 	for (i = 0; i < camss->res->icc_path_num; i++) {
 		ret = icc_set_bw(camss->icc_path[i],
 				 icc_res[i].icc_bw_tbl.avg,
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 93d691c8ac63b2a47dbb234856b627d8911a1851..fe5fe25d5f18d8a3ce35b48077a975f1453c341f 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -107,6 +107,7 @@ enum icc_count {
 struct camss_resources {
 	enum camss_version version;
 	const char *pd_name;
+	const char *pm_clks[CAMSS_RES_MAX];
 	const struct camss_subdev_resources *csiphy_res;
 	const struct camss_subdev_resources *tpg_res;
 	const struct camss_subdev_resources *csid_res;

-- 
2.34.1

