Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304701;
	b=fa2o/+Fv01Gnxv/wPnFZjBfL1YhaJm2a7Ptmz66n0XT/iEU4aL+UVaHEy1qUJDWAhYxl
	 leE1L1++kX8Hw/EUqRSCS5uzkQWw3/Z+uInMoOd42un+LLtU5KWD0P0u7NwWPlGfKpZLF
	 +ahnNQAqwZWAb7JNd7TgZRuy56izpGjUAsHAAn2LMMPFSznfuNgI9k/DUeJXvAX00c4KH
	 peRFANFbc38lb9RFHu/uGaKxVAg/6cskQphwvFGvjznpEjXIWhfBhcAo89fDZOHZn+4fM
	 iPIm0KQEI49FCMi+en1IHiVpsMDzH1DwCQ6+xWXO7NPcGT+R4qSqh+cVKDh7V7CRM7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304701;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Dqy6zyuLBCwAdtPhdOZplOyEgkf/hkcPoJxQXGo40zA=;
	b=vZUdlZMiRlL4RNWJD6bNifQltwBVsUV6zVPsCQ7KYYFNfbTO+xmbOTi+AlTP8wMWRhM+
	 zOwD9UYOo1uAnsbbm1q/WCURbTAVZrSqf1mMXM8SmkAgSozpmXrXOCGLa7qBQ77L4Q5kc
	 U+Rmwb6SGk2qIvwCPOdp/xMV6LJbaqVrDv9Nuc45IjVR0cCq2RiXKDx0BEWu0SU6/flpB
	 xTRv2l1LHzaxhZrRXvSUZM14lIaxjfoI8oSA2Hey+a+tKFOI2PTwfEAhjQX6eYVaqsnuE
	 VoJiAXeyPQiPqa1uhcNS5qnz6nJQklb+vGmlx359cpSougu8+GOT6EZvuhozJQo9P7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BJ+9Xxz8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e1ouXujT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D22F60A2613
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 09:58:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D22F60A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BJ+9Xxz8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e1ouXujT
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7l2oQ1681010
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 09:58:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dqy6zyuLBCwAdtPhdOZplOyEgkf/hkcPoJxQXGo40zA=; b=BJ+9Xxz8F01ulYxz
	Q82Rgc1TLeuaSLBIHQQNL/D4L4QXiskoc2JiS3ZpiI7i4/VN16CqbRxEkZpkcgm8
	Vl1q34xADLUNWgC0zXE/5Qn+Fa8WM073mrE7ACJumvVjiH/MQ3x42jMjC7m9oCJ1
	24VyP9xr4D4AfFk7yb3jUQSzh9PaVfYsoJbrgTDJuhgsMhnBveHyqqpN1D8POIBc
	JGhsOll/gl/GqHW8L7DZUOxrsy0YfrhClZIu03g5H3wX6cM52siIhQSBOmsr7CMd
	jMKYWLLFTj/5Ucm6PyqMqXodNu2smj/yHoCAR/XUFUGln3PbFAgGeaUDT+WifZDp
	kPRs8Q==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hunwkjnp7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 09:58:19 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b3b63b9665so557502c88.1
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 01:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794304698; x=1794909498; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dqy6zyuLBCwAdtPhdOZplOyEgkf/hkcPoJxQXGo40zA=;
        b=e1ouXujTi6R0XgJZej/Sfp3ezhx0C3+WhzAWE9ztVzapDJWB8U6PlBnAXnXT5S0jbq
         FTQWUNEkQUNGEajqfFV/3xdl19wdqz6xW8eQphUH2ayalffAt4tNEo0kBMc9eaauEDKo
         fvKu2QMZVojCDvgpSIVorlyr1hRqSqwEMa4KX/+mDgSqwQ0AapW5LnKgSQ0gvq5juhmO
         3kRbLiI7ipMnM7yFsW79fHoWBZYt+/wbGlkP253PDfkujQQVNorLuw0FJCo8FDfKeYnq
         WHA+YX42ZjV7O06oPrmfp0BG6thSCSCz08RobaqwHw6+8Jp1yh++9qVRHoMS7CROVamW
         IwnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304698; x=1794909498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dqy6zyuLBCwAdtPhdOZplOyEgkf/hkcPoJxQXGo40zA=;
        b=x5RRX6nYJfmD5sZcpDIu+CS2hBBY1ocyWAcQuY2F+RJ4lxDpe9qtmZuE3GcxUX1Uq8
         qnbtPF3j5epRWSipkRoQ9Xoth1de8iFayVAowOXNJ32RKppYLA8Sckjgvwxwtw6mCvrG
         g2QlQpydJVhUPpkFzKZ2WSRHmv9Fi5vRLKC+0bOQ01JokCo+5f8cMe5TDrw/Jpbnx8xf
         qdvNqUN0zfaOZmxWz1Ya3DRG8tpZnsdBOBnR0vHpdVCDyB4wnn4Lqx6T409ierPPcJKy
         Ma3UeUNSTPT94dUNCf04Q4KTUOqvlcQuT0D4q8h3UwZ3vojk1guUq6ea+0qgl8QuNrcG
         f8rg==
