Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200890;
	b=Vv84FV59jJhrNTZHVwtOswDMUC1hqxx2g2RqN0PkrdYqyZ/bhhEzVvNoWMsFRGN5EyTF
	 19/d+gUjMTDhuN1meeeeQhPG9W52n/S2BPHjz+4c4Yk2KjyIQDZH+nJhDOqNK6ZQQCvIz
	 t1xMnqpdBL3ReaPdvJtiEwn4hKbKkGEqwrkEY5f/JDQUlrHGb+LhORJUsS8YcNl6bQPMO
	 ho6Mn19OBCT7aQZcWbcVCXJ0TzojIil/n3Y1PdkPupQAuc7bEADWr94ZKaZS2K5/4EN/3
	 iqzNQ+HVn5mvtLo69DgSZvgUqUJAnpq97hMZMOW+U8Dqft8oAp3j71fQZNKYOX+vzpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200890;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xDQYtF8k8ZaWbb7+5j3FW9elWsMzSAcqwviqB4BRnpg=;
	b=GIFNkbhNlD1cYV8y3Yd6sQMhEtFPW8yxK1V48X/WbWuU6/7NtMVBDY+cGbuc2nyHJdm0
	 qUQUfloM2quIp1hFUGsqaMZmc+JV6mCzwEFr3b2/NqB4kIVYhfwdFAr6fKXO/AR6iA24z
	 QGWdeDmjlkrImr3UdtpgTzG41fNhPggDIFdTgkk3AtwI1OqznvA02jgs2wSIseqSBnc3Q
	 8neEDbOxC7RCUcQXzHBB4uhtQfjs9T4rzbdbPFeEAiIxWAoqDQku2jw6CnLHC00it9JYE
	 h/nCAdzuiqJb8nwx0/P+hf/YrS++YiDAUCe1vgIjJMLHIhAMUtQ1EBjYkLU15Y5Tj1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="HuE/je94";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hFHBlnJx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2CF60A6F56
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:21:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E2CF60A6F56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HuE/je94;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hFHBlnJx
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFA7pO1471918
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xDQYtF8k8ZaWbb7+5j3FW9elWsMzSAcqwviqB4BRnpg=; b=HuE/je94ZcOYhWRc
	ghkn/2Qmm/8QFtNHdl770cBwJlasdQH27/aw919vM/IrfvXWHt7bbiMi2Cr3l+5F
	nqOgms7g1wpfHGJJpNNehwH+csbph54uH8aEO4nG4Ej1t/lS/Dq3UTfKa7hSl10z
	dfiGUSHwtnfLw+yEC2QvGOnUTpbZjQVLO9dWD5gSSSvkRkCjabxm6E4lYSIHXpXL
	14O3ZcYxOhwPZjVXualqXskPA2FfcfY3EiDrQrpFaWWAu8+Sm2y8bqAr0oIvVdZV
	RnIpqY3U2lZv5EfW/caRhgX5l/Tflc+IfkdFhOpQ2dzD2c8X7U7FouPUMn9iqjUg
	wWtGbg==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkfehh493-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:21:28 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-67994010b21so42232d50.3
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 08:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793200888; x=1793805688; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xDQYtF8k8ZaWbb7+5j3FW9elWsMzSAcqwviqB4BRnpg=;
        b=hFHBlnJxLJuofQKH7JwhJyBJS2gbVj9sZ1PfWKb3brbJGdXSRopYMr/oPXpl1WeCNK
         XUYFMWaFwJH48dwzFV1CGxHKnIMJU9sy4bpmE4JZ45LQ7zNz0QEGBN/5QWAnTTBuwtxC
         VWkZ2BDPO8lYSm3MZCpaiWBQgxUvfJm4iuYqexpjH9Day7neqLCfj3VuP5EQ8XeuwTsP
         sBDIv6rRGpleWd122AB4DI5VC+FIrhYRV2LoebyAj9S/IUgG926pNipjD7ibHE40LGDy
         ctde3VHh0xEUFK/g6wYRq/NZW2nxVl4/5SQrsZxI4oaazZj/8miO1BLd9G0HUqWMta+f
         GUug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200888; x=1793805688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xDQYtF8k8ZaWbb7+5j3FW9elWsMzSAcqwviqB4BRnpg=;
        b=Oqm5ALVx8nAHaoYiXTTWBefShosv9VvwEGVn9HOHGKR4U+baR+6dN6SqbRVGSKV36I
         hfP1NhZcrPA+ipqdwjPC3TJ2TJSKX89xMT6z0WZs6fqP7sXgyd4ucszbRjX+VLg+pfjh
         1NMvQUr4aGCf/N0m8FZcxCk/5ZZMNt+3LfsAi2/v75fCHHc6lZpBCYc0FV30cWLSLoGr
         T1xZueAWlBp+kc6VjvXaOrrJ+hjMfblkj6sMGt2hkB7L9tYE+Jd0SEoUMKsVvR0RW0yr
         fx3PGCWFRYfOHs+EP6a+5Tol7ifxfCN0YlZOfV8ZfqYKG3MKi9PQa1EXVpsvoEVOOqpr
         5xbA==
