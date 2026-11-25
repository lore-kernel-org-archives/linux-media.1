Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595929;
	b=ABkSJrrAKWWfvypyySVBzndmWgNFwY3WDy7M5PWKPVjIzj+b4rf60v/JnQJzyVGoCQQL
	 KwRy8wdjyaW/Q4Hmk34hfo5ydmkqYSgZzBIYFG9QcnAfp2llPKzE4thSJhksXuf4oobmC
	 ypPqXgC519O2K5KAwB7catBXpvpB7gWVqw4EsUz53bSWpQfh1qx9ZhP/55YWWDkFGa7LO
	 zYlqqfWBqxV+BeHCYqnuxMa7cCqFnwrExCSJZHRFJEEX3XAkhVf0YpfMu9rFiHq/X2bp+
	 AezWp6yo8rTgaOCQlXCYTd5xmhrsA8SFlHinR8+EJ547HuIFDdY0eZIXKvF42uElxpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595929;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gls3ERr6Kl3ADITH/EmRG5cdeVSYQKTO1P6yUuCMgCY=;
	b=CS/igvAkk7xCnqiUqI67CmFsSY6EjpbAlNfa27brgsvXVtsUNSZvBsz7De2FBh7TBKRt
	 YAIVFIw3mn0XbdimkLpSVrj9hOfMPQeQDUD+KlXbwYLcQbzR1oZe/SVbHCH2FaV8O0afs
	 HbdIjvLXrph1TYJ4rqrEtB9Uvz4CNRZMw2SmenDkfbRPVGj3yKHAZ73WB6wMg0GvMQI5S
	 3w6/qOxjHwt0ayVtsVn4mli/yygSkSc9t1eEVCR7+dY7qSQiJwM2szPWn9PZ7Bs1wfKwv
	 CFbXxzCMbIil5vXhI6ddqajFFmtWraTcjt/DrfGS2oiLciCK/ueetdNDw2ep+2hkjTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gngjxp3P;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GZKAEUFf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B8B606A685
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:38:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4B8B606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gngjxp3P;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GZKAEUFf
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP69wTx1006408
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:38:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gls3ERr6Kl3ADITH/EmRG5cdeVSYQKTO1P6yUuCMgCY=; b=Gngjxp3PJowqgNgu
	auXqnVG8/uwmMf0U2uo8olYknrgD6XhklCgf1HS6PgYZ5LJ+/n9MGI90saEr+rY0
	fIBmzqI1Kk+ZXNk5yiuao+DcxJtpnozHE2oSfPRr4zHJIUQ7SMYn6tMePzkhlGah
	kUe5ObDItTf1HyWdMgg5G64/YHiekwN4Cz1l/I4v+ZjixaouTF6a8WmLaYJKaq49
	YMA/tJwhNvi2T9TjBFOFPOX2iMRiT+wiOG08MJmWyfVHsEwQc5fSVOX2kzs6LpKr
	Pe5wTmdXVNMxUU2cDzOBYqgy6ZDP1Hsg1Pt2wsLB2FU0gImyBTFAh8fmSfOMyJr/
	QFQprQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5qa298jh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:38:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-944138ed63fso355984285a.3
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 00:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795595927; x=1796200727; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gls3ERr6Kl3ADITH/EmRG5cdeVSYQKTO1P6yUuCMgCY=;
        b=GZKAEUFfjXOwZFZPaETFMGkQ49oQflksnCxiORt1HM3IazPiT84xCRC/z61scIRSzr
         lM9rnSfzAmhcO7QBtayLTGhc8pghwDAfZwvvcC/UCYeJuz+Z5yGiQRWASV7YiovWyZZZ
         c5c8tJJmhxuwX+XzIkL938zasbP/9ZFAEPXJkEN8hLllCSXGGSaVlnyZt/woIGShrvLK
         o5OEXrZfi3TRrmIlTGG6FqyHfi1Nq+xJ9tFS1Yq7C8DDRiUezrEzjsUp590ek6Xa3YyB
         CS6YvAXrG4joBW1gU0sYVw1HlybPV8hs31RjFzxXzWTlGF4S0D1Xw/+JPyEy0JMZws9I
         Nm2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795595927; x=1796200727;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gls3ERr6Kl3ADITH/EmRG5cdeVSYQKTO1P6yUuCMgCY=;
        b=I4ekXZy1RkInRQg4DWK0KHYqfAb2hbogphfBe+wyUbEHBD6IdujlSTKBZb8Z9v5UOK
         eEv1rN9DlGAD3Cr4Rbcxv5GysjnMB6fWtUXKdk3ySSl3p3tfVZ3I9kfmhsHr3DW1x/E1
         +RRHbLCzzH5Ts30EwArvmwplolKVcmCOaotmwE0RXktzIHn5qnB/oupJD3JithmljFPo
         mJjmZjhMjK8TIDEGcyL32AWEWB/hYtwJWp/PpcbOe2u5nq1xmfSY/5WSyLZTRNJ9lY+t
         C+adepw0+wird06MKgGCkOcepAX1LgtPIa0ey2KlTPHy1dLwHtFpnug60Rn2+gOZhP/I
         Q0RQ==
