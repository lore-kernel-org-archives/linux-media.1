Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0159A370AC7
	for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 14:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789050919; cv=pass; b=H3i6nzhpKirB8U16PgHotJ3yqXOah9T2HYkMHFklGguMRIoH/xibxD4Rch+m65j+An5t/YWYOjExLqUmtUbuYXUHxwZjwieSCtf55PCnO6fVTaawnwlI9a6rqrLpUQjYyswEfSSgojsjLUq0Q6YuytSdlQrvGr/NJFDlmWdB3hw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789050919; c=relaxed/simple;
	bh=L17jW+nhc8y1D28H4hUsSAjmsNdLIugvjTy77S1ogVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rZ7pEf+Yo18FElpXcSrXJwX/L/iVQmBXDGBYZW5rBa00XJGd/f5IpEs1H+HJYojXBapoU3hQ91EheQ4MXJUUtRrYRXA0Tn/SpYp08srGtXiak84GLCQU5F9ifOrgES4bnL7ECtVikZ9CgoV376f4A7e7qscodXCpQjgRsGdkd34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kvUNUCO2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L9g5d/8z; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kvUNUCO2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L9g5d/8z"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ADqdYG1151133
	for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 14:35:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=SyGRoRxzrS9S8txyYHsaj+mP8c0hLvS0zXlhKlwEOiU=; b=kv
	UNUCO2klR7aLImxRdmF3Z15bCCdCU5EZ044eyqPngnL+uZc2RhgiuUz+oYZSZdZk
	56VBbETrEa6iL7EveTRjlur3uW1cPUR8TpFbH7ux3fULnwgdH73Eq66jGz3uedIH
	S1eDkBNwgvZwelMdRg0X4ppMObzYbdzHa2mwMkXbwBHnwKeIPrdPCU01MpdUXHst
	Ln7z+MenafPgon1Jf/YeZUwTfBGQiw9QBJyW9zcPPwm5ciwljTxyDM52S/YgctM0
	CJI6nyL6EDCtDa0jFBe4jaLWzRO7reSWTqPHMDPiMLA2eyOaXleFZqmYKKhlvMeY
	erm7mCpzN+ly0WgiLwpw==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwts08tt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 14:35:16 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b38ea4c6acso4487843b6e.1
        for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 07:35:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789050916; cv=none;
        d=google.com; s=arc-20260327;
        b=LeL074utwzlXY81PHWMwoBb5laxmNgSkRASVhpM1vtx3VbTTb8CwOkqS5GumFGPVHr
         RduYj82xQw5cdnMBzgt9IUCmxQHY3Ikv0I98pzjRpsJxMNLhf5V5DHAm3cGt7ucJ0lkS
         FGb190vCzTTN/OgItIk37buBRYDr0JeMM/yQaMpDlslOjAI72JZfqQRbYdWACbivTIhV
         PQWYZaFSM1Tq0+grGN1GpUM2ujUhW4yqeAro2jm7MJM81xbCW0PRE+RdlDI245aOUC0V
         qICMkhoCJhhPvOSqfAl6xyG9tiZhph/ItY52TeWA+zGbpel7gRQPu8LpDOdaYGWCw9+c
         Io+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=SyGRoRxzrS9S8txyYHsaj+mP8c0hLvS0zXlhKlwEOiU=;
        fh=4vj7m5670rQASgfXxoQDVHN9l48b6f4pMl4bYfGjBbs=;
        b=FZtgoO3brdcbvL7Np/xRcj3kmW34PPRA9Re47F4kgsU9Qcb38gNOZ6gK1J+5eJKE9p
         TDtftHmiBOR6fMVjbL0rkKllRysDXiaq5psLwVkvu6eFikanmr7uRkLZSQi948nlWdGf
         7tAtprFCymPv5psl7rtVB5/1+GRCPlehtrhCBt+VwtMA/o8uSGSupy1WOCa/OQCpn9Ml
         91ovjcbYt2H7o9PhB+cGwdAMEE/S6FRua4kD9p78Qh70Z4AzVMTprgpYUbrb7A6cPjPH
         ANgH+Lc2nEobCiwOsLofbz+uyPRYbHh3mFyfdCnVnNbAFmJheGUK80v/33D30KLy8rlV
         3KMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789050916; x=1789655716; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SyGRoRxzrS9S8txyYHsaj+mP8c0hLvS0zXlhKlwEOiU=;
        b=L9g5d/8ze32ezW5HnboK52M5N6wBOmm5MrvJ7lHHQWK7vlAbjAb8CQoJUDhtngBf9l
         Gl3ciVGildZII90dxV4eQZ2+732oI0+y92YOrdswm5huf6Wt7AkvooLMklW33VURkTXe
         ngW7D7F9fZQgBQ+7j/IkEWFjZSp6E875HWKYHXqhQ3GHw5Wr6+nHp/tUTUL4CKKEitd7
         lcEyvi+0q1DL7uEfryyZvZUY9JqBXpufAEKZh1X/t1T8MP0716bEOy4xvq+Yj0D4HZDj
         A1ssklGQs31bOHjamcW2gw3+Nt8PFsguEUbRiQv1/CooSTOMAq1hxN8bssOZMUFqqtAs
         jmQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789050916; x=1789655716;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SyGRoRxzrS9S8txyYHsaj+mP8c0hLvS0zXlhKlwEOiU=;
        b=Rw4yRNnesnfI12FumXiKcfZIbDoTNsq2EaHu23HUWht9RrD6Tv+gYSXSPnZ4S4+DAu
         Og1jyvV398FvfHyhsh7pJkC+djkj1xVYTqRx9Ae7/Yn752bsH3EYTKhcZu3SiJxKEb5p
         r4he71tyAMAzIs1V1luThf+wv/sxWT3COe3K9pbvOSb19U4hwS/Vdjh2jrbZFv2OZ9qI
         q/APv1W72h217aeVY0yzhS5fKmi2oIHUHW+p/Fv8+P5ZQWWAjzq4f1du6rBCj7U5RXkK
         WKH/8QQvehXtkJxXwb5W1DDBK3UM7IDLhMvoc0s9VVYZu1xG2EMBdo5wGzEaXLDmGv0J
         yBKg==
