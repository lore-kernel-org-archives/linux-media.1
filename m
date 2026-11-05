Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793912881;
	b=0oOFQ+/GQ5TCZGX18y3xpwQSyfUJ268y2fCFTO4f0oETZmfEZhhGLnnpOE8TugraM0Mt
	 M6CU4c/SLuXrLU1UVjOrhr9nfeicQwWY2OgO+XuKfIjKWGM7njRxcaz0tj/h2TWA6hT4W
	 jdnztapWJb6k9ySsKCLN55doBOx/c9kC36GZ2WweauMk1i1N9supdB77kEhaAQQilxTjV
	 G5GYfchpZPJabQ1ZhVgiHbqNuyZqYy4yYOfxA7CBw0gwWI0UCLSFllJplqFxzvl5et74r
	 eoRix3gCXNANkqjCa+M/tyJrYiiqAEjxnnjtHpVXE76LL3tMgbKyS3P5afeL+fxhUIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793912881;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yrKHsAyKjgQsLWA30cSaDJqtamOdne71y3/nc/PZAXY=;
	b=ghiUouL0ZzzECVGRsK0AzcmR59C8xBSHTw237vkLgWUmjUUIVB8HDJGU3Tt7PFwWqeVv
	 03x1YUx2GeEwBbQFGXc0KvOqDI/UBW/7SwhPHMWPoy8Kk82Sb3IyV0BGfTGgnsxS7ZOqE
	 /WBigf9jV+ANqfH/RYXDtWCRwpoeQeRQG8Ma6j3hb3FJ+efpgRqi3A3sZQb3QuhOh9tqA
	 KpW74Nvqsmaqbz/MlZ6TNN8ikFvzBV+Vj2gOK76FdkbIQ3HqM1zwdRLG/D51M6ebUoXvO
	 e4JyM8qgBVa7oW8kivBAMh5sitRjntGiA4ibgAGZDiibVpGqxv3UgtXPHScFEgHSURg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=koQgpWjC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xh8l0zQ6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8262606D812
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 21:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8262606D812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=koQgpWjC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xh8l0zQ6
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5L6CiT2972269
	for <linux-media@vger.kernel.org>; Thu, 5 Nov 2026 21:07:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=yrKHsAyKjgQsLWA30cSaDJqtamOdne71y3/nc/PZAXY=; b=ko
	QgpWjC/rgaCt0NHLrQfHNc2+Iz/JbxNh1STZty8f+unqZjTUU/JirMf+++xHmTwn
	YIAZrKLT7itaSsSGx+ulrNeD9GR0qMz2h37Ck+zV4OUg3wh00Mn2WSEsYHMCNcDd
	QqpsSySqlPm5HBaRQpCkyWbihCF2TeRDDGPY3C1W6Lkb3bDv/SiNI7SUwfvyultb
	GbG7PlaJWNLX3FFhR+pBy8UhvcDvG58NsxsaX0KIJrgPskdDOKMUeewLy9T4UlwI
	CMPkAPzsWNfscaE0LpzBsSo3MXr9IP04Bb4wLqiDJ0wLQLUQ/PkQF4uSF49g5qsH
	4MKFiotR99rvbtV2GVww==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrraatqpk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 21:07:58 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-451d80641efso2843366fac.2
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 13:07:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793912878; cv=none;
        d=google.com; s=arc-20260327;
        b=TnE5MpLbD84UnqtoX3kZ+24w/UgS84HmwRQKduiV29Le8w8K3OHcctMQxrB2O/ruc1
         eaYS23DfbU2ad6aP4A2DqRGnx7qA0K3R7MojHTwAIpG9e3zsuPqVqgVNkwukOTTRc/yX
         vaGqmLyRPbz8luFwbDiq/RdNfkasfjnLHQLQHCCcaibvPxm/6VrLx13fIcmkLOea3CQy
         eQ7R25exAUF5Cg9Fv/tGk7c+5Aht02Zz49Tg7wLTUekZ24D6H+fF4vwQ7u01nw1rAPa0
         nA+Bev/f2Qguwmz+d+5w6Z9kr3uaqPhQWd33QUMETaJSVlaP71FTg+McFQlAiS8onEAK
         K+Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=yrKHsAyKjgQsLWA30cSaDJqtamOdne71y3/nc/PZAXY=;
        fh=PaBbQQgbAnMJVMhT3wQI0cCVXnG7wdl3vFkn315NYd0=;
        b=RfLaj2HDhKpxDLmg0fvKSLAPg1zECytM17WpNrq1p7AB5Gp+E1Z1sU5gykekhh5aXi
         VFBfCGGQ4X9O8A7vwDUB2yVzJWac/y9AqEc1Tu0VXumHEpuIkgl7vvX9IVu3DIAeuG57
         TwPMVWhellQwvpAJRymdh2AUJxR2IoosXhBBtWEQB0EIJaAocuz4Gibaxpog9XVvtDrn
         lWLHxTqlv11wgJkOFfFihn8JvO6t951yqdTBV/L28lQ6f+kQ/fD0qt7rRVT/hnjMleJG
         eRYr2YPCU+YCeAKyywHbepzO3chOq84EX8CEVpZXm71tOdhDm+Rktgsr9FeVziD8c6AH
         HmxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793912878; x=1794517678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yrKHsAyKjgQsLWA30cSaDJqtamOdne71y3/nc/PZAXY=;
        b=Xh8l0zQ6C/xZbWgnXvb+3G/sy1IhfcE9UXe48qhHSuQk99fNy2Ueg8wIurqpJ/pQr1
         YAgM/dtLe5p16fA6mpAQrBTytMe5WLmXR9i47duHnVJxFF84Oytn49z+CMmAtCkxm68r
         5q7pCtN8lUv9wo0HQS/fSD9UrifX+fyX9PfCRsrIdsQzKlf+4QBIidZSwfPSpzWJw+m3
         iOCntmvvt2i8/xtvq2da2su848AK0q0RCV6Q0LelKnt6VGkyq/Fu2Bd1HZkc62rIfNYQ
         vFX5iQSIJTIBJiR//MQGAWCmhP48kGtXPq4G2KZxcO7SweyJYGEhLKyWS+xgoSSokgWR
         Y7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793912878; x=1794517678;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yrKHsAyKjgQsLWA30cSaDJqtamOdne71y3/nc/PZAXY=;
        b=EUb0J5IjfXLJy2tB2wQ1ZCMIhgOE0+pddEcowTTr9jeTqIQ6s8RnYWf53gKrHFMOp4
         D2O9QKVkqg+w6tjrssblXFIGgA8ScuvqAz2lHQ9lRoibQrqq39bOyaiYn3iGcf4GCfEX
         oIzBpozr9ZwIzYh9utFEov6iYyjq7Ur466JVwUqUh2D0PfSWfY64Cqt5YRVWhBFoza+4
         1Z+sidLbCtWDQaNaeZaT1oSkwf0V7zLD2Qn6+pXGKuVNqGyVVqRzcQE8dz6/ViPvu5Jb
         5N0qqlXN2rF/PPmf0e6N8oeVdUfnshiTb4ygi8AvQLJa5AxPrmXkMOLSDFochC6YkMP0
         5zFg==
