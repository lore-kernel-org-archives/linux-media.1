Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E98C37C0F8
	for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 15:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787153003; cv=pass; b=lcnQ4PFKKAXHMP/SlIx/e7xEC94tMGuHqNH3TvSaNvV5d2WlhTRGSn7OQF5rNvwFO+MlHkAEgkQiONLp6pAB0sXVERat4IBGgI9bFGpf2XQ0WNN4ZTmtXCx4TzmcGTWLPltkE6N6H0QVGxqHDooVE/gGgN5dkQ9HEeSK+/WWi18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787153003; c=relaxed/simple;
	bh=zgrW+FnTM1DV6L5kMs4FP8rCOUdtYt8xe+26qvHuZGA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L5NVndd4K0fTmPmQDjGU9nQyxH5WG5FgngNPQ3TVpxgUghJZ/8dfAtjSpwdRL74gs7m6rgPaysck2632l8+m0nVl2bhasjjiXX5aTG0bdTVuC/fPtCDP2EQOJfUk4RaKH1FS3fEYFZKO6AlFYFNkQCwCUDd1ca//Wj6XakK0Xp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eqtYERns; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eYfmUCTw; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eqtYERns";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eYfmUCTw"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JF26SF3606041
	for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 15:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=KBH/fUIgWYWW3/6b3lc46QqFXFbnfFKPLKLVEnp7Rdo=; b=eq
	tYERnsZTS3kFgGZ+V6OYIfQSuwal+Wyf6alsTQxpOdLChbPicqOUuXLXL9yBVLVI
	DpPL8hQD+TSwk0o8IG05G4gjVuVAj19T/RyMlhPzZbqqBkVYB8y5x0mvZZim1dON
	idZbReCveIfOKPoQSCJrzVNApr4H2re1dYjZjPK6cXbayggYeOpiBcniVOe8aStj
	ldhZb7RZiklrnboO0MquBUxcpdDAnR3aFOnL/HzIXssMdY8hn9AkeH6xDVR4tofX
	rYW5hyrLveNflJWVikkwx62Dd90MdJmAlFQG53w/5Rw6/T5k++Ln0+TyhdZxnNsM
	JzA/VA+0/v6s5OPvt43w==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5esar3k8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 15:23:19 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4a7c64fbbc6so1655023b6e.2
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 08:23:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787152999; cv=none;
        d=google.com; s=arc-20260327;
        b=HYnIJcUnkXKrjo0JM9w2XnTRnB+p9FCGBuAS7l7QUUO1FyoZbUN2pEj2xmJbpqvC50
         J1sZAZSDZSbaLRtEn1SY3gv2NkILJBhLNHc9mwihXnitSNXImVQktSB5be+03d88kL7W
         bSReToh8KDVy1Ntlg+9E/EWiGeWrhwASDPRrYniVLlJEzqrr7YNhY2/qFfVq4cYPnLGg
         1DvFLDyqVvpPBzPItkFXPgxIqNN1IL2K5qrM7IMqkzV68x8Nn20HG1Ew6GEHEdUBpOWJ
         dnc7hc8W7LOlqzLMUSrcKtblbHlXGkEnJuJnjqfhdVmuT9u+PuU8LkjNyo5ryCMg4rMQ
         kxpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=KBH/fUIgWYWW3/6b3lc46QqFXFbnfFKPLKLVEnp7Rdo=;
        fh=nxoLnK2TrncIh4+V/TB9q5UKivUhg6dsslI625bl3P0=;
        b=jZ71azg3124YVtI/hTRvHs2PDX9NQkoZrCWxdI/JJnMK3rrypCKghcJlqzvGZ+tFK8
         rvJI1EhJuscM4aHh2NUAU4nVHUazfM6bEmp6rj7B7BMO6N2517HPgVkf5gUIZsvv0c5b
         9fzDiWv1kHVJRHpvNLITVB3xtvgOLcYIFRQ9xZ6S6CCQfWZ6HEnVFMdFea76hqwhOoyJ
         aVaUwper5dIkulGX1lxQP66pn8rAwkUK2NyU8aoP9qpkuDmGqqyKdDgxak63Aj0gqmV1
         VQEP1Z2J4PGbwuv0wacLty+q0kU/d1/jalYj76d4C8++5Vey0uoYrMkVqVkxcjHKqqxO
         G8ig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787152999; x=1787757799; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KBH/fUIgWYWW3/6b3lc46QqFXFbnfFKPLKLVEnp7Rdo=;
        b=eYfmUCTwkxq1B0YAPGAqFhhD8QA6yTCL0EfVzleqxsN2syZcbAZlt6EkBg2gLIVsfN
         4JODvqapdd0NAD4dK78dK1kzb+u+W120azaDEs9X6zIDQGqIuaO2TR54XPmcFKhWHIKB
         D0N22Y6v2LBkPzYuolTcDG7ZTU1tCNlF7ju3kpeN+jDmHezEB42ajYH3jlErhkrTNwr5
         kY9KBkjljJjQ6N1+I68qDmulYTjb2XQTyavCdk66+6KW96rRQ6WBD8ruxtDszh37A399
         sQghfxvIvRWCFewONKAr/mtlezfkwvgjOIZmHBbqsdW+tSJ1BuenrqpbVDEpgzgxpwHU
         sxMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787152999; x=1787757799;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KBH/fUIgWYWW3/6b3lc46QqFXFbnfFKPLKLVEnp7Rdo=;
        b=X9ZfS34zRm6f7Ul05XhemxD8IS9u3hdK/p3CBvQOWdanXEDx17TUvhBe4A574/0FZ8
         zJuI6PNlQr6ic7sr6+p0SRgXqGWG2si/md21U0QsxLm7r8rUhJFTN2nCHvjdKcG0rvu7
         SDxX17ZYSAyY7uFMDtdCMnh0h/cJRIjyoAyj9FjuFBZ+GuMLarV0itgO8yZ2srSRZUy7
         nzCwaIHnnoBZDColywj+GqKJTBTEt1U2jy8xwxNLBrzSaJll12yGfidq64fc3AzS8PM+
         SkLi6mZKYnqvHgz0r0ZRk5E226C1DsZR3MG35qRIikB6SC5XxaR0MkG8EA6WtE5mHGml
         cSsg==
