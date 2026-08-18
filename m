Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6984229C6
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 15:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787068477; cv=none; b=Z4NCBt3jm3CBkWeL7Ok6I0MkYqNfhf/IEvhWuHlp9JgEjvw/t0adHadGajOtKBZzZ9V/ym6QQjHrKr0v43ygz4aqUCZRtsCtgFzYTHu1NBsoMjMLTjmh5FumkhNmPfVhiuaD81ak5oMmvROGLmf5maLhGYknEByBJIaiRVP1/TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787068477; c=relaxed/simple;
	bh=BJj+h6cqFz7a8jDJBV4N5fl7HAGSE22AVRcbeP06B/M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WDfmkPGjsR5uK14LS0/5M2npJdUBusi8cgXS8E+1LMUR1vCLInZEcP2ukOwOWE7+DTbxR6S5PjT1Ab8UbOPGKXTMaI41l/yX8ViuLOpKOMru28v9k3HNE/GUI/sJpgafsA3U2ggv4LvtXIsecK/8AZkPAyLiIBtT9YbEBBTQqE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KoHi1EiB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f/us1bWu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KoHi1EiB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f/us1bWu"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IElqqW2157121
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 15:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uNUPIhgDn26t1adXEsWMB0BzKTY4owl+xpM8zcLh8mc=; b=KoHi1EiBC6jfZcYC
	QSvidTv9Wd3jNuzJaoi1aA7Rpu9eHPSlan9JCtpZqvXfHCnviCVlOtWa6ZxPEIOz
	z1ZyPw170scNBZtf9KfpfYr2SuXSoZVM86G+qXJM1nJwNPobCbLef0MxeGU1CmoL
	ffldrTIya82O0f0ovbLFk90Ke00Hm16IRazYv/ToOB1+c1xX/c534yF465QL/NwU
	h+QBMWvDWj6E/EnUKhYJ1a0oCI4BmMgTPJmiJtfoF3uotcQgldnktlOen0KuBZqQ
	iRxtLjXXBpDIt9xt+Vr+6eN1vK4LWlO0IDQpM9ZR/ukThW/WoVtUrSyKHtufmxde
	+QAazA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4sfngbyd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 15:54:35 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e475f83a2so121107a91.1
        for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 08:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787068474; x=1787673274; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uNUPIhgDn26t1adXEsWMB0BzKTY4owl+xpM8zcLh8mc=;
        b=f/us1bWuTr1RLU/nGzb9Lil5JzPu6WEMMG+ODd9rNwB4JY0LorQ5JyndYWTL+1HGnZ
         vFOOlIHqOydxcZJLWrNdT9DpYn6N4ooxnJFcG7xkJnnHR9ZyPAZoUAska5uHlJRt3aU9
         0//Ry/1CUlK9cMTzWMqhyI2R+3j6W5HNeoiQ0FsjbeJeXur1ZgTN9RbgXHOMGqHEiXAJ
         Ptgwma7qQ+TMu+3JExyvta0/5C8AYupgBmg8uQgMWFnF8VpJpbg5NX5mG+C69gatyB0I
         XYbY0nTeU049ElM4mWnkO5Hv+9nABZDX6lT1Gvtf0374YnYgyxZ10RPFnwILFpoCDsbm
         DVXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787068474; x=1787673274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uNUPIhgDn26t1adXEsWMB0BzKTY4owl+xpM8zcLh8mc=;
        b=DjlkCkwP0LhkJCqhGLnRMWfUDGD0N38TsVOzt7V0Ial4+WL4mAy9kuy53/oo9Potjq
         plNpcMaP1RZNnrJz2xCGFnYBysukc1MJQuuqAxFNm0Q9FVArd2vIu4Rh8rc0lKFQs/AC
         MVAkl3cdaM2bwItVuSF0vGwkOkF6oytu2scnK5PjE3KV3G3/jCIVYlOLmM4DX3QMvnqv
         xPdIqqiHAj6F1hV2/B3xu0l88uLWg7KwbW79JB/wbe2ZfMPXVMU9u5azxnAjUWTd+IZ0
         YJAxdESlfs7PjOdD5HLp3S+bOOqLD+tz9VSASYyFL3AwU/8B82ppZ/dU3lUSXJySZjlS
         KWog==
X-Gm-Message-State: AOJu0YyL6YFV71aKKpLiRTo7Jrx238rK7TGNhs9UW6ge+cttWg+LQejw
	yU1RLEzcmWupWuQZyzeI9cwfe42UbWUB6rcLMrigJY9W04ScXZGYmCaWbACCqyHGx+WigTB1fxz
	HRsxneAqq2jjXJFlRo9i4iHCWqSkQlN0RILeY7NpExjo1aLKK7USkZun24/BidcI/Cw==
X-Gm-Gg: AR+sD135XNCW6OaGzd3q9tX2LthEOWShP83YXEKwpdUNQxesgM2XoIq903feLFPkyJR
	tM+vRi72gFdglOQOCO5MPWzRpF5eTbLNXtOXlr5P9SYB1Lbfl6zUE8Jjv/P7sqDo5NqKF9bCUdK
	T4HHK2C/LpWuB3geRmCkXXLXQthR2T2w2+0IKVT3vju4LgZDryl/cCdNlv5FFAG0JZuhKwV0L4Y
	sGliKoA83NcVGFV3kxpfodmVXMwyvZp5/Q0bjgeROHChL6g01RevZE1JQTiTTBvOaZyd1Fxc6W3
	dly9EZv8c6aYkgB1ka3zCQWgfVed1b30BdPIRgrqSKcOuD3+UoDGfQa6PH4+1msgivZ5fkHFN1N
	XZWUbWiteSjlavWMV5C4wA+Jd7aAQngN2hw==
