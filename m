Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3960F351C35
	for <linux-media@vger.kernel.org>; Sat,  1 Aug 2026 07:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785569907; cv=none; b=TCElJAgUHIxwiXUAf2pnecgnn38E7+uEbat+Ektou7Sf67/PFtbTXi98BwKMjBokibJQl3kY7/6CJZ5kebGDCOQwx/yTk7pBhbJZktKI0JRbG0TIBXHBQRV1zls3xr4NB41TR58HPsBl8wiy1UBlllC28dWwGkAS8ZqI+fSqmcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785569907; c=relaxed/simple;
	bh=qBcqygLGzctnWl0Ad9kRqj0ar7uVk/8H2PNp87JucGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=isQix4hkNwzsRBqeTHU7d97SdjvOYLXF+R5NJro397eJHDmE8btFNroIxyVhbgDIpJWRDDd3vtUJU8AGns54xVW/Y8OnlnqwcWw/IcfmiYxAnwmAqiH/mKCF4ohli0T3+IUgK9EPckYMsTxUiHmnrf+tre4c3bHhw3GGzIL3zK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q86wiqAh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M/CapaV0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q86wiqAh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M/CapaV0"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6714mBK01776376
	for <linux-media@vger.kernel.org>; Sat, 1 Aug 2026 07:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6Mp+nfA3N+p1lXQzMxJCbO+jynV1YH3G+4IyAbOESn8=; b=Q86wiqAhA9bJ5lgC
	OfOArRrU92p2EdlV32XF/6o4sL/Cm8scNPeDkz+TrWBt1xdMeH/BlcAqlewFfGEE
	GUaf0iU3u9CMYNjJ49VdbncUSEko2pbwkWoA/ScsURPZoxRwpZ2qM+0D+/z9w8/j
	Z+0IpchwAEgyeHgDe65xVt4XwaEJMf40WGX6mE9Vsd2Vnh9W6LW0FK1RNPOgauuU
	1pOigAOtyE2vwc3YmDk+wgsdwjjz1iACDl+SZcJd6CVBcmtUnyikH4mfWK4UXo27
	r4c8QRn6MwJMxlMA6zz1ZyOqee8Gq52zN0W+EUH+1/cBv/VQWjlVtzVVm5PmsmZY
	GBnIfQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fsa3809pa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 01 Aug 2026 07:38:25 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e11baa66eso1635842a91.2
        for <linux-media@vger.kernel.org>; Sat, 01 Aug 2026 00:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785569905; x=1786174705; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Mp+nfA3N+p1lXQzMxJCbO+jynV1YH3G+4IyAbOESn8=;
        b=M/CapaV0FGtDxQItITP7nONrdCaJLfwF3HHFLuNYxMMgPGl3Sp5M9F7KmKq8o/ci5B
         SOM/9Op6DxtbfdvNkG2O7jcEp6ipzzfrX5hWHrDE9qny/2ASl8wJ8mqRoYjUBBFyTVeJ
         MS48BmIuZT18BXxVCU2/9y47vEfTg3RQTZnp0iwYS91qIhPOTIvEzHW/cx59o83FI+mM
         bSwRq4k/vXbECbnqDzxBui91mamdMOEx/5qf0FQyfiiziWT9jT+tIOD2xzUb/ppUnu6v
         /79twFNxtLm/pGw4l5WgSM3QzvZj1mf8EyfEditEk0WI2lfbND1XU+vEtBKmI9z7IIeA
         zkbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785569905; x=1786174705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Mp+nfA3N+p1lXQzMxJCbO+jynV1YH3G+4IyAbOESn8=;
        b=isryyT0Dpr02MkSTkeWWbLL503OS4nfDYy43ZQW3OWiRBTX7FZsvQQp7zbXHf4w8Rs
         R5kghn4vG3rtdWzGhupBzZtFVN+sEBerOfOwsYSBOvTLVuzWOL+FGr30Hr+deQd3HUE+
         EHZySMTYIdVf3iW70BEDpLzZfVpi7N77y7yGc3ks/64NsF13gy9EBQC0qRwraAoI9FkA
         L9L8Pd0B1pqdgc1Z9Svmvuq2qM87BH2r+YRx/U/rDl0X4bmVEJKurGBKNnYtLGHKsCWR
         f9KDQLYCmGBus6QDLxkTYrjUSR8W1+pBQBn7NareJTescjXzjQPZBQFEm1dQI6UO2l3V
         Z1BA==
