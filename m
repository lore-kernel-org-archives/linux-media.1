Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6741D3B95F9
	for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 14:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787150979; cv=pass; b=hEtIN+bzWKtuD2iubq4slC16mpG/IEAUcREYRHbp6xp9xJwt7XmKa+qJuVzdQNHieSXe1DPUrhO6NXYHaUxSYm2DQa+shL57ORTJk1cV18jeloSZEyHU9En7FaWWm26lO+O6lqLoTagv7q8BQhU1w7b5C/fW0LLSRjQyxb3QCKk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787150979; c=relaxed/simple;
	bh=9wVhSx3PVShqBVKKwgYE6zUrTe2YMfHR4S+tqrdXOCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GlQKxrRvhV58FIQ+Xj+suBvDV7c3qEa1wigUbre1itVlSqWBKxzjbAe/TH/LSRGkMOLYuR8cRI78sKrtAAGncr6FbdEroCyv86GHaxnH4r44UVCuqu4eLnYBH3lI61sZq7VqXFgEUAM+H3WFkj7vX7L/km1711oA4jQNIgjzfxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eLme8JwQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UrMk0H3s; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eLme8JwQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UrMk0H3s"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JEcT98910531
	for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 14:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=4rNpIpy4LtbyQ9Xtow0eilFdW8OjcFy/oDCBHiNow/s=; b=eL
	me8JwQK0gnd4E0UZMMlGf35BN58ld0D1S5FR4/hiSNXSXIxD29uqf2vrpsBHXPjx
	d9PATSuywKmGTK0IssoLyQ3nYDj52e+ZKi4vMX5YCORIKrn1TBdkjENHaxy4I9Tf
	EhQRPwdOujFdQJfuOIq9ktzzprkpUeWv5BnWKOtOp0qFSIsIi/9Y0PmGTqk4JrpO
	nhu6BwMo5nJPbzvlRvoNnPEOjerlIY8yXhVvvN3gEqVRxGpSCl6vToiotnzH9P32
	FnOi/m8QA5a7QSwo+jCuLakY1PKPY0T4EjhdsQksMMIpPQysdOh6nsgGFr9hEiYy
	9QCjJF2anT+fFc8qCrEg==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfmbryx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 14:49:37 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7ee1e335245so1179674a34.1
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 07:49:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787150976; cv=none;
        d=google.com; s=arc-20260327;
        b=SRu/NiIFovv72xR5gKTRh2LYgzqZUUwtPWz5hptYpTEaqHQLES0MFreRijQDUuGNSW
         v6tLD1wfwdES6kFj9VDgrMCFHl1nkfJa/mO7ZOrxPxl/7R1P3leOdPz/iaH+MtWY/Q6B
         YhjP84rMVB9t0+bUjYHJ0Tw33TLO+G7h33yaW8nG6CeOb2JFFVn8cRAVaO2G+zu94oZH
         T3Oa5zAgxihtafx1iIqB/cOWwYh+JLbQaZMXVu4gXnQqdz8YEAyj8wJ81mgnkK7ylNDR
         9PmJdjQ9T3xWqWDkB0nnBHgAwHJPMSCsZjYCfxAVn1zOEqMNzht1KuG/w4jHEvwZFn3T
         8ijg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=4rNpIpy4LtbyQ9Xtow0eilFdW8OjcFy/oDCBHiNow/s=;
        fh=Luja45WEUfO/y8I46IBRwXsjWh85WU96CNWVN3O3xfE=;
        b=R7O3KWvQXnt60nDFulbfqow3YtU+3j9D/3KqVfjouXrMnpUHDiqEC/yfm5ad6Zmtdo
         cK/+tN0GJSmGKgJRH/V0kLMX+2ONyxqeRMUdITWB8ym7A5mMArC4Fpag2Tha6mpahPwW
         5ua/e8X0Q3S3YfRXrWcwQIYLvWYkzaK6S/jP09ybX0xumptT0lmRU4mQLzVL+ZuuPNDr
         GRqVyzYvh18Nkx9f7strspb7qHgQSkgD+TU4z4uKVpzT15SFmiKJhvlJBOct+TK1R7l/
         qxNQ5k2Z9ZuAZr/yTHSffJ4NxVAnGnhvvkqMvLToOOaWOue6mDj0tvyGbgFt6VZ7GurE
         j49A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787150976; x=1787755776; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4rNpIpy4LtbyQ9Xtow0eilFdW8OjcFy/oDCBHiNow/s=;
        b=UrMk0H3sbnZy0RhM2hZxtn+WMG9+lYsEt0YAi7yv8uYW7fo826HAgoiOKL/nAxAeef
         lGjBgqWzVkoaK0zk0COmItVtBFD9cO5VUz3BNH+l7RNV3XPG5RwlE4q2wh1FwyVg+7dh
         ExrVxQm4sJFN2aNbJOiddAI28qx0AJXUnCbJjBlUOGGRhNOwcKEx76p5nCSPGU8B4mwn
         cM2qpRE7KQBPhyojg1HoKCKoNiK75PJ1VXNU09kVNf38/qwObo7kZGj5Bd+DVpaxMZ4F
         ya7PwXdxV9PEe/5mQErwc+Asb0jpktkYfr3n/aX19f0bjy25jjI2MP4ocDKD5shoSaaU
         jZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787150976; x=1787755776;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4rNpIpy4LtbyQ9Xtow0eilFdW8OjcFy/oDCBHiNow/s=;
        b=eEjJCDT0X1q9pkwlShbMdJw00ahbApMA5nEfNINaLZgsUfF7WjpPkZqzIVY/J2gWfn
         mCq80bNJBsPjVqbhyP5Ro1NlkraZGXJZo2Ofj3j2AffD6UcaGjWY2k3T9lWwBAvupJ4O
         yoPKb7+jeIY8ilOWXgDtIkPCn40BlJS9NMDXPgiY6L6j2L5SI8xNmByaZuGD9V2+NWZt
         QqLIdPFyyIrr7DyEK4aIxtwgDon7WwMotByduDQB6YNFdYTKI81ASyd9+hebv03f3n7A
         2tTQ1kT6lJI3mRBkCti28tnpPDFqFQBZ8y7k3tEnKK3bMDetaXpNXpAVQ/m+9MkmGwBN
         eHUQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpmd2hBZ5r3tc9ete9JiEg2kweNDCeJE0zgeefrDmmGZKoJm10mrzTXb2VXeIWxDDnMbl6xCNXMhX+eIA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yybcnvub73zU4uChjlNN2iW3wzFCDj6yhwU0jlE3NzFfn563M5c
	kTxWaYEe56+YGVxZC5Wx+qjRAlwDLx1pyMQAp8m3PMWVMFqg5/3IbxxTgUclUtpkjdKypMFsuSH
	qoly0KocfOxwl3eimN/qzGuFg7iQHJEgyMTOXC5zMpiudc12bykXfjTFHcNx4Vy+X6JN/1NNVYc
	c7FeLE+CUuYNvP+9Hse8sdPFul9wo+9iSPZaIPJgSv
