Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793887281;
	b=3ZKireYFsMPaegAPzluMNo7tv+43IX4d/Xkhvm/714AfNBxpXGxa8QBIq9Q4fASXynft
	 kW9Zh4kHIrghu3nelEQoahpf16sDVwB/kCYhholQwJyS27BOZm4HjfGEh7pdygd5QipHs
	 1rpLFUjAE/F4Nrd52BPsrfu9DP58USfq7ddgpDHJqDUQ/4GYTtam91aAuWjmeAZ82cYH/
	 Ag6U4e0k32tpqHAymnEdBG8/3x2QIND3Bdf8R2yxm3KiJxHVx4L8+BhX7ToIBksDKUpNJ
	 e5aoXq1wwggXuBypy6z6GLgDu4WqWC7QrG4s6jQ+s5MFtkohIbe94V898MjB8kAKfZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887281;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TyfoRLOpQ0Pv8FfbhV0tQzNI/xObjFjyJa50AzI8c34=;
	b=vWw5R+03Z6VSBepa+iYkMILnLSmFeoU+szsGPqnSfmfLVFCWXS8JNLC0u7jhb2x0Ylzr
	 HHsUpVKqTI5IJunYZIMvyu6jY1FHofM7LlEbhqKtYz7p7AxJh6zMgk/6FAKiSh2vPrsSS
	 qUbC0/PXgkwJc/VSWdBfFSvWb984I/Vh5kqwdobce5uuS4d/DjJCJQlzmXi82VfpxYffz
	 2vKV1QQbPD4XmnRQc6CCWDzxOJkRUsM3NIu+72tSnBkJglP3B0NxBvjm8Bc4Leiy/+T0V
	 bl3brdYymWC/5HaqiZcde/T1WC/gJOI9j8CGn+tCcKpUoXcNUf+E9i+4tE6i/DIeuMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mir4VC+3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M0nOVwID;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F456606D80B
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 14:01:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F456606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mir4VC+3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M0nOVwID
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tc3G1028262
	for <linux-media@vger.kernel.org>; Thu, 5 Nov 2026 14:01:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TyfoRLOpQ0Pv8FfbhV0tQzNI/xObjFjyJa50AzI8c34=; b=mir4VC+3wdUaahp5
	ktja868nO4QtXhxgHuGqpHJGfc4y3qefHLIfA/n+XKk+aIfK8svi645NkkLweAsB
	mhzHivfz1lVQdT0kkdLuxCPr+T8t/fZWMEMXrr/YGpvO3bYwy27SClMuzmhh5uZ+
	VjEOByy1YTh2qYsShbTaiUyZP7Oa0OdEmoCZM4IBdaJZh/YK+amMlhVVEDi4agR3
	kvezPwijaoYnX3c7U6dBTN+t47cyN6mcLf5TZlK30+hjp8xZNkLtcElDfUcWhut8
	bzn3BASnyFr7nUuIyMxcPnt6RuzU5QqeSkATlmQf0mt1sHLRvsZGTY3ntbmku362
	ndrceg==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrkaqa4k7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 14:01:15 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4c467e19391so2873641b6e.3
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 06:01:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793887275; cv=none;
        d=google.com; s=arc-20260327;
        b=THpD0eoBw+Udf4NnPWmfADG4mzgwcmCS4WwaEuNGau+Fz41S84kFwEUuYESoJgSVA1
         ZDqD1sFkaXG2vbzIsxso0gpnvy5qWDnJYyvqR+4PGtE2EHwFpedGRSneTcEHv4qNMnp2
         aidLVdJSEQScO2aXK8SoJtTMYE/+92xruMRXabxa9Mp/JlxxOMH81Pv4iWS5Nf8QZXu1
         Ger1n9Z0U4vxwNnZWqC5bxbWGN/5dQBCenBlpM1kkA7y7PEa2nuRoQp9c0kIeTjIUlw0
         tWePhzpPU+KOxYhkp7lkSNnwX6mM0q9l62cvDNsMM5PayrvMQxKJVIrpvSRCfZeQkMwg
         dEYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TyfoRLOpQ0Pv8FfbhV0tQzNI/xObjFjyJa50AzI8c34=;
        fh=BRSLS+flTg6kr7VjysE01BTjQl0oxQUaPW/kVypDZmM=;
        b=MNAPqZYnyL0C9Oh4THBuVWpZM1Bahm6FULncAEF0BthvN+30wBVvD8se3c1KFSMt/m
         eA0qJ0q5CB9uHYaa4O9cIZNDyrnkfT534i6DlTnlEm/pLwGeF31HKSSeymLwPsSQM52u
         VWVHBMY19Pt0qG9SLGx+1JK75cjLbkOWnOw+GnhObMuOjl7xBCwImQmfLw7bzk2cbP1e
         JsMpQh7xEoCjtddrqQh9OpNmCcl86lLQ6vLVIoZP36pA5fCY8+VXcxJwHPH9c/tsg3Oi
         m+QQw1Mz1LR4xNALCwmCLAMBzBX58AL4/EeAzZRHR1OkqHvXGGyE4k3FCJPXkMllkkX4
         qrNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793887275; x=1794492075; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TyfoRLOpQ0Pv8FfbhV0tQzNI/xObjFjyJa50AzI8c34=;
        b=M0nOVwIDG7jODMT+nQkr/TPC8EkB/nasV2CIwBGyY4jSYU5vwmQQhLJesQh4BpO4xn
         ByKd5GG/EKVb9xOrS8QfrTi1s/VkiO4XN0ckZQ5NkwfOUfmiRaV5lGoXq1FQxOBeR4Ch
         Bb4TO6mOVzv2OPHtDmYvXph0ua2eL0MudhdyP/iQl8aosWa3GRaaaIzo91LWlWTiRiSJ
         q7kaOLacFA34DHBBeGuoDcWcQ1UOWYH0rOoxD+rOZtM5fB8troYwp0qN4u5MPIk1X6qU
         E5XkkMgIxZNj6alGq7HdlfWVL0q7riFSimK14x7XQt0CvMsCWPBaIAjFiZwD1EbZLSAZ
         TvIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887275; x=1794492075;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TyfoRLOpQ0Pv8FfbhV0tQzNI/xObjFjyJa50AzI8c34=;
        b=xr/UlLcRkRGldt97UQ83OtRsEFrsV/aBwAlo1DVvHxfHMVkxKuxAHKh3iqv8Oe6Bzi
         EAl660LIR+tFn+qFJLcMgHXsl3G9rNm7TOuyn7axcfmeDjIQ01GyZUY7qCbI036xYy4M
         jDbWyruu5YSKEFfpDWJQCrYykrcKU1HtJ2lrd7F+p7zzndj2TRxPX79ns1elgyNoc21V
         WxaDqJL2Bc9ucKoTGe13xfjTNDpsGpQX7muvXjlGcSsQh6CKGh8zYgE8PHqhti0ZhDlI
         +X9OhM+eux10BJXv3fohReb3WDHkRciSc4nZAjxzC0VTyQrDgm9U2FvtyoZ9NA63ivJl
         dRMw==
