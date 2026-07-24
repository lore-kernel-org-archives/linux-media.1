Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6CE3F3283
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 09:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784884171; cv=none; b=emLTB3SJyRkbyOjtXyUNZoNqNniYhW3eaI0alTvXS17go4fN40yt0UtbnrayEvQk0Nbrs/iQZQV077PH4yKH2huFeW+k+d1WBl58h81EhWpe8qG7xNjut09uI1EKk72dVnWbi4+HBE3XmEaSqcXVUaT68d5Z4prkDVgg4GBwNJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784884171; c=relaxed/simple;
	bh=mjrVDz4H6RpOYzrPpqqkMT5INmyzNFeOGabjHCl0QJs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XH8YptWz+YV4rgRoR5RHP3zyCGHE4hR74oicIfKPeU3MvWlD8NCEl+IgmKWj9xQv53Huc4um72QXwAifiymuxgvygCdD/cxgi6U5iQOdEPqxcccrn1tQmHrkePOn6+A2DRiHq0Nbc8s2ma27cOMBFvn+LQPHMj9fUvwrgG1//vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B0IoIC6l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BBEZYlIn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B0IoIC6l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BBEZYlIn"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4smdq1897518
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 09:09:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C4fjwuViaOd7s23k+7ReVdvQjEcM0iippnZxvUolPq4=; b=B0IoIC6lgEhlhw60
	Xnw+SEktqDWDKXlxpBR8PwZ5mhrK1S6/VuS9CDOll1S67Gu4DbvkzAi/o2NFGbvf
	/ED63SaaRzsFbfa+osJ+S8VfbDvOfBJpVySihohr1tvyBnqMpfU3U1Lt+h5Yusnm
	Fo3azfJ0TP0VFIMPwGpyjtmmvswSXWkjz4xErEPt86Il585e3mR0AHuPWDJSYrjP
	LDFh8mSKercQuBE5ODhNvAlFeZKw8uHE2V9PFklJHUEXJH88+uS4in28o9yjyFk5
	IkNqtMRzf+DrEPxMXFd5m2cCcjevnPslN00kfTbwbLuyQ7GFtZCSyFpcKjOEIWpr
	WlJvHw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm1em8v7p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 09:09:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c7f385887bso5553235ad.0
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 02:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784884168; x=1785488968; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C4fjwuViaOd7s23k+7ReVdvQjEcM0iippnZxvUolPq4=;
        b=BBEZYlIngEzspFiZdEXLpF+YxtN+YsLjWclKWlGk3KEezQf04icVL/DPgBiYMUZeLB
         WQWbzfrm/VWMcFLiVB9VArYLUVW9fLUsDQYepaQXN4+G8UfPktMA3w8z8G88rhIrg3ev
         gzdYhUzGgqJoNg5EiCGCeQDNYmhoY3+I5t8rTGDU7n/VQsw/JWqNM04X44Zx89PPauNp
         +XekOZQBt98N8DET+ybW3/l8T+4jTD79fx21nBLGxLY5fwj5S6zrPv1QRVX6e+DZQOVv
         TIchdhKd5blNUleb2W6CQqBJaYDuM3DcQnKBmZ8sBLlZWHiyU7wR2BZ3i7dhZ3HIqFbu
         n5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784884168; x=1785488968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C4fjwuViaOd7s23k+7ReVdvQjEcM0iippnZxvUolPq4=;
        b=HNRcfC2WyNVa089RzSqi13QGqeOi86hJJxIwk7mUPfcvCSiZ7XUjeduLRSbpGMVIGW
         hwqz05QyW7n/fvK23oLXbmvn/hTLStMQeCssJ65QL0cqcQ1A4LvQJl3NU122wVsZaCRX
         vEkrlDTgIlpmdl4VZVB+5ajgvxXuH3TK+vumPUUSKTcjegJ6KkwAyKTtAJVwV+AW15ms
         m1aYaxw/QdBAv5IOrmLXIrs+cKetZ9mmYDEkarPbBOak8LjhmUt4ZgngBOx12BHOLYFj
         Xb1yCpvTag3DsDbaw6IYu4JZY9gYGxpGqmrr7ShzQwW2iyn/SyNUw0w96aQjEkqaPTMs
         fzFA==
X-Gm-Message-State: AOJu0YxhZ4VU3HLAiTuK1rfqemTUbh4OxKaAlHsGjfYjXjz6w2OWxq/s
	UPC7tL4Msx7dteSfcFKbKh9Rw1KnQEMjCOBZ77TAa/Z7rmS63OuXtV9A8vGsFyt0Vzftj/fTCQw
	vlYfxmDJCFlSCSyCSA1EoJ3zMxOuNPo2r/06HRwRDVfp3f7j8ocJ6pG7UbXDWf/ddUQ==
