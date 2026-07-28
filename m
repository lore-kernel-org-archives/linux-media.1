Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831D72E091B
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 06:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785218585; cv=none; b=GYCrMGtZ5aw1aLRgu8RKhldw7sS/iREFYy3AV9BGRMWfavfdCBBMIPx+4SJrKrQpEFCgq+ukPYDvBO1NbINXb6R8ZX5ThDO4c/MdHRHf/CFpDNNvrmxrHBybt46e9Y5VxJxcyLlFowcquqTkvzRFynfG1fHLn90BCCke58UXVmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785218585; c=relaxed/simple;
	bh=McZCOZqoIl5ZH/Ob0riQHizmLROEdt6xe7Nj9U8O5D4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C4cHirBg7O0Pb3gVf52MiwBW+emEenwqaDHsKWxTEiX+B2UEtklx6UhrDgUPnfeQH8lVvs5XCXQL4BMOT5IwjnFCuRQ44utmig8nxfekuvNkrFwHLIuiwntG7gZjT+mCwAeDXxjkZT9HAK+wAjSJRX03afMmv1gVirwho8fMH4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RAU5k3jV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ninmor6F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RAU5k3jV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ninmor6F"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S40gjx1593624
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 06:03:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cP/Bdnl4uFSzfM4GV8j2lxERS9uQ+hX1N4GLtjz248g=; b=RAU5k3jVCRKCBX55
	M6MIALD4MO+sRSFOxsw+DokyBQTTNhBowC6NvdI0otmQIumaF2PIbK1QFu5dyk0z
	2ns2GCzRmeMC9bw5HoMgWcPMAl0f6oY2F55EwAm4vr6YzAd7o5JlnA4PfFQezrTb
	3TVI6GUtYzcQA4SS77LavRakjpg0z1Rr/PB9bb0NrZd6V1cN/oDumfT/935ivaGf
	G5MLTIvBju5r3/aNGr5VlehCJgt+mLVy9gmoU++caipG8iJqimR2MvfoX5erIh8q
	mb9pY3IdTZWvQ6C18vVTL71hoasmAVGo+bD0NZNWN9gnyZtxpFZ0Cuk214R9A14G
	aERXOg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpn19gcnp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 06:03:03 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84e04598adeso2957249b3a.2
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 23:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785218582; x=1785823382; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cP/Bdnl4uFSzfM4GV8j2lxERS9uQ+hX1N4GLtjz248g=;
        b=Ninmor6FakBXvLGfv+URGMSKS70jRem4Vrl5zeTx3h5qFkgNgqV2fVDdap4CTd1+a2
         Hwm3bQfDSGTigHAJFzltMQTQecf0mff4K+E3/jq5S5jqUnpbZXEWkCz+AFOSGcpE3qez
         CN+0RIEFdR7qAHdKxZ8qU0ikhPWOHdChEMYyB1Xol+7K+A6/VXeNC5WcDeE2nKsSUimU
         3ldk+FndvDEgd0C7lgopXBxQD1FWSYHpNQPzS01JALl4aIXLs1++xXBPMEl0T2IOnC8X
         IC/ciWWFgbhlFruMIS0bavg8bSbdzRM0BOrANC7aHwhvW15R7cvB+ESZSaqhgDY+SnqS
         VLKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785218582; x=1785823382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cP/Bdnl4uFSzfM4GV8j2lxERS9uQ+hX1N4GLtjz248g=;
        b=pHWH8cEa156PF74SN/GO2vktqNDjmXd0usoJ8ZctPdxfHcF0MQapjHHt571EWuHP23
         HEkVVR8sxyLn3z27VuZgCeWsjnYY3jh4HPg6QmPUF3FXA8ifEN1bgSTfy2AeBBH20T8e
         +tLY9N2/P7LVekMVwO6k7XkkAY9xGN+9DtPLfPO+baZ8XzIbzTMXsXr8SP/sBPoQ0vLZ
         JX9eY4nhIEmiVbu2ssge0WrbLl0v991Pil6nWszQVaXKsF16O2WGXcBGX08226tDc5Lm
         +vXwvEiIrCwT/YU7ggb8kGtRTAnOrulOMygSelwe6wQ4xE8xKYS23kOvjDqjZ1qBWOWB
         tDNQ==
X-Gm-Message-State: AOJu0YwUL5sb671rJsZLVW5OxJL9s9xk2+SQeKJq2loKajnDKhwmYQs1
	jB8t0Eu3yWr0iERbpbwWW8ZjcfjqoVBmOGiYgs2b39EP/rUDTBY5y5tYUVYpRrOWHMumDir6Ku/
	pw8Y4gbdu/ISliunjzaooe6aWFmMG1F5Uo/SW6eMlVruNtgS65jZVsclId0pW3Cfmow==
