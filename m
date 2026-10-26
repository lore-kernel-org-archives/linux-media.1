Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793008877;
	b=W55twEYf1oDuIFU0VrTHEb4fKrgs8oDT4hhKjFqQejRbRQhMrAAaUeNlv1+fnKRs9lo0
	 ijAp3bdr4rNgeRdreStwHBQcU6b3NlJ4+OFMUNL0jecXrCiVocc1OPVI/zwXrvDl1FzH0
	 iZqVemzZ0LT+gw7HAkV5qqbuPypykOhCNXohH4HYLLkAKkqMupQU+GbVcAFA//yJeKN58
	 t0N5Gdx5hh50Zr1yxByYpRq0+9fO+w2dhQ+umILVC1gLr7ykL+EumQivfe3xOBiSIZ1Ex
	 rt4qENtF49LcaFIcb9voiaMt/ZU7KbEaU8jLAWzsthJ7GhQatEIkuLGfk9a5P2SxUyQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008877;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OI/dNtcGZjhk+KLGnWOyJKLydwYsn94SsKin7b9OGlw=;
	b=Z8g1myold5f0gNyQAtxbLdvsxlIyH2/seW7fyyzcLUUtp24p2I6TRPUIHKBnVr+iOimM
	 53G9nnluCYtvTB8UQJncqRQ8o51Q5DC/MgaT8i46fbAE3uAVQQOAKf4Q+lJO2PfUN4a8U
	 nyenqRhvpDekwYUbKrymnZ3CJALHXEOgYfAQtmB3QkoURFEeNVgFNDvdCOdfkHcp+k99g
	 VTdFVrApTsKR/ATpOoL/V4RwM1wBPTI9netnl1UoAEZB7bVdRtAXYDOtflAKgThXq67M0
	 gJ8sCZgQik2rRq78nf3KxIlINasfAamswgqjpA0EwMi/Sb4eI5Ce/hfYT/jTglqjaag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o0IcSfKU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vx96L0OH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF23606A31A
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 10:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AF23606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o0IcSfKU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vx96L0OH
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b9o42728036
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 10:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OI/dNtcGZjhk+KLGnWOyJKLydwYsn94SsKin7b9OGlw=; b=o0IcSfKU9ohURjzk
	V9O5XnWwQCLwtYhdFJfBIVuXHU0ktXCLDxYfzf6eAU+7P163oSXGoWKsRYsvhzPu
	+TTb4Rk+wYFyaAJhwollKrHoBUwx6GIQKDT9IBIYGVlSnepAft1ITttgWCKyXJWY
	wNPB1soeggDDsYxioINCQkc9dlm+SHLXldCsB7vWP9vX2od2hLX7pFExxUpbI2VB
	bRz1uxs3F3J/O0nPTBZOwC+/fmATFcpew2n/9iOR2tLfy34L88JKXuwQFvVT5Nhc
	2DW0E+IuW6d0E7NkZ7HrE2fKNN9giMRFE0z5IFD6WHKrlYNUY2x/waJ+hP6uZqBW
	a8DdVg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgkp6ny76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 10:01:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f62934ef6so354240685a.3
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 03:01:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793008875; cv=none;
        d=google.com; s=arc-20260327;
        b=M6Yg6ggLP2hIelb2Iff31hw8iXDOcv45QWg7d6pDN7DU1IhdXt2dthwa2WV9LjjsEh
         cyOofQiHshtVkiyBN8IERhZpDuAdgLX+bq9C3DBvVgFFXQMNq/zsBUTYgT20ykJ/iET+
         NQ77ljwR4TMwzYJ0Czec3pX3W4a9mKBKKMFR8e6JtSCHuwH81ZBaQvVy8iEdE1tFsL6D
         k7cNdlWx/nsA9ML1pEM6MY5ZL2GvqjTL5JJKGMkX/Wdu/hvLywzA2gzol7Y4CQsoWNmm
         jQwsx8/P9hHFupbGyhdxmW8SfXhK8OUPt0QXa/w/xu0eCstdtFr+ptfQKF4BP5YJ0cMw
         kQ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OI/dNtcGZjhk+KLGnWOyJKLydwYsn94SsKin7b9OGlw=;
        fh=mkibSIAXuxeSvRlTb3t+C06suCR7mJ7eVxYAr4c76cw=;
        b=UzxI+RXsMAns66hkc4SEnbpLSuB9lLvFyXy0d/J2x3AvGWQX9fZo5Jcp4qFfDwwYuT
         uy+scSEb0jpXQ8z2vje0XuxaE79YTT/JbaXATfZER6piCrsHPn4/aHmLDMlmycO4T6h6
         XTh2ZLarXvSVoyqHyyBLTPejtJfml6+t9H64tNahz6LMeSLAOzxjGqgpgjBuqAWWjUqe
         EDhB68zhSrsfSpjDiAFdEdLTKfG3/gN3VlYzkiq/8oR2H8/OyYihddX+X1HfD/odZnSc
         KBAbSALuEFHhIPzcWCoW4pPp/FndBWWyivNd+TpMtKklT3bkz1cX2910mX0RzRyFk+nw
         fYrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793008875; x=1793613675; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OI/dNtcGZjhk+KLGnWOyJKLydwYsn94SsKin7b9OGlw=;
        b=Vx96L0OHIYobB0Yhf8ghLN6RFm15xzQwzKmVW5LNrTyXMF75b6vagu0yK2Mo/1D9kh
         CtLAeGphhQccwbMhMCh2DPKXPqkmlXoghVVCGHLrVjdyCyKUXpbJ5t24weO+d6OOoVhp
         OgK5jGkZHQZwiSVABCnKU2xc8g3qjMEhmNP1BuBOQni/rQnGd1LbsrL1KkDv06jZlvlU
         PpBZYHTMSE2FZm6qvf1FtmpWSSICdYqeBJ5t4+5a+8NLNlitwmzSYFxa2mzJCvBooklv
         76cEGSxSozJvxNGosFg+jIqIILyxgSs2C954MBgV85ogMt3deU6whBuJaf0/xpUmwURO
         jeGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008875; x=1793613675;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OI/dNtcGZjhk+KLGnWOyJKLydwYsn94SsKin7b9OGlw=;
        b=HmndCsERgJlINGChIyfELKbKeOMC0T4C+CXwquNWV6rm4IctB68uQhZk7Cyf1Lduns
         Ez0x9TfGB5IkCo/9dCf5spUK6gvbohEYmeo1XOr2GhOKwTebD+HBbD8VTEZ1wcbnMpwq
         Go2Kx/MVCMtQLWqE7kwzE+Rrz7ZHn9s6KLvo1q8VnUoMsbDk2c/YeuiFxjP9PrXf9S1S
         kNkz5bGaVQHGR1nxsBUZgVwLy+4byO67nsPKbEzsEpxOG5N9gJcj4bxp29LVwUQ3TMfx
         3OSszshxbn8jYxJqebQZrRXSKCFrKU3V45VA5PqthxBKLHfvprryj+wChcQh573jouiH
         hAiA==