X-Forwarded-Encrypted: i=1; AKwUvByIyWZZt7eO2CaQREN/yFh3owxlvrrCKTt2i0dtusSJHr9Eqy5jH4rH/qw3i075dP0e2Zwc0W+gll1aDA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+vyiYICtl+J0MI7rWE09tRWBAM71aWuYNMaPRnRunB6nnTX0K3
	VF3giLt8GkTsC6sHsU8K+rjgaf8FpjkcZaV0/QWUOlgfx+SQrzmhh0L/uLEwNcWHGlL4f6q8Qed
	OOXNPz78KefNoDB2+TRQS0Q56Nkq3RgPgNhqIb+xjHVuMESN8pIyOZmYBcWdxG0O43BQn/MoE2e
	KFaQvhAPgH9TJyamhXOkJSDsv+4DdVhLGZYV4f8hjZ
X-Gm-Gg: AYBFou3UZ4NHdzqdSaziAul4jvmu9kdwtAOSJy1SSup2SnmXPfq5Db2qupDy/24bjh3
	imuBq7zoJz+royKYGVX1/PuCsUBrep2/OBcGid01SMukgTAozHoOmGj3zAjldnaDVtsFl4oahRp
	5eMvDpxQVMrn5MYvmciXQmHyB1fHka2H3lGx5AtkeiyflaFzrTzZ8FTc7g8r2RDzh4vhsxqyP6W
	TF00m/gx4Cm7B5RIxhgpQ==