X-Forwarded-Encrypted: i=1; AKwUvBxHKRpKhl6gMA9mPPr9j8F6LCJDHMK2fRvpXQJKfy9mgiRbopn80QR7ttFHpUYeSPKb88Edgwlt51RM2g==@vger.kernel.org
X-Gm-Message-State: APuU4Z+zqAFBPb1ZKdDvxjlKvpJCqyIW3QbHMolfoSuUPTLWgfzxbXY5
	VhaP8xdzH+XLLtqqXJEkcaHJVbFlBgnQp0wclMqBgJdGdI6MrfV1Wb9SHSMl/9SFCYWIdWklukF
	PbyNANQlSu5px1//fX7OvP2KO8WVZdEzJXuYQ9ZyZQJWC48xtYcg+XUoK9vE9k0pgDa2M8T7X97
	8JujJ8K2uGp/m+foC+7zGKiHbHZytDcIiVlPZPFARK
X-Gm-Gg: AYBFou3LZbiANSsspgS6dfoPDOsv1fzNmrvxYyqO7xNOqL9PnZn4CjykqWM2i0r2uTc
	p/Lm09yPe9hrFMN6cx1QeS+qV8m1RS89faSP1Se3xP6fGnBc3Oq5lidvgC0tOJOc7lH/0Pgbh6i
	/iko/DPGAedt4RN07hDVFFjTAb1PZkKPynr7DdDJlvgJX7xZig9zVXfkHhIGUkvfYJ7pQE/i58I
	xkwkh0OY7AeYHCkkiVD6rhieF7ACbhQmFXJ1dZDhGy/jHJ2iP63L+rXHQbgGmE302uCeLRyp9w=