X-Forwarded-Encrypted: i=1; AKwUvBzvyO+LCsU0rh9OMXyN5H0Ya0lQ+gEr1A/am8ezlppksJXRhGJ3HuLjaqMG06TGMARwWcftQMbBwWu4Tw==@vger.kernel.org
X-Gm-Message-State: AFuF++n+ZgRu5cDQ92PRLdi4fifW54yJUuDfMvVwO6sLv633WZ1eWBPo
	E9LmaYxz3yCQR3Equ3QziWpOdNLbZg9TK5dIQYQDOwJiDjty870OHPShW/q4yEt4cqWQtbuOBvs
	ajDSlFjmvFVZMVuL+/dDu1vqKiYOz/Wv5eRjlyM1r9agRyK5I7c+GUZJ1p7H+jiM5Iv5MBh7fCq
	TyEd86Ug1mQos32MEKiSqEmUXed7IgR8jTwawctTJ8
X-Gm-Gg: AYBFou3ONLEZxQVDa3qPt4hhrDJGY97zWxvJdhZNzbkYOb5lMwtG8URuWnqmFspXt4+
	xD0LEPGaVxbtzEMB5UwuXzbseWV1xpeg9vqdCsH4QxpwP2gBhvq6JVZzSfTpU3yLeCwhE5dbXkT
	HnyfFLA650l/v8+9nNJKQVDZKctPuJTrod9OucBKPYuMYpPhwjgHA9H31R
X-Received: by 2002:a05:6808:1c0b:b0:4b9:a88b:8890 with SMTP id 5614622812f47-4b9a88b9027mr20758193b6e.38.1789050916047;
        Thu, 10 Sep 2026 07:35:16 -0700 (PDT)
X-Received: by 2002:a05:6808:1c0b:b0:4b9:a88b:8890 with SMTP id
 5614622812f47-4b9a88b9027mr20758168b6e.38.1789050915578; Thu, 10 Sep 2026
 07:35:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACSVV01T=ytVJKM7NRoBTAJm7vH+JPJNT9Tftu5X9YskGXerwg@mail.gmail.com>
 <e7b4eceb-cb3a-49ea-bed9-728c958594b0@kernel.org> <CACSVV03ypjBYkhRpt=TyDwOKhejKKke3x=Fi_TvxXN-5U_rCsw@mail.gmail.com>
 <fb834ae5-7113-4a86-bb84-ca5115c8d7ff@kernel.org> <CACSVV018jB4WRRJ_CUHQmkHXZcqauWJXWGgrzY_HA6cFQ+Q3Xw@mail.gmail.com>
 <dd3da35b-1db6-43a4-ae1f-35620692f51f@kernel.org> <CACSVV01o_XYuSzaYGbo9pY=459qiA_fgL_KRHVJH+LH4RYcMzQ@mail.gmail.com>
 <23e31249-cce2-421e-88f7-1a2af66e34b6@oss.qualcomm.com> <aqCKgM1yCbWjFdgO@baldur>
 <rh5ufacfap4x63rjmgd76wlwgn3n2wuelpe4sqwy4yda27nsiq@lg4ltoqwz7ba> <aqK3QiR3nsXtHTwL@baldur>