X-Gm-Message-State: APuU4Z+I4th/vQPeXX37PuPhAIST6RN2u8pBg+IF4eWz1tOFrJKBz3GH
	lFQM8G8T4HYNauGz5RPyu5tp8dHkRDXRsTjoxALQnI9jG9WPXWbYABRM7uQmXpVfBxjpue6v5nk
	9WyIKIykQrLQALaGeDeSbbAutj2gn7i0opilITeUw/NxCTpiSouD8e8yVIgDPKrlAHw==
X-Gm-Gg: AYBFou3BvXAZn6VKLczTRwoDZ5CK8d4/Ux0MWWgv+sAj4vvXwaNwDZKHGeBMRQD+P7A
	Az+p3GXIhLp0ya7PbWhPSHHhG2jDqgKamRLd9DbxTA7m4EjcbfVcxLBEcTiEB6UO6p/oym3CDZB
	2VPfd6SlK6ULjYYAQOct8ayE4OUsUzpPUKCjvaZgTMlAjH3dBStkF4Ot5thasoMQNnfIjGyZd1a
	B2ANDnh7/fQZGMqilKpt7vpeVvytcbZTYBBUqj+4Jw2Ul1sOnOke9gJ9fmGHdkyZPmG8pRgvWmG
	oo5y/ctLwxwmpnr/Inb9ebxTb0q5QyL+S6fNlrm/E5+cru+Fw14/oSQPOmwvxFdmBQz0hl1XGEH
	6vg1OXMgFdTyocZa4OnhXYS54oO0AR3YeBJn+haTDBnHYNveAjapnPyDRpzpZASsgWulxT0KdvZ
	/s13bwAQ==
X-Received: by 2002:a05:7022:b90c:b0:14a:8df8:56c5 with SMTP id a92af1059eb24-1b3b607b487mr2969495c88.26.1794304698393;
        Tue, 10 Nov 2026 01:58:18 -0800 (PST)
X-Received: by 2002:a05:7022:b90c:b0:14a:8df8:56c5 with SMTP id a92af1059eb24-1b3b607b487mr2969461c88.26.1794304697646;
        Tue, 10 Nov 2026 01:58:17 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11346sm7333141c88.7.2026.11.10.01.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:58:17 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 15:27:13 +0530
Subject: [PATCH v2 1/3] media: iris: Skip redundant decoder input config
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
Message-Id: <20261110-fix_dec_seek-v2-1-210d8c4fc31b@oss.qualcomm.com>
References: <20261110-fix_dec_seek-v2-0-210d8c4fc31b@oss.qualcomm.com>
In-Reply-To: <20261110-fix_dec_seek-v2-0-210d8c4fc31b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794304687; l=2308;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=J+3ZsNvdFp2OxHwNoqL05vud6cfNJiFhDK7G5hBgPFY=;
 b=lzO9FTQ3kd/3K/7lj8dJx/QiPKGwZwGTzVEkzT6ce9a77Yptt95uDUNwrV9TjLHmHQ2lk7HyF
 IYO9duH/L20AtQPaMOTJv1qn2rXYQhYcz0L1XVAs/hXh/jhNj31BeQZ
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: imArbmZ1lfCS_OqAGzd4qRYL9bxYoP9J
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzOSBTYWx0ZWRfXxYOnM1F1Z+8F
 I6Vn8dh+uKV6aIgpPWUdotn0uST1rJ+WmSy4ujPu7nTFj2A5x/m9QI2C/zpSxI40Uie6khAlbr1
 C+Nd4gU89FUoQd16QAqw3qV1NKyaKo4=
X-Authority-Analysis: v=2.4 cv=TOrQ2Fla c=1 sm=1 tr=0 ts=6af2eabb cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cPfzbt1C_6B9HWAkqhEA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: imArbmZ1lfCS_OqAGzd4qRYL9bxYoP9J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzOSBTYWx0ZWRfXySxiBdKav3xd
 VzXspXqIGf14uQjz7q0APP8mf92aRU6vqMhmzfkkvtv+v0326HXpiBEjqxEgV1/zw3+uD3Td5jG
 cee4uWJJwyn2re1RxYKLpvxZyuYzvUM083PRKF+GNA/ayxBjMBZrepO7F/m3uFNzff3s8XW8/8H
 jHKeW3X9u/vEThaeBq6ID6nPN7g9eIi0WUVedwMSDxSssD1siRYRelQJxIM/oK/iC108FLX3Xch
 pmHRXXIr7WAbgo3c5ZIK5DktAUniL5c6pnqOlfFivqcjZs9aISrMgQTiJMMI0wd0XqWa0qDMOj9
 wEW5KtAPNkeBwDXk/PL12Qhlb+mCciS3kdSFdorIyEffUKcpZsDRhKB4Km+HizxMBvVLjxq6///
 NdyiOOb8GE3TwX+IkPyY4T39pyUr9Zb6iqHfR+VI5Y/mettE3j0m0iXdDUEdHj+34BUwPzzrRSA
 HHDe2rMYH7DnKoKYuxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100039

The decoder input configuration parameters are sent to the firmware every
time the output plane is streamed on. This includes streamon after a seek.
Resending these parameters generates a port settings change (PSC) event
even when the input configuration has not changed. The client then
receives a redundant resolution change notification on every seek. A seek
hang was observed when redundant PSC events were generated for the same
configuration.

Skip sending decoder input configuration parameters once the input port
properties have been programmed. Reuse the existing ipsc_properties_set
state which tracks whether the input port subscription and properties have
been configured. This prevents redundant PSC events during seek operations
and avoids unnecessary resolution change notifications to the client.

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

