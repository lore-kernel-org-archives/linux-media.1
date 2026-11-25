Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795577119;
	b=Y8g/1LieXuJsgiegt81mwg9jKktYU45VR1guyn7ZSTGERzniJwZyAac1R5YyZZ/OQ6Nx
	 tXAttNDfQUdXo/o1jjSvLf+qAkdwN7zlo5oGh57CJPNnndDLRpU+3EHxDlZr3f2X1Dk3h
	 zdW5F+76wERRJp7+8zXyrd2GPU68ZAncQ1MXjfjHeHE5SllYmX2vilpc1XbIv5N6Dm45E
	 +SYgO5xHf1Eq0hx3Ve5SWEFYGoMmR6mSee4qkxA8L1eP6VUmORRXeM8mSl19RMqjpNaUJ
	 8QVqmnWGa5qgGCvohkG852DAXzPhYfCCHY9GQJEDmPdV+YCbqW1Wt99r0iHYdBzNIXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795577119;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vE46ldE9Tgv64dTBxNDpQ0zCcr1G4oUqOs6TVPei9EI=;
	b=1tW8vo5U/BsHFnlmFDG7ydjENBQa7qQWKW8nyxDm0q2GAfgSKr2OVeN6lDMY9Jqs3fUX
	 IIRvbeu0f30Etw/B2Awfb3XO34+INRj93DFWuDwBlxa1344Tf3+zPM4VIyTj1Rd21DvGs
	 a0U0JaM8vfx31lBuf0/KM01N9TlajcPVpP8jk1MX6S1yGcdKAlo2Q3TCkx6lLuixY4jXT
	 5GPyKgh0lJF2ZFYz5HhdKKwpPK9k4mMxDCu3HqyBhWSJiLPE2sc60iTyAskOSS8kXS0Ad
	 EfvD+IFBsGYcfUcOrYBgTb25YXI9zCT4y/NDI2WEd7a+IOUISZKULXyua9/VRsXRuvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fkgbwGin;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cefnSwub;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1F6606A682
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 03:25:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F1F6606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fkgbwGin;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cefnSwub
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP2AvmW1342533
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 03:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vE46ldE9Tgv64dTBxNDpQ0zCcr1G4oUqOs6TVPei9EI=; b=fkgbwGinaP2l1w3k
	R4m435J+dnoOLhxwW1WfprYHsmigfExRD93jNXwpwwuwRIHUh8aXu2eQOjgIbX+P
	mIXn20YtnavhtYJu+y358zBq/zfjfL7lyCCMNIfDPoq+IFYC0VgIeevBhrIbMwIl
	NMytbqZbpisHE1S1hjdfBqKHLsWi2T7Gj0zj5kQ5s2AFVfn7cjGxq3CoANqGze5a
	epmlBZhG5awNOxwndDV8qNCo13CX7Wi3sS/rf8G3pMn0Q/NsbfTUXxdbt2/cccR0
	Mc/wDIxtQebMwy0GGS0rzXTMgsK8oMQ8zqpIvwQ01E8MskREM1ezkUcExTf8vbJM
	4G4d9w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5nu68cu1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 03:25:18 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a0619b1fe5so4370401b3a.3
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 19:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795577118; x=1796181918; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vE46ldE9Tgv64dTBxNDpQ0zCcr1G4oUqOs6TVPei9EI=;
        b=cefnSwubMNJ6q+PvI0+wQhtLZKUrxpHkNe+OPYTxaFZoX2sgqtAmK/YbEywPrrkfn4
         XkpSTmzi6q0MrfjzGoOqUKePCtgmkM9t2JzuH/4j0G3+D16ES59DDXojVNEcNU5a4miJ
         jXSK9AgqD3W/GSRvueNv/CPbvRFQmcNsFNTO+gpTpGVEMcaKr4/8CrnzoYjOP0gxUgbK
         J3Foqoc+RaC5W7V/WAQ+uuFkrzX2bYyWI6psR5a7pVXXlN8YeKh9ViKTKTh6ltuCYCaM
         KVg8Tv07dvlVu5cxmJucwAVRNKH8R4cmRZXY8BFBuEv12mhyYytoY9ki6d8fzlH7W7Zf
         /bSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795577118; x=1796181918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vE46ldE9Tgv64dTBxNDpQ0zCcr1G4oUqOs6TVPei9EI=;
        b=aT/zBgrDNM0vWH2FmPRzlxsQ5YwaXFLA1fvLCsgfedrw5FY9O+Gp2+87Jc+Yv63Avv
         dDHYNym2dep9gMc0lfYzmPR2Xxd3yeUwm95Q/rzwpMOmYjYz3tji6zn5HzU3apptZvk0
         KLYxMD4LoJNKKKetAqMcbKsArp+WmyvYVzryAlAIfz0U1GgjTsU3D/irkgQewIwOZP+t
         SrZWTDqsPt9gwulnFWCmHZBxQQt0uxzmUdC1EDROST40BXReVC1ARGn4pnvsiDIn6uIt
         rsTWk4JusmAbD3UxxTO/1Hhz3aMTSsr7IMJQfmDQcoDaEob7brtAlDub4lpjPZadcXPD
         gRZw==
