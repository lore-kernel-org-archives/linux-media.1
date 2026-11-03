Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742071;
	b=dIdyPtX1v7e2RyLvy5cWUnZztb9GVHdMCeruXCH/8uixBH3/3qQq8Zg+ohlm+gNxhgOe
	 QjmCVZJ5fG4XYMOtAqHcuf3hR9dj3+CsoiOjutUGzjDEYRN9cpRZFMEJtVMuE8IKQT1Va
	 JLY9KNuq3ZD5DV+GIDP99LWvNRQ71iofpfJDiAZU+vEWh+M+jDKq1aglhTNQduoPpUpkt
	 +xZwHfODhgGAUwDuzWNIFvnqmQGgdM2DxK78CFO1UndHVwkXUULmR5QiVBNkU0n5W8g8Z
	 811C7pv+NVUOsdAfGld63iTMdMrBTWzhwOY3KyoSk8U1SG8enG+GGTQTFo7hhz5nspA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742071;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=poSSODbWEoxTyPL5Lk4+LMqs3YK0EF3Oc0Nf3TL++Y8=;
	b=NJgtrsLpss8HpSE5CegZcf5AXcjQrhAd813gCRUrbLq0nlOQtNUX3DQ4WGyegUcoZual
	 2CoF/cT+GNzJyKE7b8KjNz+vDUPBjP3j8nhvB2YYmZKvrWjGPlm9IcWDddRd5114Qk2lY
	 9KLMBLUSOPhRu8DjGvi859ujDkj3Ih+yJHvQJyp4mT43k6DMbnKgtKarmmdsME4AJjo3C
	 Sd15ppLIFf/kOXEq5VUt2Su02iEA5GMPMeWKX+XhX28HteQrb1hxTnKrZSpVuGB+6ZBry
	 MeCm1EkjUw0P2UeaAO9EN+d28NrIQ4oqI5Uby548AJrYKN+3tSmWOXsr1lS3/UVsHxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WCGvaw9B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T6KVELgu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55756606D811
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 21:41:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55756606D811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WCGvaw9B;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T6KVELgu
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LL5Ta2944212
	for <linux-media@vger.kernel.org>; Tue, 3 Nov 2026 21:41:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=poSSODbWEox
	TyPL5Lk4+LMqs3YK0EF3Oc0Nf3TL++Y8=; b=WCGvaw9BNgg+n8BWam4+pgrlVpT
	Q3WPDyP3w+uLyxXN3t0QKyVAFgkVixJ9TYP6BD1FhVOtJqG5J37MkRHB/QQf4ih1
	qZJCJnyGUIkz+OnyNv1Hpy/g4bHKxylkfGCmd3G0UCIoC7dnHf4H5cY1v8LoFinx
	E6ADBCbX9egBYrS1EUAMlk3oxLEianPOt3I8F5awkco5UUEvncXSjujyzyVSXmqq
	/NG+Q3kyOAESg+TcW2Og6lbAt5RV0KlHmO0A3D6QopdkmQSAaU7QusvdCzaR+2Qt
	px9/8hoh+obNyigvI6bYsPjcy4PkfDvDcgYP8QduLAEgVBS5snZAuW5/heQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqmjbrs9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 21:41:10 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a1e2485fdso10636256eec.1
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 13:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793742069; x=1794346869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=poSSODbWEoxTyPL5Lk4+LMqs3YK0EF3Oc0Nf3TL++Y8=;
        b=T6KVELguYNSYMtaxHGd1aPkuQdpocmnf0MT8p5JDFXoAXTB3UDC4e/HTJWhwM45mbo
         7PhcM6TBQ1oNZbtmip6iCfhYuqv9+VHMS4dYGtHtQYemr/CXKQtIqA1revjqL3TcZXEf
         UJL3F+PQ61MPZRipiE88ZInhV8deT4lsjKsvdF4yqCar0ZvV20F3rT/Px4KXeqlR2K3v
         0XvCBtBHP0u7Sg5j5y5fPK3uH9RqOqmTNMkGU2iOQlyMXz7EVXQFzIfnv8vc0UKMEZxz
         7mpraHzUCWEC+bg+xcxEiUKVhfR7bCakWu9bKgc1XJSj9qMcgGZoUj48UvHjIjXTHy1G
         8Q3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742069; x=1794346869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=poSSODbWEoxTyPL5Lk4+LMqs3YK0EF3Oc0Nf3TL++Y8=;
        b=T7YRxkYs4k0lp/N53CVKsNO99kVJqPer1EMm3OXVCR9tddCDR7XxNb5KJEOH/FZ5x0
         693mdZxNaVtVfPvwAdxNqR/S0rhYzoltS+uIxtMAX3a84Q2eyvxFThnhLSJQxaZzuzMJ
         aBU8DO4KIABT3XOplnhS3Bqq48NZ78iV0de05SV4JzFvzXEiXwe1agwuZfnXEDQiphYm
         3EIH1OhAD0mWloyioqyUc0hcza3kx/xQhUpo4p9jHUiiazBFnYIOPyi3gynXt4HqtbW0
         jBqWdifQYq/GpX70fzr4sUYd63YUMRjL+0FSu2IHtZ8SNSAwh6GgO7EEps0NbG6R1AUZ
         x4bw==
