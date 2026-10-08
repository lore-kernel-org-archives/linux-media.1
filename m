Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846C73D333B
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 07:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791443691; cv=none; b=oGgO2G4Xzjkf1vfK6BpsqoNW4Bsrrhxdk59GJlydg9QYnQTC7X3TReRgUgvxdQCQxILUThW5kSr0XhJee2ZekrkHVUdxYxwS2SrnIGCQHDPenSsjQ6RMyJzp3nR79G5ULwaUPr97WobJ09npV9fwZqYvQCd/XbL6g69ovkG8kRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791443691; c=relaxed/simple;
	bh=ZWn1goxuLFlJhIXJvr21INebf9rK8SREbM++QGUD0ng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IeL8cq/srzViqVPqgMYcJh6E7juGEQfWSj7G8BzInfVaOnI+ykiRXA0No3ouD0xHxfAz0lfLHjlvrgQNudLn3kVonZHg/kmaivw0HBQkAtfjEGcxc3Pm92iL9S3/om2n50iYU/SiJ6EpEsgVEhiAkrZkOjU5LhigkWzJUW9RGto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FjUToq5H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MpQaSRTX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FjUToq5H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MpQaSRTX"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BZYA313878
	for <linux-media@vger.kernel.org>; Thu, 8 Oct 2026 07:14:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g5YAmdM5mpYFZzFAUloPIwCU1Y2dUjbjPhmaVIbMoRk=; b=FjUToq5HuSwahYp2
	R73ZKPL5QfroZgIfBp5sxA8EfeMelo6YOezeEW92HiokQAHVIh7Toxr09P2h2zie
	loMTf1NxkSrgDq5itoxlIlCYvtJQQ8fcc9q6AFbjz5pYgMVgZ5mrSF/1mj0bTrgA
	D7PFjNoWGnW98oZgnUEkyo1YgXzU3CT7QYWWLH9aukNs0P2DU0aVjknOyOHwxQgA
	jrA44wM4kWKdavFnsCdrIlUQviJnULU8+XWoEbr9FLbyrokMhC5lqu7LBNauMyl2
	S/Zy2vBwkwpCS2YH1riaQLf8b3rZCWokJ5UwQYC5t1pzeDImI5CocGIdi+PijmhV
	IIRkZw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe31kkp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 08 Oct 2026 07:14:46 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34d49d8dee1so5188264eec.0
        for <linux-media@vger.kernel.org>; Thu, 08 Oct 2026 00:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791443685; x=1792048485; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g5YAmdM5mpYFZzFAUloPIwCU1Y2dUjbjPhmaVIbMoRk=;
        b=MpQaSRTXzfanomyQbReUnX1oOOH3bsxovJ2hJ/e+/zHhIJW0Il7cBfgZcxfiwwwHGi
         Um8YaIauOgymcAkiRhrysC8VzlZYC55jY8u2Lao0MbkFlprKw8BsIZy/TCOn8xQtAHim
         Y0zlN1X8cr6/GmdP9XYwGLbnE/gZxv1w1Nm5e3YCGhIQNOUoZgH4FdUwakwyq/8d92uo
         DiNAQSHHASmc8lnznVY6wZL5/llVaUgaHgH0QAouo0CxRJ8CqwgTloE/H1OisSSwzN4o
         cEE3HLkpM5FrZB7QDewUkl5BOKHznnR/qOpqkes8Bv+jEF62kzhvA+/JlKTH1bgQ5r+X
         VTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791443685; x=1792048485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g5YAmdM5mpYFZzFAUloPIwCU1Y2dUjbjPhmaVIbMoRk=;
        b=RxcCa3sTdsb8YDeVARgTjkVLNx8G+ogn1VHn/dXCAtYY1FSZ84y9JYcyocuWL2/Wh9
         rdevY3zBUr0CI/7WVK/MihvCYJvJ1ET2eIdoQeumpMttIxA3NPtXNoNRE3VKjbM73lWm
         f3LL1VLL0Vi9CfhNMQ560Wab+P/ryuwXqiY0fAkFthoCgtpv1miYj8xxdx4NI45u83N2
         6ApAZYaRK80hPqP3kPdspUHJnE5OTD/X6gHw55ocfVw2LPW5x+uodfQiCVYdNp5Lv8fL
         nC1zmE8DCJbAdnrRlfOSQkNg60MwjCfFURL9nxUX/tZzAW2fN8Ro4Ax4iVz8ncKIvlyE
         EJqQ==
X-Forwarded-Encrypted: i=1; AKwUvBzvha81/08E9voNH2SLMPJ4l3DzJYC7zwM2IV2dlPkicvhVqoDIUTCW3OqcvF0zh2gRnXjLKkFHNuGGpg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJXl0o6oigPRmEXK0QW0kaeSnaxs6Q0giWTmuXCPBqtFUB0L2to
	lOo4IeJB8xRvz0CGXMt9VS2JlW3JkblgOhM7vjB8bKG/mtaM3721kUHCTAQ+CRewYzJMGQxUknf
	15DpdjUwBxB+OMkL8LqiPOtiXxLzh9h1B1xiGQAMVbcOeSTfPVh78/Mr8YgzBnAn46Q==