X-Forwarded-Encrypted: i=1; AKwUvByUacYi2+ONvzF3omkZbmAVE17NllH87T1ZJtUzwMj18b2QTgDWVba2mq4Xyk+P1TIeQnS9gIC8RZJseg==@vger.kernel.org
X-Gm-Message-State: AFq9FYL3R2DMvZhVy8tlSWp5c6IhVuCPUm+LaK7ByCMGSNNwwsA6zMMl
	4AG3NdxtK+c0wS5XuYDKPnlTiLuCMbGUzlSer74ExU2aI6PNL7PASE3e/9ElXcCcC38lDeSDVzq
	mDlGW1gpiS48LRgj996j789hjT+gEagks5trJNVZ4mmEUK+WUnQf9wCCWqsV/riGE5NY4VF9BmQ
	7L1P6xYBlbqye5scKDGp8sDLZK468MCY9Z2X6XFcUv
X-Gm-Gg: AYBFou0madwORHBcSiPZ5ZbFwP7nMBkjLt2gJS5mZ0vHabe2cfKKXszQt8d+doxXrnb
	g97dMBLoMsQHLmcHA844VwYzz8MRnjBbRpbTK2sNUdEzWdolhW+diDawXbW/oBYsZGp/AGVARVA
	mqQNN44P1j2cXo9xgr/zgqK19OALQbVlFPZFXn+iU4zW1FcTV5XrUZAJ7VMk6yEA2UkWasMu/ji
	KEclQ5zc443EHMgUbe9ZzH1yN7gUhLDLb2ZIimp3/f2D5U4xY6/ov4DLAcB1Y6kr1+ncm/fZ2zb
	KT+G/8byRWyntiaGZcyx2estnwkG
