Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB733C1D63
	for <linux-media@vger.kernel.org>; Tue,  6 Oct 2026 08:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791274618; cv=none; b=OiNUF5ITbaAeg3xI/7UKxge0E6grMqoDgvjpbZpWYc9bdN5wydwbHokgXymqUHFX5ww3piLJUuCnDfSB127qPFhXwxIBYI1tMNdHTvvosAGIfv2OM3mwkvFxpDi3nAr5k2ACJErKYNdq6gzwIeCfvxqkNGNJzXyPC+lCKIjCMgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791274618; c=relaxed/simple;
	bh=r1edbWID6BHyGGO+La0zZuQuA2P2eLpIcm0jEp6Hnsw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Q6nKQLXRmzWJqyxWECEXaMfeoV6rfltsELK5K1xsxPGYuG/gPaL+AVG5TKbkBDew6nw0NVWJD0YwCb8hpzSkU567LpBDgrZ/j2BYeyXYrRVfjgbgE8vaFZlfRUeXH/xTK8BrAY88MlCr2YH+6UxcFCt0k4KfnGa+QlLx7XHSAlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ts2xmcHe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i2M2Oy2g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ts2xmcHe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i2M2Oy2g"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966e9Qs4103522
	for <linux-media@vger.kernel.org>; Tue, 6 Oct 2026 08:16:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/+yEirwMAP/6wyo/OxO7wX
	cw5TJycM3pvC8p/zwpENs=; b=Ts2xmcHe8S4dc7Dh5bbcdll9QpIYjqkO4K2u+e
	GlwqbYPAoa6UrKqGVoSfWbTGE7LfRWNN53VJb+nAC/msZwpJpPbaeZPGVVDLGHcs
	LkO0pydSzX7My6hZbJ/0xb1ZTgCckgv+Brsd5AogapyLrXX3oYL4HI+bQ7j3nzYx
	APUWmAL3zhQxIg5T+ekRowRBUEiyS5N4OwHdXVuDDJlDiq06slevGW+FWadDIv49
	CMCpC35UWfLcd4UFelMulXmWB13MuLIoowsL1ielHZNawYJrBa+0NLn7UQwbE68g
	dF4DZ2ImPeTBMDhW+v2FXT2cPDRKE4ekF2V355eW+6UwSWgw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4gr0apc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 08:16:51 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso3048294a91.2
        for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 01:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791274610; x=1791879410; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/+yEirwMAP/6wyo/OxO7wXcw5TJycM3pvC8p/zwpENs=;
        b=i2M2Oy2gWCQz1lw0IIhUq/tet6a+l+IqudvZV0RqUddi0wDUMWsZxXm1F5lm+HddbD
         DfdiBHK64lDEvz+jYnTiFipVx09tKdQeSmcrhYqOrieiEDkD44fe17IiOj7PyDtbwyEU
         GXgEq/dKh79Q3y4wylYu20IOFdWEZnU0KKsrVDH6gWsF1lP+tySV8nGYPXAIy4/vvkPe
         Cu3YrZKwVrV72pll6GTRWR+eWSbx1ubojI2IVLPHG7j7ZqHoXIjxC5StvuhF8Ut+9zng
         qqyHfH8j6Gyga0QGRanE2I9mtC89RGthQPTpyKS244TZSJ8z9MFmyEY1xT13pQRTtvOk
         gJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791274610; x=1791879410;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/+yEirwMAP/6wyo/OxO7wXcw5TJycM3pvC8p/zwpENs=;
        b=1NxTfw0jbKo/UWXfYssbcgOloMqogRtTlk4jkLSfnqAkfQtUVnCckjgCCQ308aqyg6
         uon83gduuv5iKiLoVEOaI34WwkWsoEoWwU9JZlvtTgPfoh26SXtnU/ZCSf+Ri5sJM5S2
         KnRPZWOIlPob/vuOQ8chRevvtqixd+UclVt4qoJ/RPCb7Z4E/HXGy5OIAM56c4g8bT/N
         gfWZR+E5hXgcM4GcQwmkcUmYpstihFwL4ZU+Ut3NRMg+YpkIA8trtWTWBhJlDXEH0o0h
         arc309Ltxx9YqybsmVvIroRnBh+Ey9ZPXKU63V8yIW+ajk1ADrJ1Ttk2cWl1zungAxyg
         tM7w==
