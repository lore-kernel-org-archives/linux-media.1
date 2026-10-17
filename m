Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9718C3BF684
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 17:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792257238; cv=none; b=fLdjU4iKjLWInXb/baFY5hveSIf+HE1zxvcmbvVKhAh56FUqPKu65eC08f2TnkxgZBAATt0CqtopmW9wzcH/E1fsf0HB1yuN09pLBco0qDku6tUTV0gcYraC7h7iX0p9rJk6S2WhTquuQrUAuQDHGAExNcOlvLSsBIvb1Xq+9Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792257238; c=relaxed/simple;
	bh=qb8oumom/2PvdHzndETk92xid5VBCe3skBrkXMR5kuk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ae7tgRObbbal3ankrOlmM41YFcLPB+H7lWtD1YKnPYHlGmkJ3s2cbqTqDWbn239EDlITlhbRpZuIDu+3uo4WcVsIY+amI9lEdX4uEE2qdVNOrOsTYnTUlKS94NsC7nuSUu8vFj50UN5gHaGcCNirtlrA8dxEobCBjWzVf3kFo4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CKQN9chq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bFghHnys; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CKQN9chq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bFghHnys"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HGA2Sd019420
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 17:13:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6r/UckFAEErFp1xd/71TZeckGQ6z2As9/Zh1h/yB9yw=; b=CKQN9chqQRxHZKyj
	JzCcWINtVC4GKdUDWx4qYSyI4c0WI5ayQxZ0H/v90RThEVhnf8CpSwtMnkJgf9Uq
	G24qti4LzcNbK458nEhf49yIfIbnkSoGdgs1kG4m3S6rwyS6wX/AjqW+nE2Opzdu
	WNAjsiLbDl9F6vtXtz+e6AzCzhy4r61tpszqBDDnDiiQRMaZtE7tfC2zYk4s6/eF
	4kPkSvKFDRgHo4VjrW171t9Dxs0eodlBogXnZUrG52q26QR+IqlMfm7KD4NAIjkz
	Nr7KSGUWvLxAWzQfjr7iX8atx/JSk27MT/Ln2qe//L4Hyc//L4k2QXTCMQ0JAa8Q
	nHlo6A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc26k19an-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 17:13:56 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c3c370b17so1851711eec.0
        for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 10:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792257236; x=1792862036; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6r/UckFAEErFp1xd/71TZeckGQ6z2As9/Zh1h/yB9yw=;
        b=bFghHnysODt1PWoZ8BxX5A5KKrGLmX0VHx45LCiwP2lXakb/yQGtpVpx2A8mBA8k6C
         OrndaTJ82ILnGbRorqlbQ7Yi7hSCf1rJU4xSOSr8cHR6gDUdGpZwnymCWDhURkXtK+7T
         dYS18QISS3K3cX3Ty1/zdP6gmXCJBXaE648mD7tlRT/d4DEN4tnK6ryF8rUGFPsJbRub
         X7f3zYn7hLiCd9Puq3tzpbYKUCIyre8Gg9AlMmnMyWsc/aTwmuUQk3C1WQfuy6SPP15T
         5aQsMHc3xpRSu19+bhtWw/bsYSKMW/BY0IRHPNqniHx3cruP3yp21pPqSXfTdLer5J0n
         pdOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792257236; x=1792862036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6r/UckFAEErFp1xd/71TZeckGQ6z2As9/Zh1h/yB9yw=;
        b=hA/PkX7T0N0pv/uMezoTVsTrQ/6nZLyoAwXue2TohjIoOQwjpNaJJSoAOi4kl10wHh
         LzBICJY2fuWErklXtxYujINo4rVzU0b//g93zOCvoZ57hVnNZUjcgoeNgeQNHUuDhPLt
         munh/QInZxnfIHl8cduankl/p7HbpFKpmso9Qt2NozVPE7dwScG0miuXBhdj0bi/29lr
         vHmoiYCx5vLcWqYHjM2hnV8GizbcgVOpzYmAviP8ZvIXkgF+HfDhcd7EQfZHzy0Zfczs
         prnzqg1y1OzpsyW8G9vDcS+Ogt4RJvqicF9kLLi2wSYGjqkP7Gx4X+Ih3HG/euk5129E
         SlLA==
