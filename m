Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742077;
	b=W0tAFRAHer3vSW6FHQ051VBmgyaOx3/gh5LxkykrhqyhVC2qb9b22pQxClOsKX6DuMMV
	 XjxGaJyrq2iTdFFOVHSLyxRxHhwUp5ssrNcV5pHFH7q09hpRsUmJ54Np/tuHtaEHO/uDC
	 qoJPBWcx6Uk9QO88nfcPWAIZ8MRSzzuqVJdKKY4UQISeISjL1/4GuYaMSEE/AmcCt5eeB
	 1b7PGf4QA/P+3CGJLxI4q+u+3aVGR6gxc5vobNmzHoVHErd6CiZLHlvQVm2xmL7PMU2Ts
	 JySQ5GkNHOVPqbSlKSNCfPGVwWG7B+tAaauTiXc9Kr3C3Kxz0ewAa4ba1cAHQGTrrcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742077;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mWF4Em/s+/j7aCjLGWQL65SgDN+9hBOaJk8SJTBvAJo=;
	b=AobLPLYkp8mIIIF5zZD9qpyVy/Ofl5sAEKRLNvhNH3KSb/rE7hAsDJHFGzMVsryYKICC
	 c3jTzadyDH8+kXohzcodYzP9AdSGyDrBOcXnD/2gnJMv3qmf8QI95/HWM4cr+PQAuI2cg
	 Xy9Vi1KoUJlizez+wqdYtLcq1JbquVrKcs0iKSAapPcrNm90WwqVYWnyWFOZJjNPOSxkf
	 E//4D9fqz9sWRPzILAiFl8b7RRuXfGbP5BXBnFTI/QmOOqjsr+Zno3j3+7jGIYV5yOxKm
	 uD4NLZeo0sCPU6gNr2lYSXG5wL8kvTn7wCWp5o/tBnk8/tWvMvkdZRA/i6lEcjD/eWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f3UbJzwY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i0ZUCrN2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58514606EEB8
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 21:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58514606EEB8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f3UbJzwY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i0ZUCrN2
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LLj2E446602
	for <linux-media@vger.kernel.org>; Tue, 3 Nov 2026 21:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mWF4Em/s+/j
	7aCjLGWQL65SgDN+9hBOaJk8SJTBvAJo=; b=f3UbJzwYsZb59Z5cK8xXeu3TMXJ
	7qaeeZGm0cuCdqGGn6Spdu6UEw0IiqLMZ6n1lQkXit13pIEol/9A6dyawmJMmzN6
	bd7aayDEYF31v5AvAfKHRXfq33qR8coZ8HSClQVR7mZkXseXdiI3Vpr2I7EdDz32
	RMWPdNbHFO7jqmJQkCTmG83D/rMiJ+BBRmyc/IiG26iK6MakxWmfW4iGDoadVumV
	fwn9RWVCXJkJgVEw54vKaTRyLco6eImGqzRbDHmjreCCU9qttw+4atEZCPsp2KO6
	ruNF0YUAFhHM3oQpMnrmpSkdHifvTi02DTDLKGxj8XEyDSeaMhE6Hkp4cPg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8mrjy5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 21:41:16 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-154e9d2d94fso208350c88.0
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 13:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793742075; x=1794346875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mWF4Em/s+/j7aCjLGWQL65SgDN+9hBOaJk8SJTBvAJo=;
        b=i0ZUCrN2CCGTByLNekxjJ0Z9DMzzD3hre45KNhD+wgWEkbnC9UK7CL2Oo8N+qYU9+i
         JPTQVxc9do/Ni9KLGGGAMblWNFcHU/rLU176krDE2EJC0GUTBr2HqQZ57XtpskIkGNQ/
         0nnWKw5KmlDgL/8HnE79BRZCd5N6wHD3Wg/BKCLdDwKyuI2GxHtXEpiqZvAdKJcn3xJW
         tKGU9Ce6sZ9OBeVHfGrO2aiunf3DXTs4HV9Q4RaHWJvLhzePndyh7myddYxXhAhC7Uk8
         VmzTZP0+ESVlJDDUrtu4k+HbkeBlrnh6iKeaD7eBAPRyXCXCc2Lxe5/SXRYFo+V5iGms
         HSyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742075; x=1794346875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mWF4Em/s+/j7aCjLGWQL65SgDN+9hBOaJk8SJTBvAJo=;
        b=Js8q41u2MmZugtyE7emcxYZKzILPwzhWuXASb8LIBFSfo5FnURaOZ9Rll9MpV07WFz
         jwvDVEAswEWPXJ4EuhtE9caRDvwnqeuhRW6Hu5QTKYTa7E/xcP3x1TFSC4o8UuJKnS9w
         Kg8RaLaEJSgIXiB3OB1fTtp9zRFkc2dAOZ9HsMNjMbIg5KKenCrWXzC9xI9GeNJJaXay
         nyxsyGp7rDbgYCMfAlEktEHzrL4ZjDDfA218kwrtq5wOtFbeHoDvZXB1vc+cv5g68SE8
         RPnk+mdDss/EJpwVDbMInvkJkNMwRr03fd+uaA5Yp1rrYQiAoDcJ8Dl9Po/q4OOhsfHj
         YAjg==