X-Gm-Message-State: AOJu0YwthOa6wbx3pY+accjuhKTUUQ37cL8/BdktRP2LuOU3IOUFnyhz
	BgfKEQKmkHi9m1exUfvSMD9RbW+b0KknfJ84R22s48sbamgwOfNUkBTIhmqi3CqLSwVX6Rusgec
	Lbp3TBbkNlGIkMrIGOPBU3ijWQRfcutwMOwpK7teX0/K33cxX1mDx5ZDKnL1n1uH2jQ==
X-Gm-Gg: AR+sD11X18upLEAYCpvnPp3whkif3E4+k3V6Udg+qve3SUpFCPGqX6tl30Zk5B2VKWt
	vONKUEUP1JnNYvnsBGIzdHGIF0hDjBVjfyO2XEMPPckq4XEqfplmn06lRGxmtw1VWFRgN4/olzl
	BCyYo+nmkAezbfNhUpMdWW9FnCSHuq9eDH1XMc82JwIWpy6UwQdbgkTMW+ULbwKqIk5OA7WLbQ9
	s/M0UCmpHkV19JJ/TtGcDd70v61/2brANKzII/nSJOgXt2P4E9d2MH0kamPycH7qlr4QFGc5u6u
	XoN3TRSkmSz4LFRiyhRvd8QVkTQGw/6/26wRWKi/AJYHi0kTdC/j06jZC0agc26+6RGfLCV5Sza
	G1heOpqnsmOtm+FrFGu4hc7cn5BwDfO4DCQ==
X-Received: by 2002:a17:90b:4b12:b0:38f:57f3:4dc7 with SMTP id 98e67ed59e1d1-38fbc4c66c4mr2472935a91.26.1785569904670;
        Sat, 01 Aug 2026 00:38:24 -0700 (PDT)
X-Received: by 2002:a17:90b:4b12:b0:38f:57f3:4dc7 with SMTP id 98e67ed59e1d1-38fbc4c66c4mr2472903a91.26.1785569904117;
        Sat, 01 Aug 2026 00:38:24 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e045016sm20729985eec.19.2026.08.01.00.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 00:38:23 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 13:07:30 +0530
Subject: [PATCH 4/4] media: iris: Fix frame interval enumeration for
 non-divisor framerates
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-iris-fixes-dma-pseq-fint-v1-4-aba0cb22f6ab@oss.qualcomm.com>
References: <20260801-iris-fixes-dma-pseq-fint-v1-0-aba0cb22f6ab@oss.qualcomm.com>
In-Reply-To: <20260801-iris-fixes-dma-pseq-fint-v1-0-aba0cb22f6ab@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785569872; l=2222;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=qBcqygLGzctnWl0Ad9kRqj0ar7uVk/8H2PNp87JucGI=;
 b=Zb792k/Ttm9QCTPbV0RFTp6LNEeiguSLfulNYbjzUaoDXYPfSPyu/FE/rWHuOS0q2tZe/Ya6Z
 4QbnxgnmjttDbmKXo+Ky6fdgKaEt/djIbmE/8LIlw/UkVeCP8Msgts0
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=KezidwYD c=1 sm=1 tr=0 ts=6a6da271 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SOCO_u0IuGyKYXpwI1gA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDA1MyBTYWx0ZWRfX5AWlFDuvzNc7
 eWFLT8monfXiBj1N/gUwJ4Sv+pM9GO46lQmAfx/xAPy1aDboFRs9dpqdMpOoInkrWM5HlWsAXFG
 r4XKaiZHxLB4TyMJ0lyDEQBsdgj7Vaw=