X-Forwarded-Encrypted: i=1; AKwUvBzWOs4PwMfuYoXQ9pDMTcHmc3CYryjp5x6JuGNQcNGozQA8jTxAcYUQttHEPX5fGO5CK4hwzarpk1CtFQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLvc5wixqc+IU5VROes3D3heRVNV7CiVGiuwFCU64I5Lgex2IcS
	p8IlKBTCcrADY1ffL+ZFHhWzS6qcY1pqldFz1Hp/QZn8orxDBm6RhCi/ITB1QX6ne9LcyWt0jSe
	ZRtn6mgyzkZQfX3TKQwGsltO7462SMxih1BBOnH9pt82tm4ekScsVzRIMCtJH7wvK1w==
X-Gm-Gg: AYBFou3YxIFKctzk95v9UAOeGnSD/Wssb+6ruXafexFxGga47RkTdo6cBc0lp021KiB
	bkH1n8p/94g8kOkimSUfipwQQD2wM+Ke2xbMKw/gI7H2KvLWUP+Q8p5rsXpHhTdX43GwRNeD18B
	6YTcuDbPaUm051i3YsMY6dchipVTYeCDfzJWf8xUtnM+VFJEcK2SBA+NOMQ4n58udEyQiozst5x
	mImkukgNtcu/XQqwe5s34xGa0lPlcKnatFCqEVu95yAKilgMIIsHQcqTXEwpX3LGMTL2z5iIYTB
	641213WbIobgjWu7Vmfvd7tBHJNa+cylYZlM5INdvAyEIp4UQeLd4+UPq6A2efXXEmeg+/qD/YR
	gwulWb4n6BuBFqHnLOn8OodOTcHApog==
X-Received: by 2002:a05:7301:6447:b0:35e:2c6:d46e with SMTP id 5a478bee46e88-361a312a4a0mr5991361eec.41.1792257236181;
        Sat, 17 Oct 2026 10:13:56 -0700 (PDT)
X-Received: by 2002:a05:7301:6447:b0:35e:2c6:d46e with SMTP id 5a478bee46e88-361a312a4a0mr5991237eec.41.1792257234186;
        Sat, 17 Oct 2026 10:13:54 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6e33sm17893966eec.7.2026.10.17.10.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 10:13:53 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Sat, 17 Oct 2026 22:43:13 +0530
Subject: [PATCH RFC 6/6] phy: qcom: mipi-csi2: Add lane mask calculation
 for C-PHY
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261017-cphy_support-v1-6-8b0e1237ce95@oss.qualcomm.com>
References: <20261017-cphy_support-v1-0-8b0e1237ce95@oss.qualcomm.com>
In-Reply-To: <20261017-cphy_support-v1-0-8b0e1237ce95@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792257199; l=2691;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=qb8oumom/2PvdHzndETk92xid5VBCe3skBrkXMR5kuk=;
 b=5Z4ib2LnjfubTXuDJJ7kiwx/2IhiPqctYmRM+7eplTS5rb59j7to+uW3kA1nvHLdH7YdpY7Bb
 dvgIQioOe4fC/FtdKCYSWiYENddLBE5VezRTXKnQVSj06hsRhKqO3Xk
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA2OCBTYWx0ZWRfX4rzVZ4QrwIqr
 KsRNqH+yZ2/KJn5egG/ZiIqFkzZqswvZj56LuEZuJYWSPrzAJZ2UO5pHkIwE4snlcQRJoPVQfpH
 w7oSMrmwT4Rp3QNJIXRgc1aACj6cyhtpsweJux/CCk8uZMgeL7rsHtGQQSu/xaNB3d3iUdCg/RY
 3gIJ2mLNlZE+QWUa0SXhYuf8lBaNFIknj1st8j/vHhfw6Xl87AafYGoqEtjoLgKY60SaUPkOCym
 KGwKs2JWlixt6zuwAnqtT+Vf9oi4zcUn9KORLMXGWHI9tm3DQK9bvNPA6Dtt9VshlTEBAfMh2ne
 oeXx+Gq6fS1EkCt5q+kooodARI+SLw0SNFtv4N38n5hlmOcT6Il9x9qIY0ZC3HdhQ9MkzxsORgJ
 HF93S2OVlRwET2Mfo732DoENTmFbVJVHoCE1l4Lq22wvnfThMfu3jzC76kqlvNUG/DmtUwTlCIz
 t87dh/f1COS5b6TJZmw==
