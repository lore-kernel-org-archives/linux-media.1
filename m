Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922704;
	b=EO9td+z1A7fTpUh7SsPC+A6aOM1C27PeK4D/2BSj12PmjpLUQkkbSie9AKiG3MGcOJJl
	 c5YbV9Yxm5Qz8LsvSQpgtilJhOsq777lFdwA3wCw+bY++AWBPG2BnctMq959b3fkEzbbi
	 cAUQ5UTwA0RVECEMFZGvoon0QQZQRNN2k1OgQDCij6zP9vSnFCOPYJpVtWJmwNSPdjivW
	 MkMFssT2SqO2DkrSK9ka7Fs7LLCtBpxhxxnpWppWRoIPj8eiKqnpNLm6dB+hdoQjk/5Hf
	 +w4R0cbzYvRPsonY2PIPhrSmLdKLetgYcnK9f/Xna9K2PN5Ub35ibFBLUlLk2nIdrmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922704;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZPLdkk8872+3hTdrWeH9X039pnhcr7CAG7eCMOqHgoo=;
	b=AQd22AkkmoDoXOZJGRdZPtqnRi1drtlNIcXlU3Y7t7hDdqkKPF/w7zbMjNYgXe32r+vw
	 Jrqnga2N6/K0SV4t1+wmQdpAnB79mGWFQgPnUxiU8BFmvlTO9hcjcmEVb1dAC8kcRrH6Z
	 IlgTSTatvi/uKx+W3tS35dxSYXve3/OeDdALyOvw6s5+ORfDjz2m5bn6ce3MYdPM5DTOb
	 1n03Fw8yl9qXhUd3pI3PGZv5oqqlEZCjcpQiTsROhq2nrR1Ykd27+EZ3c73owwPqfeZOZ
	 CurPGwOhKeqWALyD0tJUqpbD1oZZXjT5m9T7wSsy7nz6FuynSnuAMcYoUqzT7LNSsAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UkMr84MR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jViDaO+s;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B5C606D810
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 23:51:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28B5C606D810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UkMr84MR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jViDaO+s
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5Ngnf0664822
	for <linux-media@vger.kernel.org>; Thu, 5 Nov 2026 23:51:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZPLdkk8872+
	3hTdrWeH9X039pnhcr7CAG7eCMOqHgoo=; b=UkMr84MRhG2lwl6GRudk0/V1aKS
	k6KLoW94KwpoB0/8NXIq8PN2pxR0aylngS8LJuzs+1ioj8sPRmPgOiuJuZq61DMf
	Nb78RcqMZoNje9ftXFatgSbVwuvSUsZwZ4Bz1zDzk8Lvy4atOm/D70c0D7pr6SH+
	/uUE4vmoAGYVIaBcznb9huBgRNsta7bZJtxMd3YSpxWgyFTfc+lVbsLtVHreYEm/
	2hBdudXpsOqHnLFHEhy5V0Cq0rsba5oIrS2KBwzOh8LX3NClFBfk2brdXvhB1/dx
	RkTlGEJ+C3EcNoR5cNO0dqSXB7DWUxTiGbJ2LgZ7RaRrbX2kTBUzsKMEG5w==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pc8189-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 23:51:42 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139b62317d0so478410c88.0
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 15:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793922702; x=1794527502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZPLdkk8872+3hTdrWeH9X039pnhcr7CAG7eCMOqHgoo=;
        b=jViDaO+s+ivKsMA2QnAHSoZfkgIrZrQTPI2rYIxck7cIOlBNOyEIYeX4Dn9xxB6xpt
         0UWqtFrewptgL5IGTyroBcLjdygbiQeH7GbzmalXo2GtVVZ/NEHa00gWZJzgGqjY3LAI
         w+wMwpcEfTN9bfecGu8hwI+8Rak5qLqQ+YX6nu0F/cTCKRyjVjPlzvrbe1bUaoqTQxBF
         hG1jxQ/gC6m420RNCYWvBg3c5RzDeMTQuI3Cr9g7CgTm3DaK8EjH3yiUyPCXGFwgnrC8
         eSmLzLi2Ik2SNCGZ1e4sr+R9l+0t7o6+1IBb9IO81YuCdez+zOmrvFFbzbhkiYM/ADJN
         ggDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793922702; x=1794527502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZPLdkk8872+3hTdrWeH9X039pnhcr7CAG7eCMOqHgoo=;
        b=s/T/lfCNEdl4qR55t0QLdZzKBz1O+6+dQg4r2nzPdeonnLdoVVAJ3b07RBEebSchDj
         OORVgUp182jpckdFoSh/yL7TEqweeBeaOmLqK7Bz+O6WLjpaYU6F8/uZJ4TjYokWfUhg
         ZIuC8cZY3AWk3BiDQq9ZnoOBQEQzUDthsb6RXHyDnsKaPX+y1zdS9XcPo7Y6vrnNrEY1
         Bp+xnv1u9JlPgap6gvaWq18uclxxnTw3JThdO7Dis+OBmpAN8du8Y67KVc/8F83zKtZs
         XQ0Ei7ToWBg7MH4IKfnNiLaMP7QrMRwJwUCZeAGi7eO8x6XCaY3gZJPwiq+Zoj8SHdm4
         D7PQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6Kw6NUMJZsTcpdmXyrt1nWcN9swALO028DhsAtDCvaVickndn8EprPI4wET9r9CgBbppZBAEZ/vg4Jw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+MFYOea+/gh6g8pj8h5lo7k9M98lOQI8wlDP8/yJL+kFRK6ZtV
	bW/y6UF0+gfRUXUHCbg0o4k+nS3/8cqqxJdDYm2KBNUHKzyrjswVGobyziG36JEBKei2KfB/Z3u
	AIDxhzq5VIBEMCOWiq2obu8G9HPci/cui76twDtwQCh647dFvda6ilUkQKWC2gAmStQ==
