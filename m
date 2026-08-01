Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A0330B502
	for <linux-media@vger.kernel.org>; Sat,  1 Aug 2026 06:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785566706; cv=none; b=kZxsLe19dWFsGy6ICX8Z8Mz5ieaYxhEfvEast7HWqU5G6m8JH8DfAa4+qjZ9KXFSvyqeOkgHIJogtlVgVb+pSAOB2mp0YoaL5aENDBHUMszIwrfUiGw+GHLif8Cki18MnM2zKg6zcKeZV1A9+nmhRZpit3vMNmafeuZf29wEeGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785566706; c=relaxed/simple;
	bh=Talog+0/N6j8EQ1PakpJ6H88zNB0v5H7GMdas4bX7vU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=txcgIIhgMEz/e+PeRBbb+VGbgOJdV/A0W5hlmRe/QJmVT9V5DQZQIjSMP6pKi3wGczzNWzS9VeqS/OqlBv7ipIZ/5p/LSShff8TJLkgMnHF7v2gJrQaJVFHLC74Cy17pwNXXHMS2IM+vqcUPEdjbKBrhy8W4tgLPmBiDjGQmdOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FuSHQqp0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NTIoERBQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FuSHQqp0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NTIoERBQ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6713ZeFP2004597
	for <linux-media@vger.kernel.org>; Sat, 1 Aug 2026 06:45:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gy//CsWuz2yFFMSMOowYorOjj1Lc1O2Hpen8MYG/G6w=; b=FuSHQqp0K8t1xWMM
	UdLd1dDN4uSn9FjKY7Y3blIoeNXY+W98GamApn1MIFeXBaXWTp9fhOCsRClKJo+6
	oJzvEoXv58v35yUjoPhRtAji3i7istuf38dS3jzzbZ/Pi/pFNN8U6niX9FeMZCMC
	A7QDVFP5Z/yD+xqairo6gZDlw/Z6pLUvEgsFezXgh4fD1XXpRBC1CdJSwjdbrtz+
	5IVFS0e1Otn7JeCGoYBLijshCC27P9BJ+Eid2EC39RwDSt6q6/Yfwtg31Y9/XULX
	kjrDADMxrLnBfBJV8ocToQg53GdEtTWflUq8WZSZswprTdUL7zhOT1V7mKWbq1E+
	kZlQ3w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9118b7f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 01 Aug 2026 06:45:04 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb7d6ba548eso2076076a12.1
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 23:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785566704; x=1786171504; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gy//CsWuz2yFFMSMOowYorOjj1Lc1O2Hpen8MYG/G6w=;
        b=NTIoERBQ3nOTRLljzIAvhhsKiHq8BXrSachG96waxR6XpMWWwbBJ8PaSdfSNwxJkwM
         G7dlIDAzl55B3ft1IhgcUQ7BV1ddNMgt2Ydp/ps2GxzriQTsCYpLoa8MrV3YLIuw11kr
         vuu9CxPcKC8zxPY2lyPUR4DU0zeZNA3h0ozOyf0t3T3PaEfKXLfGCFHbRLl1Pj/IR/gI
         WwPTra1DA90sFYbdLnaLrwkNkbk2fvrtE6WwvTzX/POJVfVUta3Frshcn0SDmSunrsl6
         eZ46JIqVZMbyNBUtY+t0gURLKQS7b//EQZREamHyYpPo/+HRi7wOAM7xRKUCybPssxjV
         4kRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785566704; x=1786171504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gy//CsWuz2yFFMSMOowYorOjj1Lc1O2Hpen8MYG/G6w=;
        b=HBLJ14EjDc4cXvGjX7tXXwDOezkdwYLjqPN+m/r72/ftJIIBtWhD5zSTNta28fepoL
         3GFMydY14VH5vhxDb544/qtOhbb0htg7bFrIKaM23e/KQkEIJkLO7gElo0yvEp3kS1/+
         CM1njAFs/3bG/fOyqPz2Sa/AE62Og4LhxYuer9j8LgEuhWn8o7e48eHfAW64kAzAZZzT
         +GsLaPzgh9GsYD5VERzSgav3nYnkTq4Z3Ykt3ziQOo5xdEhoTNU18susWiFTSzRTyBx+
         +MxIilpnJ5/i/0XK571E6iYvRX824yP3h5G2lHai85m1FyQrLlrHSt8kC2kegBASPA1w
         2mFw==
X-Gm-Message-State: AOJu0Ywrkd0qBV1CW5qwwNmBppEdxtdHHWOZr89sOo/p8r7hB9dUkSEw
	MUsTDb/ZiX3ZnJrtlynkF/HkMyNb3LaF+B4jcI+411WS+JhFvZ5WDVO/aW2m+AW5IwO6I2OjJzS
	hK1mazzcwxHr0PJ7YTU6Vlma8icIsofFnJvvV3xliSL7PVat7a63vEaiJWmWRH92Qdw==