X-Forwarded-Encrypted: i=1; AKwUvBzsEPvxo5tZTNcpJ9MLirJwQT2j2Za7Cfw42ituLckvY8oIbVoCxmnVAr/wkBYODafVIyMl/3u5gJdF2w==@vger.kernel.org
X-Gm-Message-State: AFq9FYJJflAH/XwQnkg/ag1vY97Yo5rK2ICKzHnwPUGzDS//soeI5uWM
	rbWevw1Zgyrw4cIdypwNZA7rd3M9j99qXW8fjp+ddGUH0Zfr5GlcOa7ceQ8h2Zrq0DwpH/Sk3dG
	TsY9TyUX04xO4qOqoc8XrDPDUX8preHZteiRGMESNd9qoFix2WHeAE9jr+9MLfmMDQg==
X-Gm-Gg: AYBFou1COyLtcjL3uE1cxn/wd86Ex5T4YYKwViWe1Oxn9aYBeMbb74GR9R/aoqG0JNX
	4jReK5P9TxvTBMryq7lpRz3F4nmcksgJeW7cBkiVC++jKhfo3uKXA4kJjkWvu9/oRXL44/VhEM4
	XNwb+7if+hpsWCZR5U5e7Yzvj6phhNGYX48Dypub7y5+8Kyys1H2/DZCZDhBNbYveXEbUwf/ubG
	ZZroUJj8H+rIzi090fZpBwKJZ4mXWNJn5BZ+5ZiPnER/rcFbbM5vIru2URgOzzAUi1J0O/oNiyY
	o8BxVq/lgHEYQXojagMi7+AL0gMdG9srpz5DJ9ejXD+qF/zSr89eQQT3+BEeHSmVIODLNJ4btXI
	savzPQSqH2Hycwh8qjpk8Y4rtMy25fHkG9C31P5mckHT2aIbXxUZmjBI3FzIqjGAKihFwj7Mq87
	MjkajGULwEOnix+6hvYlNqZ3s3tJuzuJ+zryUnd/29hzEdsO9lwagNYuwaYId9
X-Received: by 2002:a53:d54b:0:b0:67a:551f:920c with SMTP id 956f58d0204a3-67a7bce22d5mr1623168d50.86.1793200887765;
        Wed, 28 Oct 2026 08:21:27 -0700 (PDT)
X-Received: by 2002:a53:d54b:0:b0:67a:551f:920c with SMTP id 956f58d0204a3-67a7bce22d5mr1623121d50.86.1793200887107;
        Wed, 28 Oct 2026 08:21:27 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a803cdd1asm1107541d50.4.2026.10.28.08.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:21:26 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 08:20:45 -0700
Subject: [PATCH v23 11/15] media: qcom: camss: tpg: Add support for v2.4.0
 TPG
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-kaanapali-camss-v23-11-95f250b18612@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
In-Reply-To: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX5jcaQvmoLWOL
 f7V/a/HAFbQlipmONtGLJR5uWMwBfLnYg8KRgX7rxZaWXXDOoOAA3xxI5QpV6uGO5vUSM5jlJx/
 IZwdttlMYPC9Ik74eU/PJ4l8oOV12cs72DcBmlYdY+w2eVEP0FdJ9ewlvtihyV3gd8OcM614fDp
 AwjLn69dTmHLFUEQZ4qBxoRIeP4e+erS3dFdTPCdUkPkkLiZ42vRxw0br0cMNvirKK7t+Jk5FLh
 zi5+ghuOC62XVcwN2fj/4W869EeI460w9JIqd/Y6JnM1dwk6hOkV85+w8msuNMcQ+NSJPYr2cR+
 FONk9fhY1uSp5E/RnmbowI6J7JrIl8wnA0X9pNh38FPlRLDa/0yIFvGpaUJaokraSIX513nCdOO
 f7xFo5KdLB1GXmoBMSI1Nxl5FhQ0EFBm2EV8n5stKoS7b2LtJj8PtwVcaRCGh84+4RhhyIJ1+JA
 BJM9dwi3ICVamYlYXYg==
