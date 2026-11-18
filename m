Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994915;
	b=PxiJPxPYAEJ+zvfpuuqXwxGlx+dVnMwAtSw/0hLNatmWib8x0kLgJRbJehj0uQiMcv9z
	 Fcy+FPbB/xYRZuoRGkSAc61eD/uuO5IOy1Gr7YPuAEbZp9l6ddyqMEGyCM+V84BneVd0F
	 ia354mOr3panGaY6XPEjT/TSX0zWDZtMMfLmJE9XuosV5KsaJXepU0Y6u87sCa0SkNhF5
	 NsxaNHL1KCHVInqaCI2dhsTi9yYAwiUqHZASU0gRFBSFoKSyZE72KAu7znL6HUYls6Izj
	 Z6+co+rXMgxA2RlvCu7TgwBWAjGge9b7CvCfEeVO6MbnZQEhMkE2nPNXhoUVEX+Tz1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994915;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+whxw5wwivtSoHM2QX2azu39PmWANgcrBKwtDEotNtE=;
	b=icTQ4DUgzkyrNg/40mebB8G53UaFTCoduJgJUT3mTsWpEKXfEay0L2HivSO48FGo5V4r
	 Nfl2kwGZx8i/AYVTvjG/7fLDs+1BjKknaKCQQI40+eEd3V65r3xMC7oFb5kPWD0RtmMK3
	 J/OLuhiZdZE4t7DFv0a/pqo+KWGgWNUicsQ5lntSBfiq4OtLjPo/cC8wejZYePRs5LA78
	 g2yll954IChHn2D3UHT5g7GT2WmGECTNMVr+jsqTGZaCQij0hmtD/ZIqwpRoTbfDZRRjN
	 I9/HtwSiofVIkIgrqHNP4QEw04FkU1mFqsFyidg1bAihrKbDch4Wqk/HyQbei91IEfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="aSL1H5/1";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WnPq2rVv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E69606A339
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 09:41:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5E69606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aSL1H5/1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WnPq2rVv
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI9Kf1X2896592
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 09:41:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+whxw5wwivtSoHM2QX2azu39PmWANgcrBKwtDEotNtE=; b=aSL1H5/13XqAb7cH
	P07xUO7IwvObR2201yHKcFoxrTGHWb6OAxyQeProZ1Fh9rYlVVDOKlcV/djmU/tq
	Qgt6LcUlewD48YuxGxOiS2lGGr7FgKRaH8ka6a34DGJNrSZ2DwaoY23TtlmL9y27
	v40MWA1P8kWATYo5i30irCzOhqO/LQewA8IG61soZyuYH03ZnjqiulwjM+Y+CBYI
	6jAv+RmYsQyj+SJ60YQ4yU+18NcxfGeoOTJqUnB4rqrL2+Mth3p9Laq99tbBEM4O
	ayuKs+MOZnSWL8OCfj7y38ZE0wJomrOitSWFN6k9I37wS8PtCj8CPeLuUnWjNzJl
	MxIWYg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8jc5v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 09:41:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2eb5375cd68so8581365ad.0
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 01:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794994912; x=1795599712; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+whxw5wwivtSoHM2QX2azu39PmWANgcrBKwtDEotNtE=;
        b=WnPq2rVv3xCFbm+HgOn/MSxskzK21qHRdOVEBTdKaYnMyln8+D/JzuKkp1VKaQabl7
         Ho3uEjIlqHSZPqW3byDauLUSe63OnYfCKXmcDlpXVwuVd4U2qZg863Z7c3YmiO25iAOz
         eWJERbFhHauOtsKWchK1d9hah9TGP4dYSk3MshgaF/ZX8/XaG8MZ3sm30DXZj9pqE0/k
         F/Hl9qh6ZTa3vpwLlc3imvnIfhLMSD5kiaI+nNlHCOEaheNSaq4YhOll9FeYvEiSm2T9
         Aw9C61iLoxKfMBb3RIlRxenZIAos2o5FIG58oLz8SMyBMUkFYZrte27STI+1au+8XPuS
         azKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994912; x=1795599712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+whxw5wwivtSoHM2QX2azu39PmWANgcrBKwtDEotNtE=;
        b=m1SHW80tAa0jPmN6QZqmczVDWseW9yKALD514h3zFwbStFM7y84yepPHVUCJT2JVry
         Bcs9Awud79BUWdOrDA0bbfXfvzweLRo1ha83xCAOW4x+57IGIaWA0w1zu4xbfpFoLpKu
         QzM0gQo0z15xxdCgbCpUdE3glmlnu2cuvs8igs0aQ9+Lk2lXdc88aJN1GcH+MehU7YpY
         ruZc/MrcDdtkA8+qhGxO468nAWrAm2ecq5AL152EyUn+ulEA3VB4DQVfttAzOu6A5bLy
         NzFncLPT4gUt6Bp48RGgaUdMIW4Ge/tfDEk//15AieJrIuSp0TY9S57xo4WuomwLrYKr
         kIJA==
