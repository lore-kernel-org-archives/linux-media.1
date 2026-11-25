Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795585267;
	b=nnw2Obbu6p2ThW9t9Tbq4JGTb1neXvQA1itPq4eHRLFbHPUJAfp8xF1q0A6UezADc8MK
	 PMaPXmCTzOPlJ3Q0Qk5S0zo4L+MmCSAbZ30LEeI84GkEIpcl36ytuVZ3cAcTNrbaTekxD
	 eZVxNb5MIzuDvhAb1P4BWgnZEVW9SwkuReZL0NcD1rqtz+Dux05gGzzYZQJQihqEkcSm6
	 HJF/8hNojzkHFDHpQM+5kHQNh2iW1chgIPzfNn+zn0JQZYmF1ajBoPZf40b6AOm3fVCQQ
	 WjmQpL+xKOwrE0rZXPXYsrTbTgN+zFFXR0Xan0rn+AgZbdqweB9Xn+84fEuvsbddosw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795585267;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=R8SgQ6hwW9qOw09sW8J5tLP1YofqQz2au4lfK+740o4=;
	b=4+GdSPjwxpre7MW136aGoVzD8UZAq3YNP2KdyjirG1nAcG5ZQ0Di8AYLDknXByWSTAm0
	 WrHIJ1MNnWPTnL3c2FdFar9qMZzburrw0BrqxyidZ2lGXepYCn3qS9PB7iJ2IaurvZOfU
	 tlzz8cAlc8z5O88438dUMLH6ir22I/gwvbEUkBvopTCHPhpzRPFyQPAfBYudPeZvIM5XE
	 ZMnwaNZ40P2LvO1+pUozOYa3US2pMd7f7Mzl+oAYeuu3N0eRX4vJ+suqexcuY2LUmN+pV
	 +U+iqQKkCtenq277ECSUUpml0DZGslTVzqQiW4YphuVuoGO1pN6s5GSvHl69Yb/B09Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dg4Wu+oM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="A/4Rn6+B";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC0C606A332
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 05:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCC0C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dg4Wu+oM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A/4Rn6+B
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP2s6Hv578095
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 05:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R8SgQ6hwW9qOw09sW8J5tLP1YofqQz2au4lfK+740o4=; b=Dg4Wu+oM8DDozcut
	Wbt6+cx5bw+Lol7rvkP8MKVII+Hfb/eQ9rRXm1nTKF9EHdJESskdnDCR4Gv2dPal
	vpqLMU20u39AoTTRCw084x2P0xhHx1bKCFL5eFupIUOC50Fdv9EaID6aXkNBWJPI
	VpfV6hbzn8MrxOgJb6iNB0jmBFQKSC93Ue5gS5H0zlyMs3IwyrkeNlUCl2Fik/j1
	UB1QtrIh/0nbgPxBbozL5fZdhSZFgcS8W7IqjRM3ieItP95Z7Gwb40jJCdM78JC1
	E+FjUZEkqlB2qz5qHyuzqXXhyGA6OtSKTjW1BMJuJ7fSvpxfMOvni50WCSeUwg4Z
	vdhDHA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5qa28gn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 05:41:05 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b41f4ca1bfso4238725a91.1
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 21:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795585265; x=1796190065; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R8SgQ6hwW9qOw09sW8J5tLP1YofqQz2au4lfK+740o4=;
        b=A/4Rn6+BksppQG50CyP4+NLIMZaMftMf5HlUjB2Zg+t3GyYHjJqhuKn8HuXIs3m1sB
         tb/els/jOOeVh+DkpYn52ItEzms+/fXw4nGk/4iZLMfQit7gG3sB3aKBzlKNpyybM1Ds
         0eZWDU3zRqUz2jBEQ6wzsBbvKxeCZructF2RFzycoYAM+tEKUWFjWjinnSFUY+z01MRK
         GjTbxfvwSODy8iCLWtwFo0AZLxHnubPZUitKf1d3+xR8XD0GgtGx/xAxqO7C74RJ7i5q
         w1e1re0PQB9514xSpfVtYlAdxF2CIiH46Tn8/0jRRn0pUAXdJ3Bobr07deAznU8wPCTL
         3rxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795585265; x=1796190065;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R8SgQ6hwW9qOw09sW8J5tLP1YofqQz2au4lfK+740o4=;
        b=bGgWXwmqC8Z2ihorTiUm9B6WCnvzVFmn03sU3/leWY7AQ724ZQ7FzWYcnlymrmnICS
         OX23tcYO7as4MW3pJ+geQ+NRtnfjCsVHqdyU2GsN/3+0oXryRb11jj99Llv6q1JivKnz
         6imcsfN1jgj3Lygn2/pK1uJKNzI9LRy77gYF6QVJesJNdhh+YuuP8w+IhPmsccZhYLuB
         BURlxLKewIitmibX4aR+FC6fgAcngrodbK5DRlf54/zwkv4QQ2cbak9twi0HZAVasMB9
         6HI5wwYlA9kTHpLrm/s7NE8ecU7O4xeArEYwdB5UOAp0eX5aovJFKkjfgiAM21W/Xc7U
         B9Nw==
