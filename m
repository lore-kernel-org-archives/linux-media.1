Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548058;
	b=GMNlt9h7M7b2yMETsTPk6DDlxnfW1lDX2dw2RGWaKi97/ZDFO9Ak15TO87LgSaQ+9POz
	 X8+JRGWh08MgnHfMAEALNNRumTqtHZucE3vRH9FJIBJIidFd7dlNtRUsX23mqxrnoeHLq
	 MajWfz7OOj5XmugAoXQ0gJLMI/oWTIBDReglUX8UlJ+X51/jdsA0089eI8cZZFQtMJpUJ
	 KW3dlGmYlh5KsTxK/vMEapB4UjN/2sEb2bRVumEFYsUXVzAVRuQB83nJQsoCKP/0W/IlU
	 uc3VlbhdMrMr+cJnFxoPtWCpLEgKa+uHGlHImsqxCuCQzBRxNv2cDaUS3WPpVueQtSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548058;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UfrUK9hOt/DD1qcO1l/6d1YSHtiPjQ/MWdwV6QWZlzc=;
	b=kOY0iFf5vg0MBGgN67lCMyJXzIDoZd3hG4wXcTWeuIfkegwqx707TGGAwJKgXi4cpnC/
	 wtwqfAnMitnlBfXXGC9DAHhc9A5eRKqYlHlI8TYBvg0T722unaCRsoSwnBsO1NoJlLvYx
	 Jv+uDkn2URHbdQsUWcSrXNahLwAwdFs5CYcQ7PJADNQAa1DRxdCsXJ4IVdCjI9CHieUTF
	 LvZBCia4rnspSjGGcD1f2IX+hE4o4lk26LieOvQoBjgTqOYhPTmmnzVA42Z4U0Gd/UQdb
	 sdhs7Vg17HuoV754KxhpTln8Au98Uiu3Zqt+2QqtGiOhwLIHuukcAYHghc3qm/TTTCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fHIbw81i;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iJ+jc3Tb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B49606AD5E
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 05:34:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39B49606AD5E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fHIbw81i;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iJ+jc3Tb
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD578Nj3119874
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 05:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UfrUK9hOt/DD1qcO1l/6d1YSHtiPjQ/MWdwV6QWZlzc=; b=fHIbw81iwMhQy2it
	bkd/wHAssj89DQsLXxInoFda+J1uKkHWuAQD3YZEMUhMyP6HTdHH6+KRm9mawS1K
	xXU/K3I6wCg5tEv6Wc1EE/HVVxiHttTnaHS0j7nDEUkKsdxjvuen2fnKimPU14Or
	trhwUnsS0G8FQehA+zUA6CifYZATIGYw7UjhSNkbx7WlFScvKc5/7bIPve9gH+DN
	m5D4dP3TYoLB4g8sUiDfL4aT8cEZlK0yAd/Qdr0MvCVn4Xw0453ImJ8gX6Ok75UK
	2NKYlofY02mL7xSbNsuB8viddD45e7GGsoxTcTk/SbPWgGLRYLfTHKh4r9rVxmWI
	PFTYMg==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgw9mh2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 05:34:17 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-4ad9bc6aa91so802636fac.3
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 21:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794548056; x=1795152856; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UfrUK9hOt/DD1qcO1l/6d1YSHtiPjQ/MWdwV6QWZlzc=;
        b=iJ+jc3TbUwID+IqbZx5yMPcSYQC3XHH7UvFN1irgxNrooTaR20sYEpstUI4FTDL5Vb
         p5Acl7t3G0Dt8kAMirtsRw7IHRahtH+/PgDEFehjgnQGiUx+/4PWrKfUBTTtmmm2lijq
         UfGpvhbLM3JQtBSWxeBGAvZporkFU72ZbxPYlEzgl9MBKG0ExasEI82yyG5Y3fJA7K2B
         lBvLYYThornZTmTUT6TLMG3Lg7c6ahR2h8KYJHEN6hs6uFmrJNRoY1LiB7H2y1qtmOV+
         4c4vLMSkAudL1PzAuFqhO0xZCq99cwPWnuvaLSbVNs78BjeiS2I9+Rkvd461P9BanQho
         0eYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548056; x=1795152856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UfrUK9hOt/DD1qcO1l/6d1YSHtiPjQ/MWdwV6QWZlzc=;
        b=IfobFpl9eTZ2sd5bDfaOH/wNNbwaMctBLGhurYg3vc8At7SeugAX1kkYVO3DRXpnco
         2tgKbb/s7bUnSAmVzoQLsgQyRE8bJgvNKRNY+WmSBuNeJokF/NN0s8o0Z56bflCHWvIh
         esqoWwrv/Z0qgELRZfYeiMAG1zpaDIFCc5EAgXFi5iglKNlNQt8ZBvuJV0kpAqyVauke
         utRe6gwVKQEdJRKUPHimHeO7baw0XsAFDyOtxEU0m5H/XHo47Kc6O4hDqQ+XlOxetcrq
         xhpM8D4iWgWEM0LUcZaJlEr5Zxcm7nzQqxVEzK9NsXFSz7F7jnp3/LbsMIQc27dzqWLK
         TMqA==
X-Forwarded-Encrypted: i=1; AL+hErEGEnxmYFeI17y0wJLfbxCbzIP4TlzLRCimhOSwGks5CfsxB7FTDrvjynweLZcjnGKfm3cdM7X7+06snA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/YX/NWrm7bowFsuK3Mun8S4kv3m6N6/8WlQV0do6hAPG2pPVa7
	qBk007FRIRDvE/bl3+R5XGm/66/aRufItYz2RcdL/2BMxk43RE77LPW1VQ8o+12is03gvjbe5+Q
	V/Ir/Xw7ZkCRmK8dVaC9Ffw/5lKQTojJBIauTu64ff1uIpqpRv9CGXFtvixCbOXfxFA==
