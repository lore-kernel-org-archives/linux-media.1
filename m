Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F693D3321
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 04:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792209934; cv=none; b=iIDhhNRzgZoTm0idexMlTCNDUeyNE974rESzP+W2HqUG76wn6xjY8z3etri+txz27bn6VOTthXfA+3H6rmTQiFHtcXV2bTzdTD5Cux3RkDFIZDms5huPH+BF4ACCyhNb1izM6FhngspmxGTcTOnHMSS3kYIS6DQOGGqGXKURIGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792209934; c=relaxed/simple;
	bh=ZGB3BMtazrQQ6MMTIvyMgUHSYUWyrXV8YqQ6fJ8K0eI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iPa6DxNO3GpUt0wVTa5D5uxdRijeV8Q5nvK4EI4eghlWgQo5Kndd/rEYhMKsogYnWK93Ld2VWlYq/7mSr5Rr0eUybr+e14J+R3ZTREzQolJpqdtkWbjvhgBq/pOZUdeebMe+mfEwDmumSL4ZFFlUTnVwzGvtwXhKabeBXRdTBmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J1l6r2Rn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ol7GDRfK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J1l6r2Rn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ol7GDRfK"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H30S4l3542413
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 04:05:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jdsJ2ls6q39LpTyv1PA55j1F9Xs1I+m6tBh
	o/hxXmlQ=; b=J1l6r2Rnqxxnvp587RwFzhBsBVYMraYxLH2TJjuxA7xrwNC7Gjh
	G8qRafyr2VSoZD3v81Ne6BvRLgT2RDF1OjA1Rfw53Wm1ejRTZwbIyGymsYuzh+/3
	BiRkb6HJt0LWDgk3e+qXmwheirDK3ygAR6ltf2MxE9CvwxEd25cWNJ0Sn/Lo6rsX
	tuv+NZeSHb90SvT86yCg93pipNP6uvnEUkoLXfW5ObNixB8RlL5DpmXcmGaEVJWW
	ZpB/+/qM48PLgjaKZLfmNc+eb/P4la1JwpaHI0jrJUo52imUWnxpEnMbkjh8e8oF
	LM61jXptLEZuxzln8Wa1blPoetkKDD2FTZg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbxajrdfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 04:05:32 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35fb6be0f9fso1350576eec.0
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 21:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792209932; x=1792814732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jdsJ2ls6q39LpTyv1PA55j1F9Xs1I+m6tBho/hxXmlQ=;
        b=Ol7GDRfKAy81Q/uqlU9J7YzDTUA+nXojQOgzQaISH48TZb6dfyeCXT6gUBEDRs8Jb/
         p1O5dwQh+L10ZA1Uea+UCJ55YkrLoGlHQK/5g49fq09R/1DN+ZohQM2uw5EwuSiODS/Q
         DHVBkx7pO2dQzydgfr+1DEwosMieqVd+DklC3zD+RCBblRUGT4m2atM0r3cgEZxl3LrU
         PL3BsTQ4g5u0t2wlASNCa1D7IHqS0g7M0mRA8Bxw4dgWHCdCcafOUaZsLPHLUq5oO1Ac
         kI1g1XbWCuVBYtXfe/204It4qyO6ChNv4PWJzifZDMdgXh+hhQq8T2l7hptoNbUsmQMl
         tLgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792209932; x=1792814732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jdsJ2ls6q39LpTyv1PA55j1F9Xs1I+m6tBho/hxXmlQ=;
        b=oJFI+bSuRl7ZTTA+jeT0v/j3JBX8O8HNBNkF68F2o5vYlTQUi0Eiz6iXlDsOyPih/x
         4tS+6ClDlpMeg6VO6v+KJlSMWrfC3Il5I+crpLdBg9BJbZevNg1ZjnymQ8Rcwo0KtEx/
         PMuw5hWVxU5sB3KNdMetczIamv8CaM+UHqe52PF+aPA6bl6Lko7GbvcOcfsC2gak4e2Q
         ZDDBAGTY2oyGujrBeIRuls7+rpW2V14I+PLk9+0ZUfe2Kv54yg4a2UoK0QJCZX8GJOTY
         Hk5E4XhJaDLNFG+/uvEFiWl47tttI7yrpKOHHSeC0clHg3w0QQRlhs/MvTJ9bipbzfms
         P2rQ==