X-Received: by 2002:a05:6808:3509:b0:50a:f56d:a6f1 with SMTP id 5614622812f47-5640dc1b211mr13019223b6e.10.1793887275150;
        Thu, 05 Nov 2026 06:01:15 -0800 (PST)
X-Received: by 2002:a05:6808:3509:b0:50a:f56d:a6f1 with SMTP id
 5614622812f47-5640dc1b211mr13019186b6e.10.1793887274640; Thu, 05 Nov 2026
 06:01:14 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
 <20261102-glymur_camss-v1-1-fcb619fc7319@oss.qualcomm.com>
 <20261104-real-nebulous-ostrich-017e92@quoll> <72064a9a-1b2e-4c24-99e2-2cc15a8dd7f1@oss.qualcomm.com>
 <a2d3190f-bfd1-4548-aba9-a186cfea878b@kernel.org> <c5af7192-c923-4fbc-bbfc-7f03e310fddb@oss.qualcomm.com>
 <fc9acaf2-f214-434e-bbe1-88e8e1af7683@kernel.org> <539842db-c672-4549-b861-4a6f3be47556@oss.qualcomm.com>
 <d586b7b3-675d-48a8-b0d4-564e571ef69f@kernel.org> <CAFEp6-25QrLAF=-KgGJ-rC9pDpGa2YgoQAMKxU-FoByu2CJpMw@mail.gmail.com>
 <1db9bf48-01d8-44fe-8dd2-7a3c84ecc556@kernel.org> <CAFEp6-1fSPP41cVFmu8=0z2xibDpHuH5Lxrw7W_rvnt+Fw9EpA@mail.gmail.com>
 <62fba00d-831c-44cc-8d3e-083a95abfbe8@kernel.org>
In-Reply-To: <62fba00d-831c-44cc-8d3e-083a95abfbe8@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 15:01:02 +0100
X-Gm-Features: AclHuK-b0A4Gh4xuvf-RvkEJ0Ayhot6Y1dIQBdbhsTwiCiM18Z5of_94siqhfkU
Message-ID: <CAFEp6-2_opRq3pj6S=2nDFxXBv0waeyGBKSxp3t8OOe6vvKcoQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,glymur-camss: Use CSIPHY
 indices for ports
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=OZoNnRTY c=1 sm=1 tr=0 ts=6aec8c2b cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=5UNgDV9Nf9xsrLWpgpcA:9
 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-GUID: 2O24RwLDs3NCodvCHN62NhqvmDexB9-X
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1NSBTYWx0ZWRfX/1kKN2ts5j1y
 A38Me1JRSn1w+Hm2cCefwGtLHujvoqqCB/LM2h64FGBAS6ciRZXOuCUqs29U0NCBR0AVVGEIWOv
 /ZAzUwrGCtoBnBvqgDcG1IAFnsH34Fw=
