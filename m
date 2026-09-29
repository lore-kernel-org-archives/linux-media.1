Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DF84052D7
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 06:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790661664; cv=none; b=B4OM8v1NPwvE2G9CqT576e7PeeQRKrYVV5CFmxiVggvxniRFDCA/Bb8SSNQEsFda8zdppm4OoGiMVHeXOPmZtCr23YizI/yYkA5M6/7+K/4//HbzIoZy6W3+sC7l4WBnV6JcIuhwG9tjMiQ7imsgrjPsVo9lAWrqlDKFeQSXdPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790661664; c=relaxed/simple;
	bh=4xIt0EllDoY+Tgz+y2nkXsy2RSUlxdhW2Xjil7UXbk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D7J17DoF4vNzEhJyBtH50z5NOMdtci8+7H9gnc3sbx/pO76hzrTmN131e5et39DfTY20TYs0ulUrd5Woz5ERpRt8wS3K6NHsM8vuRT2M1FdMR+c56ToqMa4vQwcFxV1RfNfullLNdS0q1vUOPqMjxUlt3/ENoeq+7qhAZkbT7iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bzMWu4im; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I+RFq8Rp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bzMWu4im";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I+RFq8Rp"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T470dI2685996
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 06:00:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J9XpRhDCIBk7nECEJ0+8fGl6mP/GgAplTBJ4Fr8IU+8=; b=bzMWu4imBpeWms9C
	zFhWH60l/9IwkGY8ZDYh1zdbN1U4zbnVT05pY1Rjbju/i+ngG2JrRYj1HXBSBPPB
	qXB6wAfr8SDNyGxsqE10u6QVNHThjVh/a8Sk2hGEsTWUtLunvGLOFbJT3aPXE4wm
	b+4WlZcQPyMcQijQ+HDSgHzPQ64heHzD/FLdmA+qesO4uKC0yVy4ZdxDtEtv1BXs
	Pmjkl5PoZ1ctr0R8b+C5M2oGANiQbDTcYm7lze61Ixv+ziw/NGfAQtf1EVALlIPE
	vI5HB4G7PBAc1yIbeZpWEl4+DN/EgcZl4YpXBgOqEbJXNIDoFu6oDvEYCRLkfZVk
	AiQnjw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h02mjh274-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 06:00:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39e3c10ac70so5436650a91.2
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 23:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790661656; x=1791266456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J9XpRhDCIBk7nECEJ0+8fGl6mP/GgAplTBJ4Fr8IU+8=;
        b=I+RFq8RpUsNS1ixHhZsPoz925Rl5mKf8Fh1pX45lOCDFUHh1q05Zg3rOhq4Fu9YdW1
         RTGup1AT9glW4ieSRi9gOYwSEh6SAtHTOEQR7OJ9Vj+ntBWePAK9NqhmhK7/LLQUeI1N
         nCQXN7GMqzwFceY/4G8Csmh60LRHXxuyAL6KUdoQEH3u9q4FrxBw25zX/dobs3eSRuNp
         QkXiPKOoPJXpCdS/vtKCKk9xb5B/Vjs7gGB3qF/fW0ESqPmypOZ1Bzqnf7yawzVtJxr9
         qQlXMt2vnGuMrpmTNjcXwtAQGUki+oLRbykmMePKTC2oYFdivqIO9k4H71djxkADNzdk
         nIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790661656; x=1791266456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J9XpRhDCIBk7nECEJ0+8fGl6mP/GgAplTBJ4Fr8IU+8=;
        b=htomPxNyibcTWr1XOFjpH8KIQWdzvoATMfZeC5xWy8FjhEeObaCLqHUs552vBjm1z+
         87KnmWp8Ljf7g/wumGyyd64wVi/prsh2+ktxYGodLxAcx5Pyat370EJONbO+XdRa4HTf
         kgm3DPcq99iJ6ad4YfK1OVzzVdQlnkd9xQ1CZKHWHeaK63H5MX0iiUxK43TLxRGGmveu
         oGYAObdlTeJ5a2VGiQY1ZbVfesPXOLxTe6Yts1g+HB+xhhuNxx0ySD5+ov1QPTIGGNZn
         px0IxZTJyCQJ/Lc8wlN7t081A3b9HlQ0s9/+6hGiTgy8tXN2fpXvP1Qom4zRXCXBkoBd
         GIxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzEWZ5luDT85Hh5R5tK6ct47i9Gboml4lHMBAFHgjaSBCvIHF3xctj0OTtOnGMC2D2opxHAmEl1ZjHxqQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIkSmxibnVINDilb/J+8aYfokgRilDU9I+MSdJ7Qwu85wNHlpfc
	2hXGBZEcOGJRz8yP7lFoy0DGm/zruIzHeZmW9vOlGXBuLs0/lEea75jvNNqmcVAYR9s3fq8fELH
	v3uaGqH9ywUNaqqsmv5RSl8GOCFUlBDwqCDSqF3v/LEnzWABZfnqLuaS3XmubMpEFJA==