X-Forwarded-Encrypted: i=1; AHgh+Ro+MojUB2dBIsYWKvqB6+6a3SkhPtFz5USg63HtfFHDtn/6RclgDeUaHMxATY1iNx/PWJdfDfV7S1JCow==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBTUDceyx+M1AIcX/FFH+eHXjbFCTu0x856HSLkbZ7bq6f6ZGr
	/G9t0twyKPgPzvO7knBan9tDhvWznIs8D8CV8QxNx6mCrqG1Yj7ENxsoiZ5J3VWzwAuiUyoAdn+
	J67mGmWFw5WvL0xAQa8lsG+c4pLiSH/G4tDbxX6XoCVwCyhQBTyH5TlmT306DDUumFsdNR5kajk
	4NTL1e8O7Z363uYvXyvmHy1aBsAr1ijvV/M62XMPBS
X-Gm-Gg: AR+sD123senoih08Q3ouQ1a7+kC8yFlNR/sZ3dRWvXHcKvMAxcKBmF4zhTE9QkeqHpS
	pbJSZ5LPilgFGsHwGcI32nE8hsjRl3hMmA/53r6sshosBL8Et06Fb/CUVKaaiCSnwxZoU7SyfP7
	d4aDkX3lNSHho/P/RUGF7HpmOIyzQO512LzTEWJYFeV/1J5HwBJh2r9za4
X-Received: by 2002:a05:6808:1997:b0:495:eb86:6e8f with SMTP id 5614622812f47-4b2bcaa116cmr4635297b6e.14.1787152998973;
        Wed, 19 Aug 2026 08:23:18 -0700 (PDT)