X-Proofpoint-ORIG-GUID: 2O24RwLDs3NCodvCHN62NhqvmDexB9-X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1NSBTYWx0ZWRfXyvR30w8J9X1G
 O1qnxjsb313Al4S2a/A+ol23c0VMa0K+r7xYGyqm2iWOCICnqP4LyUf2+SYTBJa/pd18oAkP8qt
 e1TZ3N7YmF0U29DxkIZZNIPurymPxQSWrCgfaCqwMEg+QF2UTg9ISHiNAN/cW29DJaTaJ1y7SUo
 lqP4mSYDXhEwvcYxaGlHh5Q2NbpanstajsH4VKlvW4qqwRfFjmKeJ9Jjv6e3cyB3jMoYUPwOdqD
 q+v14jHM/vkkk1mEnZNgK/iJJSsTeHX0xRPTjKpGvsqEQG5GqRytSPARB1d09l3cJpyQlHqqbKW
 +xijcDe5PWXQZy4hDZgUtl3M93cc9etrNnqKZOqj2E6/s/x0qBw9MWk15XnWiBJ7h6+pt+XB6Ro
 BiRVRrdNqQ/YickN43G7TUmp+5bW5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610300000 definitions=main-2611050055

On Thu, Nov 5, 2026 at 2:21=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 05/11/2026 13:04, Loic Poulain wrote:
> > On Thu, Nov 5, 2026 at 11:45=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 05/11/2026 10:53, Loic Poulain wrote:
> >>> So some chipsets share the same IP blocks, with some block/phy
> >>> instances disabled. As a result, we need to decide whether we're
> >>> numbering based on active instances or on the actual hardware instanc=
e
> >>> index/offset. If we use active-instance numbering, then yes, it shoul=
d
> >>> be @2 (CSIPHY4 being the third active instance). Alternatively, if th=
e
> >>> port numbering is intended to reflect the hardware instance offset,
> >>> matching the register prop, then @4 would be more appropriate. It als=
o
> >>> has the advantage of directly identifying the underlying hardware
> >>> instance, without requiring any additional driver-side mapping. In an=
y
> >>> case, @3 is incorrect.
> >>>
> >>> That said, since the bindings have already been merged in its current
> >>> form, we'll need to preserve backward compatibility when addressing
> >>> this.
> >>
> >> This is the input port to camss, so how is it called in camss, not the
> >> csi phy?
> >
> > The CSIPHYs are connected to the CAMSS input ports, which can then be
> > multiplexed and routed to different CSIDs. The mux identifies its PHY
> > inputs using the hardware PHY IDs, so the CSIPHY4 is identified as the
> > CAMSS PHY4 input. In this configuration, PHY2 and PHY3 inputs are not
> > connected.
>
> I could not find that information in Glymur HPG, but maybe I looked
> wrong. CSID Wrapper lists CSID 0-2, not 0, 1 and 4, but again maybe I am
> looking at wrong device description/interface...

Yes, there are three CSIDs (CSID0-2) and two CSID_LITEs
(CSID_LITE0-1). These blocks select the PHY source to be routed by
programming their PHY ID (PHY ID =3D PHY index + 1), as defined by the
PHY_NUM_SEL field in CSI2_RX_CFG0.

If the CAMSS port ID matches the PHY index, the port ID can be used
directly as a routing reference, which keeps the implementation
straightforward.

Alternatively, exposing logical port IDs such as { 0, 1, 2 } also
makes sense. In that case, the driver would simply maintain an
internal mapping table, for example mapping DT/logical ports { 0, 1, 2
} to PHY indices { 0, 1, 4 }. As long as we establish and document the
convention, either approach should work fine.

Today, the Glymur bindings define DT ports { 0, 1, 3 } to map to PHY
indices { 0, 1, 4 }. One could argue that this is already an
established convention, as it is documented in the bindings. However,
it is somewhat confusing.

Regards,
Loic