X-Gm-Gg: AR+sD106ubszQZNTDNy6Esc3UyT8UFLYue2sh3pKT2ygq0LyMU9v/2o6nD4LIcXc2Qy
	kDszXph8S2/CD1xiVzVNtvrbPkZULTPmpZ1fafQv0yh0+IrNXDmbundwG6D+UDnmb3Kq0KxXp2J
	IYdDUr+7qZBnT2Yr7YROnZXXIYrQV67bQ1NVi2mHhwRHJTA1J6oNwGTWoeF7H760yMwp17vpX6q
	KZKz/fMuJZRx4XvATJpp6B54sLmHibRoq3eNDE9KA2Mf4PUSXDzYu7HrFOcxUdtEuMZKS5Mlaws
	ODpj0F23rG0Cb7np7X43Qdb+A+XiBwcCbwqI3s+RVZfKi7hxm8TMInbu7CRa04Hsx0rNw6u0En0
	hhN2ounP5Wom9ouixGNsG+nOm/3Rb/go=
X-Received: by 2002:a05:6a00:e13:b0:84e:456d:aa5b with SMTP id d2e1a72fcca58-84e933095a2mr964365b3a.72.1785218582191;
        Mon, 27 Jul 2026 23:03:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:e13:b0:84e:456d:aa5b with SMTP id d2e1a72fcca58-84e933095a2mr964336b3a.72.1785218581778;
        Mon, 27 Jul 2026 23:03:01 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533ce57asm3980421b3a.28.2026.07.27.23.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 23:03:01 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 11:32:44 +0530
Subject: [PATCH v8 1/3] media: iris: cache work mode after computing it in
 iris_set_stage
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-iris_multi_slice-v8-1-eb18f96f0ed8@oss.qualcomm.com>
References: <20260728-iris_multi_slice-v8-0-eb18f96f0ed8@oss.qualcomm.com>
In-Reply-To: <20260728-iris_multi_slice-v8-0-eb18f96f0ed8@oss.qualcomm.com>
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
        20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785218571; l=1459;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=McZCOZqoIl5ZH/Ob0riQHizmLROEdt6xe7Nj9U8O5D4=;
 b=SGyWGHVd1dTFzivHD1bFB+vCcKijiCXbuXP1rPg2iJa3gwUO0QCkr1bpG30zbGQ7XsywBT57A
 S9XSSOG3dDkBDN/Di48GwCD8NuDw5vv18hO3Vbq+b96zQ/vvdgCvWlo
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Authority-Analysis: v=2.4 cv=TJV1jVla c=1 sm=1 tr=0 ts=6a684617 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=DQE9uWRhMQBL0dtU3VIA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA1MyBTYWx0ZWRfXzguhIPofWPDG
 6RJGGmrdw61+1aSd/F3HS/ZC3avFPKhPiQ5BQSen1q4Oqqfsca7BS89xmsgg/YYyZL5+oTjaLsT
 X0A5yJdZA8cTqTJNZ6qghcY7Sj29n1jiQpGgToFshcllVp9fAluUlo1+Z5r8Dtxzduk3GL4hvtE
 6EPRWdMwQdLXcWKf6w6+Ul3htXeIR3vrV+TZ4nTER/qp8zrVMZup96fncAqnm62Hw9sRlXubQEg
 QLvHVXRg5vRqDQ/2dNcyHxdvvUJK5gTwOBZ5D+/FMSx/Rag1pKj4mWc0UnUWOsvQtG2JAj4Kkib
 oC9/nMFtSm+f3vnkM9uEduZJfTpFEshtVyS2d9LXPoprfgoJ6GVoXhVPJqM+wVwO6gYiWlMK4du
 aGi8E3K1+nhWU7dcJDBmq4Vy6q//CfLFPwUwrB3wYb4sN8TLye4V0Pz+nsp4EZVv9TRGVFu6vUw
 FLiXp2pRF6ZsD3T0MWA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA1MyBTYWx0ZWRfXxq13o1VXMH9I
 NnDlKTHcOQka/fvQMpX6jNSx1XhVRzGtzHvL3J14ZSonqF1qySQuB74Fwc6O40cB3VkOtwWzv/5
 tdFHZ1rJq3+x6ktETO/5WgYSosdwYDI=
X-Proofpoint-GUID: TDB8uzY08hkYEX29fOPD6tUysR63IJ82
X-Proofpoint-ORIG-GUID: TDB8uzY08hkYEX29fOPD6tUysR63IJ82
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280053

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
index 33a34573391a..80cb43b8bcf4 100644
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