X-Gm-Gg: AYBFou1xOh+BWHUDqYz3k2LHNIGYy9iM2X9+5sinC8T3ZENRcsqpAlyAEcMKprOk7Xx
	i4LV8vTpgqi4BwqRlDKK2tW5bPb2B0SEpB5JZnCcXh8W768/S5/cJ8nsf/D7sdrII0w2qdM8vKb
	0dY6A5Oq2RFkL02qKH3snZUNx1Zb0AOqsUQlm8lmzBFuc6l6mYRogbicbXjrRYrE0x5lOMuSbgr
	4C+Lx0NhVdlziiF56p0lhr+l8lvavAHxfv2epawEsBmUG5wYgR0fLmvg+1/yRpfazyUv04isMlO
	J1wDS9Gv1qCcRiOK2j93ERGxDg+vkD0t6+obwbmF6GOPdvAZpSKRKR+LFMpjlAG0k2r2S0lunE3
	gEyWpzfUws/opUYQXqOi7bK0ZXzq5BJ//oTMfpF/1+iKCbItVlUttUF0VV/3FNicZkD/0PzP+dM
	+oi1NSB9Z4f8EQ2uVpnYmzU2bm3vM=
X-Received: by 2002:a05:701b:280c:b0:192:e5a8:6bae with SMTP id a92af1059eb24-1b25d368d72mr666745c88.40.1793922701649;
        Thu, 05 Nov 2026 15:51:41 -0800 (PST)
X-Received: by 2002:a05:701b:280c:b0:192:e5a8:6bae with SMTP id a92af1059eb24-1b25d368d72mr666717c88.40.1793922701154;
        Thu, 05 Nov 2026 15:51:41 -0800 (PST)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4a63f6sm389041c88.9.2026.11.05.15.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 15:51:40 -0800 (PST)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 2/4] phy: qcom-mipi-csi2: Make OPP table optional
