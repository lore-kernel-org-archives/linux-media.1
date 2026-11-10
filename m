Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794319905;
	b=mu1vTRwMV4T9Ix4m2QzWNYbRy5yGvbbc+DIEYuB4zmoEUtzuVltItEJkYG97nOfuS04d
	 zupnD/YxcDukTXeBHeTr0wzVFWhmz/dUXFzONnXo8HWV9PThRdqCjZ+9DI7zy14FABNXL
	 tgmcLUzWRSP23n13noRURs2m641izqMFfH44Y+EAXmtr4WVcOPX2F+w1ON4YfzMKYHH5c
	 42CG+HmZ6pesAHPETKYaWaoQuMwBuBwUrTZm8d1SxfX9ygCHkG5RGu3jB2jWxgC7LfLRd
	 vSGY2vJGKmXSO8FWaTJHG+bLcvuPCN4qYxJxHh6+j7/vuBV/iOOxkk9cepEbm4aMTTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794319905;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=P0gDbpRYwXjrOiNSKkytD4TVz1o4q/cXx/36JYdIpmc=;
	b=NlRBxjKEUxST6pfvUM4sEbljiiwWf6rd3PyjDC1BmOC6TroYHu8WCIlLP8ncfntgbFao
	 +3mpQnj0Ecxx5Z8sQ/dUS6SOf9C8/af1oEsCjbA96IDFrYJ5SYueda/hJcN0Jx5PFK1+Q
	 ZH2iPq8fEfV7QNRu/urWVeh5PUCv9ZaTAlK+JNhiXH2WQyn/3fzK8uoh+/5DqaHk6vuI5
	 B05GzXRooqdtp0hoKC4W52wCpreMCXadOKQafr+zQXZCad7ad1Rpgz51C4SbX2xEr+euy
	 G6UgMrMXfHpp+VWDtRa8RpBgyWk6UPZBnS1z+Rimmd3NtzxgIkjITqFEaOKCiFhE0TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eC580CI+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Qx/Gsh+u";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B668E60A2612
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 14:11:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B668E60A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eC580CI+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qx/Gsh+u
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABA6Yh3217056
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 14:11:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P0gDbpRYwXjrOiNSKkytD4TVz1o4q/cXx/36JYdIpmc=; b=eC580CI+EfReaL+K
	QVb4jwWd8G+tjsJNPYyO/K1YKgPfdaAd+mUba9LUy0qDatR7/JERJ+CpZKHuT6le
	D3S1QRhu6C9rubOoVWoQpySfKI/KPzkJoxzpDBlDDhyYgZ+V9/0XmIvYn1tpKk5h
	YKAZs1HAB3Niyac1D9d4D0Dc3MLifS1ASJq7XzvCb9t6yBDBPb5I29TElU0nWsqI
	JylwUMG0RCoUgxTOCRRKbbvpERLmhT63ixMGF6PDCeJHcxLSD9mhT2ZNOL7ygZ+R
	n+eI3g5RA+rCzxXPtZWxehp+5SCVCxqTdzClXXKIlwGtiK8WknnDrTTelv5egwTa
	XJwLzQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huvtda05m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 14:11:43 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-37628596fc9so379014eec.0
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 06:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794319903; x=1794924703; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P0gDbpRYwXjrOiNSKkytD4TVz1o4q/cXx/36JYdIpmc=;
        b=Qx/Gsh+ubCuML8FH5j79pHbTkGViMqVMeAOUwXU6SfsM/xrKdtXxPvaOSYvXjdN+At
         I2pMx3UecXAs4vMw039Dh1ba4dum/J3Bi5GGiq95TwnmghqXWpEXLNMX0IhICbdrUUya
         wt+qM3CYFR3FycXX2JvM11zCs6vEpe33cRmCH8hnyzrh4hS5TkfzfOgZykKYxqEdwhCR
         X9Py0651M25yJzdFduZn1mVFv2ZiKJBOCKUL08j3wdxt21V0K4Si5o8FHrBU0vXrbPEG
         8vzm7J/Bp5w33XujwRzeGnqy2SFcaSNiDwS5GoXiPzAusOqbDhaC+TpGraRN4Vuk9B4V
         UHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794319903; x=1794924703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P0gDbpRYwXjrOiNSKkytD4TVz1o4q/cXx/36JYdIpmc=;
        b=ztgP1x0x+iZGZhNfEIDwPS+kpdcmkiCyy2ey80O5hMXThqc0O5PFm3037rvW5kfnnL
         Xy4m/2bdNTn+NJld3OyC4qAriSw8B2micZA2gj2u/HviyyJCW4O9ecCWzfczvp/bADTd
         HFttHlujFxED9gbg8c1LtEKIYNRAEUzOzU8MI11snXaK4VNWDVAiYQc+A+jro0G+XNyN
         oskhTnYiR6E4y+eSj0ajeZsAmDsVzCoDTuAdy6S17sNdckL/v7iLOQG6FwX1QoXVkc38
         nFVT0gl4uGIRvpGAXmVlT8JaOxzl2nHA9gxES9m7q6Pspjai7vzKP34GWzsA1l7F1dNu
         0DFw==
X-Gm-Message-State: APuU4Z/h2qTLk1AeOJj+EmQiLDYd9jli/890BpM5zf6oEc8tuOz+b5Dm
	2osbvNQs0aidC71PpedG2RsTjofi79gbX6FDAJNOrIcV2dT833Z5IZJDkYO+wnDVNaIz3BLLUM8
	mYcHovuEky0AxYx18tcDDI/vshXSnG170s+U38aYF2bVeSXo7ZuCgUNK0yC1bh56c6g==