X-Received: by 2002:a05:620a:4554:b0:93f:3795:e8ca with SMTP id af79cd13be357-940ef8af8eamr905247885a.21.1793008870848;
        Mon, 26 Oct 2026 03:01:10 -0700 (PDT)
X-Received: by 2002:a05:620a:4554:b0:93f:3795:e8ca with SMTP id
 af79cd13be357-940ef8af8eamr905231685a.21.1793008869521; Mon, 26 Oct 2026
 03:01:09 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com> <20261024-kaanapali-camss-v22-9-7da3ea49c8a1@oss.qualcomm.com>
In-Reply-To: <20261024-kaanapali-camss-v22-9-7da3ea49c8a1@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:00:57 +0100
X-Gm-Features: AclHuK-MjFDtNrzIAF2I-LhrglSAW78oQO6yvwYpJ1LYe3TenKq3-aTE9h7hk1k
Message-ID: <CAFEp6-2a9-P=eN-A3h_aWY=pbScKnwwn6me59S0oJipD4gLcmw@mail.gmail.com>
Subject: Re: [PATCH v22 09/14] media: qcom: camss: vfe: Add support for VFE 1080
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: kNiHv5tm9G433AYy3PsWoDzXbQFVL5Wm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfX8z9bSFK33ifl
 x/OQVMm4KA0414JueBeoEre898W6JrNFOtrQJZ0BSqR4l8V2RqCmUtJVd6Lahe+7Wr4w4IFsSgK
 gerUNOdnXtcdA321uszcUO1ov6QjDu8=
X-Proofpoint-GUID: kNiHv5tm9G433AYy3PsWoDzXbQFVL5Wm
X-Authority-Analysis: v=2.4 cv=bq/Zl0ai c=1 sm=1 tr=0 ts=6adf24eb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=RwwU9dtkUOg5zNwaluQA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfX0s0viSnaRFLr
 TbOmL8io/JBwXUCKjtCd7IJi2/qLJ+7VDZmg3fugjdph5wU4ul15gOKyBehicjUjKEYQqKkenbf
 TI+q9Bj3O6rgVJnCsrdKx0YJP1acb2zavFOmsicVNDqRCGUF/pjIgIBi0YJkpUb6P4TlBC/2gjO
 pl1IiY9aL7Il+ersYDoIkKxVuD36howMG7QP2Al7Fw+srrDJvRvg/4E6TkITsyZertiWJqBz6DG
 ZTpCEBRPo4SVtXd+PNBb89wO0agYNUG7bbRHCsdEXoIxwavQ51AWoM3q8JkVWOx9bt3Kxv1BkX+
 WGFAvhncbrbkCjS485trNYEPf5KLAAVIjDo0G5pIHvvS/2kMjpL3BPZDaggJV1KV8fQOn2U7foQ
 RdPNxXeOHsnImC8s+kHTbJE0JwKB/GPF19nPT4M+66vwJBlBaxqnEKT0OdItbWBVwUgFCCwIVRY
 b/yOk8KQOkmYKHA8lyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260039