Date: Thu,  5 Nov 2026 15:51:35 -0800
Message-Id: <20261105235137.2635442-3-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105235137.2635442-1-anusha.nandi@oss.qualcomm.com>
References: <20261105235137.2635442-1-anusha.nandi@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: fsorrJ4zYzlKJpD5L49s8OQiLpjgGa9a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA5NSBTYWx0ZWRfX5PgcI4JnAeVM
 KySfXEabVR45htUlrzBvDfpJk9BQ1hulYbtNGlHZzGrGNDpwGZMlTrLsdkxABz6643mzho8nNcT
 pMxifWisWaHeYE0o2Dw2/RdW0EIf7m71QpxbGz8GkN0PTocd5arY1mxSP0s0GJ02HxCPdNihehk
 xYiO25r4Jq0F9VJyFvquBtGQ+Cb+3rZTtRMvnnL1dL18bDL91G25X/2qWwmkrkIzIvSJfcxEyS6
 pxTodFwcRU4a8ehjoNEyz8mSEf00rOZHfefJ7m2hYEJbMzPkKse05/UwTV0BDeIlqjc9pdeu/sX
 h8WwFT5/5IIoXrsLGklYG+rdkTa6YpXyyLmrO38XKOcHmabYzM8r/x+CPx9lwlXtD3jiqHv0pux
 F0eOZAFL4x2JOMAzg52rlkepkwQ+dNLOypmGNyBfG1ZMp4nwsREaWhhZALjuF17J7GgJUqcQLq5
 msMV6BiXmB6EheGIddg==
X-Proofpoint-GUID: fsorrJ4zYzlKJpD5L49s8OQiLpjgGa9a
X-Authority-Analysis: v=2.4 cv=TI3Q2Fla c=1 sm=1 tr=0 ts=6aed168e cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=xhLwaI6HiHkcQTGlYsAA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA5NSBTYWx0ZWRfX00zQn+/BRvc4
 GKMSnbkYzGG6eUcljQ8IsyLHxVs+4MpGx9sj8sktZGB+TGu+R7PIvb7NRloKm/5zmNjnKlGkP5w
 UeqvdsDK9DfOYTZvKIT0mJPxzSvoXDU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611050095

Not every SoC the generic MIPI CSI2 PHY driver supports needs an OPP
table: a CSIPHY with only a single, unscaled power-domain has no
performance state to vote on, so running its "core" clock through
the OPP framework buys nothing over a plain clk_set_rate(). Add a
no_opp flag to struct mipi_csi2phy_soc_cfg and skip
devm_pm_opp_set_clkname()/devm_pm_opp_of_add_table() in probe() and
the OPP/performance-state handling in
phy_qcom_mipi_csi2_set_clock_rates() when it's set, falling back to
clk_round_rate()/clk_set_rate() on the timer clock only.

x1e80100 doesn't set no_opp, so this is a no-op for it. The "core"/
"timer" clock-name strings themselves stay hardcoded literals: every
SoC this driver supports uses the same two names, so there's nothing
to make configurable there.

Reviewed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 .../phy/qualcomm/phy-qcom-mipi-csi2-core.c    | 72 ++++++++++---------
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h     |  3 +
 2 files changed, 42 insertions(+), 33 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index 269232499fca..8bebc943a771 100644
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
+	if (!csi2phy->soc_cfg->no_opp) {
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
+	if (!csi2phy->soc_cfg->no_opp)
+		dev_pm_opp_set_rate(dev, 0);
 
 unset_pstate:
 	while (i--) {
@@ -405,13 +409,15 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 	if (!csi2phy->timer_clk)
 		return dev_err_probe(dev, -ENODEV, "no timer clock\n");
 
-	ret = devm_pm_opp_set_clkname(dev, "core");
-	if (ret)
-		return dev_err_probe(dev, ret, "Failed to set opp clkname\n");
+	if (!csi2phy->soc_cfg->no_opp) {
+		ret = devm_pm_opp_set_clkname(dev, "core");
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
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index 7e55ae007370..6cf9e5b956f7 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -68,6 +68,9 @@ struct mipi_csi2phy_soc_cfg {
 	const char ** const clk_names;
 	const unsigned int num_clk;
 
+	/* Skip OPP-based clock/pstate scaling. */
+	const bool no_opp;
+
 	const struct mipi_csi2_genpd *genpds;
 	const unsigned int num_genpds;
 };
-- 
2.34.1