X-Proofpoint-GUID: zJUbD73m1LAlES_8hGKt50V-EqlDbJFX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA2OCBTYWx0ZWRfX8CAfPJM12tXj
 X6j+ALV8XY6KsncJkpfiopY2kFwMgtAKDAJe9bPH4fdVkHHVQUQ8G8HrMpjSjpCHMayYX2znQkL
 J0BpVm57Jl4Xv226Fl0URYHB8JCJ3xE=
X-Proofpoint-ORIG-GUID: zJUbD73m1LAlES_8hGKt50V-EqlDbJFX
X-Authority-Analysis: v=2.4 cv=Cowq4X4D c=1 sm=1 tr=0 ts=6ad3acd4 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=32Ig6A5ggYWErfKYfvQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170068

C-PHY uses trio lanes instead of D-PHY data+clock lanes. The existing
lane power-up mask hard-codes D-PHY bit positions and cannot represent
C-PHY trios.

Extract csiphy_get_lane_mask() and select the correct bit pattern based
on the configured PHY mode. For C-PHY, data lane bits are shifted by one
to target trio positions [1,3,5]; for D-PHY, the clock lane bit and
even-numbered data bits [0,2,4,6] are set as before.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 40 ++++++++++++++++------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index d93fd9845b50bd7e5623013aecd6db42dd491dca..5e7036cb7205d75c988a281eced60658b45c73c3 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -322,6 +322,35 @@ static u8 phy_qcom_cphy_settle_cnt(struct mipi_csi2phy_stream_cfg *cfg,
 	return settle_cnt;
 }
 
+static u8 csiphy_get_lane_mask(struct mipi_csi2phy_lanes_cfg *lane_cfg,
+			       enum phy_mode mode, u8 num_data)
+{
+	u8 lane_mask = 0;
+	u8 offset = 0;
+
+	switch (mode) {
+	case PHY_MODE_MIPI_CPHY:
+		offset = 1;
+		break;
+	case PHY_MODE_MIPI_DPHY:
+		lane_mask = BIT(lane_cfg->clk.pos);
+		break;
+	default:
+		break;
+	}
+
+	/*
+	 * CSI_COMMON_CTRL5 is a physical lane power-up bitmap:
+	 * - Bits [0,2,4,6] → D-PHY data lanes(LN0, LN2, LN4, LN6)
+	 * - Bits [1,3,5] → C-PHY trio lanes(LN1, LN3, LN5)
+	 * - Bit [7] → D-PHY clock lane(LNCK) dedicated clock enable
+	 */
+	for (int i = 0; i < num_data; i++)
+		lane_mask |= BIT((lane_cfg->data[i].pos * 2) + offset);
+
+	return lane_mask;
+}
+
 static int phy_qcom_mipi_csi2_lanes_enable(struct mipi_csi2phy_device *csi2phy,
 					   struct mipi_csi2phy_stream_cfg *cfg)
 {
@@ -351,16 +380,7 @@ static int phy_qcom_mipi_csi2_lanes_enable(struct mipi_csi2phy_device *csi2phy,
 	if (!settle_cnt)
 		return -ENODEV;
 
-	/*
-	 * CSI_COMMON_CTRL5 is a physical lane power-up bitmap:
-	 * - Bits [0,2,4,6] → D-PHY data lanes(LN0, LN2, LN4, LN6)
-	 * - Bits [1,3,5] → C-PHY trio lanes(LN1, LN3, LN5)
-	 * - Bit [7] → D-PHY clock lane(LNCK) dedicated clock enable
-	 */
-	val = BIT(lane_cfg->clk.pos);
-	for (i = 0; i < cfg->num_data_lanes; i++)
-		val |= BIT(lane_cfg->data[i].pos * 2);
-
+	val = csiphy_get_lane_mask(lane_cfg, csi2phy->phy_mode, cfg->num_data_lanes);
 	writel(val, csi2phy->base +
 	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 5));
 

-- 
2.34.1

