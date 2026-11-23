Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795446711;
	b=4IcylVJmrQpuwTCmfcMhpWY3mydOgnPvRJJL3Xj3YUDly315lK8uHAb+o3i+XgV9+pjS
	 ebAXzYxaXZimQzE09L2i1iedzWlqcKeyF8hjelr3fh31P1wz187hIohnxcaHocRzHzflC
	 bQ2SqFA0YiP+1mknpO4C3ZIQSnBG6gQfPCiFZ00UxFBmMQmCbkLduxjvBHBrNnwDAW+s2
	 u7DcN3GgbeQXCxcEIuOsCCRVbUC3EFc2A8+Kqf4U8DN0TTxmuumRKxaEHPIxkgV7tDUEe
	 sV3Ay6e0RjpV2e8OYJFRmEsyh7jKKeDvMldnLMMgV4YUkSVdU7pZKTRLeaTcgsNgQMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446711;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MHYsXh2rYvgIaBOCoqtwMKCA2gezyD7SRqb15VXsvAc=;
	b=2TqQQIaDRyIrQ6NEL6nzWX0ynrvVBfY/6/41k88EGkw5Mxl2/tFMCUeKWhAxp1TIIBAF
	 FlB33fDH5XC+6ikH9EESmYyhOgKa+fplCLGXORfpXGvPxYK2FMRwWWN293cwv165o/Ejr
	 38IAP9370tWPDfGBbIOdDe+RsSpetUwlyg5RY6cCcayjvZo3ffST8jnZG2LQudqC88Pdd
	 IqNp5yph/pcKfWOlcvc1lOmUae73KA63Tmv0hcnXN81xD+yLCuwFDxzjLXCC1SdR18Gq0
	 fs0t44ESTFHJb1bPQGPiktKO+Lg9gG1c9/ZIS7o+ZQbajBk/htfFonn173juKjSPdWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oFaUlr+h;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=amkmpvVP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B8A606A693
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 15:11:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01B8A606A693
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oFaUlr+h;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=amkmpvVP
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDLEr84030401
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 15:11:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MHYsXh2rYvgIaBOCoqtwMKCA2gezyD7SRqb15VXsvAc=; b=oFaUlr+hqfy+qKop
	JPCZC9yZIZ8imH8ZDwgb8GuzrOM7A1lpRhc1QA3PBbV0saAjShH0hR+vdNnZbWsH
	7OcQbYTbhEloa/IxAJQDuGp4alVi1808PFBRC6sC/K+2Xp/eXrMh7AcCAS1SjpUi
	eHaZSkFR3dFGqTFm/9I4Gk7fsux+pbdi9xW7FF7TqDBttYSagEE04+voUwYupPvt
	50kwmluzsCqdwpT/9FS1mMATTbvYk6Eb7xteP5IN3gerTkGlG2nJSlhI/xqrMhDV
	e2BevT+AUUcSkdhTnYAn6Hheb7zA8gBJ3g7KLhpheQ4xWDfsbaK82MiwHHbxKow2
	Y5rK0A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4evsj6kj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 15:11:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94961511b61so577584585a.3
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 07:11:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795446709; cv=none;
        d=google.com; s=arc-20260327;
        b=s4QMQA3ft1Ab/6aCVCobVC/S24+ovOA6C7Xio1xt2/u3Y44PzFUTAw+6Y5aJXlVKtl
         uI6bHWyntcCMbiwtzxjyREU3wsKp31RtQYJH7wYtUifDTr8xDJI2pk+oEi3SrUQtMeas
         hqhPRada9YZhbwvKDqSRX9HrjhAxyhsf0ss0jWccJhdKdnaIgFwXoT35jDFyz1SkqEJn
         /jjq8f6VslPG00GOpe7Qs2IVxaaNfg5SkK9fowaCzTYVXS/Ixvdcz4Gqn8Mvf+80MNN9
         joGz+f2MF9Vqs+muRKdYa4jak9yfo4OEI1eWJkZTKMe/ihorSJNeIX4ax7DORvxjP/9H
         qjpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MHYsXh2rYvgIaBOCoqtwMKCA2gezyD7SRqb15VXsvAc=;
        fh=ZSr1xGtpbuvGsMmmQ4KZxXfNfBvhzh0fzmvJmTg2fH4=;
        b=p3BVW2DfvJ4+m6xQzsvg6j2E3ZQf91DMRQQIh+D5sAhbthKJNVclEMmI4xvL/TkcKl
         BxzBjIRbp8n2h0ZBCyDEH3ovn1soBJL6vdrSQO/8G3dCopl1UTqDj0JzI2BxAY5tWlcG
         CW1IwlCEDDsUFfpdZnxh49SIgTmFpc51tayRO9f1AWymlz8fC9bH7NWV+fbi52Dho5eY
         FRYzAkdMlTth0bwB8w6cxO/BZ7V3sbDRHYPngyyya2hNzW6+oh9/SjBQp+2dX2JXOyuT
         I9VxAjR0er0HFx5w0yuDwLG6IxlvdwmBCDP3IBYTb1piQsnmyw3jIgZ5eQP60WB637PL
         z5Zg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795446709; x=1796051509; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MHYsXh2rYvgIaBOCoqtwMKCA2gezyD7SRqb15VXsvAc=;
        b=amkmpvVP3KsI4BwgaM7YzQLR0xe9BGUPCEA0PzcdY3LGguCbZ0+lg6GT7P8PwueFtp
         7ywAbwL3aAlVX/W+79/1NJbgWp+V4IrW5oOSlVpYw3+4Joq2Qq30b8SSwGoiutrDdj5g
         UEuZrtjBoOoehsxu6kxiIBoUmtF7YgqkVV2Rr0ODVP49HmK+SPj23qkefkQ+8LQpm1r5
         +ZlIIuwhyK2b8eLjigq9M5WGrhJ9LIaWHbyr2NAGhAq3WS5h4FsDWk4SpNMafu71+Ab0
         f+gTrM/xmSN6mO4vABNHtuE84rZ/YTEzyZ7vZjJ732OXNYR/BD6C7EBDkmiJQIIfOCID
         RVFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446709; x=1796051509;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MHYsXh2rYvgIaBOCoqtwMKCA2gezyD7SRqb15VXsvAc=;
        b=ZTq/1jj0jGoOyuJiJBPZSp0N2WruZkkSC1FLtlgMK8sY597DsZmqYKbOT6aNS4D+S7
         m+2Pu5NoChHngKhh4xvzGLC8oZ+HJQpDZuTfnsHeG10qFiIg14lb9dhFsHRP3XSag9rp
         HYwfTmaLsESY7uvYoAtLoRbPp/gNBOtCkX4pwWJ68jevq2WIxggHHhsTPE1oji3NLVJb
         BkLwfHkhhaBVcsh1aySa2zMm/OzmZbw7LHFWJYg4/uLY5PKrVotlrfuvVXRDJpsF2NHW
         mX+43ynetLc55Km0zPWZI4Dpc0csx13Be+uxUwFpsLGlA4Oyjds68o7RW8A4ySPIRR+g
         7hBQ==
