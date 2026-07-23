Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC8643BDD1
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 10:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784802094; cv=none; b=dm6o7Iq1n+Eh6+CcLAvgJmF6DUg9mmCol9gQi+fCTTuv1yH7wK2F2EWzxY+kmoEw5SiDEkePFx41YdQxLCOlgdEs2sQ7Ml/ARdcf65rWPbP/vhv9CXOJ0zubcp75mVx7Mr7KNoQ8HS1HCF1WJkDdkPKXmJKLdRdGxpkjHI/kgH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784802094; c=relaxed/simple;
	bh=UmdblSpZaurXsYbimbPkFcYNgBfTLQ8n8EEy99+CMIw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UPanevQribXZhYgVlpxSbIDJBPV7QOSutvi8lEBX+F3NJ3fFpRqjjQwN4LuVpdqd3lo2XPoqOyQtN1lPc3jOiMvpzK87BnAGY+afvHiVs1vDFNMXuGt54AFlFKTjeGysAUjYP7PAss1Ka9AbYkLbo0/aI7VN0la23e7wapFdgfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H9lk/fwE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G6I73DRn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H9lk/fwE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G6I73DRn"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8r9ig3790880
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 10:21:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	judSlP75ZLbiXWBghDPK2goZdlDsavKdoWDvXwUlnWs=; b=H9lk/fwEWjBgknIh
	EJNkqhTME/rYJpf+KCFf6SwuQZNQznWQZD9L/Gm+zxZswtfx7kiYI2e4O2Af2mxU
	scEQqSuupLnTphcMwambNKdhCVZ3jKS1k1dOaBjhm1c8qRf/nKUxe4OPaI/8p+4l
	2ISxmNYeiWw5jHrtDXCbxttEybaUh9uDBtVzslniyd6amkLd/zpaPPJVFBz98Vvq
	6iJUeIgggQU3816xxQryaKP1U60dnlY7vKqpsgfi8iFADae7YiQ+RqWMdlG+H47a
	mj/3nkRqFfi/6d9WXXDe+IDnJXrl1aHXpam5ZgLB1KtiTcfs788xXdAdbt0BdD0w
	adM/SA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk7b52ac8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 10:21:31 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84e058ff6cfso1069668b3a.3
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 03:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784802091; x=1785406891; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=judSlP75ZLbiXWBghDPK2goZdlDsavKdoWDvXwUlnWs=;
        b=G6I73DRn9G/qk/FvV1QoDctNXqZ89IjGY/B72Ge+a283Rr1aGzTyvedSUuu4qlJ0Zk
         cDqq2yDNrJFB9EM5d/ZgGGGWUVHuFvOjUWBXzIPz/nIG6oVmNn21iT7nlkq+u0A6ikE4
         rSfSj96rqUEXB0qCiGC0tRwCUvOcBIb+J/ywoctKcy8lBOo+W0HhyEyGNMCEsER77JeB
         TWtNvXjYQpny83/uIzfJyNIbW5K/0AJ584q+bW5ua3VYClJubmGaDUtGeNPdrkeZcaA4
         /Rr2nZh5Kw0txFmsxPHZpMrIw4dWshzQ2wdPGCHFBGOPenE12MvPVb5+qHGz+wDrQoSh
         12PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784802091; x=1785406891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=judSlP75ZLbiXWBghDPK2goZdlDsavKdoWDvXwUlnWs=;
        b=sR9+Kst6588NPecqwZ4JJwC3D0RkUBFMXpru/QPfDXqxe0xEO5ivpdFt+S8Em15j2A
         dB+8hw7UaSFsdcIbk6Yz0Vlh4RJEYS20z44+jDLsXY0SKGLAXJHJUiNlgUANxY/kqCi9
         U5MHXmdyS0ZK8Y72ObmSHaCHUPRX97Xqf12wZpi14EuOn6rCQDSGGcei2LGprPtK77Nf
         qryCZG2BEgg6j7avpXYWmOuflWD7l+N6a2aU9a1LD4DVzMHilwLq/TCjF1LQIaYbm2t9
         +LUx0PGtMZna+PsmVS6XR0hKK8KVXHfOWjl7XWR110zP0e27NiyNzSegTeLS40bL9+eN
         0rWQ==
X-Gm-Message-State: AOJu0YwbK9DwAWzGg64dVHTvDzNFslEMgadSXnf+zyAlHEVFIjzncc3M
	GFYsJzNig01GH3Bfc3+8cFDIhxPDlBk2zrsvV0c3Q+ZS9wdVKLIHFMCPwSNs0Ttvszkv8GpxOkv
	Csg8PDdEByzCqFwTRkFXcKhP+RWoGaHEPMPJfV4tvDeC1Kcm3LjcATvMbDT2Bo/LMWw==