X-Gm-Message-State: APuU4Z9+VVgAEybBTMm/l/13QtKQKXEtzZTyZLNEjb1yOnvcB4VhVw2B
	PcDE1gFAVj0u+/9M5WFZFn1wybVTXGNzAVDPk54cemRnQGFP0LMJQiU3p+cFmHftNrlJdhq78Fn
	64sN0OsvluMdjwEGPFI+zeiwF00iwWCP2LLHH5aBpEiIVAtV5c6c1dzLuX6TQriDgQA==
X-Gm-Gg: AZFdTZfJgUDU13C0Ja/3nwHmbBA6yN7jsYfaHUnejJLo42zxywgj4p0f6lHfsUYSIbq
	Aj4oTLGXY/36kjny3vgBxGlVByLARUDWgBuzgRKTtOJkKfj90IycJQ7leFSvF8w4emxS8807fFV
	taUhsYUafUrDI+7wnf7E0hTaGlPepIVgQdlDi36m2jyzFR6pGSThxujuYtp9AKD3izISy2O9eTR
	G4AK+5Kl8vVt2DkdWDIW5mar59Yi6N5uRtgLlSPM/H/e1CTAYIPRXAq9oI8RCIg9BmlXYQJhZcX
	FMVhO+N70SgIlx93Mj6RaEChACXK6GbYwVYCQbRBwboJt97D5d1CFEItyGPJwr0oKgG3F+dZVpL
	C/90uSbZsOjT4KKOE98fmYu46ACRxgwyMb4lI+R7ysAwR3WVWW3koTKrls4PQvHEaheAtfZv/n/
	kYZaWT48U=
X-Received: by 2002:a17:90b:2e4b:b0:3b4:e3e:647 with SMTP id 98e67ed59e1d1-3b41c55f771mr15874073a91.0.1795585264721;
        Tue, 24 Nov 2026 21:41:04 -0800 (PST)
X-Received: by 2002:a17:90b:2e4b:b0:3b4:e3e:647 with SMTP id 98e67ed59e1d1-3b41c55f771mr15874061a91.0.1795585264213;
        Tue, 24 Nov 2026 21:41:04 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b409330ae8sm28897957a91.7.2026.11.24.21.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 21:41:03 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:10:23 +0530
Subject: [PATCH v3 1/3] media: iris: Skip redundant decoder input config
 params
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
Message-Id: <20261125-fix_dec_seek-v3-1-66c9889def2a@oss.qualcomm.com>
References: <20261125-fix_dec_seek-v3-0-66c9889def2a@oss.qualcomm.com>
In-Reply-To: <20261125-fix_dec_seek-v3-0-66c9889def2a@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795585253; l=2753;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=HbJHii63vZuPsEL3D0WK9kORlLRtexqycHmObvJrerc=;
 b=VmTJ0C+QAsT40DxE6OqPP3TqMkhaaZQc4pYwL+tyLtGZX/Iw8wRFWnHMSseFNfK6bx7fuO9Ve
 dMGRdffwoYcCJREIirXL2Kq6MJfNTdBxi5uhhFDFGzqWR8EYQIiS3U7
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: I6EWjmWTSatlr_DcGn92ITyBwPPagZ7s
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAyMiBTYWx0ZWRfXy6uM1ibkxSkd
 sknZdLsiCuISzuVhcGud0y5xjafVeWgF0dr0T28qxDtdeH7ptVM19h7LtP76LSOv5dp1WVljE/h
 YofLudL9Xj4OEW1jR6CnTJHxC4VnoTI=