On Sun, Oct 25, 2026 at 4:17=E2=80=AFAM Hangxiang Ma
<hangxiang.ma@oss.qualcomm.com> wrote:
>
> Add support for the VFE (Video Front End) 1080 found on Kaanapali SoC.
>
> In the Kaanapali camera subsystem, the front-end blocks are referred to
> as TFEs (Thin Front Ends). This driver continues to use the VFE naming
> in some places to preserve consistency with the existing code and avoid
> unnecessary renaming. Support is currently limited to three output lines,
> matching the constraints of the CAMSS framework.
>
> Kaanapali requires REG_UPDATE and AUP_UPDATE to be issued only after all
> CSID configuration has completed. In addition, the number of AUP_UPDATE
> requests must match the number of buffers queued to the write master
> while it is being enabled.
>
> Although real-time TFE traffic is routed through RT_CAMNOC, both
> camnoc_rt_axi and camnoc_nrt_axi clocks must be enabled. This ensures
> that the PDX_NOC, which sits downstream of both RT and NRT NOCs, exits
> reset in a fully idle state.
>
> Co-developed-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
> Signed-off-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/camss/Makefile         |   1 +
>  drivers/media/platform/qcom/camss/camss-vfe-1080.c | 213 +++++++++++++++=
++++++
>  drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
>  drivers/media/platform/qcom/camss/camss-vfe.h      |   1 +
>  drivers/media/platform/qcom/camss/camss.c          | 148 ++++++++++++++
>  5 files changed, 365 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/p=
latform/qcom/camss/Makefile
> index 218ba3a95939..42a14e8fe1b7 100644
> --- a/drivers/media/platform/qcom/camss/Makefile
> +++ b/drivers/media/platform/qcom/camss/Makefile
> @@ -26,6 +26,7 @@ qcom-camss-objs +=3D \
>                 camss-vfe-340.o \
>                 camss-vfe-480.o \
>                 camss-vfe-680.o \
> +               camss-vfe-1080.o \
>                 camss-vfe-gen1.o \
>                 camss-vfe-gen3.o \
>                 camss-vfe-vbif.o \
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-1080.c b/drivers=
/media/platform/qcom/camss/camss-vfe-1080.c
> new file mode 100644
> index 000000000000..68798f13fbea
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-1080.c
> @@ -0,0 +1,213 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * camss-vfe-1080.c
> + *
> + * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module 1080
> + *
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +
> +#include "camss.h"
> +#include "camss-vfe.h"
> +
> +/* VFE-1080 Bus Register Base Addresses */
> +#define BUS_REG_BASE                           (vfe_is_lite(vfe) ? 0x800=
 : 0x1000)