X-Forwarded-Encrypted: i=1; AKwUvBylXSUZ1q2bQJUci1KPzazS+PdwbKC94qB5L2eQAh4f/GwvbNWHgt1ovYa+x3lprj0bUsG4LaOgeDFS9A==@vger.kernel.org
X-Gm-Message-State: AFq9FYK7cpW4mAoeT6b92qh4G78SJ23vs7SrEoa1XHBGq3H5PhYJMSMJ
	AsKY1eXJi16/v4RvrG49ywR7/H3ykGlJhPskt8WBh2oLBWEzSFer3bSAZFjDyLdCJUYKrJdAUS+
	3DWtXJz6Ot4EucQcXgtvqVymtqR02+DIlhVEDVx0crWSrrhOk8JHPRyp0GfxKDyDNnA==
X-Gm-Gg: AYBFou3uuDzp8DoDHBerXMY7z5qIKgbwbtleiMBbKWYV2cfoUZL2yFUBGAzW6elrncg
	OR7ZR776M5RlfPN2G6+CRtoiUDACvCdIF+CJwjO/06OjQ06d66Hq46x1Xo9lcuEsMzS9VGtRJnw
	efows6klih3NxlLSoQZlL08AuRLHlURAR5aIoyPmkWc4a9krChiHZHXQeflTKJRzWCONqKfMGOg
	vwOHuQcU7p3qjGoKLN7Zvbe4epoOG40zd7SMMB9jR8T76tY/L667AhHigJQB/g8VzrgtgDse26/
	1PkZ09Y3qH7T1QaQ5DhfEdUCxfTpcyzWO6xBQqbHCkV2RMX2xQfgTut/iHuwLuL/t15DBe5wR1w
	r5FIYAYVDPej4s6K8sE8B3szQc9oqD8lZe9DzWSFAiuLgfYAmAgtnmQ==
X-Received: by 2002:a05:693c:87c2:10b0:34b:4b99:24ab with SMTP id 5a478bee46e88-361a1e501fbmr2738830eec.22.1792209931584;
        Fri, 16 Oct 2026 21:05:31 -0700 (PDT)
X-Received: by 2002:a05:693c:87c2:10b0:34b:4b99:24ab with SMTP id 5a478bee46e88-361a1e501fbmr2738791eec.22.1792209931045;
        Fri, 16 Oct 2026 21:05:31 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608297f4f7sm11190385eec.23.2026.10.16.21.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 21:05:30 -0700 (PDT)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: david@ixit.cz, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bod@kernel.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        bryan.odonoghue@linaro.org, linux-media@vger.kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com, daniel@quora.org,
        konrad.dybcio@oss.qualcomm.com, christopher.obbard@linaro.org,
        alex.vinarskis@gmail.com
Subject: [PATCH] media: qcom: camss: configure C-PHY in the new csiphy_stream_on()
Date: Fri, 16 Oct 2026 21:05:29 -0700
Message-Id: <20261017040529.3832120-1-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: FiCz5UN91Te2vVcY5dXmkNbXcXIJ6_W6
X-Proofpoint-GUID: FiCz5UN91Te2vVcY5dXmkNbXcXIJ6_W6
X-Authority-Analysis: v=2.4 cv=AOfP0WMl c=1 sm=1 tr=0 ts=6ad2f40c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Jz9lr0wY845TKGJsqGYA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxNiBTYWx0ZWRfX42LLhgYc1PkA
 0ToBJPnTrOnPlRRT2RGbbqdXojwgBDl5bGJkYLvpK4xTfq2o/KBi8LVXfLk7HVo5FOXh4vv2TRu
 wka6UdU5xIoY/S8JsMfX9lJYtSyPDbY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxNiBTYWx0ZWRfX2GqjNdN5Hore
 OqvElE9ZybQsLKll9YU5IZCJTYEZa3iDjj3VvEuRYQbwFwC+xOsrRDrD5eMhSfaeZty8LqkV3K5
 CKpfrocG/yzNNFapU67P6DI7GX6Eb+H5NToQuO6vy9jIFiPaRkdQunE0KMxG9dgz5FXiUcwPt9f
 zo66l1P47coWU8yA3+QmZPSyPvGI+B5yB2QOS7fIb7DEzBqJ+gUaBBQy88rOC5bsrZbmhBCg2IA
 iPM94q03LqdILgAgVtgLJIfTRyKj9mydSE4GJSP1ZWPTOKL7kTpoBDlaTk6cF+7BvNZFZx3INAQ
 X0DFkgkUWyUvwQht0yx3XXxLhLdKM3vov/DLvlhX2ue56R4NL7wDc2fjRbv5LaBwmv8Ud9DV5cd
 1lh/+BcawmCJNJ87FFkGZ+FoOKSL8K73koB2YyQ6NmHCH7X9+aWiWkaaLDq1JMtudAu/WjPRwdy
 RJaYkGNrfvtivNUptYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170016