X-Gm-Message-State: APuU4Z9ewfij/kKTBC289ljCvqw+btXgKQb0GVMV+t+CxbcIjWVGtOre
	LT9TpspsmBiHxlzAbWpnMToIYaRgXtNSjYZg47RC6+fKQhX9i+wKTGZV/00fLK1f7+nitY1GMlP
	UVwZ+zQayMnnltQOA/w6sp84fi9J64RoXrP16/6FPS7lc2lkj6IW6vn8MewWzZnVGhJIQRepoYY
	qs
X-Gm-Gg: AZFdTZe5HWYHPUTrQ1701OnDm1iBv4UkQ8k8lECr3uKFiMVzz4TSBQtTQChzLTh1n3p
	t6IK/dzeU3mAM9LeQJ5pxPPmBhGRNXXFdE+ErxY6QNg7RwuJqaRJCq4Y34Qyd+OHq21u/6adclj
	//6pIKD/ljHUYh3Dl8UKlRZ96CPcLepf6DTjQfI3Y0P8kmWaiyq+FcLcn8fX+6Ep3CCSJL9XCzD
	bBrYkR8u+hA3sUsg0wbXusW1RF81YlNI2bqTQcTz/N8mKuhj+yyCrjbUqYVR1mILEX5GKA1aP/a
	KxWMwVlnphOACnDR760XysogHTZj1jE1ka/NvpHiX6aU4DBAp+DuiI8VG8TCXm7LCNjJPFN2upC
	kjQhWXAoewHVW7wgc/C5CaWOTiUs2v1bDdAsMoMJDOMF3rfqsKnLV7ISf5ybvpfXj7hj8TGpOAF
	vlh/U7HlB18FqLeFve0ZbIL4Lvk+i9Cv2a+amYwpBWqTaFTYOQ4R8DGx4jt+0zP5gfYI5pDRQ+8
	2PAL8y8GSfazcCaEdNTK7zla3Tn
X-Received: by 2002:a05:620a:29ce:b0:949:8bd1:15d with SMTP id af79cd13be357-949ba9b3e0bmr3209293085a.26.1795595926698;
        Wed, 25 Nov 2026 00:38:46 -0800 (PST)
X-Received: by 2002:a05:620a:29ce:b0:949:8bd1:15d with SMTP id af79cd13be357-949ba9b3e0bmr3209289985a.26.1795595926240;
        Wed, 25 Nov 2026 00:38:46 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad6403fdbbsm24626021f8f.15.2026.11.25.00.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:38:45 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 09:38:41 +0100