X-Gm-Gg: AYBFou3Gy0e98uU7IcSzKbhuta4ZJXwL+f3OiUxjiEmhEDkdBnzx+0HcQvMgui9I+PW
	fyN+0vvjik0MG+fNehYCki1yLPV9+sImW55JZ1Ctu6vl4Iv3whVBxjWY8tKqu27SbsPg1ina+Pb
	CkumwekCdh/8Sx0gc25EzX/bAZrFtO3V7UDe2rCbxSuFlkEPCkAUlAmbfIr+jNodLYIjAnirUJY
	/LbA3dP2FdPsCBmsN8sLVed5IP8dtm3OKdi84AIcSD7jZLvB0LmgyHWksAfdM6QCV1iQ+FaZKFs
	scMt6wErwNjdy+sc7xelCo78nDNwep7g8sL88SRf/hBedGt3ObLyMWlJV44bU4Jc9L4FtDrqmMv
	Q11VfcjQpOvUpXDRUHtN2sqbJbTxY7ZgV0bc6a8LFiYVQUfFG3eF8t2lPuqSJh9xB+ImaAFRoWT
	ZI83R3xrRuowDNpIjstlyEx34uojrJJeeXdBCaKhErvYyeZLvovCgxJcb7+sm+
X-Received: by 2002:a05:6870:21cc:b0:4a8:b12:79f9 with SMTP id 586e51a60fabf-4afdf480625mr1611300fac.46.1794548056385;
        Thu, 12 Nov 2026 21:34:16 -0800 (PST)
X-Received: by 2002:a05:6870:21cc:b0:4a8:b12:79f9 with SMTP id 586e51a60fabf-4afdf480625mr1611273fac.46.1794548055893;
        Thu, 12 Nov 2026 21:34:15 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe22576bfsm803252fac.7.2026.11.12.21.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:34:15 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 21:33:43 -0800
Subject: [PATCH v25 11/15] media: qcom: camss: tpg: Add support for v2.4.0
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
Message-Id: <20261112-kaanapali-camss-v25-11-1d709f57f370@oss.qualcomm.com>
References: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
In-Reply-To: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af6a159 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=E31TOhX9jficEpHhqf0A:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: fDKbMlcWVT2AvjNV4qubvSpMh-sUXuLx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX3U5jq1aa4Nao
 IXiNYPbXgGrb8uSJkle2vbwuopzjXGXBHkuAtoWrO48QKrPSMa4Y6mGhSMPdqMrGoWRoi75FKUN
 mQNYg+Uoy6aX6cwVKkgtmuQRep6QL6oO+3+keW1vCDdtzpsmnKRn7SVi/aIWx5LSdELH/tuhSuM
 0DT5RwecDtCGP76gUqYocjXuXKlLRWuUxwHsODC/Ov5+YPLC/BZZHEGiME2oh8ArPB2lvh4U3NA
 neCmK1NSv3tV034EI+fPTPsuZVAG7AeUJQCVWjmrCV5yWUqCkfGI7mcqEQFjKqQT6jwDgHOC6ND
 Ics5edHq5OAixwsVvR/IjFHCf5cotfhoNCZtbJ0ENzj0hXw10TcX2GBpSfLudINf97/5D9EXnEl
 09TFZY3rVzje1BEXJt9M9lIJJAex7fWo828/2zWJSgPsefkRQqT6dht7EMC6D9YAVoJki13ctLq
 tvPwCBsGvvEmGl7CHYQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX7PeN+UBQmgzg
 nOUO/Tr1R2Is4oob/FaEp9BW2KCFsY/PoRQjQ72paWjRTuf/PXl9efwxBWzbeUpMbzlft/PehDU
 58phYRobgHVPy0MCI08Jm/bQkAFavkk=
X-Proofpoint-GUID: fDKbMlcWVT2AvjNV4qubvSpMh-sUXuLx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130021

Add support for the TPG found on Kaanapali. This TPG uses hardware
version 2.4.0, which drives test-enable and reset through the
TPG_CTRL_CMD register at offset 0x1f4 instead of the TEST_EN bit in
TPG_CTRL and the TPG_CLEAR register. Its output is routed into the
CSID 1080 RX through the CSI2 TPG mux, so the CSID selects the TPG as
the data source when a test pattern is selected. Read the hardware
version before resetting, because the reset sequence depends on it.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-csid-1080.c    | 15 ++++++++++++--
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 23 ++++++++++++++++------
 drivers/media/platform/qcom/camss/camss-tpg.c      |  4 ++--
 3 files changed, 32 insertions(+), 10 deletions(-)

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
diff --git a/drivers/media/platform/qcom/camss/camss-tpg.c b/drivers/media/platform/qcom/camss/camss-tpg.c
index 3caa95819b39..e7216f7f9d81 100644
--- a/drivers/media/platform/qcom/camss/camss-tpg.c
+++ b/drivers/media/platform/qcom/camss/camss-tpg.c
@@ -176,9 +176,9 @@ static int tpg_set_power(struct v4l2_subdev *sd, int on)
 			return ret;
 		}
 
-		tpg->res->hw_ops->reset(tpg);
-
 		tpg->res->hw_ops->hw_version(tpg);
+
+		tpg->res->hw_ops->reset(tpg);
 	} else {
 		camss_disable_clocks(tpg->nclocks, tpg->clock);
 

-- 
2.34.1