X-Received: by 2002:a05:6871:a1e1:b0:48f:e0e5:a1ec with SMTP id 586e51a60fabf-4ad98bedbd9mr282021fac.49.1793912877674;
        Thu, 05 Nov 2026 13:07:57 -0800 (PST)
X-Received: by 2002:a05:6871:a1e1:b0:48f:e0e5:a1ec with SMTP id
 586e51a60fabf-4ad98bedbd9mr281983fac.49.1793912877179; Thu, 05 Nov 2026
 13:07:57 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-ubwc-format-docs-v1-0-389044012b4e@oss.qualcomm.com>
 <20261104-ubwc-format-docs-v1-7-389044012b4e@oss.qualcomm.com>
 <86b801ce-a56c-4ff8-8915-9be369fc0ce8@collabora.com> <CACSVV02t9=tm2qyG531f8Ne90ADAb1_ZDDGEg7PwDmoEvGxPrQ@mail.gmail.com>
 <062fe7dca00f77dac05197552d22897b28dc2143.camel@collabora.com>
In-Reply-To: <062fe7dca00f77dac05197552d22897b28dc2143.camel@collabora.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 13:07:45 -0800
X-Gm-Features: AclHuK_l2F4brRz8zEFJVBH6hAHGfTJx_ef7xI7quruekmosYIZayahgz2bCT68
Message-ID: <CACSVV013piWuVo87SuAGK+j9i+rj4cHGiOTX9kznE4ROJup0Hw@mail.gmail.com>
Subject: Re: [PATCH 7/7] media: qcom: iris: describe QC10C as TP10
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Robert Mader <robert.mader@collabora.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>, linux-media@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4NCBTYWx0ZWRfXzLzp40I/xJJF
 zyVAkvi5JQ8wDlJAnsvhm83fpfokIDqHw2Ycq/bAiKpbA0JJYaPscn7LTuum5QYdq1sH+PAKimi
 DFPQ9PP2V+oMBbFeWOoGT/n4VSNAKuM=
X-Proofpoint-ORIG-GUID: 1nMWfcYAQ9I0ii3LSm0JWH-VgJww7cEp
X-Authority-Analysis: v=2.4 cv=U54Hnuru c=1 sm=1 tr=0 ts=6aecf02f cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=e5mUnYsNAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=w63Y8P8m0PzJOg8PKjMA:9 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4NCBTYWx0ZWRfX7QnI5PBBDgUm
 TC/ptosE11FrOq5pCJ6Vdpj6vt+6AwBZKzfLFOEFFY0hmY4ZvH7PzM7pS6PuBuueeHG10UVeez/
 FsluAPZbTuGOPPaVokjEJzyzM0jphgmhBNXhcK/76c8OCno7rb98swSQ3xDvGR3yVVgIO/Wh2FD
 YLLgdUuuoVB0f2BDGyD5ujK1sRsJX8ISgwN0n37gL1jV3IskYNiTkIZEMUQoHSvEmakfjJ7D/YF
 eiS4kHTNGQVlovJw+PdDAd0Fgws2iDiMkzLNoYbiJx2704c/QcvggvZJTX/gFJM0qIgkMEqFk0J
 rQdBzv5mbTyDwnSJuNGmjspa6lO3yYmiUX8E9W2weRzbvUBzPTOJXPMnHth9zaM1tkZmP3IWozm
 0jEBqEJvqlcQrizunbcVrk5jggRHeGYBKyODtVZu4R3AQtJ7yXmHKCoRcqekyzHIn7mJOVajpUm
 hWO80yJ1rPNrvlnpxdQ==