X-Received: by 2002:a05:6808:1997:b0:495:eb86:6e8f with SMTP id
 5614622812f47-4b2bcaa116cmr4635236b6e.14.1787152998435; Wed, 19 Aug 2026
 08:23:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <3322b42b-3755-45ec-ad55-345125f0d488@kernel.org> <10349e29-b583-403f-a89a-9a00c73666bc@oss.qualcomm.com>
 <87dca76c-851e-4cc3-ab91-68949d283b79@kernel.org> <CACSVV01eYr6FyA6XBG0xw0yv2dydvTEhcY-WUy07mxM8WwkZcg@mail.gmail.com>
 <318f14c2-0e87-4e07-8173-1511dca67d78@kernel.org> <CACSVV01T=ytVJKM7NRoBTAJm7vH+JPJNT9Tftu5X9YskGXerwg@mail.gmail.com>
 <e7b4eceb-cb3a-49ea-bed9-728c958594b0@kernel.org>
In-Reply-To: <e7b4eceb-cb3a-49ea-bed9-728c958594b0@kernel.org>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 08:23:07 -0700
X-Gm-Features: AcwNN1WxA9fiQ0CGl4J8t7bFhD1MTRVpPgPEs_G6pBof5jMpK8zFCbjUKPrGqB0
Message-ID: <CACSVV03ypjBYkhRpt=TyDwOKhejKKke3x=Fi_TvxXN-5U_rCsw@mail.gmail.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEyMCBTYWx0ZWRfX4qjGg7qryXUj
 IEtsSmH3hcv+hGX1rWMbXImXPFAQLpAY6FP/xFKxC5HoBEWa5+4G8jgpBlFQ0DBVml5C6aSRTfM
 esg7lbYlzfu3Nmf1jNo3fjhwqUsmpKc=
X-Authority-Analysis: v=2.4 cv=fKcJG5ae c=1 sm=1 tr=0 ts=6a85ca67 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=2opUpfO7wUc-A3Q1rUYA:9 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-ORIG-GUID: E8WSV2GWjGbrJOQFMMjKwBown8Vs7GCR
X-Proofpoint-GUID: E8WSV2GWjGbrJOQFMMjKwBown8Vs7GCR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEyMCBTYWx0ZWRfX9T+MuL5FSNMT
 RBsG8wAlJ+B8+Yh3wG8nA8Kqsr/uqi7oD1+6FdDPPv/048JtTRFSNZKofAEScbAB8JFvVPb4XWS
 JT6EuZfaoi485JmfYPx1VTr90HO2tThxpJh2lQs9eDkeoGt44NxEAhs2ickIg4AVmWY46VwkybN
 MWu+CHxe2nAh0AaezKw4ZkpmsLkbMQnZRMjqGAVLPzv+m9YmfilWwIKOpicQrdCmJkwLXMb5oGb
 xTRcdy0SZSS0E77xAQ/ewIzhxgDWiCtIVgYPh0z89HW/UdTpQ2YnFo4X2Jsl4OSu1XSEWEfGEd/
 kxlRh8JkX7+jaXXzexnMGKWrgR8MrY2Giq8FiGfCsgo4mjfQw0m01V8wBvajxmU4w4UDXdJJtpu
 qz1N6izN7/Zo9NVF90MJXSkEl7jJFcoGlRv2e0soWNSITmbxsXmoFYgqAJ6IVXgsKveZk13m0gB
 E45GCy9tC4o+kEMmjoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190120