X-Forwarded-Encrypted: i=1; AKwUvByRJ692JWCYN0ireNuwWWylgkkpDgRBMRyRPTi29rQmJYg5MfbMsQKT6U507UOfkucqb0ZD4yeuM6gSMw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/PfiO/eiulqQZEhhTVacN1vYfm/EqP8ngM+0mUKzI/Nutg0mMn
	Zrf9J3XI4GcT0zDSP/3sqSFcqD36xeqzp5QCXNP/VRQRt2Wnwf5E6m6pdS1PSn9D0YK4s2ikqzz
	a0Ulm88DG1VLcHgYy5dci49unrCIqPx0Qgwqfrf7VTWCeLM20tgGFanACV7Ee/Yn7qg==
X-Gm-Gg: AYBFou1PNVTPBCRWU/OCvzpHNDtpVPMj3WLeh5rrBORXov+DFFvEn2QyQ59Nfq1p/W0
	TyXoRM4S1G6PxubUsGzxWcbe/bu6abABPVY1oD4qW736RB/+OPvLJTUVkd/otrbDXFMTpXid07i
	B95qDKuM3UEgotPMP/KYvIxO8jGaHthu0Hr6KirPYFBMoNavRHLoJl0Fg61pEfOtoJW7XZN5fep
	YiHafB98LUbvpfoj0z+atoc579b1qBqMdwBtbzk8ahCBmZ8vbdWJoYY6s0U7qxobSrkxZDoINhk
	9r5F+ViNyHNOD9C/OvoOBPWgHTxyhLKKLnsc6MfKMpAamMAm4MMlb4VaV+xGLJGG0U8zY/NHtmG
	IPB2CTHtD/0YsMKR0L07e4j5VoAbEf5+u9nwM3MPotBL361QAKh772F3dDSPuccRsaWF6bPJ5/b
	bc/Vnr4BkPY5tJoN8fgFI/0wBAlfk=
X-Received: by 2002:a05:701b:4186:10b0:137:5b9d:cf87 with SMTP id a92af1059eb24-1ac4f91ee96mr22118945c88.0.1793742069118;
        Tue, 03 Nov 2026 13:41:09 -0800 (PST)
X-Received: by 2002:a05:701b:4186:10b0:137:5b9d:cf87 with SMTP id a92af1059eb24-1ac4f91ee96mr22118916c88.0.1793742068608;
        Tue, 03 Nov 2026 13:41:08 -0800 (PST)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm1537440c88.8.2026.11.03.13.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:41:08 -0800 (PST)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] phy: qcom-mipi-csi2: Make timer and OPP clock names configurable