X-Gm-Gg: AYBFou2HxPE88+Ezxi9ULourCtKHbRQ98o5yvZkT9k5k9u5VhgpsrmS+uz2geRYWM9A
	q46HKhjt6JOCBf/w5qNkZuINSoYJP7gPd8+OJh8YlXQNaLUC0CxlrcUF88OhnUOrXbhUGQmxRkX
	jkK/3/BfdWoq7YArl+3mJIlxgaJCdLnuDKmXSAQ1q4RkWMAohidI31Mgy8csfFWD24sjOyexNFe
	BcFU/33RB76d0DqNdPOA21KvvDjA4BrswPKk6olPBc+hwel4og4cg10wtOrmaLJshpWndWMZbfd
	QluiPZDBNWhUDEoRM6oBZ+gY2CpEFx6Sau5Sm0cyrZJf8SoHDsWnuvv6M5mRcGSt0RxDJ7y7zZD
	N6Ttw581tLng0A9e4e+P3QgduVmitvXT6qzAyM1MDgOysKhOaiBvZyNa3BDbV8inwkoJHs7WiVe
	U0wMzrJov3yg==
X-Received: by 2002:a17:90a:d444:b0:3a4:a383:f9cb with SMTP id 98e67ed59e1d1-3a4a383fddcmr666335a91.22.1790661655849;
        Mon, 28 Sep 2026 23:00:55 -0700 (PDT)
X-Received: by 2002:a17:90a:d444:b0:3a4:a383:f9cb with SMTP id 98e67ed59e1d1-3a4a383fddcmr666295a91.22.1790661655350;
        Mon, 28 Sep 2026 23:00:55 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4985ff0f2sm3383588a91.8.2026.09.28.23.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:00:54 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 23:00:34 -0700
Subject: [PATCH v17 08/11] media: qcom: camss: tpg: Add support for v2.4.0
 TPG
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-kaanapali-camss-v17-8-dcf3fd37f76c@oss.qualcomm.com>
References: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
In-Reply-To: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyMyBTYWx0ZWRfX68CmcBH7s5hS
 vSumqbyKZxeUwb9HWb7GB9qAcJyLIdR3rg4h96rpAumK9Zr5jSqKoY77g7JJBdmsYb1PkCcd2Gy
 FdAtyCkKqUFxDPk4ewmwfydh+dbKQ3ilRQ8k7AHGNft19yuqmfqas0wsK6hcga/Jd+DfZhEYu0b
 HaPqkCGFNNG0LcnC2xQKh1G3Eo8UZM+eGNAQbS6v0i07wnZMv6LELhvGmNVJRG+IoRIzOoYPlx9
 Xzt9HIFsnttp1jI2j7MhxY5DBAIIkH8U2bgQBg/o+dqrmEhvWo4rw98fOG3QWYaab0Qg9aNIoLR
 au90dsr4Pz9s1hDh5NDHPF/N861ZqOiQhNsHzCZqs53GxUE/r4kQBCiNXN9p3TEYld1HZMKWTfQ
 IpYQ2jqqzPE6foARrHqH0qwiN1I/AgcX/v6IneyHkwuESGJy73DNFAcSpuHnix8E8yrJiC2IKc3
 YBAdeHqHTYetusmU7dw==
X-Authority-Analysis: v=2.4 cv=OdgNnRTY c=1 sm=1 tr=0 ts=6abb5419 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=zvpRHedlNIWp6186mRgA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyMyBTYWx0ZWRfXy+knASQ1RXCK
 /hwa88/kePNCckGY+TBTiUjAxnQZYDNrAsp4rx4JfBCAkfBLoY/pTpy8BUrna9Z9vIg8EE6chLU
 SeCDmpKjXVlvMoy0Iwn/xEbNQeHiegE=
X-Proofpoint-ORIG-GUID: WADRDiy9GHbZ1rXWTQ9m6kflzaG90U0_
X-Proofpoint-GUID: WADRDiy9GHbZ1rXWTQ9m6kflzaG90U0_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290023

Add support for the TPG found on Kaanapali. This TPG uses hardware
version 2.4.0, which drives test-enable and reset through a separate
TPG_CTRL_CMD register instead of TPG_CTRL, and routes its output into
the CSID gen4 RX via the CSI2 TPG mux.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-csid-gen4.c    | 15 ++++++++++--
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 27 +++++++++++++++++-----
 drivers/media/platform/qcom/camss/camss.c          |  2 ++
 3 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen4.c b/drivers/media/platform/qcom/camss/camss-csid-gen4.c
index 4ff2f41f70f7..bc52e4a1135c 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen4.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen4.c
@@ -63,6 +63,8 @@
 #define		CSI2_RX_CFG0_NUM_ACTIVE_LANES		0
 #define		CSI2_RX_CFG0_DL0_INPUT_SEL		4
 #define		CSI2_RX_CFG0_PHY_NUM_SEL		20