On Wed, Aug 19, 2026 at 7:53=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 19/08/2026 16:49, Rob Clark wrote:
> > On Wed, Aug 19, 2026 at 7:43=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 19/08/2026 16:38, Rob Clark wrote:
> >>> On Wed, Aug 19, 2026 at 7:21=E2=80=AFAM Krzysztof Kozlowski <krzk@ker=
nel.org> wrote:
> >>>>
> >>>> On 19/08/2026 15:26, Ekansh Gupta wrote:
> >>>>> On 19-08-2026 00:43, Krzysztof Kozlowski wrote:
> >>>>>> On 17/08/2026 06:47, Ekansh Gupta wrote:
> >>>>>>> This patch series introduces the Qualcomm DSP Accelerator (QDA) d=
river,
> >>>>>>> a DRM-based accelerator driver for Qualcomm DSPs. The driver prov=
ides a
> >>>>>>> standardized interface for offloading computational tasks to DSPs=
 found
> >>>>>>> on Qualcomm SoCs, supporting all DSP domains.
> >>>>>>>
> >>>>>>> The QDA driver implements the FastRPC protocol over the DRM accel
> >>>>>>> subsystem. It uses the same device-tree node structure as the exi=
sting
> >>>>>>> fastrpc driver in drivers/misc/. The approach for binding the QDA=
 driver
> >>>>>>> to device-tree nodes while coexisting with the fastrpc driver is =
an open
> >>>>>>> item described below.
> >>>>>>
> >>>>>> No. Grow/replace/improve existing driver instead of coming with a =
duplicate.
> >>>>>>
> >>>>>> That's a standard upstream requirement, basically given on every
> >>>>>> upstreaming guide.
> >>>>>>
> >>>>>> Please watch old talk from Greg - "I Don=E2=80=99t Want Your Code!=
".
> >>>>> Posted discussion threads here[1]. Would seek comments from Dmitry,
> >>>>> Srini as well.
> >>>>>
> >>>>> [1]
> >>>>> https://lore.kernel.org/all/3476b5c3-7983-4994-a901-3d7d8bd75255@os=
s.qualcomm.com/
> >>>>
> >>>> The rest of the comments is still valid even if you did not acknowle=
dge
> >>>> them.
> >>>>
> >>>> Anyway, regarding above - again, watch the talk from Greg.
> >>>>
> >>>> You have ONE driver. Not two.
> >>>
> >>> Long term, moving to the common driver framework (which did not exist
> >>> when fastrpc was first created) seems like a good thing.  But does
> >>> that not allow for some transition period?  How can we get from here
> >>> to there without otherwise breaking userspace?  Is there some other
> >>> precedent elsewhere in other driver subsystems?
> >>
> >> Yes, Iris and Venus where we agreed for an exception (two drivers) as
> >> long as new driver supports old hardware / features.
> >>
> >> This is not the case here, right?
> >>
> >>>
> >>> I suppose drm exposing legacy fbdev on top of drm drivers is _sort of=
_
> >>> a precedent if you squint a bit?  I'm not really familiar enough to
> >>> say if that would be reasonable/possible in this case.
> >>
> >> Growing old driver does not look complicated itself. The only a bit
> >> tricky thing is to present somehow exclusive interface to user-space,
> >> like usage of one disables the second etc. Depending on actual
> >> differences in that interface.
> >>
> >> But having a duplicated driver is a clear no go and it is well known
> >> upstream requirement. Nothing new here.
> >
> > Would it be acceptable as a first step to, by default (ie. when no
> > cmdline override/etc) for the new driver to bind to new compatibles
>
> You have one compatible.
>
> > and the existing driver to old?  Ie. have both drivers but only one
> > binds on a given platform?
>
> I don't see how is it possible to write such DTS, because - repeating my
> question - how many hardware blocks is there? I believe only one per
> given DSP, so how could you have two device nodes?

Maybe I'm misunderstanding something here.. I don't see any new
bindings with this series so my assumption is that the bindings are
the same.  What I meant was something more like "qcom,glymur-fastrpc"
would bind to new driver but "qcom,fastrpc" (which seems to be what is
used on older platforms) would bind to the old driver.

So single dts node, but different compatible strings picking which
driver is used.

BR,
-R
