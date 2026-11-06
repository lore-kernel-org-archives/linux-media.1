Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793993323;
	b=sjp19RnZ1jDaQGS0jndy/KTDgWleD8zhZMOUqKz307MLscPjvT+q5mIqq7+7YDY08mf8
	 k2AlNBI58OjdaB8H7Y6pPBrbY8cMk97tuxAwfmpcYmAkmtBl2ixwvU6JhVbqVNrU4I5lM
	 gY8Xvj65v2A0ceeZ9mxHES9yCqhb7SEiIVAFaFUBeqPpjEtgodqMtmK7tgC1nEJCHs6Bo
	 WmUllYNhvkmrNfbqjCPlbdqUgBzO0amp19wDjY649NyCWHhNvH8If9yHtyVE6KzykwO2H
	 Qx6VHLeKYlXrNDnjeddZQjZEa7paePBnsTFpyTXjpEv3f6nJvfdTT+ZY39fnYpFqx5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793993323;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=eBPjMwVd0jaBoQmrGoNaoqquijK1PZ3EZwzevr9JqQ0=;
	b=bxghk5Ll0it5rNg0v+02TkraJRg1MsmMrsK41WUG6kwzdZfnIKKojsQ/pnGjkoWmexDC
	 y1hQRlqmSvh+/MwHKn2IDkmQB6S92xRyXmb4Mg/sYSTlBfkuZXSdA4HEQmmJwXNUIiKxD
	 RKkElFajDMt1ZT9Y67/BwrBSuxfyfjyhf2//DXl0Anjz5F1TfRRtY8XSy84vRS11dqV1g
	 /708rrsqWdmBy9k7iXiri9pvm/JfqOWdFKI95aHLc8e1egO1U1I4GasPFyKy6LSqcuTxO
	 HgGYVpbscOI/4h3HwlIN6ny9JhDWCfvcuPyzT/oWqoYH5WOBZODYQ2b9IRag3HNMgSw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kcVTlkY1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CFddPfG1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEF6606A329
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 19:28:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AEF6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kcVTlkY1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CFddPfG1
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6IRa7s1512588
	for <linux-media@vger.kernel.org>; Fri, 6 Nov 2026 19:28:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=eBPjMwVd0jaBoQmrGoNaoqquijK1PZ3EZwzevr9JqQ0=; b=kc
	VTlkY1xd3z3BoetGvpZ4gUcASg6DoYN/uisq9AloTvAgCBoeKlBAsfSIqDEoypCp
	hg0w51FC0Yq0JxsNVez262dvaxDQoFeapCbrSfGg8oXV0+MhUGrTIUJDMNP0OuNn
	mEC9MqOuwBn7J/nXTRPcsocpxbCkqyoJ/XV6mkR/pL9l2jSSHqDeXCSdfa5SA2t5
	QiWJr6liD/mowHNlvTb2I70Y1Dd1OatzpZE16N4+Crq7V6IirC6QWe5268cYb9oO
	mSZcDbtp6xJK4VsNN/Go6yIJVA2ZLRuEzkcs+Wp1z7pya9a9SybTpzB1xVThOtdI
	beJQ8IFFa3vIucu/YC6g==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsm6m87m5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 19:28:42 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-821de0b7baaso1348257a34.1
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 11:28:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793993321; cv=none;
        d=google.com; s=arc-20260327;
        b=G6Q3SH45V6dxOm+FazEK2C4iM1Jeas6RcrlovNrZTRLIvTliisewXZbSkWI+or5QuN
         aTTkSCmayqqojkVO2gybrlJ835TXTpAmliBmkRnvNJv7B3BR6fv3sH5mEr+DWVLVfJNn
         EZBYe793miPbJTqdwvBbKA7U7jXsJylIPsi0z/1kuN49EYD28DpsxGgfGrdqs4qdzXtf
         3G3KDzla07KuaRUL8rWvX4FcC/9FhILUleFBfQbzPxwj0Zg03vHlex7JBJph0iZKPyQX
         jFDeGgkfP9Eg34OGj5bbblh14deSB0LRoRC6MrkJYSdkpFfniYLIYgL7xYmykI7ArMH4
         ePiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=eBPjMwVd0jaBoQmrGoNaoqquijK1PZ3EZwzevr9JqQ0=;
        fh=dYTbQm6tbIljtiyqpp5nWsMyanwAGASZsgyQrre+mn8=;
        b=QlGYyW54QCehn9JbKyjmYX2vCyQf6xd8fDr3MUf0/WhhARuLtzAoHf4pBox/7bG1Tz
         ahsMUSM+iP0YNvh3nh3BXdKXDa6EAoREXgmAZ6JPNrODitRy0pM8BwqvSbqtEVYZ2Ak9
         oW5KbOXYysB3UEPmDDHo9CD3PN9JIIaKFJAJSApXeWW+eFxaD09uhDRKh/GzvT5O9sCm
         6rBoYwuvESrNZtO1+y4ztg2uNbJqRMsJ8z1AtNVGFNOJBSUSkV/ZbmphRKqxG1S9cIzM
         kFmFmPiWKIJqlKzodNRgcw08GOwBuggtYM454HccjWhETjwiXzv2srrQmWH0wJQiiNhP
         MMUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793993321; x=1794598121; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eBPjMwVd0jaBoQmrGoNaoqquijK1PZ3EZwzevr9JqQ0=;
        b=CFddPfG1VOLewoiRfzsDqnOumQCnND2ELvXXQph9vR0tRBBvKk/aCXNuak8VCvXwTk
         iCptNnkNiL2o5XwOo7rxd1xJR/CnIm4co0ELFHt8ejzs1ZiQw6RqUGxJZiSX9NKUtsbr
         3o7sH/K1f1y4cTStMzXEhK48QGGdxQl46N6XdDep6x0P/tbNcL0mEW2Hj8BEdqqj8fwy
         oCqrDdHw97lSMcLx5f7eeZjQD+2IqF2hpF0612T83kbmPV3ia+v/Cv3E90Qr6R8Nh6GW
         VVHeMA8fxEJvB1+XMizoRhrhBpfUW3bhn3wiYIPLHKHwXoGZM++qsZHnrCjyN0nvvT8R
         Z0oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793993321; x=1794598121;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eBPjMwVd0jaBoQmrGoNaoqquijK1PZ3EZwzevr9JqQ0=;
        b=bBySDvYDexV9ZsokyWKa5JwoQlRes0c335RXufr8NSZHkgaIHDdyAozED4wVEvMRb7
         OKliHVV6ED8Lm6z8bm+peKCNxDKpRfBtJwDWtvbLNBTtyU2jydISb/wD5asbzii2N7l4
         BZG8Dys89BVIa2qU8ftbxLQLN88auLRk5INsLtqsq7af4f5wdATn6eZ6jejNd65LsxiE
         Jr9dw149O32fOwwF/m0nNP8DPB1FhDPQ7fB3AB9FNwCTLtsnEYZm1jTVDiheTaGodHlv
         fIfHfaQl8K3hGb5WXDnI2gWs/aAJ8E/+ucTj80FkRdPJfZ6D758DHFQoYBVlRECUgnVa
         uPGg==