Subject: [PATCH v2 2/2] media: qcom: camss: vfe-340: Skip the register
 update when queuing a buffer
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
Message-Id: <20261125-tfe-fix-irq-v2-2-29dfa0955927@oss.qualcomm.com>
References: <20261125-tfe-fix-irq-v2-0-29dfa0955927@oss.qualcomm.com>
In-Reply-To: <20261125-tfe-fix-irq-v2-0-29dfa0955927@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 2B7FYvz7SY_2Zu1WDhZatmrXfbf6O3d4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfX0wr3kguPtP7J
 tFqjLnEOFL03aejhtr+8L1F+WUriaxPhHJh4sGUcwUC5Mw7RCOpEjszVJQFCB1uEygCjbjf1cqA
 Kvo+ufX2Cfxe1ghH44cuEQ97MHige50=
X-Proofpoint-GUID: 2B7FYvz7SY_2Zu1WDhZatmrXfbf6O3d4
X-Authority-Analysis: v=2.4 cv=CKu/zhrD c=1 sm=1 tr=0 ts=6b069e97 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=6k50daf3fveMbYCwvhsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfX/H7ErzxAGHKW
 Rd3DoxtkrX32hXWIMsGC2++YzYrXN1t4wCSud1dwn2/KhPmdEuNwY1vkLHrxIXQF2GMfdc3PChu
 mOwwFFLCXZ0l6xPJ8bHOT8JlzgEVrHmuix7OF6BY0htYWLro3mP2r85Tax51kP6g328/GfM4WQS
 OJQPijoLqzpgjtZQ8zkUqeIxOzAiMitImiG9YPuznREymc8EGA8vt767cWXI1yepsO40le3mV6c
 RIDz0ZL4WzwmRHoDNeyj5cV6xyYk2nN0zaESwvxMRelhNOcaL9VRVp71nnmvdv3OxvxzqOSjRhF
 ANKl/GpUh7KDC57wRhjRuWtsLCgunTNngd1Vc6Aal/0rZ49rPJaBNR0jlN4aDsSctaD7TSv2yRX
 Lpa6agPXSHQQ9NFMPBnRpAyXMmcEtU2NobtMw7oXG8aK2KjNMMyjTbUYoT6hoZCkKqcZKYqA6zS
 nklu8kv/jc3iyABRI7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250034

The TFE bus image address register is a FIFO, not a shadow register, an
address pushed by vfe_wm_update() is picked up by the hardware on its
own, with no register update needed to latch it.

The register update issued for every queued buffer therefore costs an
extra RUP_DONE interrupt on top of the BUF_DONE one, for no effect.

Implement addr_update() as a no-op so that vfe_buf_addr_latch() stops
falling back to reg_update() for this generation. The register update
done at stream-on is unaffected, and streaming now takes a single
interrupt per frame.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe-340.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-340.c b/drivers/media/platform/qcom/camss/camss-vfe-340.c
index 2526d568686db06a233f0aabe4bc176e4c440ea5..560acec0e0297a4bbe862fc71411b792841a7623 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-340.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-340.c
@@ -365,7 +365,18 @@ static void vfe_reg_update_clear(struct vfe_device *vfe, enum vfe_line_id line_i
 	vfe->reg_update &= ~BIT(__line_to_iface(line_id));
 }
 
+static void vfe_addr_update(struct vfe_device *vfe, enum vfe_line_id line_id)
+{
+	/*
+	 * The TFE bus image address is a FIFO and not a shadow register, so an
+	 * address pushed by vfe_wm_update() is consumed by the hardware on its
+	 * own. Latching it with a register update would only cost an extra
+	 * RUP_DONE interrupt per buffer.
+	 */
+}
+
 const struct vfe_hw_ops vfe_ops_340 = {
+	.addr_update = vfe_addr_update,
 	.global_reset = vfe_global_reset,
 	.hw_version = vfe_hw_version,
 	.isr = vfe_isr,

-- 
2.34.1