In-Reply-To: <aqK3QiR3nsXtHTwL@baldur>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 07:35:04 -0700
X-Gm-Features: AcwNN1WgxDRKonbfwtEs2Ayl__oXzThTnTjcC11fJE9LIXFOVR04lHCeSd6EFRM
Message-ID: <CACSVV0273TW2Ws8KfcT0BUS9O7ERWo7YUnpwgVndFYHjE6_yWw@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] accel/qda: Qualcomm DSP Accelerator driver
To: Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
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
        srinivas.kandagatla@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=PIaaavqC c=1 sm=1 tr=0 ts=6aa2c024 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=r1Mlh0iZuFWrlC140wkA:9
 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-GUID: VX_4C8sTCfxEcrEmRhX06rwmr8bX__2O
X-Proofpoint-ORIG-GUID: VX_4C8sTCfxEcrEmRhX06rwmr8bX__2O
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE3NiBTYWx0ZWRfXy5uR4qWWJwR5
 DY9WbbnmTjQkSR3+k9gRZ9+QhLr+u7T0dTBgcherDVNhKNbacI+APvH96ZiGnfWQXr/BYrNxmVz
 lhbOO6hdOPCrk1y+2Ldt2nfjf6fO74w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE3NiBTYWx0ZWRfX3myIeJP8Cckc
 VwFOU/zk25QNVvee7CisTVQFFzvn5iQyqL9e5q73BXMqqowmvwKUOnzZ4mcS5i9AcqVueDeUIXs
 Uon1maOAXAg87tJBLZcGeShqSKa8Q2RPycfWjUb2lEQ/Fpx7zL3+Ct98L63KK9VefVYu787dTz2
 NyUlBKRc99u57+q0KYXVmaP9RBumwEcyvxQhFlqtOJMOZQdIc3a9r2t+RErYgFHqAH9OKlq/oOb
 C2Q/TmUnU/NC9gZhf8HaFzEzYXkn2QgpIQZtEEiT6hLpfPaox+W8W/jdlaTbBhTfBWZ6EkeCVb9
 /cQDzUCvLPj5Mbk+hY3nMKXZtnuQnLqO5J6S2pVZHbvAGUADhwqrbv82dZbU+FFnt7qWw2RvcJM
 P/xU7HZII/fcj4zypV7L0Qtkag9iLbMDmW7VpRKBqf3/kMEvHCxPGiKrF5gI4kazJGEwbr/oZTL
 CkqpL0p0y+0nQMwN4ag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100176

On Thu, Sep 10, 2026 at 7:25=E2=80=AFAM Bjorn Andersson <andersson@kernel.o=
rg> wrote:
>
> On Wed, Sep 09, 2026 at 02:48:17PM +0300, Dmitry Baryshkov wrote:
> > On Tue, Sep 08, 2026 at 05:44:10PM -0500, Bjorn Andersson wrote:
> > > On Wed, Aug 26, 2026 at 06:37:00PM +0530, Ekansh Gupta wrote:
> > > > On 20-08-2026 20:17, Rob Clark wrote:
> > > > > On Wed, Aug 19, 2026 at 11:15=E2=80=AFPM Krzysztof Kozlowski <krz=
k@kernel.org> wrote:
> > > > >>
> > > > >> On 19/08/2026 17:48, Rob Clark wrote:
> > > > >>> On Wed, Aug 19, 2026 at 8:27=E2=80=AFAM Krzysztof Kozlowski <kr=
zk@kernel.org> wrote:
> > > > >>>> The rule of usptream development is that we do not accept dupl=
icated
> > > > >>>> code, just because a vendor wants to write something new. This=
 is
> > > > >>>> basically the concept applied all over the drivers tree, where=
 we pushed
> > > > >>>> back against all sorts of duplications all over the vendors.
> > > > >>>>
> > > > >>>> What I miss in this thread is why would there be any exception=
 here. We