X-Gm-Gg: AR+sD11U204fy1lKCmfgZFdxHe5VC38ADglfUPOMyVGEOWYh8cUBoMPFpRxQjkjXCzu
	GqpH+kgZSN8oha/jP6QzSHK1LutKZs5hCfBcRnKEd9SWCRc43LIN/N0Ald8/bQ7kJVJNychtQky
	1DUmVv8KIDXMISkkBv+eh2q20qGaVUuBtEyUDswXg90lBXPvZx9cLh1nCa
X-Received: by 2002:a4a:e917:0:b0:6a1:8c8c:abd7 with SMTP id 006d021491bc7-6b13c3a41cfmr4766407eaf.16.1787150976074;
        Wed, 19 Aug 2026 07:49:36 -0700 (PDT)
X-Received: by 2002:a4a:e917:0:b0:6a1:8c8c:abd7 with SMTP id
 006d021491bc7-6b13c3a41cfmr4766332eaf.16.1787150975455; Wed, 19 Aug 2026
 07:49:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <3322b42b-3755-45ec-ad55-345125f0d488@kernel.org> <10349e29-b583-403f-a89a-9a00c73666bc@oss.qualcomm.com>
 <87dca76c-851e-4cc3-ab91-68949d283b79@kernel.org> <CACSVV01eYr6FyA6XBG0xw0yv2dydvTEhcY-WUy07mxM8WwkZcg@mail.gmail.com>
 <318f14c2-0e87-4e07-8173-1511dca67d78@kernel.org>