X-Forwarded-Encrypted: i=1; AL+hErHo/D/mx4vyBAs7tvMf8Jh3OLJL7mW1CcSo1uqfSfPLIp+55Ew69rSegslB0rejTOAJfCtblIds9CKJxg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/7gIvlNUBh3RWYBC+HW+E/EgfDWmqQInSM5NJiZzkskYvSrlo+
	AnUFKHzQauGboLkYCt10nGqcQAMP2R9IkY9eJfZEzpa7u1dwgBs/Iyw3rQuTvVlbOG7/sHaT0lo
	KVuQ6Djkup61GUwjGjjrhe/rtvR5d04tluudSf72/bgMO7wWjTWCWY64F4h4WTKcT6g==
X-Gm-Gg: AZFdTZe2uD0uDQfAGePEQtRGYl4Eoo4VP4whk0ibER2NTt/akLp56WI3zGH/qH6SytW
	XHmd8mGCE+Hfy/q9JGxgq3dCOxJIy2/P+mKRvuztp9Wa+DPwmtW1SqNX2ab9LdL/MxyK0A0Jkds
	+/9hJDJ4cjKp3ccqjwRGhAsnrCsBzGssEGFn3QKTCROGJPNI2aGg4b0gChmVpHlTqpDr1tiLiFW
	a616RVvr8xWtJI4kFRbH1kQ+Po3Nps82g+fDthwh6T6gEJUf36MWJM0U2VTNF2Dz0UYWFOn/ayR
	VhEd80TaPzWoD6IuD86ifC+Sz7XedJKCwGA/WoDObeSw8Gvo9SNGeVap0mh3Dh3taDHUClLFgrw
	xlCd5YxvkJH+npeZ5TEC/94pBI6kgqfW67kas7Ivo28KIW/mccH8uH2/qbwNrdWQYKNB5opGFy6
	5CkMkFCuo=
X-Received: by 2002:a05:6a00:1788:b0:89f:d620:226 with SMTP id d2e1a72fcca58-8c87c09e5d7mr13842520b3a.24.1795577117452;
        Tue, 24 Nov 2026 19:25:17 -0800 (PST)
X-Received: by 2002:a05:6a00:1788:b0:89f:d620:226 with SMTP id d2e1a72fcca58-8c87c09e5d7mr13842481b3a.24.1795577116966;
        Tue, 24 Nov 2026 19:25:16 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8cbe173453dsm4762399b3a.25.2026.11.24.19.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:25:16 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 08:54:11 +0530
Subject: [PATCH v12 4/9] media: iris: Add power sequence for glymur
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
Message-Id: <20261125-glymur-v12-4-5c34dfd73fc2@oss.qualcomm.com>
References: <20261125-glymur-v12-0-5c34dfd73fc2@oss.qualcomm.com>
In-Reply-To: <20261125-glymur-v12-0-5c34dfd73fc2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795577086; l=10254;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=akRiIylfcKKIoiUqca5o8vfojNfvOaA8NafWyJ+FBfc=;
 b=Xzj1WCttZtTPaCrlmIcecd1s8PWr1uYxZ4PCPHR4yBPagHAlOwQYu2BVsl0QCnWGkqtcTCHCO
 8VsnOvWibppDMOi/fT+hSrclf5lTpeMH6LFdUfXM5Jv7rUAMCou6e65
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: 3STGPAs4pcA5fgdJbY2sBHN6NJt0ibbJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAxMyBTYWx0ZWRfX7Xf2LKN3Rr6y
 K2uZFcdIh3f4E1HF8QUAOabbWsfXvbuUayYpwjaXTXK/106nZfeAHQDwYdHYp69PlWtqh2Laxr0
 uS6QW89kxls91NFmPwR5F6yeA9+lx4I=
