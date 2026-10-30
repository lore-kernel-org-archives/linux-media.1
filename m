Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793391596;
	b=Ik5IiDjG0kwnhGrD2MxjgKkA3li8+KF4dRIKN+4ZEMvtjdb2HCqGUujbrfTZlH5biFHu
	 8+Vm2uVtTy99327UJqZ7xQYMqkeoEwAE09M/xHCYIN3AuVghV3V7wq4oQcpiw1nF9FIiI
	 IB0i4n5DKqQTOgpT2zV4OhJE3trHdga9JYk3qvzjzPYG9h+2ijTuW9qBItkrzHVncpBjo
	 RbJU1i8LAPY6rQZ3KACqouP8jNPqSabjWatfb1knOmr1dINyTShwiizlGwL08BBM4QMv8
	 Y4eumrSOjgmnOruoH5nORioL3mP8I/XpBH727zsYbhgp8tVSsahvKIh/a1lgjU7aV3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793391596;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Dqy6zyuLBCwAdtPhdOZplOyEgkf/hkcPoJxQXGo40zA=;
	b=lta1JIzgcQq1Zd4IkMGCQWV2R8qNhbCP45Fj+weWmxKYm5jt4RHEiHSFMznR96ngWsru
	 0Z0MQRlfH34nkeGADOGydQYv80xPt8BiWAA/ytmNW7NKhm4OJX7hKWXZzzxlBokH7uMgo
	 XJq1TK4djf6kiAoV3IXaXSh6rkZ6GO1rROYZSEapycdDmC+lkVyti/XLLyTBvQj2ScFun
	 2X7zynQ6OohapdoE+t/9sXXdfiqH+6yM+KeNmHo7G+t8C+70HVrJND5XCOUgi5NrVjNVB
	 mfRhFWHQ70JXyGtxpkBbXQN2+8R4++UgRky3rZfVqKYnwzoT+pbpTR1ukQFa5bd2VOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="KHi/hL7Q";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gfBdm2j4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0560606A31D
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 20:19:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0560606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KHi/hL7Q;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gfBdm2j4
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UIi5bh2523015
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 20:19:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dqy6zyuLBCwAdtPhdOZplOyEgkf/hkcPoJxQXGo40zA=; b=KHi/hL7Qrdb3RLH8
	H2PwyMvxxHdNyzd/HCkNcYQ7v77xFqg/AhqMQiwZ6UFOGU5uXhLDzYDXm+c4Ngzc
	V66neTPztiJxr2tWfeEV+Tv304E/UWrBZqNWOqwrswVqHA5XdbhJTkQ7JVtpgm3f
	JPeSGwZwFo+4dilSG2e1aoJppwwChXKHTtdhaKuhkvuzHh6E9YbtOKdvgFqR4Odn
	0uC4RjY0EWT4vyzkAIgK/UHiGYx4z/fuQXRY6GTxMz+kusbH/qLlbdANv0MRXQ6c
	O1eBuz6YCYYQGx88r14WyMjAqprVl5CLUekw3qlxUVVTb7+MoNklXhSF/+/DkxZ6
	zPxh0g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn0sbr975-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 20:19:54 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a223755e4so4323030eec.0
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 13:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793391594; x=1793996394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dqy6zyuLBCwAdtPhdOZplOyEgkf/hkcPoJxQXGo40zA=;
        b=gfBdm2j4zir9TDsSLp/K8Ff10mf5dW3wVc/kciv3Vp9l6u+zpxdn0QqmQ4CoLLhUS6
         XHQ33EEw9D818pQpmCnryXPNoHbr1q1Z1zE9rUiP5QdEjRHdzbKe+VSHg9HD64u/mpoe
         v84pGSOd/eayunXZZ3is1gptUjfuWiKfqTZG5+bd5P0T6XefLxYUfkJ+j3Njwt7IZoII
         3A2PMcWQ1/0mSlyolFolRekCF5lf/xSqj/VRLrk1nxERnxZhG2K53gAq7XRqZ+U8JH0I
         UO4Per497PWNB/vx55wEQv33tUXFEdtERGhZP8/F+iAZq7z2J+0QgIfCeTF2Hu37y+9u
         M07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793391594; x=1793996394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dqy6zyuLBCwAdtPhdOZplOyEgkf/hkcPoJxQXGo40zA=;
        b=Lz8Hx4dpN6Kb2v2056XWnzrlznktoResvdSYdAbLQNFNwBOoAtw2pcWT6hUnOZZOr8
         t3IFg34ODF66lVwI5PlTiMzB/dM0p7S6o4Ay5fZoGkOciD5dqMY+TuxYSQQhjw1HNDw9
         rHdlzIppK2lUsiPgWpMrwIN0t8i9QARCziw30rag9l0Sjzob2Zh85NhSeMaQp4Vx22cN
         8mNxNF90Ek0s3HR3ZqKBcDvd5QgusnOjPQP6dNbXL+0EFMfRYIyi+4x1BQYadKcOyhfZ
         swTASXb16wg6xUFFbOieRqosIi6CpeE5unlqDSLkI0eOzSDNqM/tObhCWXzegsNuGVEO
         gBKA==