In-Reply-To: <318f14c2-0e87-4e07-8173-1511dca67d78@kernel.org>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 07:49:24 -0700
X-Gm-Features: AcwNN1V5bfW_enn3TfGcE4UwPNlg1kyolZJsLpJh8D-Byx5y30oNV1d5dKRlS_Q
Message-ID: <CACSVV01T=ytVJKM7NRoBTAJm7vH+JPJNT9Tftu5X9YskGXerwg@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] accel/qda: Qualcomm DSP Accelerator driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: -KcM-zKFyYnyDalhDA396w5OYSYhnkiC
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDExNSBTYWx0ZWRfX70rtWoQO4nZM
 wUERU9sf/GMlzhd3xdSMK1pFWl9r0ZXRe03ig78pKNWQIkxGuiAaMOVO+8sj7p63Pq0g/AI1Zmx
 S1BLqT13wtTtvKUzkMLYA8RzEKD4px8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDExNSBTYWx0ZWRfX1U1yioaMHOmp
 i3JWjJeF3jEBZds6EX1djFXEHxFZupUN0gHNv+X+VLpQsAUqzNo5M6Q82HRhyTDfiTvtI5fQV9l
 uFPwAeUkWH6uhV4UzTrD6DHcIH2OxLysahl2p8P8byuGbOwbbzl67SmWkPRe59KUTlA+UOgd2Bl
 z21gqNDCzKjmHuhGNy7l3ugBiqhlliYky/o7Hmgp8s+qV3NfM/OGokhaF7bX/lUcc3DlyiWqb27
 0b12hrFND/TqWkqtooQJox92nW53YeMq8NSjEst39YGB5Bc/j+DwH8SZLMGGZKpev5UeufeZPlV
 Oqlv31TRt/MXYYz4xHSF46UZDTCOcGfBHxs/boSIli3Z4inAqwFevBv7ZM79XDmZ3XvXFsUml+c
 XUG8AGGTfhbulpu/as+0vcus4i6RiI4zQxUmODfEbWp2i57Tta6UYpuVJbWLyxhEbhOND6MSvdV
 dKijYmfPrWQbdd5znQw==
X-Authority-Analysis: v=2.4 cv=aNrAb79m c=1 sm=1 tr=0 ts=6a85c281 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=MVsHzMdaoZhIBd0MKPEA:9 a=QEXdDO2ut3YA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-GUID: -KcM-zKFyYnyDalhDA396w5OYSYhnkiC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190115

On Wed, Aug 19, 2026 at 7:43=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 19/08/2026 16:38, Rob Clark wrote:
> > On Wed, Aug 19, 2026 at 7:21=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 19/08/2026 15:26, Ekansh Gupta wrote:
> >>> On 19-08-2026 00:43, Krzysztof Kozlowski wrote:
> >>>> On 17/08/2026 06:47, Ekansh Gupta wrote:
> >>>>> This patch series introduces the Qualcomm DSP Accelerator (QDA) dri=
ver,
> >>>>> a DRM-based accelerator driver for Qualcomm DSPs. The driver provid=
es a
> >>>>> standardized interface for offloading computational tasks to DSPs f=
ound
> >>>>> on Qualcomm SoCs, supporting all DSP domains.
> >>>>>
> >>>>> The QDA driver implements the FastRPC protocol over the DRM accel
> >>>>> subsystem. It uses the same device-tree node structure as the exist=
ing
> >>>>> fastrpc driver in drivers/misc/. The approach for binding the QDA d=
river
> >>>>> to device-tree nodes while coexisting with the fastrpc driver is an=
 open
> >>>>> item described below.
> >>>>
> >>>> No. Grow/replace/improve existing driver instead of coming with a du=
plicate.
> >>>>
> >>>> That's a standard upstream requirement, basically given on every
> >>>> upstreaming guide.
> >>>>
> >>>> Please watch old talk from Greg - "I Don=E2=80=99t Want Your Code!".
> >>> Posted discussion threads here[1]. Would seek comments from Dmitry,
> >>> Srini as well.
> >>>
> >>> [1]
> >>> https://lore.kernel.org/all/3476b5c3-7983-4994-a901-3d7d8bd75255@oss.=
qualcomm.com/
> >>
> >> The rest of the comments is still valid even if you did not acknowledg=
e
> >> them.
> >>
> >> Anyway, regarding above - again, watch the talk from Greg.
> >>
> >> You have ONE driver. Not two.
> >
> > Long term, moving to the common driver framework (which did not exist
> > when fastrpc was first created) seems like a good thing.  But does
> > that not allow for some transition period?  How can we get from here
> > to there without otherwise breaking userspace?  Is there some other
> > precedent elsewhere in other driver subsystems?
>
> Yes, Iris and Venus where we agreed for an exception (two drivers) as
> long as new driver supports old hardware / features.
>
> This is not the case here, right?
>
> >
> > I suppose drm exposing legacy fbdev on top of drm drivers is _sort of_
> > a precedent if you squint a bit?  I'm not really familiar enough to
> > say if that would be reasonable/possible in this case.
>
> Growing old driver does not look complicated itself. The only a bit
> tricky thing is to present somehow exclusive interface to user-space,
> like usage of one disables the second etc. Depending on actual
> differences in that interface.
>
> But having a duplicated driver is a clear no go and it is well known
> upstream requirement. Nothing new here.

Would it be acceptable as a first step to, by default (ie. when no
cmdline override/etc) for the new driver to bind to new compatibles
and the existing driver to old?  Ie. have both drivers but only one
binds on a given platform?

BR,
-R