X-Authority-Analysis: v=2.4 cv=A/T5rKWG c=1 sm=1 tr=0 ts=6ae212f8 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=1CCqUJFLb0VynuEnu9gA:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-ORIG-GUID: 6fAqv286hbn8dyIohpHnEUb2av32xeMw
X-Proofpoint-GUID: 6fAqv286hbn8dyIohpHnEUb2av32xeMw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfXxBhfsijwKjB8
 +t+G1G3w0ktSDwfhPIuBUSoHqomr/F2C5lUpTpY3ytIGw1xCzLN7r6384uUodU6EkrKbOMkCaDI
 8OwacBzoEAVvK5ft+vOPykYWJeCNJvU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

Add support for the TPG found on Kaanapali. This TPG uses hardware
version 2.4.0, which drives test-enable and reset through the
TPG_CTRL_CMD register at offset 0x1f4 instead of the TEST_EN bit in
TPG_CTRL and the TPG_CLEAR register. Its output is routed into the
CSID 1080 RX through the CSI2 TPG mux, so the CSID selects the TPG as
the data source when a test pattern is selected.

Add the TPG resources to the Kaanapali camss resources so that the TPG
subdevices are created on this SoC.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-csid-1080.c    | 15 ++++++++++++--
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 23 ++++++++++++++++------
 drivers/media/platform/qcom/camss/camss.c          |  2 ++
 3 files changed, 32 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-1080.c b/drivers/media/platform/qcom/camss/camss-csid-1080.c
index 3d90d31201fa..ec56ba85a0fa 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-1080.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-1080.c
@@ -64,6 +64,8 @@
 #define		CSI2_RX_CFG0_NUM_ACTIVE_LANES		0
 #define		CSI2_RX_CFG0_DL0_INPUT_SEL		4
 #define		CSI2_RX_CFG0_PHY_NUM_SEL		20
+#define		CSI2_RX_CFG0_TPG_MUX_EN			BIT(27)
+#define		CSI2_RX_CFG0_TPG_MUX_SEL		GENMASK(29, 28)
 #define		CSI2_RX_CFG0_PHY_SEL_BASE_IDX		1
 #define CSID_CSI2_RX_CFG1			0x884
 #define		CSI2_RX_CFG1_ECC_CORRECTION_EN		BIT(0)
@@ -148,6 +150,7 @@ static void __csid_reg_update_clear(struct csid_device *csid, int port_id)
 static void __csid_configure_rx(struct csid_device *csid,
 				struct csid_phy_config *phy)
 {
+	struct camss *camss = csid->camss;
 	u8 lane_cnt = phy->lane_cnt;
 	int val;
 
@@ -156,8 +159,16 @@ static void __csid_configure_rx(struct csid_device *csid,
 
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
index d29de5f93c18..cabbb2638cf3 100644
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
@@ -164,18 +167,26 @@ static int tpg_stream_on(struct tpg_device *tpg)
 	}
 
 	/* Global TPG control */
-	val = FIELD_PREP(TPG_CTRL_TEST_EN, 1) |
-	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
+	val = FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
 	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_VC, last_vc);
-	writel(val, tpg->base + TPG_CTRL);
+
+	if (tpg->hw_version < TPG_HW_VER_2_4_0) {
+		val |= FIELD_PREP(TPG_CTRL_TEST_EN, 1);
+		writel(val, tpg->base + TPG_CTRL);
+	} else {
+		writel(val, tpg->base + TPG_CTRL);
+		writel(TPG_CTRL_CMD_TEST_EN, tpg->base + TPG_CTRL_CMD);
+	}
 
 	return 0;
 }
 
 static int tpg_reset(struct tpg_device *tpg)
 {
-	writel(0, tpg->base + TPG_CTRL);
-	writel(1, tpg->base + TPG_CLEAR);
+	if (tpg->hw_version < TPG_HW_VER_2_4_0)
+		writel(0, tpg->base + TPG_CTRL);
+
+	writel(TPG_CTRL_CMD_HW_RESET, tpg->base + TPG_CTRL_CMD);
 
 	return 0;
 }
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 6ff82dd2aeaf..df4b4cf30711 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5850,11 +5850,13 @@ static const struct camss_resources kaanapali_resources = {
 	.pd_name = "top",
 	.pm_clks = { "cpas_fast_ahb", "cpas_ahb", "gcc_axi_hf" },
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