> +
> +#define VFE_BUS_WM_CGC_OVERRIDE                        (BUS_REG_BASE + 0=
x08)
> +#define                WM_CGC_OVERRIDE_ALL                     (0x7FFFFF=
F)
> +
> +#define VFE_BUS_WM_TEST_BUS_CTRL               (BUS_REG_BASE + 0x128)
> +
> +#define VFE_BUS_WM_CFG(n)                      (BUS_REG_BASE + 0x500 + (=
n) * 0x100)
> +#define                WM_CFG_EN                               BIT(0)
> +#define                WM_VIR_FRM_EN                           BIT(1)
> +#define                WM_CFG_MODE                             BIT(16)
> +#define VFE_BUS_WM_IMAGE_ADDR(n)               (BUS_REG_BASE + 0x504 + (=
n) * 0x100)
> +#define VFE_BUS_WM_FRAME_INCR(n)               (BUS_REG_BASE + 0x508 + (=
n) * 0x100)
> +#define VFE_BUS_WM_IMAGE_CFG_0(n)              (BUS_REG_BASE + 0x50C + (=
n) * 0x100)
> +#define                WM_IMAGE_CFG_0_DEFAULT_WIDTH            (0xFFFF)
> +#define VFE_BUS_WM_IMAGE_CFG_2(n)              (BUS_REG_BASE + 0x514 + (=
n) * 0x100)
> +#define                WM_IMAGE_CFG_2_DEFAULT_STRIDE           (0xFFFF)
> +#define VFE_BUS_WM_PACKER_CFG(n)               (BUS_REG_BASE + 0x518 + (=
n) * 0x100)
> +
> +#define VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(n)     (BUS_REG_BASE + 0x530 + (=
n) * 0x100)
> +#define VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(n)    (BUS_REG_BASE + 0x534 + (=
n) * 0x100)
> +
> +/* VFE lite has no such registers */
> +#define VFE_BUS_WM_FRAMEDROP_PERIOD(n)         (BUS_REG_BASE + 0x538 + (=
n) * 0x100)
> +#define VFE_BUS_WM_FRAMEDROP_PATTERN(n)                (BUS_REG_BASE + 0=
x53C + (n) * 0x100)
> +
> +#define VFE_BUS_WM_MMU_PREFETCH_CFG(n)         (BUS_REG_BASE + 0x560 + (=
n) * 0x100)
> +#define VFE_BUS_WM_MMU_PREFETCH_MAX_OFFSET(n)  (BUS_REG_BASE + 0x564 + (=
n) * 0x100)
> +
> +/*
> + * IFE write master client IDs
> + *
> + * VIDEO_FULL                  0
> + * VIDEO_DC4_Y                 1
> + * VIDEO_DC4_C                 2
> + * VIDEO_DC16_Y                        3
> + * VIDEO_DC16_C                        4
> + * DISPLAY_DS2_Y               5
> + * DISPLAY_DS2_C               6
> + * FD_Y                                7
> + * FD_C                                8
> + * PIXEL_RAW                   9
> + * STATS_AEC_BG                        10
> + * STATS_AEC_BHIST             11
> + * STATS_TINTLESS_BG           12
> + * STATS_AWB_BG                        13
> + * STATS_AWB_BFW               14
> + * STATS_AF_BHIST              15
> + * STATS_ALSC_BG               16
> + * STATS_FLICKER_BAYERRS       17
> + * STATS_TMC_BHIST             18
> + * PDAF_0                      19
> + * PDAF_1                      20
> + * PDAF_2                      21
> + * PDAF_3                      22
> + * RDI0                                23
> + * RDI1                                24
> + * RDI2                                25
> + * RDI3                                26
> + * RDI4                                27
> + *
> + * IFE Lite write master client IDs
> + *
> + * RDI0                        0
> + * RDI1                        1
> + * RDI2                        2
> + * RDI3                        3
> + * GAMMA               4
> + * STATES_BE           5
> + */
> +#define RDI_WM(n) ((vfe_is_lite(vfe) ? 0x0 : 0x17) + (n))
> +
> +static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line =
*line)
> +{
> +       struct v4l2_pix_format_mplane *pix =3D
> +               &line->video_out.active_fmt.fmt.pix_mp;
> +
> +       wm =3D RDI_WM(wm);
> +
> +       /* no clock gating at bus input */
> +       writel(WM_CGC_OVERRIDE_ALL, vfe->base + VFE_BUS_WM_CGC_OVERRIDE);
> +
> +       writel(0x0, vfe->base + VFE_BUS_WM_TEST_BUS_CTRL);
> +
> +       writel(ALIGN(pix->plane_fmt[0].bytesperline, 16) * pix->height >>=
 8,
> +              vfe->base + VFE_BUS_WM_FRAME_INCR(wm));
> +       writel((WM_IMAGE_CFG_0_DEFAULT_WIDTH & 0xFFFF),
> +              vfe->base + VFE_BUS_WM_IMAGE_CFG_0(wm));
> +       writel(WM_IMAGE_CFG_2_DEFAULT_STRIDE,
> +              vfe->base + VFE_BUS_WM_IMAGE_CFG_2(wm));
> +       writel(0, vfe->base + VFE_BUS_WM_PACKER_CFG(wm));
> +
> +       /* no dropped frames, one irq per frame */
> +       if (!vfe_is_lite(vfe)) {
> +               writel(0, vfe->base + VFE_BUS_WM_FRAMEDROP_PERIOD(wm));
> +               writel(1, vfe->base + VFE_BUS_WM_FRAMEDROP_PATTERN(wm));
> +       }
> +
> +       writel(0, vfe->base + VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(wm));
> +       writel(1, vfe->base + VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(wm));
> +
> +       writel(1, vfe->base + VFE_BUS_WM_MMU_PREFETCH_CFG(wm));
> +       writel(0xFFFFFFFF, vfe->base + VFE_BUS_WM_MMU_PREFETCH_MAX_OFFSET=
(wm));
> +
> +       writel(WM_CFG_EN | WM_CFG_MODE, vfe->base + VFE_BUS_WM_CFG(wm));
> +}
> +
> +static void vfe_wm_stop(struct vfe_device *vfe, u8 wm)
> +{
> +       wm =3D RDI_WM(wm);
> +       writel(0, vfe->base + VFE_BUS_WM_CFG(wm));
> +}
> +
> +static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
> +                         struct vfe_line *line)
> +{
> +       wm =3D RDI_WM(wm);
> +       writel(addr >> 8, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
> +
> +       dev_dbg(vfe->camss->dev, "wm:%d, image buf addr:0x%x\n", wm, addr=
);
> +}
> +
> +static void vfe_reg_update(struct vfe_device *vfe, enum vfe_line_id line=
_id)
> +{
> +       int port_id =3D line_id;
> +
> +       camss_reg_update(vfe->camss, vfe->id, port_id, false);
> +}
> +
> +static void vfe_reg_update_clear(struct vfe_device *vfe,
> +                                enum vfe_line_id line_id)
> +{
> +       int port_id =3D line_id;
> +
> +       camss_reg_update(vfe->camss, vfe->id, port_id, true);
> +}
> +
> +static void vfe_addr_update(struct vfe_device *vfe, enum vfe_line_id lin=
e_id)
> +{
> +       int port_id =3D line_id;
> +
> +       camss_addr_update(vfe->camss, vfe->id, port_id, false);
> +}
> +
> +static void vfe_addr_update_clear(struct vfe_device *vfe, enum vfe_line_=
id line_id)
> +{
> +       int port_id =3D line_id;
> +
> +       camss_addr_update(vfe->camss, vfe->id, port_id, true);
> +}
> +
> +static const struct camss_video_ops vfe_video_ops_1080 =3D {
> +       .queue_buffer =3D vfe_queue_buffer_v2,
> +       .flush_buffers =3D vfe_flush_buffers,
> +};
> +
> +static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
> +{
> +       vfe->video_ops =3D vfe_video_ops_1080;
> +}
> +
> +static void vfe_global_reset(struct vfe_device *vfe)
> +{
> +       vfe_isr_reset_ack(vfe);
> +}
> +
> +static irqreturn_t vfe_isr(int irq, void *dev)
> +{
> +       /* nop */
> +       return IRQ_HANDLED;
> +}
> +
> +static int vfe_halt(struct vfe_device *vfe)
> +{
> +       /* rely on vfe_disable_output() to stop the VFE */
> +       return 0;
> +}
> +
> +const struct vfe_hw_ops vfe_ops_1080 =3D {
> +       .addr_update =3D vfe_addr_update,
> +       .addr_update_clear =3D vfe_addr_update_clear,
> +       .global_reset =3D vfe_global_reset,
> +       .hw_version =3D vfe_hw_version,
> +       .isr =3D vfe_isr,
> +       .pm_domain_off =3D vfe_pm_domain_off,
> +       .pm_domain_on =3D vfe_pm_domain_on,
> +       .reg_update =3D vfe_reg_update,
> +       .reg_update_clear =3D vfe_reg_update_clear,
> +       .subdev_init =3D vfe_subdev_init,
> +       .vfe_disable =3D vfe_disable,
> +       .vfe_enable =3D vfe_enable_v2,
> +       .vfe_halt =3D vfe_halt,
> +       .vfe_wm_start =3D vfe_wm_start,
> +       .vfe_wm_stop =3D vfe_wm_stop,
> +       .vfe_buf_done =3D vfe_buf_done,
> +       .vfe_wm_update =3D vfe_wm_update,
> +};
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 4f8867daea4c..221abf7bfd47 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -353,6 +353,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u3=
2 sink_code,
>         case CAMSS_8550:
>         case CAMSS_8650:
>         case CAMSS_8775P:
> +       case CAMSS_KAANAPALI:
>         case CAMSS_X1E80100:
>                 switch (sink_code) {
>                 case MEDIA_BUS_FMT_YUYV8_1X16:
> @@ -2020,6 +2021,7 @@ static int vfe_bpl_align_rdi(struct vfe_device *vfe=
)
>         case CAMSS_8550:
>         case CAMSS_8650:
>         case CAMSS_8775P:
> +       case CAMSS_KAANAPALI:
>         case CAMSS_X1E80100:
>                 ret =3D 16;
>                 break;
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/medi=
a/platform/qcom/camss/camss-vfe.h
> index 8312e4c91e98..0a91440cfe43 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> @@ -251,6 +251,7 @@ extern const struct vfe_hw_ops vfe_ops_170;
>  extern const struct vfe_hw_ops vfe_ops_340;
>  extern const struct vfe_hw_ops vfe_ops_480;
>  extern const struct vfe_hw_ops vfe_ops_680;
> +extern const struct vfe_hw_ops vfe_ops_1080;
>  extern const struct vfe_hw_ops vfe_ops_gen3;
>
>  int vfe_get(struct vfe_device *vfe);
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 7acace363fc2..beca4b827b32 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -156,6 +156,152 @@ static const struct camss_subdev_resources csid_res=
_kaanapali[] =3D {
>         }
>  };
>
> +/* In Kaanapali, CAMNOC requires all CPAS_TFEX clocks
> + * to operate on any TFE Full.
> + */
> +static const struct camss_subdev_resources vfe_res_kaanapali[] =3D {
> +       /* VFE0 - TFE Full */
> +       {
> +               .clock =3D { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
> +                          "vfe0_fast_ahb", "vfe0",
> +                          "cpas_vfe0", "cpas_vfe1", "cpas_vfe2",
> +                          "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug=
_xo" },

Now that we have pm_clk in the main camss_resources structure, it
would make sense to move common/top-level clocks, such as the AHB
clocks, to it. That would avoid having to duplicate them across each
individual sub-block.



> +               .clock_rate =3D { { 0 },
> +                               { 0 },
> +                               { 0 },
> +                               { 0 },
> +                               { 360280000, 480000000, 630000000, 716000=
000,
> +                                 833000000 },
> +                               { 0 },
> +                               { 0 },
> +                               { 0 },
> +                               { 200000000, 300000000, 400000000, 480000=
000 },
> +                               { 0 },
> +                               { 0 } },
> +               .reg =3D { "vfe0" },
> +               .interrupt =3D { "vfe0" },
> +               .vfe =3D {
> +                       .line_num =3D 3,
> +                       .is_lite =3D false,
> +                       .has_pd =3D true,
> +                       .pd_name =3D "ife0",
> +                       .hw_ops =3D &vfe_ops_1080,
> +                       .formats_rdi =3D &vfe_formats_rdi_845,
> +                       .formats_pix =3D &vfe_formats_pix_845
> +               }
> +       },
> +       /* VFE1 - TFE Full */
> +       {
> +               .clock =3D { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
> +                          "vfe1_fast_ahb", "vfe1",
> +                          "cpas_vfe0", "cpas_vfe1", "cpas_vfe2",
> +                          "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug=
_xo" },
> +               .clock_rate =3D { { 0 },
> +                               { 0 },
> +                               { 0 },
> +                               { 0 },
> +                               { 360280000, 480000000, 630000000, 716000=
000,
> +                                 833000000 },
> +                               { 0 },
> +                               { 0 },
> +                               { 0 },
> +                               { 200000000, 300000000, 400000000, 480000=
000 },
> +                               { 0 },
> +                               { 0 } },
> +               .reg =3D { "vfe1" },
> +               .interrupt =3D { "vfe1" },
> +               .vfe =3D {
> +                       .line_num =3D 3,
> +                       .is_lite =3D false,
> +                       .has_pd =3D true,
> +                       .pd_name =3D "ife1",
> +                       .hw_ops =3D &vfe_ops_1080,
> +                       .formats_rdi =3D &vfe_formats_rdi_845,
> +                       .formats_pix =3D &vfe_formats_pix_845
> +               }
> +       },
> +       /* VFE2 - TFE Full */
> +       {
> +               .clock =3D { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
> +                          "vfe2_fast_ahb", "vfe2",
> +                          "cpas_vfe0", "cpas_vfe1", "cpas_vfe2",
> +                          "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug=
_xo" },
> +               .clock_rate =3D { { 0 },
> +                               { 0 },
> +                               { 0 },
> +                               { 0 },
> +                               { 360280000, 480000000, 630000000, 716000=
000,
> +                                 833000000 },
> +                               { 0 },
> +                               { 0 },
> +                               { 0 },
> +                               { 200000000, 300000000, 400000000, 480000=
000 },
> +                               { 0 },
> +                               { 0 } },
> +               .reg =3D { "vfe2" },
> +               .interrupt =3D { "vfe2" },
> +               .vfe =3D {
> +                       .line_num =3D 3,
> +                       .is_lite =3D false,
> +                       .has_pd =3D true,
> +                       .pd_name =3D "ife2",
> +                       .hw_ops =3D &vfe_ops_1080,
> +                       .formats_rdi =3D &vfe_formats_rdi_845,
> +                       .formats_pix =3D &vfe_formats_pix_845
> +               }
> +       },
> +       /* VFE3 - IFE Lite */
> +       {
> +               .clock =3D { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
> +                          "vfe_lite_ahb", "vfe_lite",
> +                          "cpas_vfe_lite", "camnoc_rt_axi",
> +                          "camnoc_nrt_axi", "qdss_debug_xo" },
> +               .clock_rate =3D { { 0 },
> +                               { 0 },
> +                               { 0 },
> +                               { 0 },
> +                               { 266666667, 400000000, 480000000 },
> +                               { 0 },
> +                               { 200000000, 300000000, 400000000, 480000=
000 },
> +                               { 0 },
> +                               { 0 } },
> +               .reg =3D { "vfe_lite0" },
> +               .interrupt =3D { "vfe_lite0" },
> +               .vfe =3D {
> +                       .line_num =3D 3,
> +                       .is_lite =3D true,
> +                       .hw_ops =3D &vfe_ops_1080,
> +                       .formats_rdi =3D &vfe_formats_rdi_845,
> +                       .formats_pix =3D &vfe_formats_pix_845
> +               }
> +       },
> +       /* VFE4 - IFE Lite */
> +       {
> +               .clock =3D { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
> +                          "vfe_lite_ahb", "vfe_lite",
> +                          "cpas_vfe_lite", "camnoc_rt_axi",
> +                          "camnoc_nrt_axi", "qdss_debug_xo" },
> +               .clock_rate =3D { { 0 },
> +                               { 0 },
> +                               { 0 },
> +                               { 0 },
> +                               { 266666667, 400000000, 480000000 },
> +                               { 0 },
> +                               { 200000000, 300000000, 400000000, 480000=
000 },
> +                               { 0 },
> +                               { 0 } },
> +               .reg =3D { "vfe_lite1" },
> +               .interrupt =3D { "vfe_lite1" },
> +               .vfe =3D {
> +                       .line_num =3D 3,
> +                       .is_lite =3D true,
> +                       .hw_ops =3D &vfe_ops_1080,
> +                       .formats_rdi =3D &vfe_formats_rdi_845,
> +                       .formats_pix =3D &vfe_formats_pix_845
> +               }
> +       },
> +};
> +
>  static const struct resources_icc icc_res_kaanapali[] =3D {
>         {
>                 .name =3D "ahb",
> @@ -5726,10 +5872,12 @@ static const struct camss_resources kaanapali_res=
ources =3D {
>         .pd_name =3D "top",
>         .csiphy_res =3D csiphy_res_kaanapali,
>         .csid_res =3D csid_res_kaanapali,
> +       .vfe_res =3D vfe_res_kaanapali,
>         .icc_res =3D icc_res_kaanapali,
>         .icc_path_num =3D ARRAY_SIZE(icc_res_kaanapali),
>         .csiphy_num =3D ARRAY_SIZE(csiphy_res_kaanapali),
>         .csid_num =3D ARRAY_SIZE(csid_res_kaanapali),
> +       .vfe_num =3D ARRAY_SIZE(vfe_res_kaanapali),
>  };
>
>  static const struct camss_resources msm8916_resources =3D {
>
> --
> 2.34.1
>