Date: Tue,  3 Nov 2026 13:41:02 -0800
Message-Id: <20261103214105.3605181-3-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103214105.3605181-1-anusha.nandi@oss.qualcomm.com>
References: <20261103214105.3605181-1-anusha.nandi@oss.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bISCWGRmNUrQ88qsGKjKZr14abLSZHL5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4NiBTYWx0ZWRfXylM41oTHu89H
 p1qaMLD/yu8EgKZHkZyO5534g6o8sTEFbNbysq6OR2+1k3Vj60Gk9GCsSE28Z1eNqjujfePZDpc
 vXYqMTHm5jO9ijCS230d3BeM7HWQMsUGHZLwqxUcbEMAgToEBrl2wESBXfu3C6AsN84rkNyF7gr
 /ORjYs9Qp2Axid71+hARMrIGxRHx2xvDLL0aqqrU1XNZ5oGQi6Duvx6LOeaADZdwoXusNxNy3Ku
 +aJTrkwzy6CxOxgHxraPQxRgIzzdt1T/i7WJPMU+/QMHTfJmK73HkF5eM4iDKy666qrBvh4yk5I
 2a6rEy7k0U+navrwVdq/gYb0UZxDm1UiTPQ7yAOu0lHRfVzL0Y+/IauEwIlWPkXMj9hgX69En6p
 4D83+qZD/SJkt7hOF1yc6NPggDeql8tLWRltqdrs3m2T0+hnNaP/31LtPtSrhD9wvsTjP93hY2c
 y7AJSadVHiCVUWqvsGQ==
X-Proofpoint-ORIG-GUID: bISCWGRmNUrQ88qsGKjKZr14abLSZHL5
X-Authority-Analysis: v=2.4 cv=NMhAaE6g c=1 sm=1 tr=0 ts=6aea54f6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=YDrJLkQi9lszU93BSgcA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4NiBTYWx0ZWRfX9fT+t1r7ynm1
 X3WdpIq1t5rUdW5cYn5LyYIEI8t1skWGaIoPXKIShTL9JBlc3wW4FER6ZhBUgF7DkkGtXaZIYtC
 awkoqX8v28FLWvkgaIqfbpIh9YjmljE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030086

The timer-clock lookup in phy_qcom_mipi_csi2_probe() and the OPP
clkname passed to devm_pm_opp_set_clkname() were both hardcoded
string literals sized to x1e80100 ("timer"/"core"). Add
timer_clk_name/opp_clk_name to struct mipi_csi2phy_soc_cfg so each
SoC can declare its own clock-name strings instead.

x1e80100's soc_cfg now declares "timer"/"core" explicitly; no
behaviour change.

Reviewed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 2 ++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     | 4 ++--
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          | 3 +++
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 966d79c98f9b..8f1939e81e13 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -380,6 +380,8 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
 	.num_supplies = ARRAY_SIZE(x1e_supplies),
 	.clk_names = (const char **)x1e_clks,
 	.num_clk = ARRAY_SIZE(x1e_clks),
+	.timer_clk_name = "timer",
+	.opp_clk_name = "core",
 	.genpds = x1e_genpds,
 	.num_genpds = ARRAY_SIZE(x1e_genpds),
 };
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index 269232499fca..3de25728ed28 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -397,7 +397,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 		if (!csi2phy->clks[i].id)
 			return dev_err_probe(dev, -EINVAL, "Missing clock-names\n");
 
-		if (!strcmp(csi2phy->clks[i].id, "timer")) {
+		if (!strcmp(csi2phy->clks[i].id, csi2phy->soc_cfg->timer_clk_name)) {
 			csi2phy->timer_clk = csi2phy->clks[i].clk;
 			break;
 		}
@@ -405,7 +405,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 	if (!csi2phy->timer_clk)
 		return dev_err_probe(dev, -ENODEV, "no timer clock\n");
 
-	ret = devm_pm_opp_set_clkname(dev, "core");
+	ret = devm_pm_opp_set_clkname(dev, csi2phy->soc_cfg->opp_clk_name);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to set opp clkname\n");
 
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index 7e55ae007370..359b58660db8 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -68,6 +68,9 @@ struct mipi_csi2phy_soc_cfg {
 	const char ** const clk_names;
 	const unsigned int num_clk;
 
+	const char * const timer_clk_name;
+	const char * const opp_clk_name;
+
 	const struct mipi_csi2_genpd *genpds;
 	const unsigned int num_genpds;
 };
-- 
2.34.1