X-Forwarded-Encrypted: i=1; AL+hErFJJRO7aO5JOVwe4hZq7Ew1NTZsKEvDda3quzKYRLcPWbqEHZ586spKhHSxK6WEfxaThlXjUAwuh/nA+Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z80UzWntRT8cqyINpBLRF1dAtUAt4zdIivInn3AVNsin/bX91rs
	HMzlnau96vdi/16SwmroUxobkR1pt4LGuEl2qmEgRmRRNunr85r46610sbpUXpwdvyS1TryDh0w
	KZx4QhjgDJx8N96V2NPQ4clX29xkLieXXrFa4WCI/QdPrA1c2ZmhQPh+IrJNU/11ZTQ==
X-Gm-Gg: AZFdTZfcFrV7BaaVdzU2aw/yOb/PhnvL3mZT1+oYYXOz0zEQW4KKRtyIvkkYfjKQeLS
	xxVY2bCLj30V4hAcN1Ed//iqV1ZF8tPRhNbVFLqnfdXJE1a1mGI8PV+2na06MsLW42pca++Ww3/
	AqPFw+fIRo4WwDhTbIonhDQo5AOx6vACXrDA9Jk4y4LDwYelNHRM1NvlFz9RftWV5O3eSgP/yQ9
	cgOmmeA+Vkcx+wnm7udEXCLvilpTTg3Mzh/JQr41QAWdFbA+nz+zi7bx8pqkrktjpXdmBjCut0E
	JhGxdhKD9146U6o6zQRrHk8U/yeRm3w+beFbmdd+xuv9rhJmThtBEiUJ/uUkVeqnfAwJR0bqb0Z
	nj9XxxRmg5Z1qCM7SpipbcPPmeQ3b19iCHP4UjUPoj/LvAo0sCI9Tk6LCOk18XbPedQ4pSiEBU4
	m3jTnHAfzWB45HAQ2w0x1PQYW8GXt6H/bVsxz0zY4Nc2P+6+Dl
X-Received: by 2002:a17:903:9cc:b0:2e8:e17d:c8b8 with SMTP id d9443c01a7336-2eff7557702mr19509755ad.63.1794994912294;
        Wed, 18 Nov 2026 01:41:52 -0800 (PST)
X-Received: by 2002:a17:903:9cc:b0:2e8:e17d:c8b8 with SMTP id d9443c01a7336-2eff7557702mr19509525ad.63.1794994911831;
        Wed, 18 Nov 2026 01:41:51 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f008044f26sm2947575ad.70.2026.11.18.01.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:41:51 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 17:41:40 +0800
Subject: [PATCH v3 1/8] media: iris: add AV1 decode buffer size support for
 vpu4x
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
Message-Id: <20261118-add_iris_for_hawi-v3-1-51786f6d4057@oss.qualcomm.com>
References: <20261118-add_iris_for_hawi-v3-0-51786f6d4057@oss.qualcomm.com>
In-Reply-To: <20261118-add_iris_for_hawi-v3-0-51786f6d4057@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794994903; l=5133;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=eyuhm7FCBJ1UyL2VDJkCTIlCbf4hEj3HIpXeoc6A3bA=;
 b=a5lTvwFg9C+VDweYDA24XOf+yfXQCWSpTwF5kNAwv+7ssKsc/HW3pEvs5+V3ZDQLp9MkFOkHX
 d85LMysu7J/AGLFnnR7YC7PiNeDGxwsCSISpukFbplvRUGNUiG7I4VX
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: AOOPGy4cYsY-UKgFFVUQEd4D3t5TWkEn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfX6aACk2WF/bqu
 WtozUobeoabg4rYpqwAI6Fe57TPiqwqq30Ao3JT7XtrhNOFOzHQxlaoyEjc2QATfPsOaalCClst
 Cv8QMWbgkjQCmXgQ//8tk/iBHlGc70c=