X-Forwarded-Encrypted: i=1; AL+hErE17iNYmle+Rbba7Ay9KG+jGowIYQVQvPyH8XitsYxhRGta+EBVwu/zXNu42CeMsUlmgIcGqxQAde6wtg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+OSEzVaEXKcpOVtyQZ8l6WghIMBh3uOpD6NDEvz1eus5UXioCx
	QRgQEyrrCfPkaK6macSL0+hyWHtD+nHdGe1yDFg/B2tVIfqSwEaRrujJ95IiB7P/7yUFESI6g8L
	K3ziARsL4DrLTcsf5Aya64sGSYRbdF37J29VWTHjgol0bxg0ML59SacewHlxQcp3LGPoF9w4pQ8
	fzr9ZtvBWimggv6aPoNRYr2WMWdFXUsx0mH1G17MWf5WpZ1OlK/saX0Q==
X-Gm-Gg: AZFdTZd6I0LHvLawGi99VmfPzT0bOCm3foNWqgO17XwdsGeHmMuqNGMhWwvI5tU0rkB
	vF8B28ird0kBqp4OJA9QjrmF95sfqMI2QJkVdZUes+mQjFgCXYo4P2dv5ZImKQsfuyVQtxcg2Sd
	MHkFBbqxJV0/i8SNXRCxPjneuWqtvecttgZOUpjqCUxj9Nb+80k5n5CMTHo8Vm21valGBPCBw09
	gAIsfq5a1NpQT9JNvwFWmCIN0J3sPp5GR9xBM7KOaorCTtrARw4PwEXtsg8rqIA/iC3fp36T4kq