X-Gm-Gg: AYBFou2AaWRnn5ZJprcwjmY+qw7mliPWG70u22yZBJOsuNmL7ScFFqJFxs9B+j+FIAx
	78BZBFDpxc2u0xOCZYQVhbKTSgHJ1+Y25oRjvGuD1ptJAwG+j7/Yq8qFnFklsva2AQNMkpvFmB3
	MqdyVjoJunUAqXk+H4bn7PHFqeRNqPVSLMHrr7dRWZgXNC7zslq24YrcYVJ0ZeH97hzRyaSNOdv
	I2t+6NbdTtvNOmBlihw33zY3nt6GrkZpozUafpPITcMTtPU5S1vFarKtK5L/OyJRMrUTN5mspGq
	ko5v06hyw2vXeMz2ndEI/rnqh7aVY3dZrLMhBmyp5wAy8tU0WusQc/tMx4wzt98uxdKkOsgCQf4
	PoUrgtrb0S0CzVs1CTcL959M5RSFi6hz8emhJ7SFC7tUF7FkSipm59h8tR4l47U5JAb1GjwyrwY
	wkeXaU/w0=
X-Received: by 2002:a05:7301:1a0d:b0:369:fbc1:89c2 with SMTP id 5a478bee46e88-3751e6ad1e0mr3517222eec.8.1794319902043;
        Tue, 10 Nov 2026 06:11:42 -0800 (PST)
X-Received: by 2002:a05:7301:1a0d:b0:369:fbc1:89c2 with SMTP id 5a478bee46e88-3751e6ad1e0mr3517175eec.8.1794319901113;
        Tue, 10 Nov 2026 06:11:41 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375215d8889sm8059128eec.27.2026.11.10.06.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 06:11:40 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 19:39:49 +0530
Subject: [PATCH v2 1/5] media: iris: Fix runtime PM reference imbalance on
 failed resume
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
Message-Id: <20261110-iris-handle-unbind-v2-1-86d5f6f1dea8@oss.qualcomm.com>
References: <20261110-iris-handle-unbind-v2-0-86d5f6f1dea8@oss.qualcomm.com>
In-Reply-To: <20261110-iris-handle-unbind-v2-0-86d5f6f1dea8@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794319890; l=1181;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=uA1DrNWOT1xdT5YBsROagD86Vd8Mo/RENc8c8k3PgK4=;
 b=FyWfMZv+1k1zNofMJ+HLQJe8BENlNDsQx5dvjhx7AKhywMc470zwo5xpeS3NsG7ngqswsEnVF
 PajrSZ6M4LyB/ckJfR0fAbrL4ygIeerwh4Q9w0BOIlywc3c6B/5lBSz
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: OTgPtGxdXGec3HQK4O0rg9MWhg5XSPi6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1NiBTYWx0ZWRfXx8alPTo9UNuv
 wdVPqw/xDScs2SehN+1h0NXihQZj4h+wjfFP+JVdLJphBtwGZ+8MTO4fMhEvh1sHpG8D9q5oecA
 JTUDwBrKltn+uMb/4s/EPefUh0NNR+E=
X-Proofpoint-ORIG-GUID: OTgPtGxdXGec3HQK4O0rg9MWhg5XSPi6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1NiBTYWx0ZWRfX05dp/tdmzaac
 nKwCQ1fyM+Xzb8d6YJmozLLtxGXivslkJuUs3Jx2zIOZ0Ae75eob6zWVvYeQejiz/kF8NbGpNx7
 hkvvdG0AKdXl2puDywCpqRI0jJxgGZIMi7FUHHmeIeu9CFx+KnOJJU/Bv5cThPwD8wUiN8tnwid
 xTDrvFP5K+sL37Zh8bbpBU1oznZEK25jkjf1+dVDWIpxF8nhrJ7oc/I7k/rdYCI0p7Ffng0M60p
 7Y/gwSGOfQGGp59CnRCIc2yTUi/jLTC85i/cHNVoqpwaNDPTQOk1j03bmpsPq0CWYQ+u5IvZMPl
 KiVezAPto7wOh+4WPldgqDMlqWy0D51ZvcsmCyoazg6kY7u3FZBJmv/gzUfzao2KJ45O4+G6Q/0
 hTzfyMH+WIzcrBNrluMalg6W9Z0fTFtgOiiT6L967Zj4NE4OXr+dWShrC7cw6VY/KD62fHr+U7q
 nsSGbr1AQ1cUe2yxtMQ==
X-Authority-Analysis: v=2.4 cv=ArR7T+9P c=1 sm=1 tr=0 ts=6af3261f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ohPow3cFOKvdjjdYMLAA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100056

pm_runtime_resume_and_get() drops its usage count when the resume
fails. iris_hfi_queue_cmd_write() dropped it a second time on that
path, resulting in a runtime PM usage count underflow warning:

  qcom-iris aa00000.video-codec: Runtime PM usage count underflow!

Fixes: bb8a95aa038e ("media: iris: implement power management")
Cc: stable@vger.kernel.org
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_queue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
index bf6db23b53e21..545bbe75e1740 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
@@ -132,7 +132,7 @@ int iris_hfi_queue_cmd_write(struct iris_core *core, void *pkt, u32 pkt_size)
 
 	ret = pm_runtime_resume_and_get(core->dev);
 	if (ret < 0)
-		goto exit;
+		return ret;
 
 	mutex_lock(&core->lock);
 	ret = iris_hfi_queue_cmd_write_locked(core, pkt, pkt_size);

-- 
2.34.1