X-Forwarded-Encrypted: i=1; AKwUvBwY0X+7gYTpn5H2LnWTeKf9CjXePT4hDXSqZE0+z1e631RsfT2TVqZGFyo3pN9zRxSRLbgWWttwoqm0AA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/iomdbtrUEXGvpt6B0bSuK4uadiFAvmOMXOT6gi0qH/2V/DyPG
	tt6uLzNKium4wfl4C7VrbZ1D0QQ8r9xWaGtgK89QEVBm0BTi2ld29stBs2Rg17DTSkJP6Z4ufcw
	lzw2yUvrnqli5YYXCL52AElNvX1wxCxjRSbRVGeW6pOvnnfc8d4WwJbklH8EMZw8SaQ==
X-Gm-Gg: AYBFou3SOVQbHikcoxdrYACQwuZHaCaphRn8JtP7O5XvAKpHvpueJTq8iwrEfuU21tR
	KAdHFp/mMvZ/F+xNg6dbRp0bV7MBBnLxSRmpF+fWwuNO/D+byaNEYGNBYSmVTkaGPAdg1ITwDi4
	/prqflTYD5WsBGGnQ1aGR03fCgpIpNY7F1b0AVeWWGYLslUdibWlB5KD5k+K3r4bkFWpAACN/ke
	EQFGI6fQnL0ldT98zMpfjqmCq+36NRlyFgi7cUUpYvT5mDNAGyzj2T7p1eO/h8fCgK20CjhlgtP
	PGj7cfo84ZK4H/feOHzVvpcUJNgLz6XcbIgA8g05iu3l/16QUfgPAI1PJIEwc6QC00sVIskDMQH
	+AYGLADtvC0KZsFboGSa5JEf9CLqx52AAkRPRMLjP58z5w0tMZf7wrrD3BhvYjMTZYsPN/kQcIf
	WF+ic+y6uImGZBqeszg8U2BoD9+KI=
X-Received: by 2002:a05:701b:4188:10b0:166:b307:5855 with SMTP id a92af1059eb24-1ac4f91fceemr22434986c88.0.1793742070236;
        Tue, 03 Nov 2026 13:41:10 -0800 (PST)
X-Received: by 2002:a05:701b:4188:10b0:166:b307:5855 with SMTP id a92af1059eb24-1ac4f91fceemr22434945c88.0.1793742069598;
        Tue, 03 Nov 2026 13:41:09 -0800 (PST)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm1537440c88.8.2026.11.03.13.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:41:09 -0800 (PST)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] phy: qcom-mipi-csi2: Make OPP table optional
Date: Tue,  3 Nov 2026 13:41:03 -0800
Message-Id: <20261103214105.3605181-4-anusha.nandi@oss.qualcomm.com>
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
X-Proofpoint-GUID: Dq80raxbH4roMOylgXwaFExjofV82cSt
X-Proofpoint-ORIG-GUID: Dq80raxbH4roMOylgXwaFExjofV82cSt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4NiBTYWx0ZWRfXw9EWV2292RtR
 88eWaatvnFeUJUQAm6a4nhdn2EWJo4+YOSCGPJ3XUHJz7XXbWfM8hfYGjIyBmQwPfhxyizRf4Fn
 ZNTToJEgVO4XDstjb0TtwtpW+QjVYYwzOxkm/oy6x1jnZTS8cYXAQLd9d717VlvRjw+wWLnNdaz
 Mv6fgYCDbglp66XCEe3m9YNd7bwROv3sRq+y45IEMB0LxK8ZoIDXtqjV2V5UgqPeMe/lN8W1k8/
 /bLM9QzYPZ3gK0BAWJ7riqlvi2sSSh/T9tucIqPHinWBvJFgxnwWEh43Hy1PF2HBxftVYkaL6Ia
 vHRW+Mn5b3CQ8EznmOdQER4ktspKjAX62R/c4woxhoivetgo0GnGNhP/jV/NDR7cjFeug9h2A1q
 a9cOBAFqZUadJDeQpgWqVsCt76LXrVXUtvofu0nF1QUGvoC81GX47bbPWD93nIvkhTFqDfZ7shP
 FkOQePN3gfMQPGA71Vw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4NiBTYWx0ZWRfX0+gGtOLHUC7I
 TSqSQyACd+RBqMabCTq8UZKC05Tg+o7HZbfR5cnsH221clF/aBRTpn+8RBsugdCvXvlAGGHar4q
 g3zptun4xxCL+9MW9QDb2kdKGYHlue0=
X-Authority-Analysis: v=2.4 cv=HbWB3SE8 c=1 sm=1 tr=0 ts=6aea54fc cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=xhLwaI6HiHkcQTGlYsAA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030086

Not every SoC the generic MIPI CSI2 PHY driver supports needs an OPP
table: a CSIPHY with only a single, unscaled power-domain has no
performance state to vote on, so running its "core" clock through
the OPP framework buys nothing over a plain clk_set_rate(). Skip
devm_pm_opp_set_clkname()/devm_pm_opp_of_add_table() in probe() and
the OPP/performance-state handling in
phy_qcom_mipi_csi2_set_clock_rates() when soc_cfg->opp_clk_name is
unset, falling back to clk_round_rate()/clk_set_rate() on the timer
clock only.