X-Proofpoint-GUID: 3STGPAs4pcA5fgdJbY2sBHN6NJt0ibbJ
X-Authority-Analysis: v=2.4 cv=Vra2kO2n c=1 sm=1 tr=0 ts=6b06551e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=GANyUBKrrYAveNDb0HoA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAxMyBTYWx0ZWRfXyawsUqrGyspX
 EgR9VV7XyjYl3PcX1voo6B3Hg6eWrBLW4QMiZOLn4o800CWONQcpWbes1Oz7EVFl6GQr7YuUsq/
 eA5gcBWpS53W58jH/4P6LCEiwgweO1eYR0gsJykJgSQLX403ybeIEh4uJpKEYZru6ZPr502eVbC
 B7NxtwJGZ68i5IVa02zRyqVL1SCOM1sNONNqDB9hW+D/Ocrn1+F/bwjvGA+vTmW+edXd1uUKkE6
 BsaFY/iRfDa2552YQa+/ynFW+xFur9bfJGrF6kXA5Y/zo5LFUOzNDOXMXlorkrlCJuF/fWZSMo7
 N0OZfdyGt4DnkKyeFEnNVHIGdVt0cPmNcLSSKUWWioeXToMT8vgwL6RyF/u0gAX47jQZALHLQ+w
 ELFajB1g86IgyzJCJOEjwHhZtBrOdj6itc5W4nuysIY7Tv9YnjmQIwGxNPo4Jo8u/imBfy25KJn
 do7NsXvsK8vm/h6ngCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250013

Glymur platform has two video codec cores: vcodec0 and vcodec1.
Both cores share a common clock source (video_cc_mvs0_clk_src) and the
same power rails. The clock dividers between the source and the branch
clocks are fixed. So when both cores are running, the source clock always
runs at the highest frequency requested by either core.
Since both cores share the same power rails, the power corner cannot be
voted independently. Scaling one core's power corner up or down would
directly affect the other, leading to under or over-voting.
For these reasons, both cores should voted the clock and power rail must
be based on the workload of both cores.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 134 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
 .../platform/qcom/iris/iris_vpu_register_defines.h |  12 ++
 3 files changed, 142 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index e1822b0ba4ba..4c591538ed82 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -17,14 +17,14 @@
 #define NOC_HALT				BIT(0)
 #define AON_WRAPPER_SPARE			(AON_BASE_OFFS + 0x28)
 
-static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core)
+static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core, u32 pwr_status_bit)
 {
 	u32 value, pwr_status;
 
 	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
-	pwr_status = value & BIT(1);
+	pwr_status = value & pwr_status_bit;
 
-	return pwr_status ? false : true;
+	return !pwr_status;
 }
 
 static void iris_vpu3_power_off_hardware(struct iris_core *core)
@@ -32,7 +32,7 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
 	u32 reg_val = 0, value, i;
 	int ret;
 
-	if (iris_vpu3x_hw_power_collapsed(core))
+	if (iris_vpu3x_hw_power_collapsed(core, VCODEC0_POWER_STATUS))
 		goto disable_power;
 
 	dev_err(core->dev, "video hw is power on\n");
@@ -78,7 +78,7 @@ static void iris_vpu33_power_off_hardware(struct iris_core *core)
 	u32 count = 0;
 	int ret;
 
-	if (iris_vpu3x_hw_power_collapsed(core))
+	if (iris_vpu3x_hw_power_collapsed(core, VCODEC0_POWER_STATUS))
 		goto disable_power;
 
 	dev_err(core->dev, "video hw is power on\n");
@@ -221,6 +221,119 @@ static void iris_vpu35_power_off_hw(struct iris_core *core)
 	iris_vpu33_power_off_hardware(core);
 }
 