X-Gm-Message-State: AFq9FYKkVhfrTBlg2zqXcytPgaV+8i8QKffAv/5JMDOQJhIp3fsbZ6sG
	/tHzAfhhDX3F2wSLSD+Lm7zHiE4xcAfKFawGd1Fg5HamX7PV/KeNQDh8d8JC3a6lCqKSwtV2jJ4
	Fd6GuYB+c1ob3ocTpBlTo52UUjY51P8f1PxekCONZWr9sScVcYYwJupP5mL0sOvOnCg==
X-Gm-Gg: AYBFou05JqFz1qPuyvFJvt3b+Jb3DXFVqQ6wY+JdC/9gBQ3I4MsL/T2zHBLolJ6A8sE
	lOYvH4bivOE2vt+LAPy8p1EcT9gR3y8Y++yzuIlpCvVCm4drKIqNrlYBJRRv/JckpdxepnK2qTZ
	TxqmQGUJqk7qvzPhOQhoQszP7QjhNMqILrNYxb9nRj/c1ZwJbkoTiF0oCLorQuOor7eDNU0+xb9
	9I04xNB+/lepYu9RomSCse64vM91TSTFmDomK5iYf3Rk7a6XbgL1HasBsl9ZsjOpsrvv1LSSREm
	riH3U+9rOvuJm+k+SJEMyMFZh9uoPBNZmbIbbHM/tPq9TvPsBnk7QumNiNFhwROP+perAEe1TA4
	nsSGILMRe106QEOhDaNEr48gUT1OAy2eTYITPUR/Q3sNksX13vb29CTSJbOMKre58T1WH4JTeDd
	td+emK8w==
X-Received: by 2002:a05:7300:471a:b0:36a:2382:7dab with SMTP id 5a478bee46e88-36a4232cda7mr4616464eec.6.1793391593800;
        Fri, 30 Oct 2026 13:19:53 -0700 (PDT)
X-Received: by 2002:a05:7300:471a:b0:36a:2382:7dab with SMTP id 5a478bee46e88-36a4232cda7mr4616418eec.6.1793391593086;
        Fri, 30 Oct 2026 13:19:53 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4239ca82sm9300197eec.0.2026.10.30.13.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 13:19:52 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 01:49:09 +0530
Subject: [PATCH 1/3] media: iris: Skip redundant decoder input config
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
Message-Id: <20261031-fix_dec_seek-v1-1-cfedf0c267ee@oss.qualcomm.com>
References: <20261031-fix_dec_seek-v1-0-cfedf0c267ee@oss.qualcomm.com>
In-Reply-To: <20261031-fix_dec_seek-v1-0-cfedf0c267ee@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793391582; l=2308;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=J+3ZsNvdFp2OxHwNoqL05vud6cfNJiFhDK7G5hBgPFY=;
 b=6S571aqhfJ5YJwehy77XWoQ85ejcyXyUVLjoWWjhnPXbeza6WEjZz9CDIoLDe/8OAuoiY/cvI
 MaPULRwlQiEAKzD3uELQl5xhtL2q+d00mo1f5bIyUWLAVkAhSN/iGff
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: xOFrCBoRldoQH4yMspDtZ36Gb95Sf39x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4MSBTYWx0ZWRfX4xQiI+73Wx+N
 fo41gAA9AKdrM9NVa70P+VZl+apsUfCyeKSkHhyeP6QqrA2gufUxYT7t0ctKDuLk/ut7l9zTNv1
 0QoQ/Dm8m0qhTHvMUVjqP+cCVXpcsRpVha7w+fpGyitR+fro64aAndjzAUBdux1cTkPksp6KTcG
 DT4C+XK+ztgD/tz1aN9+Q0d/vjMEhICw9SoeymtelX8elt4qOgKgm5L1utQlpi/xYx0TNOxhPpk
 3SzqqgQFvVZjLO6doH2YZv3TTaMWpEsqJ++F5GprWxK4lVlA3uH91VJrZMwhC+/8NOnLe1FGYmK
 /xdZK/eFDaY2Pxc7URf0E+d5fJC1a3jMFArcyCM5xx6OppmAh8Gqk9NPX5cInXybvDTxrhA991t
 jc3KAYHki7mjTxftqoKeeiuutFxmwlSqkApX2GYu/u0yua9MuTjGZ6eJmTrLMk5yNKAKPfI+ulN
 L6pn7dRLYxmQ64Ryyag==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4MSBTYWx0ZWRfX4t6gy6EonAFs
 cmqguFEk4VcG0ScKdGw6QoHpyX8bFgjkao6kAueD0igKzTCMMSQLjxvmeV70agTU9tdpwYTxlS6
 ugJlVTg7k/PNISnoGa5uM5Q/CVwMMOI=
X-Authority-Analysis: v=2.4 cv=IJyXmQvG c=1 sm=1 tr=0 ts=6ae4fbea cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cPfzbt1C_6B9HWAkqhEA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: xOFrCBoRldoQH4yMspDtZ36Gb95Sf39x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300081

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