x1e80100 still sets opp_clk_name, so this is a no-op for it.

Reviewed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 .../phy/qualcomm/phy-qcom-mipi-csi2-core.c    | 72 ++++++++++---------
 1 file changed, 39 insertions(+), 33 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index 3de25728ed28..181813caf282 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -32,40 +32,43 @@ phy_qcom_mipi_csi2_set_clock_rates(struct mipi_csi2phy_device *csi2phy,
 	unsigned long opp_rate = link_freq / 4;
 	struct dev_pm_opp *opp;
 	long timer_rate;
-	int i, pstate;
+	int i = 0, pstate;
 	int ret;
 
-	opp = dev_pm_opp_find_freq_ceil(dev, &opp_rate);
-	if (IS_ERR(opp)) {
-		dev_err(csi2phy->dev, "Couldn't find ceiling for %lld Hz\n",
-			link_freq);
-		return PTR_ERR(opp);
-	}
+	if (csi2phy->soc_cfg->opp_clk_name) {
+		opp = dev_pm_opp_find_freq_ceil(dev, &opp_rate);
+		if (IS_ERR(opp)) {
+			dev_err(csi2phy->dev, "Couldn't find ceiling for %lld Hz\n",
+				link_freq);
+			return PTR_ERR(opp);
+		}
 
-	pstate = 0;
-	for (i = 0; csi2phy->pd_list && i < csi2phy->pd_list->num_pds; i++) {
-		unsigned int perf;
+		pstate = 0;
+		for (i = 0; csi2phy->pd_list && i < csi2phy->pd_list->num_pds; i++) {
+			unsigned int perf;
 
-		if (!csi2phy->soc_cfg->genpds[i].scaled)
-			continue;
+			if (!csi2phy->soc_cfg->genpds[i].scaled)
+				continue;
 
-		perf = dev_pm_opp_get_required_pstate(opp, pstate);
-		pstate += 1;
+			perf = dev_pm_opp_get_required_pstate(opp, pstate);
+			pstate += 1;
 
-		ret = dev_pm_genpd_set_performance_state(csi2phy->pd_list->pd_devs[i], perf);
-		if (ret) {
-			dev_err(csi2phy->dev, "Couldn't set perf state %u\n",
-				perf);
-			dev_pm_opp_put(opp);
-			goto unset_pstate;
+			ret = dev_pm_genpd_set_performance_state(csi2phy->pd_list->pd_devs[i],
+								 perf);
+			if (ret) {
+				dev_err(csi2phy->dev, "Couldn't set perf state %u\n",
+					perf);
+				dev_pm_opp_put(opp);
+				goto unset_pstate;
+			}
 		}
-	}
-	dev_pm_opp_put(opp);
+		dev_pm_opp_put(opp);
 
-	ret = dev_pm_opp_set_rate(dev, opp_rate);
-	if (ret) {
-		dev_err(csi2phy->dev, "dev_pm_opp_set_rate() fail\n");
-		goto unset_opp_rate;
+		ret = dev_pm_opp_set_rate(dev, opp_rate);
+		if (ret) {
+			dev_err(csi2phy->dev, "dev_pm_opp_set_rate() fail\n");
+			goto unset_opp_rate;
+		}
 	}
 
 	timer_rate = clk_round_rate(csi2phy->timer_clk, link_freq / 4);
@@ -83,7 +86,8 @@ phy_qcom_mipi_csi2_set_clock_rates(struct mipi_csi2phy_device *csi2phy,
 	return 0;
 
 unset_opp_rate:
-	dev_pm_opp_set_rate(dev, 0);
+	if (csi2phy->soc_cfg->opp_clk_name)
+		dev_pm_opp_set_rate(dev, 0);
 
 unset_pstate:
 	while (i--) {
@@ -405,13 +409,15 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 	if (!csi2phy->timer_clk)
 		return dev_err_probe(dev, -ENODEV, "no timer clock\n");
 
-	ret = devm_pm_opp_set_clkname(dev, csi2phy->soc_cfg->opp_clk_name);
-	if (ret)
-		return dev_err_probe(dev, ret, "Failed to set opp clkname\n");
+	if (csi2phy->soc_cfg->opp_clk_name) {
+		ret = devm_pm_opp_set_clkname(dev, csi2phy->soc_cfg->opp_clk_name);
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to set opp clkname\n");
 
-	ret = devm_pm_opp_of_add_table(dev);
-	if (ret)
-		return dev_err_probe(dev, ret, "invalid OPP table in device tree\n");
+		ret = devm_pm_opp_of_add_table(dev);
+		if (ret)
+			return dev_err_probe(dev, ret, "invalid OPP table in device tree\n");
+	}
 
 	num_supplies = csi2phy->soc_cfg->num_supplies;
 	csi2phy->supplies = devm_kzalloc(dev, sizeof(*csi2phy->supplies) * num_supplies,
-- 
2.34.1