X-Forwarded-Encrypted: i=1; AKwUvBzj4448Bjv5ZNivTfjKE/smr6XsTYsUzh/oHlNhsp9UU/wAckiyjjfEiwzrC/M2qgiz5OS0XXv1gs++QA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKP4ZEiDoqCs+eJchNH9QQSfWqSHRjdBhJvuK1+cvM1v+++Dt8V
	VkrRQwitVC01TPt18/tCmL6w1goearGclLto8c3usF7PlWmiE2zNDHCqaULU3PP4sVBycN7RhJY
	IAdqx647WI2spO8Y8rVAkdZoU6hgrM7c/42+Bc9ONRwdG8zn1HDj664aMEQ6aiPIt5A==
X-Gm-Gg: AYBFou3OJ4jS8dvqtgj0wcoaXNj8mLprhXIF/J+VcvQRGeXYfzf9c2knlOxWG0Zfp3E
	d6ZUo03AAwy+rWsjMA6r1aXaP0x2Afrg+RJvm/6Lgau9rE+jViWleWAHDhp9FtFOYBpRccINcaD
	Y5D6Tb+2NdHfJTb7FimKWC3v7PYNxuADAxzKhK1dJVFlk3hzIGJWxa14V8wX6js4brkGXpuCx7N
	c3Bh6jhwujNDDJ1tYvUhkuDneFNb/cbEfXSiqZYEg07y8FeZ5I4mpcX3vJC41wAQ4UeVlU/JByG
	9ql+7l4+m2LtLjX8Oz7brfQ1WsC9ghMgRCQWFFOC0U1a+SUQl+CH0lU0zC8trzvxJCcFp59SUg/
	ZBfOFr23D/Kg8vAMTjUgHRcnrLu89wcE0Xg==
X-Received: by 2002:a17:90b:4c8c:b0:3a6:f90b:20cc with SMTP id 98e67ed59e1d1-3a873763609mr238468a91.61.1791274610495;
        Tue, 06 Oct 2026 01:16:50 -0700 (PDT)
X-Received: by 2002:a17:90b:4c8c:b0:3a6:f90b:20cc with SMTP id 98e67ed59e1d1-3a873763609mr238457a91.61.1791274610013;
        Tue, 06 Oct 2026 01:16:50 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853cac663sm3700800a91.9.2026.10.06.01.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 01:16:49 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 13:46:20 +0530
Subject: [PATCH] media: iris: Fix VSP clock calculation for high bitrate
 streams
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-fix-vsp-freq-calc-v1-1-53532d893852@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFOuxGoC/yXMQQqDMBCF4avIrB1IAkbiVYoLEyd2iqQ2Y6Ug3
 t1Ulx+89+8glJkEumqHTBsLv1OBrisIzyFNhDwWg1HGaqUajPzDTRaMmT4Yhjmgdt7Z1reOrIH
 yWzKV0dV89Lfl618U1n8IjuMESk0VgnUAAAA=
X-Change-ID: 20261005-fix-vsp-freq-calc-19b967b79e62
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791274605; l=2846;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=r1edbWID6BHyGGO+La0zZuQuA2P2eLpIcm0jEp6Hnsw=;
 b=XWH9e957kJV8PNpzoQrSs8jiiNi7LRxC60IDgsEfqXgNqQ+cR9EA2DL32SzP8VSa1CUQ6BeFz
 0SqL8v/olo/DyFLJ67GrMl8XkG4CxJrT8o8ce7ZHN/rFMM/zEMzSP7g
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzMiBTYWx0ZWRfX4dBMBi1+/HL4
 6aRw5kiQQueL9UZlwtPYwue1nNwiShn7yS/jSB6BPspKt2JiQxGKB1gPfZZQZeF+pC0T4BGTGiA
 7NiecpnmCr4YSYGU4RHwvrXyR3wVNRnRcImDKQTs/JxrmDZPERCH84lURrYAReggDW24DiUMGFr
 ayAg+eDiS+vQm5GC9SludAnX1v8HnFh1qmbjUMrWp85owP10cRxZfSczYjVz9lNmbxxyaZsDAcO
 3twDD5zQRpekTjyXE4b/4T+BQVTqUddc/Sh2RA5EVUKhknKclOCNF8KtpUdFfbcQFSNvT0UAFvT
 dHbYEt4tInT5XfVgSOdHEeFka4xoZW4EZsfsdhvTqN9lf+qrsffi2kdKxoYQfvX2wXEuhWWg4kx
 W9Jt/hhIyvIRRwP8fEgAeQY9rtRHmhh5wdy3OzrZJROLQRqSRpJr7eYhytvYg+d/zsnuQ1QWn8m
 kjvkQ0tPKbT0AxnJvJw==