> > > > >>>> do not grant exceptions from standard practices on "I want" re=
asons.
> > > > >>>
> > > > >>> I agree that we should not have duplicated drivers just for ven=
dor
> > > > >>> lolz.  But when it comes to adopting common frameworks and inte=
grating
> > > > >>> better into the ecosystem, this doesn't seem like something we =
should
> > > > >>> actively discourage.  I don't think this is a case of vendor lo=
lz, but
> > > > >>
> > > > >> No one discourages it. Following standard Linux kernel practices=
 and
> > > > >> requirements is not discouraging, do not twist the narrative her=
e.
> > > > >> Again, it is standard upstream review telling that we do not dup=
licate
> > > > >> drivers. Ever, unless there is serious exception needed.
> > > > >
> > > > > I wasn't trying to twist the narrative, just trying to come up wi=
th a
> > > > > path forward that isn't "no" or "improve existing driver", since
> > > > > neither of those gets us towards a future using common frameworks=
.
> > > > >
> > > > >> I asked why there should be an exception granted? Is the reason =
for
> > > > >> exception following:
> > > > >> "We want to adopt common framework"
> > > > >> ?
> > > > >
> > > > > Possibly?  But I don't think we want two drivers to be any sort o=
f
> > > > > long term solution.  (Ie. as long as venus/iris have co-exist.)
> > > > >
> > > > >>
> > > > >>> rather reacting to drm/accel emerging as the standard framework=
 for
> > > > >>> this sort of driver.
> > > > >>>
> > > > >>> So how do we get from here to there?
> > > > >>
> > > > >> What is wrong with my proposal?
> > > > >
> > > > > Maybe I missed something, my understanding was your proposal was
> > > > > "Grow/replace/improve existing driver instead of coming with a
> > > > > duplicate"..  grow or improve doesn't move us toward common
> > > > > frameworks.  Maybe "replace" is a valid option.  If there is some=
thing
> > > > > I missed, then I apologize.
> > > > >
> > > > > Options I can think of are:
> > > > >
> > > > > 1. Hardware cutoff.. new hw gets new driver, existing hw gets exi=
sting
> > > > >    driver
> > > > > 2. Backwards compat chardev registered by new driver, providing e=
xisting
> > > > >    UABI.  I'm not 100% sure about the feasibility/drawbacks of th=
is..
> > > > >    AFAIU the fastrpc folks where planning a backwards compat laye=
r in
> > > > >    userspace, so maybe it is possible.
> > > > > 3. exception?
> > > > >
> > > > > I'd like to know what the feasibility of #2 is, since at a high l=
evel
> > > > > that sounds like the best option.  Possibly limit exposure of leg=
acy
> > > > > UABI to existing hw so we don't get into a place of needing to ex=
tend
> > > > > the legacy UABI for new hw?
> > > > >
> > > > > But #1 sounds like a non-controversial place to start regardless.
> > > > > Possibly with #2 coming as followup and necessary step before eve=
ntual
> > > > > migration to new driver for existing hw?
> > > > >
> > > > > Even if we start with #2, how do we handle first-merge-window
> > > > > bugs/regressions without reverting addition of new driver and rem=
oval
> > > > > of old?  It seems like we'd need a window of a couple release cyc=
les
> > > > > where both drivers exist?
> > > > >
> > > > > Maybe others have other/better options in mind?
> > > > To all, I'm seeking on the approach I should follow to go ahead her=
e. I
> > > > can work on implementing #1(as per Rob's list) with hw specific
> > > > compatible for v4 if it's acceptable.
> > > >
> > >
> > > I don't see any reason for you to define a "hw specific compatible",
> > > because as you have shown in this series (and as Rob point out), ther=
e's
> > > no difference in the "hardware".
> > >
> > > The only reason for your "hw specific compatible" is to make a softwa=
re
> > > selection in Linux - and that's not what DeviceTree is for.
> >
> > That's not exactly true. There are protocol differences. For example,
> > polling mode is supported only since a certain timeline in the history.
> > Likewise other interface features are not supported on all the FastRPC
> > devices. For the polling mode support we were already beaten by the lac=
k
> > of SoC-specific compats.
> >
>
> I can see the benefit of capturing some of the generational features in
> a compatible, like the changes related to address width. But for pure
> software features that doesn't have an actual bearing in the hardware,
> I'd prefer if we relied on dynamic discovery.
>
> But none of that applies to the question of "can I use compatible to
> select if we should use the new or old Linux driver".
>

Nit, driver could still have an allow/deny-list of machine
compatibles.  Might be something to keep in mind if a phased
depreciation strategy was desirable..

BR,
-R