X-Proofpoint-ORIG-GUID: LMU_osdTH9JxkL4nMxqohuSxlw25abZF
X-Proofpoint-GUID: LMU_osdTH9JxkL4nMxqohuSxlw25abZF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDA1MyBTYWx0ZWRfXzZeNm2SbszFI
 839h712Club4zrPf8mRDB2eclNyy3VmyBz8TqUmuKP4FA7X4qJLlI0dH+0v63cX7Kf6wfMZh/Y2
 rXr5cXXa55ooz7rVh4taZZb/6Pfc79uvqlXAR5pc/NdVRXDn+ReRygO+3TTxGT6oRHgDJ518OJ8
 GNkOcbYPtWbZe5qI1pHV9IF4BS0I/kkwXvwFdYYJ+Vt3om7lWEu/4dhDCKZA/J/E4Ehf6ST461z
 y2IqHc18qI9VhUJXdQ5970Ub88OiT3D9cJy2l7hpdgOhQo6+oPTrtkER6h784fbxnW/YI3S9bi0
 3wyT/uHcE5BmXlaFP5E3t7MHSTSZqdDs6X1rz30etxMSrYv0lymDOZPQS/BGoKNf2igyXYn2iQU
 Cpi153C+GATv+irEqyMYzlFBprSqY13ofY6oHv9XVqofoLFSNKUIYJliVIYSEr9XVuu0aS1Gsp2
 7fBvZHEWztGLtSKhsng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010053

iris_enum_frameintervals() advertised frame intervals using
V4L2_FRMIVAL_TYPE_STEPWISE with step=1/MAXIMUM_FPS where MAXIMUM_FPS
is 480. This caused client to enumerate only framerates of the form
MAXIMUM_FPS/n (where n is a positive integer), restricting support to
exact divisors of MAXIMUM_FPS (e.g., 480, 240, 160, 120, 96, 80, 60,
30, 24, 1).

Framerates that are not exact divisors of MAXIMUM_FPS, such as 29 fps,
25 fps, were excluded from the enumerated list. There is no hardware
restriction to framerates that are exact divisors of MAXIMUM_FPS. This
caused GStreamer caps negotiation to fail with an "internal data
stream error" when encoding content at such framerates.

Fix this by using V4L2_FRMIVAL_TYPE_CONTINUOUS. With CONTINUOUS type,
GStreamer creates a continuous framerate range [1, max_fps], allowing
any integer framerate within the range to pass caps negotiation. The
step field is set to 1/1 as required by the V4L2 specification for
continuous frame intervals.

Fixes: a6882431a138 ("media: iris: Add support for ENUM_FRAMESIZES/FRAMEINTERVALS for encoder")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vidc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index fcbc60016bee..8f20cb281a93 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -438,14 +438,14 @@ static int iris_enum_frameintervals(struct file *filp, void *fh,
 	mbpf = NUM_MBS_PER_FRAME(fival->height, fival->width);
 	fps = DIV_ROUND_UP(core->iris_platform_data->max_core_mbps, mbpf);
 
-	fival->type = V4L2_FRMIVAL_TYPE_STEPWISE;
+	fival->type = V4L2_FRMIVAL_TYPE_CONTINUOUS;
 	fival->stepwise.min.numerator = 1;
 	fival->stepwise.min.denominator =
 			min_t(u32, fps, MAXIMUM_FPS);
 	fival->stepwise.max.numerator = 1;
 	fival->stepwise.max.denominator = 1;
 	fival->stepwise.step.numerator = 1;
-	fival->stepwise.step.denominator = MAXIMUM_FPS;
+	fival->stepwise.step.denominator = 1;
 
 	return 0;
 }

-- 
2.34.1