X-Proofpoint-GUID: 1nMWfcYAQ9I0ii3LSm0JWH-VgJww7cEp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050084

On Thu, Nov 5, 2026 at 12:30=E2=80=AFPM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Le mercredi 04 novembre 2026 =C3=A0 14:11 -0800, Rob Clark a =C3=A9crit :
> > On Wed, Nov 4, 2026 at 11:00=E2=80=AFAM Robert Mader <robert.mader@coll=
abora.com> wrote:
> > >
> > > Nice, very happy to see the series!
> > >
> > > On 04.11.26 17:36, Dmitry Baryshkov wrote:
> > > > The comment describing the QC10C buffer layout calls it a compresse=
d
> > > > P010. It is not:
> > >
> > > If I'm not mistaken the display engine / the DRM side (including Mesa=
)
> > > describes it as P010+QCOM_COMPRESSED as well, and so does my pending
> > > Gstreamer MR [1] . So if we can't pretend that QC10C =3D=3D
> > > P010+QCOM_COMPRESSED, then we probably need a DRM_FORMAT_TP10, wire t=
hat
> > > up everywhere etc. OTOH if we want to keep the DRM side as is, then t=
he
> > > comment should reflect that, IMO.
> >
> > IMHO we need DRM_FORMAT_TP10.. on the GPU side, we have TP10 and P010
> > as distinct formats, both with and without UBWC.  I'm not sure if the
> > same is true on video side but P010+UBWC was never exposed, or if it
> > truely only supports linear P010 and UBWC TP10.
>
> Xilinx ZynMP is all matching TP10 (they had GEY and YUV semi-planar varia=
nts),
> but they never upstreamed it, hence why we don't have it in V4L2. Just fy=
i, we
> named it creatively NV12_10LE32 in GStreamer, but careful, I cannot guara=
nty the
> padding in on the same side.
>
> Though, how do we deal with backward compat here?

On the qc side, it seems like apparently what the display advertises
as P010+UBWC is actually TP10+UBWC.  I'm willing to call that a bug
and just fix it.  On the GPU side there is an MR[1] to add P010 for
vk.  For gl, I think linear P010 should already be handled via shader
lowering.  I'd like to add TP10, although there doesn't seem to be
(yet) a vk format for this.  (And I'd like to stay away from hacks
pretending TP10+UBWC is P010+UBWC at the API.)  For now I think we
could workaround the lack of a vk format by using DRM_FORMAT_TP10.
The main use-case to start would be dma-buf import, so that seems like
it would be enough for now.

On the v4l2 side, I'm not sure.  But it is also not clear to me if the
viddec hw (iris) supports all four combinations of P010/TP10 vs
linear/UBWC.  I guess there is already some fourcc translation needed
between v4l2 and drm, so maybe it is ok to stick with QC10C on the
v4l2 side?

BR,
-R

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/45721

> >
> > BR,
> > -R
> >
> > > Best regards,
> > >
> > > Robert
> > >
> > > 1: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_request=
s/8195
> > >
> > > > P010 stores each sample in 16 bits, QC10C packs three
> > > > 10-bit samples in each 32-bit word, which is what the stride comput=
ed
> > > > below (width * 4 / 3) assumes. Name the format correctly.
> > > >
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > ---
> > > >   drivers/media/platform/qcom/iris/iris_buffer.c | 2 +-
> > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drive=
rs/media/platform/qcom/iris/iris_buffer.c
> > > > index eb8de60c1177..ec2bf2a2d953 100644
> > > > --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> > > > +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> > > > @@ -266,7 +266,7 @@ static u32 iris_yuv_buffer_size_qc08c(struct ir=
is_inst *inst)
> > > >
> > > >   /*
> > > >    * QC10C:
> > > > - * UBWC-compressed format for P010.
> > > > + * UBWC-compressed TP10, YUV 4:2:0 with three 10 bit samples packe=
d in 32 bits.
> > > >    * Contains 4 planes in the following order -
> > > >    * (A) Y_Meta_Plane
> > > >    * (B) Y_UBWC_Plane
> > > >