X-Authority-Analysis: v=2.4 cv=c60+0h9l c=1 sm=1 tr=0 ts=6afd72e1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=KAqM0-_hLyDR7Zr9OkkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfX1IX/LY9IOsNa
 2obV+mvTo2ykbRGD60Cp1Ydz1Z5KPAyMGygrgXl6YfYhqqD8AGuDiiF+r4q7f/hKNrxr00P735C
 vJF6gEpWyXlsO/yNQaZ0Vym8KS1CCgB37gQ4I84LXzQvH14URqux3kGn03Hq+ujqEja1HaiQkVv
 erZfv+EVMowjBGW9Xa4Udo4CQP2ayLcool4Spc7d+9YM3RNQQ/9ISrmqfvPd3nX/gqX8/LbNWh/
 KbFX9sDuWQR/MHOV8fYHBMw42Crz2KG0mURsAY68ncF7UuvjLStcL5FLLrD0WZrLzICRf29QFoG
 kDTr4l0PcboaIAuKua15/GqQz2Y1qazPTlwiufmRnhKJP8joJTAMhWnYSXNRdHZ74iXWhc7ChHP
 uUs99n6zinDZz8LcrXWue/IoVDdHR136eEf9fr6yal5OXZ9gKnswRwGmcHlWPwCQBxqHW81naie
 zjhZLeNcodQ861pb/Ow==
X-Proofpoint-ORIG-GUID: AOOPGy4cYsY-UKgFFVUQEd4D3t5TWkEn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180038

Add necessary buffer size calculation to support AV1 decode for vpu4x

- wire AV1 into iris_vpu4x_dec_line_size() via hfi_buffer_line_av1d()
- add hfi_vpu4x_buffer_persist_av1d() for the vpu4x's persist buffer
  size calculation
- add BUF_PARTIAL to the vpu4x decoder dispatch table, which AV1D
  requires

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 67 +++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  1 +
 2 files changed, 65 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index a8170e5fa9e600a3897b87ae55b5f413666185f5..f322dee4ec56c89d163deab068df98c1125724e4 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -2134,6 +2134,39 @@ static u32 hfi_vpu4x_buffer_line_vp9d(u32 frame_width, u32 frame_height, u32 _yu
 	return lb_size + dpb_obp_size;
 }
 
+/* iris4/5 AV1 line buffer uses hardware-specific LUT values indexed by resolution bucket */
+static u32 hfi_vpu4x_buffer_line_av1(u32 width, u32 height, bool is_opb, u32 num_vpp_pipes)
+{
+	static const u32 lut_left[4] = { 905472, 1356800, 2890752, 5778432 };
+	static const u32 lut_top[4][2] = {
+		{ 307200,  450048  },	/* HD  */
+		{ 499200,  713472  },	/* FHD */
+		{ 1343488, 1800192 },	/* 4K  */
+		{ 3735552, 4648960 },	/* 8K  */
+	};
+	u32 h_idx, w_idx;
+
+	if (height <= 1280)
+		h_idx = 0;
+	else if (height <= 1920)
+		h_idx = 1;
+	else if (height <= 4096)
+		h_idx = 2;
+	else
+		h_idx = 3;
+
+	if (width <= 1280)
+		w_idx = 0;
+	else if (width <= 1920)
+		w_idx = 1;
+	else if (width <= 4096)
+		w_idx = 2;
+	else
+		w_idx = 3;
+
+	return lut_left[h_idx] * num_vpp_pipes + lut_top[w_idx][is_opb];
+}
+
 static u32 iris_vpu4x_dec_line_size(struct iris_inst *inst)
 {
 	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
@@ -2153,6 +2186,8 @@ static u32 iris_vpu4x_dec_line_size(struct iris_inst *inst)
 	else if (inst->codec == V4L2_PIX_FMT_VP9)
 		return hfi_vpu4x_buffer_line_vp9d(width, height, out_min_count, is_opb,
 						  num_vpp_pipes);
+	else if (inst->codec == V4L2_PIX_FMT_AV1)
+		return hfi_vpu4x_buffer_line_av1(width, height, is_opb, num_vpp_pipes);
 
 	return 0;
 }