X-Gm-Gg: AR+sD12dY989K/dT9xqxkSHedRTBm0hGgIh+ksxBfLP4hbKgJRJvgqHGW5niv5J/Bjy
	/MLzluYksaFUotjvHko1hAcYs6sWH6nkB1aRgBpA68RZ/1TTBIoKxoQi0rK38TzSm96PJMSWCHB
	NTOK50SOtQTRiY87VU8KkKlmZ5Kq+ujXN8o7zZleOvYxznq6tnGnWVj/6VrE0o+8UIf32DjXYGF
	ACTtZJjQJ0GIc+G8sMmpA/s8+fbb8rKxCf01Ls/sp0Ta2OV4lDV+7M6Pit8hIpPYa+G8+CSO1EL
	bY70CFporfHny5CR9vPUIdm4wdTaaw/TXu2Cb7ixDeVPMq6/KRIs4XE4wQ4LCINd8r8vU1tnSMJ
	tXx+nnenPry89EbM69BLvdAwvEF0bOjk=
X-Received: by 2002:a05:6a00:12ce:b0:848:50a5:a70b with SMTP id d2e1a72fcca58-84e2bc6be0cmr2803091b3a.21.1784802091194;
        Thu, 23 Jul 2026 03:21:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:12ce:b0:848:50a5:a70b with SMTP id d2e1a72fcca58-84e2bc6be0cmr2803055b3a.21.1784802090737;
        Thu, 23 Jul 2026 03:21:30 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17285662sm2781395b3a.20.2026.07.23.03.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:21:30 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 15:51:13 +0530
Subject: [PATCH v4 1/3] media: iris: cache work mode after computing it in
 iris_set_stage
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-iris_multi_slice-v4-1-45f0a3fe7fce@oss.qualcomm.com>
References: <20260723-iris_multi_slice-v4-0-45f0a3fe7fce@oss.qualcomm.com>
In-Reply-To: <20260723-iris_multi_slice-v4-0-45f0a3fe7fce@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784802081; l=1396;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=UmdblSpZaurXsYbimbPkFcYNgBfTLQ8n8EEy99+CMIw=;
 b=F9+ooebJvkuELuNzkFk5+MqGqOBn0gZUxVZadAybiu7GQIiXbJrAs+tEZixzAHfyFkQwrJYvX
 MBRQ4oGkgDjATrWrKdXSjZWX46XO7dyuEkDLZ4p6ERTmV9ur6fvSQWT
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwMSBTYWx0ZWRfXxoZ+Oab0ffWK
 3tgL2CtT6mHb1SjoQKCqhHxQQdbDgWk3irT8hCvyXfbZcNDc/NAM6DYHRzf9DLPeRp79OUpTADi
 4qWZf0cXligET/Bci3PnjJ8cH5/K0XYrcWoKEo0Eyyz6T4cDEJlwZERVHypTOfxrK2dRx1zKCNe
 Si3Dbm5nTfNVaeDaeAh0Ogr7BF5c//C/89ljaTRxD54LuHjwh7wnEEC1M155hImoag5T8qAMgYb
 xrVgaF4eUKDbf/S1ixoyE2VseFcIxBkB0PbIXpQimiZdScLDaRmTyHqpA/4tuUm26lU8NhBFsqX
 zStqyu/v1LzFWzkbgKpuDv/H4zmfcyzas9UlwUe4OSCFA7dx6952O9ATduTecadz5EGjKEd5oeQ
 2mTC9YSka+RtGEmeR3xEJUrsNNJNoZoQakRNlxZl31lKRZ+Ixg8SYfJhHWLl6MYtI1TCxpd2qpd
 /pU1XdlWzdgJ12lXwYg==
X-Proofpoint-GUID: SCzDw08Uqj65ES8b02K2BP1tT8kwduXg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwMSBTYWx0ZWRfXzDha0HxD2Zvl
 QZbzF4gh+PeN/GBz+bHhpmTLCNFxvOqbaMiF5qf0TJP7J3EoSUMtdCXb/8ye2zA2QozglkKxzcE
 bZSgH46czvta7eI39n3dQnOpR/xT1Y8=
X-Authority-Analysis: v=2.4 cv=btx8wkai c=1 sm=1 tr=0 ts=6a61eb2b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=DQE9uWRhMQBL0dtU3VIA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: SCzDw08Uqj65ES8b02K2BP1tT8kwduXg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230101

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
Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 10e33b8a73f6..58d195d2ab87 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -521,6 +521,8 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
 			work_mode = STAGE_1;
 	}
 
+	inst->fw_caps[cap_id].value = work_mode;
+
 	return hfi_ops->session_set_property(inst, hfi_id,
 					     HFI_HOST_FLAGS_NONE,
 					     iris_get_port_info(inst, cap_id),

-- 
2.34.1