The new (non-legacy) csiphy_stream_on() introduced by the PHY API
devices support only built a MIPI D-PHY configuration and
unconditionally called phy_set_mode(PHY_MODE_MIPI_DPHY). For a C-PHY
sensor this makes phy_configure() dispatch to the C-PHY handler with a
D-PHY opts union, which fails validation.

Branch on the recorded PHY type: for C-PHY build the opts via
phy_mipi_cphy_get_default_config_for_hsclk(), populate the per-trio
lane positions and polarities and select PHY_MODE_MIPI_CPHY; 
keep the existing D-PHY path otherwise. The shared
phy_configure()/phy_power_on() tail handles both.

Depends-on: https://lore.kernel.org/all/20261017035221.3816464-1-anusha.nandi@oss.qualcomm.com/

Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-csiphy.c  | 61 +++++++++++++------
 1 file changed, 43 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 60d58becc7c5..5ee07b969005 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -329,16 +329,15 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
 	u8 bpp = csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->formats->nformats,
 				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
 	struct csiphy_lanes_cfg *lncfg = &csiphy->cfg.csi2->lane_cfg;
-	struct phy_configure_opts_mipi_dphy *dphy_cfg;
-	union phy_configure_opts dphy_opts = { 0 };
+	union phy_configure_opts phy_opts = { 0 };
 	struct device *dev = csiphy->camss->dev;
 	u8 num_lanes = lncfg->num_data;
+	const bool cphy = (lncfg->phy_cfg == V4L2_MBUS_CSI2_CPHY);
 	s64 link_freq;
+	int i;
 	int ret;
 
-	dphy_cfg = &dphy_opts.mipi_dphy;
-
-	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes, false);
+	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes, cphy);
 
 	if (link_freq <= 0) {
 		dev_err(dev,
@@ -346,23 +345,49 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
 		return -EINVAL;
 	}
 
-	ret = phy_mipi_dphy_get_default_config_for_hsclk(link_freq, num_lanes,
-							 dphy_cfg);
-	if (ret < 0) {
-		dev_err(dev, "Invalid config for link frequency %lld\n",
-			link_freq);
-		return ret;
-	}
+	if (cphy) {
+		struct phy_configure_opts_mipi_cphy *cphy_cfg = &phy_opts.mipi_cphy;
 
-	ret = phy_set_mode(csiphy->phy, PHY_MODE_MIPI_DPHY);
-	if (ret) {
-		dev_err(dev, "Failed to set phy mode\n");
-		return ret;
+		ret = phy_mipi_cphy_get_default_config_for_hsclk(link_freq, num_lanes,
+								 cphy_cfg);
+		if (ret < 0) {
+			dev_err(dev, "Invalid config for link frequency %lld\n",
+				link_freq);
+			return ret;
+		}
+
+		/* Set data trio lane positions and polarities (no clock lane) */
+		for (i = 0; i < num_lanes; i++) {
+			cphy_cfg->lane_positions[i] = lncfg->data[i].pos;
+			cphy_cfg->lane_polarities[i] = lncfg->data[i].pol;
+		}
+
+		ret = phy_set_mode(csiphy->phy, PHY_MODE_MIPI_CPHY);
+		if (ret) {
+			dev_err(dev, "Failed to set phy mode\n");
+			return ret;
+		}
+	} else {
+		struct phy_configure_opts_mipi_dphy *dphy_cfg = &phy_opts.mipi_dphy;
+
+		ret = phy_mipi_dphy_get_default_config_for_hsclk(link_freq, num_lanes,
+								 dphy_cfg);
+		if (ret < 0) {
+			dev_err(dev, "Invalid config for link frequency %lld\n",
+				link_freq);
+			return ret;
+		}
+
+		ret = phy_set_mode(csiphy->phy, PHY_MODE_MIPI_DPHY);
+		if (ret) {
+			dev_err(dev, "Failed to set phy mode\n");
+			return ret;
+		}
 	}
 
-	ret = phy_configure(csiphy->phy, &dphy_opts);
+	ret = phy_configure(csiphy->phy, &phy_opts);
 	if (ret) {
-		dev_err(dev, "failed to configure MIPI D-PHY\n");
+		dev_err(dev, "failed to configure MIPI %s\n", cphy ? "C-PHY" : "D-PHY");
 		goto error;
 	}

--  
Best regards,
-- 
Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
-- 
2.34.1