X-Gm-Gg: AYBFou29pvY1iIjmD6WjgzbfwqbM7tXPoezbVvJVO6jJ7N6aOeioZZiTPnwpO39KMhE
	CI9Xo+j23wZCqz3Jgn0oTk/mXCBK5xRo6F2P7Bekh/v3Gye0ao/ip/Vuwj5HIGPA+V1OFq0B1kH
	xNuZcihSS3nPh1STPHwWCXs/aEDUz2seoZEMVcqsBeFBzWtY0t4a/PLZaH/Mlhka8T+hfMHRBKP
	bKX/KYnQZIhrbKkWwvv8ZkCx8tRhpzqbOoIUmzOW+q9WJSkyETKdMiV1HylQhVDbDG55StMnJcv
	blkoZVdCIpg1sTKcfefncwDqXm1K7hsT5VXL4sjvAcPQKw3me52med/6fRt20ZVUvC+1wJ/vRJ9
	QWDCPvHpdM8QXtOZSAea8F3N6VHLrHn5S7jNTeLaf2fecNo+ioDfr34mXJ/CoGD0VV2PqC7zSiZ
	c7kqFN1J8zdw==
X-Received: by 2002:a05:693c:6394:10b0:33b:fc17:e786 with SMTP id 5a478bee46e88-3515de5da83mr5478293eec.16.1791443685372;
        Thu, 08 Oct 2026 00:14:45 -0700 (PDT)
X-Received: by 2002:a05:693c:6394:10b0:33b:fc17:e786 with SMTP id 5a478bee46e88-3515de5da83mr5478245eec.16.1791443684606;
        Thu, 08 Oct 2026 00:14:44 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515af155b5sm12251625eec.12.2026.10.08.00.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 00:14:44 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 00:14:39 -0700
Subject: [PATCH v19 09/12] media: qcom: camss: tpg: Add support for v2.4.0
 TPG
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-kaanapali-camss-v19-9-b2c583ef50e0@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyOCBTYWx0ZWRfX93Co7ORuOgep
 GjHS0MonqFDOjLrzBgD+nExTgWqMUjxSslISqRUhB8sEvoKFT9N/9WIjvkETWRHU5856jcp2Icf
 my046S0J8ig4UdTJnKXGz1LF7GQq/s5R0V1bGFsoSzb2CXr402FiEuzIpxmTP2ipjr1cywQBwmh
 ldT2ohwR2FHX5Unh0f564JmuVShqQpcsh8CD9iu/Mx8+ps4aMhjb7s6wV283mpPeFBCpLMea4dn
 tqldagPhNUdhlAN+SGVms4S8nsuWrQEYYyXT4sRg93pv8+Fx58+NAxMAO7MZ8Xu305IUpQ9hHdZ
 lg/MbnkWqOX0Pg/sqr6dZZuo8TMRGJi36D+y4FYjbYoY1qAlS52kwJVKwfgjJx7FNhXI8gO7UGl
 8/hCT9B0i5lFURTeX3UMAsqb06FLCXwONFdAFluJgpnGSOA4k1LOmm9jcnHKuwwyPQDmO8UgjXl
 OyXdzsEkR76F9h8qsnQ==
X-Proofpoint-ORIG-GUID: Yy0uEjBI8oSsdXmH8_QOI97JZA_kPdNJ
X-Proofpoint-GUID: Yy0uEjBI8oSsdXmH8_QOI97JZA_kPdNJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyOCBTYWx0ZWRfX8BtFrEpNgkeq
 1ClaKMzupiEdl42lR5dr9xZFH1QmxstyuMkeSbQDt0yLbFWgxrGC/HEhrN+q1SUMS3H2z+sYVBj
 SPYNPiUW0ShZDI20nkTLAtgdqyyBXN8=
X-Authority-Analysis: v=2.4 cv=KcdHIgYD c=1 sm=1 tr=0 ts=6ac742e6 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=zvpRHedlNIWp6186mRgA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080028

Add support for the TPG found on Kaanapali. This TPG uses hardware
version 2.4.0, which drives test-enable and reset through a separate
TPG_CTRL_CMD register instead of TPG_CTRL, and routes its output into
the CSID 1080 RX via the CSI2 TPG mux.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-csid-1080.c    | 15 ++++++++++--
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 27 +++++++++++++++++-----
 drivers/media/platform/qcom/camss/camss.c          |  2 ++
 3 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-1080.c b/drivers/media/platform/qcom/camss/camss-csid-1080.c
index 46e443e05195..851b3cd712f5 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-1080.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-1080.c
@@ -63,6 +63,8 @@
 #define		CSI2_RX_CFG0_NUM_ACTIVE_LANES		0
 #define		CSI2_RX_CFG0_DL0_INPUT_SEL		4
 #define		CSI2_RX_CFG0_PHY_NUM_SEL		20
+#define		CSI2_RX_CFG0_TPG_MUX_EN			BIT(27)
+#define		CSI2_RX_CFG0_TPG_MUX_SEL		GENMASK(29, 28)
 #define		CSI2_RX_CFG0_PHY_SEL_BASE_IDX		1
 #define CSID_CSI2_RX_CFG1			0x884
 #define		CSI2_RX_CFG1_ECC_CORRECTION_EN		BIT(0)
@@ -140,6 +142,7 @@ static void __csid_reg_update(struct csid_device *csid, int port_id)
 static void __csid_configure_rx(struct csid_device *csid,
 				struct csid_phy_config *phy)
 {
+	struct camss *camss = csid->camss;
 	u8 lane_cnt = phy->lane_cnt;
 	int val;
 
@@ -148,8 +151,16 @@ static void __csid_configure_rx(struct csid_device *csid,
 
 	val = (lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
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
index 5cd9641fea94..4e9447e11f04 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5863,11 +5863,13 @@ static const struct camss_resources kaanapali_resources = {
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