@@ -2176,14 +2211,39 @@ static u32 hfi_vpu4x_buffer_persist_vp9d(void)
 		HDR10_HIST_EXTRADATA_SIZE;
 }
 
+static u32 hfi_vpu4x_buffer_persist_av1d(u32 max_width, u32 max_height,
+					 u32 total_ref_count, u32 rpu_enabled)
+{
+	u32 comv_size = hfi_buffer_comv_av1d(max_width, max_height, total_ref_count);
+	u32 seq_hdr = SIZE_AV1D_SEQUENCE_HEADER * 2 + SIZE_AV1D_METADATA;
+	u32 per_pic = AV1D_NUM_HW_PIC_BUF *
+		      (SIZE_AV1D_TILE_OFFSET + SIZE_AV1D_QM + SIZE_AV1D_ARP + SIZE_AV1D_METADATA);
+	u32 frame_hdr = AV1D_NUM_FRAME_HEADERS *
+			(SIZE_AV1D_FRAME_HEADER + 2 * SIZE_AV1D_PROB_TABLE);
+	u32 extradata = HDR10_HIST_EXTRADATA_SIZE +
+			rpu_enabled * NUM_HW_PIC_BUF * SIZE_DOLBY_RPU_METADATA;
+
+	return ALIGN(seq_hdr + per_pic + frame_hdr + comv_size + extradata, DMA_ALIGNMENT);
+}
+
 static u32 iris_vpu4x_dec_persist_size(struct iris_inst *inst)
 {
-	if (inst->codec == V4L2_PIX_FMT_H264)
+	struct platform_inst_caps *caps;
+
+	if (inst->codec == V4L2_PIX_FMT_H264) {
 		return hfi_buffer_persist_h264d();
-	else if (inst->codec == V4L2_PIX_FMT_HEVC)
+	} else if (inst->codec == V4L2_PIX_FMT_HEVC) {
 		return hfi_vpu4x_buffer_persist_h265d(0);
-	else if (inst->codec == V4L2_PIX_FMT_VP9)
+	} else if (inst->codec == V4L2_PIX_FMT_VP9) {
 		return hfi_vpu4x_buffer_persist_vp9d();
+	} else if (inst->codec == V4L2_PIX_FMT_AV1) {
+		caps = inst->core->iris_platform_data->inst_caps;
+		if (inst->fw_caps[DRAP].value)
+			return hfi_vpu4x_buffer_persist_av1d(caps->max_frame_width,
+			caps->max_frame_height, 16, 0);
+		else
+			return hfi_vpu4x_buffer_persist_av1d(0, 0, 0, 0);
+	}
 
 	return 0;
 }
@@ -2483,6 +2543,7 @@ u32 iris_vpu4x_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_typ
 		{BUF_PERSIST,     iris_vpu4x_dec_persist_size   },
 		{BUF_DPB,         iris_vpu_dec_dpb_size         },
 		{BUF_SCRATCH_1,   iris_vpu_dec_scratch1_size    },
+		{BUF_PARTIAL,     iris_vpu_dec_partial_size     },
 	};
 
 	static const struct iris_vpu_buf_type_handle enc_internal_buf_type_handle[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
index 2085e316a6bd862f0cb8c474ebea6b53947fcb27..9a1011a91cb6da0e8e7c53425b88f7e7069c4c3b 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
@@ -127,6 +127,7 @@ struct iris_inst;
 #define SIZE_AV1D_TILE_OFFSET     65536
 #define SIZE_AV1D_QM              3328
 #define SIZE_AV1D_PROB_TABLE      22784
+#define SIZE_AV1D_ARP             9728
 
 #define SIZE_SLICE_CMD_BUFFER (ALIGN(20480, 256))
 #define SIZE_SPS_PPS_SLICE_HDR (2048 + 4096)

-- 
2.43.0