X-Forwarded-Encrypted: i=1; AKwUvBz/BG1C2X37LWQtLRBfaJmhyIEzgjOqvFICMwp9OykFCTyDpNNQ7pCzxzbmQl5MAP0sErkvon2Q5woduQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8eucnCPrnai1OwZScvtkdf6Sp7oS5c7cZxzzf4mONj/2VUKj2F
	CBuJFXFReeKogiRYV8Z9pJUBDO2iFNxrioNsybX0QPn/OjllIcArCiEmhVHCsIYUy2q95eD/zNY
	Uqv45s2Y9CH/8aUsJtUDeCITv+Cs864ICM2TggweGMvOSgjAMsPcyHm/1G4N94YibhWUANcolaY
	kheJnUr3vHWGGqTqf6R5ZC996oCtZNxUTAHBZFMqJv
X-Gm-Gg: AYBFou3PY28xazkYC5zpwq8PJZl86V30R3y5MZGC9ze+M2XCWfqQMBJ5HnR2oU/oIKW
	UhrhMYJ2RSlWglmiDEf60ZOsZkImGDMY27I5QjgqFKQEOpLR6q6ckuOMyFWfazxhA6ge9KCHMsI
	4aUfWkwUOm0/3oKWnDm41DARxVbq3JhizykftmNnMaqoYAXSi63OCdFdR+RJSgNwqCJL7wBlZ//
	9e6RBhXAYGBDgiPg0zLwQ==