+#define		CSI2_RX_CFG0_TPG_MUX_EN			BIT(27)
+#define		CSI2_RX_CFG0_TPG_MUX_SEL		GENMASK(29, 28)
 #define		CSI2_RX_CFG0_PHY_SEL_BASE_IDX		1
 #define CSID_CSI2_RX_CFG1			0x884
 #define		CSI2_RX_CFG1_ECC_CORRECTION_EN		BIT(0)
@@ -140,12 +142,21 @@ static void __csid_reg_update(struct csid_device *csid, int port_id)
 static void __csid_configure_rx(struct csid_device *csid,
 				struct csid_phy_config *phy)
 {
+	struct camss *camss = csid->camss;
 	int val;
 
 	val = (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
 	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
-	val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
-	       << CSI2_RX_CFG0_PHY_NUM_SEL;
+
+	if (camss->tpg && csid->tpg_linked &&
+	    camss->tpg[phy->csiphy_id].testgen.mode != TPG_PAYLOAD_MODE_DISABLED) {
+		val |= FIELD_PREP(CSI2_RX_CFG0_TPG_MUX_SEL, phy->csiphy_id + 1);
+		val |= CSI2_RX_CFG0_TPG_MUX_EN;
+	} else {
+		val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
+			<< CSI2_RX_CFG0_PHY_NUM_SEL;
+	}
+
 	writel(val, csid->base + CSID_CSI2_RX_CFG0);
 
 	val = CSI2_RX_CFG1_ECC_CORRECTION_EN;
diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
index d29de5f93c18..770a9e5d5ba5 100644
--- a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
+++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
@@ -22,6 +22,7 @@
 
 #define TPG_HW_VER_2_0_0                TPG_HW_VER(2, 0, 0)
 #define TPG_HW_VER_2_1_0                TPG_HW_VER(2, 1, 0)
+#define TPG_HW_VER_2_4_0                TPG_HW_VER(2, 4, 0)
 
 #define TPG_HW_STATUS		0x4
 
@@ -33,7 +34,9 @@
 # define TPG_CTRL_OVERLAP_SHDR_EN	BIT(10)
 # define TPG_CTRL_NUM_ACTIVE_VC		GENMASK(31, 30)
 
-#define TPG_CLEAR		0x1F4
+#define TPG_CTRL_CMD		0x1F4
+# define TPG_CTRL_CMD_TEST_EN		BIT(4)
+# define TPG_CTRL_CMD_HW_RESET		BIT(0)
 
 /* TPG VC-based registers */
 #define TPG_VC_n_GAIN_CFG(n)		(0x60 + (n) * 0x60)
@@ -164,18 +167,30 @@ static int tpg_stream_on(struct tpg_device *tpg)
 	}
 
 	/* Global TPG control */
-	val = FIELD_PREP(TPG_CTRL_TEST_EN, 1) |
-	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
+	val = FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
 	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_VC, last_vc);
-	writel(val, tpg->base + TPG_CTRL);
+
+	if (tpg->hw_version >= TPG_HW_VER_2_4_0) {
+		writel(val, tpg->base + TPG_CTRL);
+		writel(TPG_CTRL_CMD_TEST_EN, tpg->base + TPG_CTRL_CMD);
+	} else {
+		val |= FIELD_PREP(TPG_CTRL_TEST_EN, 1);
+		writel(val, tpg->base + TPG_CTRL);
+	}
 
 	return 0;
 }
 
 static int tpg_reset(struct tpg_device *tpg)
 {
-	writel(0, tpg->base + TPG_CTRL);
-	writel(1, tpg->base + TPG_CLEAR);
+	/*
+	 * On TPG older than v2.4.0 test-enable lives in TPG_CTRL, so clear it
+	 * first; v2.4.0+ drives both test-enable and reset through TPG_CTRL_CMD.
+	 */
+	if (tpg->hw_version < TPG_HW_VER_2_4_0)
+		writel(0, tpg->base + TPG_CTRL);
+
+	writel(TPG_CTRL_CMD_HW_RESET, tpg->base + TPG_CTRL_CMD);
 
 	return 0;
 }
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2f835cf2e32e..a14947a7ac89 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5793,11 +5793,13 @@ static const struct camss_resources kaanapali_resources = {
 	.version = CAMSS_KAANAPALI,
 	.pd_name = "top",
 	.csiphy_res = csiphy_res_kaanapali,
+	.tpg_res = tpg_res_x1e80100,
 	.csid_res = csid_res_kaanapali,
 	.vfe_res = vfe_res_kaanapali,
 	.icc_res = icc_res_kaanapali,
 	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
 	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
+	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
 	.csid_num = ARRAY_SIZE(csid_res_kaanapali),
 	.vfe_num = ARRAY_SIZE(vfe_res_kaanapali),
 };

-- 
2.34.1