X-Gm-Gg: AR+sD116VmAtI+jO25L6JhcwXZd/8Aip/llX5+eOaaAws2PC4Ten9qL2Rx6bQ95jmCn
	qmGlhnsrRuWm5gcgGe2yGMX5cpfRXM02NQX36Myb/dn85V8Pl6NDTbELJKgpokRb3XJsPOmwYQP
	BDIDs7P57X2rAoZzuh2VYvoh25o7e+tunMp+yamWctMCt++tNLgF9iwkZci+rMOZvbq6yuigXEw
	fDG5Pwh2yn4H685qc1YUUNCGge+T2wfAGnl7piTGAtakHJbLX+rD1ThNDPk2AiWX2Gs2tqhZm5z
	4z80OFNXYxrpMhN5Qe2skqpi2rgnkcXd2493IQ0DOqq3ZdgapzAFdndjlInfK8GCLakOyuI2dvw
	onnN6km5chkjyxH0Jvvqpd1haa2i6xPU=
X-Received: by 2002:a05:6a20:2d26:b0:3c3:a024:1360 with SMTP id adf61e73a8af0-3c92a793ad0mr2620682637.28.1785566704212;
        Fri, 31 Jul 2026 23:45:04 -0700 (PDT)
X-Received: by 2002:a05:6a20:2d26:b0:3c3:a024:1360 with SMTP id adf61e73a8af0-3c92a793ad0mr2620658637.28.1785566703776;
        Fri, 31 Jul 2026 23:45:03 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153ddda5d9sm16863759eec.13.2026.07.31.23.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 23:45:03 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 12:14:48 +0530
Subject: [PATCH v9 1/3] media: iris: cache work mode after computing it in
 iris_set_stage
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-iris_multi_slice-v9-1-bddf1449c280@oss.qualcomm.com>
References: <20260801-iris_multi_slice-v9-0-bddf1449c280@oss.qualcomm.com>
In-Reply-To: <20260801-iris_multi_slice-v9-0-bddf1449c280@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785566693; l=1459;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=Talog+0/N6j8EQ1PakpJ6H88zNB0v5H7GMdas4bX7vU=;
 b=PW1aiaMjR+2fLFDCo2MWppwlTXu0vjtTDyfNmmOBdiCEgYBs4yBBmCX7qmQmEJ4cL7SMbPn4h
 267nikmztr1DRkNWcT9QVcvnann++9YMEVLk8XwA2XrJF2JmWW2tyf+
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDA0NSBTYWx0ZWRfX8Neq++8iGq2I
 /TyG/pi5ve2LGKgAgxxiq0g/FiXrP4ptgOkDX4RhiZOeDoDr8CamugZCiYFjBezkfyYKg8Xrjjl
 RHsYiFZRkl3g0WzZ20jQ6w/Q6TaEuQo=
X-Authority-Analysis: v=2.4 cv=PvGjqQM3 c=1 sm=1 tr=0 ts=6a6d95f0 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=DQE9uWRhMQBL0dtU3VIA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: Eub_RRPb41ISuTYtumDvj6BhXEtxR4RP
X-Proofpoint-ORIG-GUID: Eub_RRPb41ISuTYtumDvj6BhXEtxR4RP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDA0NSBTYWx0ZWRfX2X0YyJ+l99Bw
 VP983/HTTopPo/9O3r+ySweEkT+DqXffWVnZuY9z6D8yVxaR7c4kK+Pwb4D250NXc6cWTRx4GPR
 7n2h8q9eysN/AEGcpdKoTDbQEJFP4uTvv2ziHoHr9GDG02VSBEpodc3XW7Fbqj2W8U5vBR5Utk6
 a6E4R9kFO86gzzcv5GAHPXqSCAf4A+z/mIomKy6GVmbsE/MN2fU8kpCd/PjMaxA5QFo7WYy2hxn
 ZyHaeu4pdLDst0bvLVPI7fIU/3b/rd31ZZdtU732FcGMhgSZcWo0Kiha7NTyOqYIeJGFmcXYQiH
 W6gvlGB8BpCiTCzoKl9+RIVcNS2V0Kp1X7SSOvrAF15BpYG5u65aaoYz3RElVyq3nrGS7NjOtDT
 CSEnO9ISVsHwMhWcYLtOq7JqZ5801wAO3RLw8Uxf9mIxhKvaTIITQftJ/VHeiJ9Vk/oABk59sSG
 u6fLA+UGHlNM7j6A6cg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010045

iris_set_stage() computes work_mode and sends it to firmware but
never updates inst->fw_caps[STAGE].value, leaving the cached STAGE
value stale. iris_vpu_enc_bin_size() and
iris_vpu3x_vpu4x_calculate_frequency() read this cached value, so a
stale default causes them to miscalculate buffer size and clock
frequency for sessions actually running in a different stage than
the cached one.

Update inst->fw_caps[cap_id].value with the computed work_mode
before sending it to firmware, keeping the cache consistent with
what is actually configured.

Fixes: 3a19d7b9e08b ("media: iris: implement set properties to firmware during streamon")
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index cdd02328cb71..14e0bc06e1ad 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -525,6 +525,8 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
 			work_mode = STAGE_1;
 	}
 
+	inst->fw_caps[cap_id].value = work_mode;
+
 	return hfi_ops->session_set_property(inst, hfi_id,
 					     HFI_HOST_FLAGS_NONE,
 					     iris_get_port_info(inst, cap_id),

-- 
2.34.1