X-Received: by 2002:a05:620a:a807:b0:949:caf1:ff98 with SMTP id af79cd13be357-949caf242a5mr1281227185a.28.1795446709168;
        Mon, 23 Nov 2026 07:11:49 -0800 (PST)
X-Received: by 2002:a05:620a:a807:b0:949:caf1:ff98 with SMTP id
 af79cd13be357-949caf242a5mr1281222785a.28.1795446708608; Mon, 23 Nov 2026
 07:11:48 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-camss-fixes-v1-0-9df4deb87ea2@gmail.com>
 <20261122-camss-fixes-v1-5-9df4deb87ea2@gmail.com> <ab0a0ad6-4c5d-45ae-a318-dd678a5685e5@linaro.org>
In-Reply-To: <ab0a0ad6-4c5d-45ae-a318-dd678a5685e5@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:11:37 +0100
X-Gm-Features: Aa3M54pgT-2WfF3J-1JQ2P3V1nD92sRSWYlRVjghNjzcR4P5a3N9G-AehYNezoA
Message-ID: <CAFEp6-3ZE=kpdPEiRh4OwjsPoS7=OSrq9HMmuX7vBdct1GutPA@mail.gmail.com>
Subject: Re: [PATCH 5/5] media: qcom: camss: video: stop started subdevs on
 start_streaming failure
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: robertijtsma@gmail.com, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=AL9GXjHq c=1 sm=1 tr=0 ts=6b0457b5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8
 a=nqOTGbnG9gFnUC4tSMkA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: zDP1PPOHGqA3nWkKuWB4Y1iEXfDCT5-H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MCBTYWx0ZWRfX5HP2o65gG8dH
 napT0yNhx3xzO5NWO5p16onYJT7r7aH9DMiw6aYpYKqVFRprc3gS2fH8g5P2RtTZFNgBy6GfF0M
 oZIqb48z+5GTtD9CCs97dT9+Ag21IpX/we/eMyKl/art4SuCjlzuT3hnM/GL4mPTmzAPjyKwqfq
 qkqurQD/aKOqQ1VQmFlaD/kOq+Ha0+B7zCP9KMrlw/dO+uLJNasCjBej4svV5BF7tWXkszPLrWF
 dg7BVLNsbxQ8r+zNXmuwiuqPqOOI2hX9UyF4XOFHGwOA0YkONLf0wJHVwUYe24UAQWugisfwgg9
 az3y/TZjRhVV3u+IbSD3Ir9Ean6FXuLLHS5dKQGIdb3Iz5EbU1WifV21lEsDDM91VEjOQKSGRHo
 oieDyB7DYtnHrpO9PzXmAdLQ8DGiXd+0kQ+eF/gwsMkFW9W4JlwCQ8E/aa6WTO5Clange7BtHy3
 Ccr/joU0najEzq+6xiw==
X-Proofpoint-GUID: zDP1PPOHGqA3nWkKuWB4Y1iEXfDCT5-H
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MCBTYWx0ZWRfXwIPaYSXarCZt
 CM4Md0H8pAqbtkslltVyMlAxIE0u1BJ5pUlVrexKhK4a2hwii1jXXG4fcZAocCbfmgJo6bK36O0
 J+uoRODyH42QmIzJWOunAmZCSDQDj/g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230060

On Mon, Nov 23, 2026 at 3:57=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 22/11/2026 13:35, Robert Ijtsma via B4 Relay wrote:
> > From: Robert Ijtsma <robertijtsma@gmail.com>
> >
> > If a subdevice fails s_stream(1) partway through video_start_streaming(=
),
> > previously started subdevices earlier in the pipeline (such as the VFE
> > and CSID) are never stopped. This leaks VFE stream counts and write
> > master reservations, leaving the pipeline stuck on subsequent stream
> > attempts.
> >
> > Walk the pipeline from the video device up to the failing entity and
> > call s_stream(0) on each already-started subdevice before stopping the
> > media pipeline and flushing buffers.
> >
> > Fixes: 0ac2586c410f ("media: camss: Add files which handle the video de=
vice nodes")
> > Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
>
> I'm 90% sure someone has already submitted a change for this.

Yes, it was already submitted, refer to my previous reply.

>
> Anyway
>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