X-Received: by 2002:a17:90b:554d:b0:381:152b:d596 with SMTP id 98e67ed59e1d1-3955a7b15e0mr12443645a91.11.1787068474172;
        Tue, 18 Aug 2026 08:54:34 -0700 (PDT)
X-Received: by 2002:a17:90b:554d:b0:381:152b:d596 with SMTP id 98e67ed59e1d1-3955a7b15e0mr12443583a91.11.1787068473674;
        Tue, 18 Aug 2026 08:54:33 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39531fbb41esm8877721a91.10.2026.08.18.08.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 08:54:33 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 21:24:14 +0530
Subject: [PATCH v2 1/5] media: iris: Add dma sync calls for input and
 output buffers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-iris-fixes-dma-pseq-fint-v2-1-8dc8c4b3880e@oss.qualcomm.com>
References: <20260818-iris-fixes-dma-pseq-fint-v2-0-8dc8c4b3880e@oss.qualcomm.com>
In-Reply-To: <20260818-iris-fixes-dma-pseq-fint-v2-0-8dc8c4b3880e@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787068460; l=1822;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=BJj+h6cqFz7a8jDJBV4N5fl7HAGSE22AVRcbeP06B/M=;
 b=LNSWQJ0jEEwG5D2jDFEvMvuGDkumH4jv3k41dqOwv7gmEqT/9Cft6q6q32zjzDer19dYL4Fgc
 JYH4rzTJ2+fAWZYi9ufsCiytkJsAQPpMpv0FmJrsDhUgc2bmYohs5g0
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDExNyBTYWx0ZWRfX+bC7yNUGyIfC
 Lh7JMgFgZpF9Ee5zHyQCO1PnjAPvnpkNY2GsXNU0nXcvcxU54u9ObI917JQkRVlKME+nyhJ+gjs
 Bm1Sk1XHYNDg2kRmptDCHwXhu6VoAzM=
X-Authority-Analysis: v=2.4 cv=MpliLWae c=1 sm=1 tr=0 ts=6a84803b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=cW1-DYLjWNxHbtL6yV8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: eWggEZtyRjGjTxxKYZs4EMmFAMdiiypN
X-Proofpoint-GUID: eWggEZtyRjGjTxxKYZs4EMmFAMdiiypN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDExNyBTYWx0ZWRfX3k/YNTMr2BV6
 gIYbozTJWNnfndU2bT0BOVy0+38dmqMRQQ0lWho7mN0VTzM/zehx+YSrDrmEcy1mfCq1/7tk8tD
 /7zAbtOy+gV0dDc8COe/a8whxGQsdQlDxOMV0rGUvrws/wBuOQIcUPtWFvfW6sVGHjfkv6HJzC8
 wcOtFPC1XsD8JssvmXrYGSLeNugOu6YHKmth4KIyBIBJq8PMo/nVPlApfH1M4G/9HcbkznRpj7S
 wl2ch9ETEePk+bBb1KoJEMGH3REt4Lnb0UuAiYL/pW0RgJwZXs9R+Yx5Lc5r0yzrkD40i+oAuV9
 sYzcZDsfXo9uVoiuYlmH2EZlrVC3YAMlgI4rxNYefrYaBEy/7ipznw4mV8MMrfdvWYGI/yZPop5
 1gEWvNKGYYVMzWvgx3Bk1ueti55w25iGKTUqlcQjNuoB3QK0DlDe+/3t0uqcC/vGatMcXuOKBoa
 qGj2QveDPoUgYJ0Nziw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 phishscore=0 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180117

While testing with some higher resolution clips, the venus hardware
triggers a fault due to wrong input data being received. Corruption
was also observed in the captured output when the client dumped it
to a file.

On debugging, found that DMA buffers shared between the CPU and the
venus video hardware/controller are not in sync. CPU writes to an input
buffer can remain in CPU cache without being visible to the video
hardware when it reads the same buffer, so the hardware receives input
data that does not match what the CPU wrote. Likewise, on the capture
path, data written by the video hardware to the output buffer may not
be visible to the CPU, so the client reads stale or partial data,
resulting in corruption.

Add dma sync API calls to synchronize the data between the CPU cache
and the venus hardware/controller.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index eb8de60c1177..c7a664426187 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -585,6 +585,13 @@ int iris_queue_buffer(struct iris_inst *inst, struct iris_buffer *buf)
 	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
 	int ret;
 
+	if (buf->type == BUF_INPUT)
+		dma_sync_single_for_device(inst->core->dev, buf->device_addr,
+					   buf->data_size, DMA_TO_DEVICE);
+	else if (buf->type == BUF_OUTPUT)
+		dma_sync_single_for_cpu(inst->core->dev, buf->device_addr,
+					buf->data_size, DMA_FROM_DEVICE);
+
 	ret = hfi_ops->session_queue_buf(inst, buf);
 	if (ret)
 		return ret;

-- 
2.34.1