X-Gm-Gg: AR+sD11aiQafUAJxoumqnim5qqym8q70jw9diHf4AF5sEnuIXnq2f62IHOyuC8vEtgX
	L6CORL64J9FOlAXVQc/rksiGXBqQB2NDDgk70rEZLL9H9eiJeNpZ8nv4ggY0XQOb4YeBPywQhto
	bC8ejHMh021zz+0WvezpfVK4A1s7ppJXs55A5qZNKn55djzyjixIIbLiGLo3+/7s7RKLJyl+E6q
	UhuOziD/ff38T1TrGK0LtjaHjQMWC4a/HwHDJbSXLss7egfTN+j8ijMxbxVUmrq7S6n225BG2W3
	6atGAD0l0bI5kI0wIEEOiOCVpLqYP7l5agxUQ9Ihy9exG2yyy211SHzo7iFn7r7kIKpmUs+a9+U
	erdchx980+E3+QKyLUyI+HJmpLgNpk5E=
X-Received: by 2002:a17:902:ecc4:b0:2cc:9473:97c8 with SMTP id d9443c01a7336-2cfa6b7dbbemr74746655ad.15.1784884168138;
        Fri, 24 Jul 2026 02:09:28 -0700 (PDT)
X-Received: by 2002:a17:902:ecc4:b0:2cc:9473:97c8 with SMTP id d9443c01a7336-2cfa6b7dbbemr74746225ad.15.1784884167706;
        Fri, 24 Jul 2026 02:09:27 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1a6adsm27170719eec.6.2026.07.24.02.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:09:27 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 14:38:57 +0530
Subject: [PATCH v5 1/3] media: iris: cache work mode after computing it in
 iris_set_stage
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-iris_multi_slice-v5-1-4fb593d29b44@oss.qualcomm.com>
References: <20260724-iris_multi_slice-v5-0-4fb593d29b44@oss.qualcomm.com>
In-Reply-To: <20260724-iris_multi_slice-v5-0-4fb593d29b44@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784884158; l=1459;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=mjrVDz4H6RpOYzrPpqqkMT5INmyzNFeOGabjHCl0QJs=;
 b=paK2wn9a4zqJTDaD8uutynnzBibpF639fws5USR7tyf4j3CuICrhETPTaAIUgaAzLue2jH2iT
 3EbOlJocLp4Ckrj37ucYxxCAL/xHdRyCT0jD87qmlo6i1bzt5Hs1iBM
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA4MyBTYWx0ZWRfX4bZ20ytQ/+1p
 PD/Fb8SAeGJ6dX5FQyiUY328yChHTAkG/taXmrsOZC+ELVWDiyOOI301xaxqGry02qlg5W6xsNK
 jrbroloP6mYSWEx9dCe4q7uEdkOa7KA=
X-Authority-Analysis: v=2.4 cv=BIODalQG c=1 sm=1 tr=0 ts=6a632bc8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=DQE9uWRhMQBL0dtU3VIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: wf6drUQbpBUDZXmVVtx5OvQ1gkCsGfQA
X-Proofpoint-GUID: wf6drUQbpBUDZXmVVtx5OvQ1gkCsGfQA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA4MyBTYWx0ZWRfXz2N7+NGZ+SCO
 qGSB3OmyrPr2crgQHCif02wivUwQ4FKBjAzttGlXPA+lKbrbIDkhxVsCqZHas2VGX0/ykNFdyoW
 ES3q+XDOiGj8KLeCFo867OPPQapgrrjVK1UlXWudsVFRrfa3N+qWcmMSGmb9quOLFOrupKz7TTH
 49J7TyJZ7FdJ9e+qPbZh96faAEetZpSeB5D7FRnagbfAgcAFHNvMHkHbLsXOmiOKJdPR+5vB6gB
 mcjmCoDIjuPw6kka0ikgGIBQ9+gHhE88QyjKfwWejc8R4kyQRFZ20CCyLtUY6Sb4Nn1deWdw1xU
 deyO+3Ux4gtHhT/AWZ3jHTBLQOI/h4EMssLMSsP6UgLGclfWCam8yMZciclt9ONrAXddC9Sen7l
 azRrB/oE8XvVjnIsdNZotT/jqaMU61qJLbS0xtBdTZDEFsfJgbiiKutFXAQb25m2UniMrYb5gLQ
 Dq7b6vemUmMDrjrxVhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240083

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