X-Proofpoint-GUID: I6EWjmWTSatlr_DcGn92ITyBwPPagZ7s
X-Authority-Analysis: v=2.4 cv=CKu/zhrD c=1 sm=1 tr=0 ts=6b0674f1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cPfzbt1C_6B9HWAkqhEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAyMiBTYWx0ZWRfX6tJ/WERQnWVb
 tMAoZQkAQXaRJD0IhrMcS33G0Q+ahBYbs9gAG+uCKr+N9xm9hR6FvsBab5fRmvR6BgrKrt9Bben
 /GfN3niTARLsi3tNID9x15oYSkVnnT8XsFqsXiXMbrbRHM/GT5bLFsabRKI/emNUPdhLiqJhmBW
 lcTBm6W+9s/q9Ur1dATLqe46TXqslzyUd/w5WuJrwtrJXDqXFfhdcNP0uIPdWybGUUTcr28MEYG
 sK8lQjQ0nuXfHiL0KA0JI3hBEGm6HkvWwYkrM8vUPUm1KnaMxC7Lj5yK/KOzsKG8umIU7XHMA8M
 W6kVsR8XX+7D43A9iyuOWTOIpHkgDAB7yovPuvtPXa4YHsP3VVAOTmiVvGy2XpAmi6/2UUoRF0C
 LkLSdtszeEn5rz5HnS4SINab//DaYLtxxoPhCiKkkp8ecSgI9b/raplIhbpTRecomLLm/90fhZF
 ycN7GVmqeY3n8tCDqcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250022

When a decoder session starts, the driver sends the input configuration
to the firmware on streamon of the output plane. This includes the
aligned frame size and the default property settings. The firmware
parses the frames and raises an input port settings change (IPSC) event
if the stream properties differ from the programmed values. The capture
port is not started at this stage. The driver forwards the event to the
client as V4L2_EVENT_SOURCE_CHANGE. When the client then streams on the
capture port, the driver resumes the input port, starts the capture port
and decoding begins.

On a seek, the client stops and restarts the output plane. The driver
sends the same aligned input configuration and the other input
properties again on the same session, and the firmware raises another
IPSC event. No PSC last flag is sent after this, as the stream
properties are the same as the ones already running. The client keeps
waiting for the last flag and hangs.

As per the firmware, the input configuration parameters must be set only
once per session, and not on every stop and start of the input port. Skip
sending the decoder input configuration once the input port properties
have been programmed, reusing the existing ipsc_properties_set state.

Fixes: 025398e9121c ("media: iris: subscribe parameters and properties to firmware for hfi_gen2")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 388a36ff2b07b..fac61ece177e9 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -668,6 +668,7 @@ static int iris_hfi_gen2_set_super_block(struct iris_inst *inst, u32 plane)
 static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_firmware_data *fdata = inst->core->iris_firmware_data;
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
 	u32 config_params_size = 0, i, j;
 	const u32 *config_params = NULL;
 	int ret;
@@ -693,6 +694,10 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
 		{HFI_PROP_AV1_SUPER_BLOCK_ENABLED,    iris_hfi_gen2_set_super_block            },
 	};
 
+	if (inst->domain == DECODER && V4L2_TYPE_IS_OUTPUT(plane) &&
+	    inst_hfi_gen2->ipsc_properties_set)
+		return 0;
+
 	if (inst->domain == DECODER) {
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
 			if (inst->codec == V4L2_PIX_FMT_H264) {

-- 
2.34.1