+static void iris_vpu36_power_off_vcodec(struct iris_core *core, u32 core_id)
+{
+	u32 bridge_hw_reset[] = {CORE_BRIDGE_HW_RESET_DISABLE, VCODEC1_BRIDGE_HW_RESET_DISABLE};
+	u32 lpi_status_active[] = {NOC_LPI_STATUS_ACTIVE, NOC_LPI_VCODEC1_STATUS_ACTIVE};
+	u32 power_down_prep[] = {REQ_POWER_DOWN_PREP, REQ_VCODEC1_POWER_DOWN_PREP};
+	u32 lpi_status_done[] = {NOC_LPI_STATUS_DONE, NOC_LPI_VCODEC1_STATUS_DONE};
+	u32 lpi_status_deny[] = {NOC_LPI_STATUS_DENY, NOC_LPI_VCODEC1_STATUS_DENY};
+	u32 bridge_sw_reset[] = {CORE_BRIDGE_SW_RESET, VCODEC1_BRIDGE_SW_RESET};
+	u32 idle_status[] = {VCODEC_SS_IDLE_STATUSN, VCODEC1_SS_IDLE_STATUSN};
+	u32 power_status[] = {VCODEC0_POWER_STATUS, VCODEC1_POWER_STATUS};
+	bool handshake_done, handshake_busy;
+	u32 value, i, count = 0;
+	int ret;
+
+	if (iris_vpu3x_hw_power_collapsed(core, power_status[core_id]))
+		goto disable_power;
+
+	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
+	if (value)
+		writel(CORE_CLK_RUN, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
+
+	for (i = 0; i < core->iris_platform_data->num_vpp_pipe; i++) {
+		ret = readl_poll_timeout(core->reg_base + idle_status[core_id] + 4 * i,
+					 value, value & DMA_NOC_IDLE, 2000, 20000);
+		if (ret)
+			goto disable_power;
+	}
+
+	do {
+		writel(power_down_prep[core_id], core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+		usleep_range(15, 20);
+		value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS);
+
+		handshake_done = value & lpi_status_done[core_id];
+		handshake_busy = value & (lpi_status_deny[core_id] | lpi_status_active[core_id]);
+
+		if (handshake_done || !handshake_busy)
+			break;
+
+		writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+		usleep_range(15, 20);
+	} while (++count < 1000);
+
+	readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
+			   value, value & lpi_status_done[core_id], 200, 2000);
+	writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+
+	writel(bridge_sw_reset[core_id] | bridge_hw_reset[core_id],
+	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(bridge_hw_reset[core_id], core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+
+disable_power:
+	iris_genpd_set_hwmode(&core->vcodec[core_id], false);
+	iris_disable_power_domain_and_clocks(core, &core->vcodec[core_id]);
+}
+
+static void iris_vpu36_power_off_hw(struct iris_core *core)
+{
+	u32 num_cores = core->iris_platform_data->num_cores;
+	int i;
+
+	for (i = 0; i < num_cores; i++)
+		iris_vpu36_power_off_vcodec(core, i);
+}
+
+static int iris_vpu36_power_on_hw(struct iris_core *core)
+{
+	u32 num_cores = core->iris_platform_data->num_cores;
+	int i, ret;
+
+	for (i = 0; i < num_cores; i++) {
+		ret = iris_enable_power_domain_and_clocks(core, &core->vcodec[i]);
+		if (ret)
+			goto error;
+	}
+
+	return 0;
+
+error:
+	while (--i >= 0)
+		iris_vpu36_power_off_vcodec(core, i);
+
+	return ret;
+}
+
+static int iris_vpu36_set_hwmode(struct iris_core *core)
+{
+	u32 num_cores = core->iris_platform_data->num_cores;
+	u32 bridge_hw_reset[] = {CORE_BRIDGE_HW_RESET_DISABLE, VCODEC1_BRIDGE_HW_RESET_DISABLE};
+	u32 bridge_sw_reset[] = {CORE_BRIDGE_SW_RESET, VCODEC1_BRIDGE_SW_RESET};
+	int i, ret;
+
+	for (i = 0; i < num_cores; i++) {
+		writel(bridge_sw_reset[i] | bridge_hw_reset[i],
+		       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+		writel(bridge_hw_reset[i], core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+		writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+
+		ret = iris_genpd_set_hwmode(&core->vcodec[i], true);
+		if (ret)
+			goto error;
+	}
+
+	return 0;
+
+error:
+	while (--i >= 0)
+		iris_genpd_set_hwmode(&core->vcodec[i], false);
+
+	return ret;
+}
+
 const struct vpu_ops iris_vpu3_ops = {
 	.power_off_hw = iris_vpu3_power_off_hardware,
 	.power_on_hw = iris_vpu_power_on_hw,
@@ -254,3 +367,14 @@ const struct vpu_ops iris_vpu35_ops = {
 	.set_preset_registers = iris_vpu_set_preset_registers,
 	.interrupt_init = iris_vpu_interrupt_init,
 };
+
+const struct vpu_ops iris_vpu36_ops = {
+	.power_off_hw = iris_vpu36_power_off_hw,
+	.power_on_hw = iris_vpu36_power_on_hw,
+	.power_off_controller = iris_vpu35_vpu4x_power_off_controller,
+	.power_on_controller = iris_vpu35_vpu4x_power_on_controller,
+	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
+	.set_hwmode = iris_vpu36_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
+};
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index a62b6184bde7..5a9ca9d1902a 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -12,6 +12,7 @@ extern const struct vpu_ops iris_vpu2_ops;
 extern const struct vpu_ops iris_vpu3_ops;
 extern const struct vpu_ops iris_vpu33_ops;
 extern const struct vpu_ops iris_vpu35_ops;
+extern const struct vpu_ops iris_vpu36_ops;
 extern const struct vpu_ops iris_vpu4x_ops;
 extern const struct vpu_ops iris_vpu_ar50lt_ops;
 
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
index 4fffa094c52f..d21c2070c32a 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
@@ -7,6 +7,7 @@
 #define __IRIS_VPU_REGISTER_DEFINES_H__
 
 #define VCODEC_BASE_OFFS			0x00000000
+#define VCODEC1_BASE_OFFS			0x00040000
 #define AON_MVP_NOC_RESET			0x0001F000
 #define CPU_BASE_OFFS				0x000A0000
 #define WRAPPER_BASE_OFFS			0x000B0000
@@ -14,6 +15,8 @@
 #define AON_BASE_OFFS				0x000E0000
 
 #define VCODEC_SS_IDLE_STATUSN			(VCODEC_BASE_OFFS + 0x70)
+#define VCODEC1_SS_IDLE_STATUSN			(VCODEC1_BASE_OFFS + 0x70)
+#define DMA_NOC_IDLE				BIT(22)
 
 #define AON_WRAPPER_MVP_NOC_RESET_REQ		(AON_MVP_NOC_RESET + 0x000)
 #define VIDEO_NOC_RESET_REQ			(BIT(0) | BIT(1))
@@ -35,6 +38,8 @@
 #define CPU_CS_AHB_BRIDGE_SYNC_RESET		(CPU_CS_BASE_OFFS + 0x160)
 #define CORE_BRIDGE_SW_RESET			BIT(0)
 #define CORE_BRIDGE_HW_RESET_DISABLE		BIT(1)
+#define VCODEC1_BRIDGE_SW_RESET			BIT(2)
+#define VCODEC1_BRIDGE_HW_RESET_DISABLE		BIT(3)
 
 #define CPU_CS_X2RPMH				(CPU_CS_BASE_OFFS + 0x168)
 #define MSK_SIGNAL_FROM_TENSILICA		BIT(0)
@@ -51,14 +56,21 @@
 #define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
 #define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
 #define REQ_POWER_DOWN_PREP			BIT(0)
+#define REQ_VCODEC1_POWER_DOWN_PREP		BIT(1)
 
 #define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
 #define NOC_LPI_STATUS_DONE			BIT(0) /* Indicates the NOC handshake is complete */
 #define NOC_LPI_STATUS_DENY			BIT(1) /* Indicates the NOC handshake is denied */
 #define NOC_LPI_STATUS_ACTIVE			BIT(2) /* Indicates the NOC is active */
+#define NOC_LPI_VCODEC1_STATUS_DONE		BIT(8)
+#define NOC_LPI_VCODEC1_STATUS_DENY		BIT(9)
+#define NOC_LPI_VCODEC1_STATUS_ACTIVE		BIT(10)
 
 #define WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0	(WRAPPER_BASE_OFFS + 0x78)
 #define WRAPPER_CORE_POWER_STATUS		(WRAPPER_BASE_OFFS + 0x80)
+#define VCODEC0_POWER_STATUS			BIT(1)
+#define VCODEC1_POWER_STATUS			BIT(4)
+
 #define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
 #define CORE_CLK_RUN				0x0
 

-- 
2.34.1