X-Received: by 2002:a05:6830:903:b0:82f:5733:ffbd with SMTP id 46e09a7af769-85f1cd6c102mr4535835a34.1.1793993321196;
        Fri, 06 Nov 2026 11:28:41 -0800 (PST)
X-Received: by 2002:a05:6830:903:b0:82f:5733:ffbd with SMTP id
 46e09a7af769-85f1cd6c102mr4535793a34.1.1793993320712; Fri, 06 Nov 2026
 11:28:40 -0800 (PST)
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
 <7b4d3a85-6aea-4b96-a4d0-c2f16e488ad9@collabora.com> <7e8a6645f181c9e8d663eb97bb1f32e3e4fd8c67.camel@collabora.com>
 <CACSVV03Nz=das+fneMqx9UE1Vzps55=_An-DtmufRTxdhv2idw@mail.gmail.com> <8f3c80b4b518835e2d8b3da62e84572338657f68.camel@collabora.com>
In-Reply-To: <8f3c80b4b518835e2d8b3da62e84572338657f68.camel@collabora.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 11:28:29 -0800
X-Gm-Features: AclHuK9Qgc9clmR_7H8t98hdINV7q2dwzavw_NQzbOJlTXbTdCINtEAArvoby-Q
Message-ID: <CACSVV02KqnDzMQd776fvXBErHLzJPptzWBSnXtEoxXNsUW6TnA@mail.gmail.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA3NyBTYWx0ZWRfX3c4aouyg8a+E
 R8YEh/uGozxNLBD4X5xWbOnJ5VQlBqpjsWzZJxNVR0qCwcXeuAsW8j7C8TrzrDQUxIUEex4ICdY
 FqlY/E3SrLK+1DO4lqa/+qeMA25rRzE=
X-Proofpoint-GUID: QKNKXoWTuqC8Ex6Z-fYgCZ9DuA6aHv0B
X-Authority-Analysis: v=2.4 cv=S7NMU4sP c=1 sm=1 tr=0 ts=6aee2a6a cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=e5mUnYsNAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=TpzBZJKYoUEfyNYX0y4A:9 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA3NyBTYWx0ZWRfX+Q/Z3LCUZTCH
 /ug5puKUxR0mAOWP/ymVjaSNV+OdzMgp9p6XJOxMsKBGjtwu8yGxuqqepgGvq0k/BaJ7dwofZt3
 lrpn/Ivq95HxUZ+xBXJerAM1sOrseRDIBy1xTeclBWfD178NE2T1hDg1HT0kEu0xexOq2Gq2CB3
 CLZsD/L7PxMHAGH55gEL7vIDk9XQlPRXurzydu5CJWNDDsgBRIvX7CnzCKLOvaMaEZIab5hyhnX
 jtG/dmggOo0QO8e6S/9DeF8OdR2dZvvT2QcdmoUq1wAxbJP0pm2P8AIMLAL8jWsM0UqCxb1of/t
 UAs9x9HbXofWDVz7u/epFEFnwBG9hksAErtVWJY0chT/lc5QG+G3VANT9C7W1u0A7ZzR9tnC4pr
 C9i8wvn87lbnpxIviBz1WhwFmHWzstO0uvHJp6Tg0exVeBCZ8Be9a7eG30Va6EGELEyhaMLv+Y+
 L+3GiPX2qDiddmno54w==
X-Proofpoint-ORIG-GUID: QKNKXoWTuqC8Ex6Z-fYgCZ9DuA6aHv0B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060077

On Fri, Nov 6, 2026 at 11:09=E2=80=AFAM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Le jeudi 05 novembre 2026 =C3=A0 12:52 -0800, Rob Clark a =C3=A9crit :
> > On Thu, Nov 5, 2026 at 12:35=E2=80=AFPM Nicolas Dufresne
> > <nicolas.dufresne@collabora.com> wrote:
> > >
> > > Le jeudi 05 novembre 2026 =C3=A0 13:35 +0100, Robert Mader a =C3=A9cr=
it :
> > > > On 04.11.26 23:11, Rob Clark wrote:
> > > > > On Wed, Nov 4, 2026 at 11:00=E2=80=AFAM Robert Mader <robert.made=
r@collabora.com> wrote:
> > > > > > Nice, very happy to see the series!
> > > > > >
> > > > > > On 04.11.26 17:36, Dmitry Baryshkov wrote:
> > > > > > > The comment describing the QC10C buffer layout calls it a com=
pressed
> > > > > > > P010. It is not:
> > > > > > If I'm not mistaken the display engine / the DRM side (includin=
g Mesa)
> > > > > > describes it as P010+QCOM_COMPRESSED as well, and so does my pe=
nding
> > > > > > Gstreamer MR [1] . So if we can't pretend that QC10C =3D=3D
> > > > > > P010+QCOM_COMPRESSED, then we probably need a DRM_FORMAT_TP10, =
wire that
> > > > > > up everywhere etc. OTOH if we want to keep the DRM side as is, =
then the
> > > > > > comment should reflect that, IMO.
> > > > > IMHO we need DRM_FORMAT_TP10.. on the GPU side, we have TP10 and =
P010
> > > > > as distinct formats, both with and without UBWC.  I'm not sure if=
 the