X-Proofpoint-GUID: 2hUHOEk7SEeRpwjE_RhO4mH25y6GcT15
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzMiBTYWx0ZWRfX0sq+ngvTVKWZ
 CMwazARTIh2CWhgzKFRmxuUFdw2WITq2iY+Zww9sV3NF+QybLE/8Esw08TGDkgR5yd0qU9I+ubT
 SkrvdHjJhptR/lEko4rk5sRpQ7A6YBU=
X-Proofpoint-ORIG-GUID: 2hUHOEk7SEeRpwjE_RhO4mH25y6GcT15
X-Authority-Analysis: v=2.4 cv=BrQIUoX5 c=1 sm=1 tr=0 ts=6ac4ae73 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=YtTrQ6CoiT8uxSe-FsgA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060032

Frame drops were observed during high-resolution streams decoded at high
bitrates, as well as concurrent decode sessions. Analysis showed that the
Video Signal Processor (VSP) clock requirement was underestimated for
these workloads, resulting in insufficient clock scaling and reduced
processing throughput.

Update the VSP frequency calculation to more accurately reflect the
processing requirements of different codecs and bitrates, ensuring that
the requested clock frequency is sufficient to sustain the workload and
prevent frame drops.

Fixes: 82b96a8d8d6e ("media: iris: Move vpu35 specific api to common to use for vpu4")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 29 +++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 243bd845349f..c4762229a1de 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -454,11 +454,32 @@ u64 iris_vpu2_calculate_frequency(struct iris_inst *inst, size_t data_size)
 	return max(vpp_freq, vsp_freq);
 }
 
+static u64 iris_get_vsp_ref_bitrate(struct iris_inst *inst)
+{
+	struct device *dev = inst->core->dev;
+	u32 codec = inst->codec;
+
+	switch (codec) {
+	case V4L2_PIX_FMT_H264:
+		return 150;
+	case V4L2_PIX_FMT_HEVC:
+		return 140;
+	case V4L2_PIX_FMT_VP9:
+		return 70;
+	case V4L2_PIX_FMT_AV1:
+		return 100;
+	default:
+		dev_err(dev, "Unsupported codec\n");
+		return 1;
+	}
+}
+
 u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_size)
 {
 	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
 	struct v4l2_format *inp_f = inst->fmt_src;
 	u32 height, width, mbs_per_second, mbpf;
+	u64 vsp_ref_bitrate, vsp_ref_freq;
 	u64 fw_cycles, fw_vpp_cycles;
 	u64 vsp_cycles, vpp_cycles;
 	u32 fps = inst->frame_rate;
@@ -485,7 +506,13 @@ u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_siz
 		vpp_cycles += div_u64(vpp_cycles * 5, 100);
 
 	vsp_cycles = fps * data_size * 8;
-	vsp_cycles = div_u64(vsp_cycles, 2);
+	vsp_ref_bitrate = iris_get_vsp_ref_bitrate(inst);
+	vsp_ref_freq = inst->codec == V4L2_PIX_FMT_AV1 ? 533 : 444;
+	vsp_cycles = div_u64(vsp_ref_freq * vsp_cycles, vsp_ref_bitrate);
+
+	/* VSP FW SW offset */
+	vsp_cycles = div_u64(vsp_cycles * 1000, 1055);
+
 	/* VSP FW overhead 1.05 */
 	vsp_cycles = div_u64(vsp_cycles * 21, 20);
 

---
base-commit: f0406245cb9855e6318335a8a223551354291a46
change-id: 20261005-fix-vsp-freq-calc-19b967b79e62

Best regards,
--  
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