> > > > > same is true on video side but P010+UBWC was never exposed, or if=
 it
> > > > > truely only supports linear P010 and UBWC TP10.
> > > >
> > > > Oh, do I understand you correctly that the P010+UBWC implementation=
 is
> > > > not compatible with QC10C, meaning on the GPU side (Mesa and displa=
y) we
> > > > don't yet have any support for QC10C exposed to userspace? If that'=
s so
> > > > then we don't have a choice but to introduce DRM_FORMAT_TP10 I gues=
s?
> > > >
> > > > On the plus side - this would allow us to make the format single pl=
ane,
> > > > matching what we get on the V4L2 side.
> > >
> > > Since its single plane, we should aim for a variation of
> > > DRM_FORMAT_YUV420_10BIT. Similar to YUV420_10BIT, there is no obvious=
 linear
> > > single plane packing for that, it would only be there to support the
> > > compression. Or maybe this one is abstract enough to be used anyway?
> >
> > Oh, sorry, maybe I was a bit misleading/unclear.   TP10 is still a
> > semi-planar format with a Y and UV plane.  But each of those planes
> > combines UBWC metadata and pixel data.
> >
> > Within each plane, the pixel part of the data combines 3 samples in
> > 32b (compared to P010 which is a single sample per 16b.  So not quite
> > the same thing as DRM_FORMAT_YUV420_10BIT.
>
> I believe DRM_FORMAT_YUV420_10BIT is defined as fully packed, no padding =
indeed,
> but I'm not sure if it actually matters considering there is no linear
> representation of these. What really matter is that its a single stride/o=
ffset
> format, which TP10 is not. I would not mind to see another pair for forma=
t, but
> I just wanted to emphasis about the number of expected strides.

For at least some gens of AMD you don't even get to specify the
stride.  It is a function of the image dimensions.  Not sure if that
is true in other places too.

So far, for compressed formats, the stride used at the API level has
been the stride of color data, and the compression flag/meta is a
function of that.

BR,
-R

> Nicolas
>
> >
> > BR,
> > -R
> >
> > > Nicolas
> > >
> > > >
> > > > >
> > > > > BR,
> > > > > -R
> > > > >
> > > > > > Best regards,
> > > > > >
> > > > > > Robert
> > > > > >
> > > > > > 1: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_r=
equests/8195
> > > > > >
> > > > > > > P010 stores each sample in 16 bits, QC10C packs three
> > > > > > > 10-bit samples in each 32-bit word, which is what the stride =
computed
> > > > > > > below (width * 4 / 3) assumes. Name the format correctly.
> > > > > > >
> > > > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcom=
m.com>
> > > > > > > ---
> > > > > > >    drivers/media/platform/qcom/iris/iris_buffer.c | 2 +-
> > > > > > >    1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > >
> > > > > > > diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b=
/drivers/media/platform/qcom/iris/iris_buffer.c
> > > > > > > index eb8de60c1177..ec2bf2a2d953 100644
> > > > > > > --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> > > > > > > +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> > > > > > > @@ -266,7 +266,7 @@ static u32 iris_yuv_buffer_size_qc08c(str=
uct iris_inst *inst)
> > > > > > >
> > > > > > >    /*
> > > > > > >     * QC10C:
> > > > > > > - * UBWC-compressed format for P010.
> > > > > > > + * UBWC-compressed TP10, YUV 4:2:0 with three 10 bit samples=
 packed in 32 bits.
> > > > > > >     * Contains 4 planes in the following order -
> > > > > > >     * (A) Y_Meta_Plane
> > > > > > >     * (B) Y_UBWC_Plane
> > > > > > >
