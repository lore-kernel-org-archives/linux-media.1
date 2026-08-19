Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F373A0E8A
	for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 14:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787150298; cv=pass; b=Fqc9vVGm02rkx08WVt4yCki8HgfmMQvz04Rk9TVmujxNiMyEZXEKphiVM/ot6Z8vYCYpGGIXsbHyP+vap9qLmF24taxZU94WbdS0tUrlKP7UD2l+q4rbI8vui1TDZ3q7f8jLGfPpFP0oTeQnU5J0i6YhDms6GjQXf5DwwTN8EfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787150298; c=relaxed/simple;
	bh=JOHfuMDahWJpprTXbJI3zSINoNZd4BLeLIcmol+bfrY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eS8hTUxbhIG1OcRAYaJTnIXegas4ElRPDY26snFmP4Cu65QXpuwxJVaAd27GhYwWBvNExPvmKTXGKMfO5My3YwNjVQ3G+tqz+3VWZA62oduO4HHgWOobImGV7hmeZexULbnIIxmBMnk9vagVfa01nRQG3d0grIC4aEoGsas9Uzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GPeudUYz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IW1TE8yL; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GPeudUYz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IW1TE8yL"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JEbM0t067610
	for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 14:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=OV4Etzi0F84EHavFR+Cnl8cEpGoAZCQzZFi7p8gpeMI=; b=GP
	eudUYzAmwpt46XExjtHoL24a2I/8JX5JZHI9Hy6CbC7dO1tazpRAgFP+VcfrugoN
	qQqsW9ubazohF9DaVxrl3s/LKRe5kznPmCK3LoVzh6vJ+iebuKHns765pvdU8/jk
	Lx7WZ4bv8UVCBWYHz3m6v5/GnJT2VNZ0ww0LUj8Ylet1jPbTbGqxlh474I7MyGKO
	RI1PPcRlaETWg5xn/0/ig7ssX0OVcLJI/cDW3vOkQPZjH9SybyNVUYXczHdUhTB5
	BQOZ3N3z7a1vzgCS4xi5BbzZii7NWgVe1Zsvy1mFlVQsrVsTo6F9HCwWhsQoGkSA
	JLDz4rujLqSxMRs9pEMA==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5e5d02k9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 14:38:13 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6afead7b341so727436eaf.3
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 07:38:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787150292; cv=none;
        d=google.com; s=arc-20260327;
        b=b8dqWdXsl+2yjth9lzCypiEVM8VcNnQp+njYIUHVSZ1/0P/9Od7uBDrJ0KPUv73v9I
         Y8wquNqjSEqBfxVLdsQqPsqZutpOTCjJmq95vz57CzacB1sHjTv1IDw/z23HxXfY/xPA
         UPtXLVjMevTzM0f6uOfnKWFkVP3n36qu5Fd8dkFBBb50UeWw/959kK/7xmEDW6esCJFJ
         ZIWRp1mAmh5krjeZimmQMpiOz0zrT1RbXo8JWEYfMoyG9ctGKUDTwKh04pKkVcUJdiXl
         IIZpxmoRRiv8IIytiEw0NoWLpBaekSqeCp8OleS4U8RDMt0JZmSw9XASW6gQGj6lEo4V
         GDdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=OV4Etzi0F84EHavFR+Cnl8cEpGoAZCQzZFi7p8gpeMI=;
        fh=s7qWikXMIEG0eclGuc+huanImRh5UqC/auCeub9nqSQ=;
        b=FYghJOawrx7pwIKwjSIrivosOVuwfSnIyrgfraAXsBovdpXoBMM/AuUNvCBSILNhpr
         VYGV9UpoTL1bLHZ935u6lEv+qW/0mStUb/44CnHpTQ0neYTv9CI2HYmf0+KgHcAURQZh
         Z4kQp9oK90nljAPpqPDx7i1iuCzwV4VJoq5dh2oqPKWlgQU8ms1MmZvIPbvtZzBVCx/p
         PxevYB9oNtb04gTyVERArHo3phe5/YS8rZzMK0DLxsZIxMr9zcXtqeaOCMWhTfWWQo6W
         SBALdcIkC9z5cwqgpqX6W4IA+/q7v1v4vWuZuIiPx50pkSkdfSqotsoKOWYbiQm0ZOHY
         8Svw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787150292; x=1787755092; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OV4Etzi0F84EHavFR+Cnl8cEpGoAZCQzZFi7p8gpeMI=;
        b=IW1TE8yLpJ8IycuVnjpM7XVKslaypCYN9D/g4mBRltkoFVqRboTt1T4fvSgl9dCK9E
         8xcLgoeOKT3h1JlCMyOgcrd5D73jtqRabHDRkPT3pJbOfmXy8d4Rt5y0U+Cbny4HL5O2
         lUyV4jfMu8XHlIhl2XbabZeFXx9HuVdLoRAoP2kzblnCK3Ulg4l0nFMIVuKsnBUwLr+W
         ptGiSy+Fyn+zwLTDVNdcoYt7iDTeFBYhz6cQQ5dBJ/1X0ZPsSX7tn3fn9kQEh0nX2ihv
         99GNZ1U/YHT3DJ2ojUxiq67rdeYK7WS2St8atV+15pDqh9/B708brwRCJXJYJ13Cw623
         toQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787150292; x=1787755092;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OV4Etzi0F84EHavFR+Cnl8cEpGoAZCQzZFi7p8gpeMI=;
        b=jwo0WCJ7DU3fh+g9Qoiyd/IngSnTlUF0SSvcmApzSLkGgBYKmfygHgHbnY+IuhNugh
         M+OMv8Z+TPrPE3g+PZ9R+64C8k3bhQN6DLHPiuw7thaor0Zc88zUAeFO93xA4OUtXLZW
         /OcoZtnjTdJk/4OFCUBMpR3kGzjW3TKTfqPSOwmQdbPGn8p1JXArT4pgF/s/QZ2ZtKON
         ffRGrh24AFhrlaM6WxCi6HW9NoRllxeQTrqXEWecaLEDjRcZa5ZlMGX+GYjRzDSKjWMS
         +fQkluyq6zjBnfi5DiXV5c7ztDURBW68p5/8YdBkdFddjAl2QaIq3kplx5qh5zHT5+FS
         +6bA==
X-Forwarded-Encrypted: i=1; AHgh+RqGZ063dk9jIYYGK1JyCoJn1UBoN3OEpR8EFK1aKqFvVlOYwSl8TwhN5LfjK4KRdLReBzOFz1yHOsblJg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx05PVoDPuFi56K+86DKglhbEcgEJgMfevCwTa8137ZKXyDfk8y
	RpfhhdVCJPOBl1257fY2ZkT6rAewlRsEVZVOJVNNNxmtU1nLaEUnQtwvDtx4KdkdYP+TqLuhtRr
	Bv6+7+O2HGRlx8aCYlUSF/ka5DPSTE2niKbxTCKL2QkQDiUY/+PXTFbQMELUPVXj1otahw/0g2W
	4k4bOIta4IPPM85tITEeG0YKqMlNDyOapvDGD/ez/U
X-Gm-Gg: AR+sD11fzFiWnEAYiNTUBTSmgjLfyVDfMI9vRVO+Zpl5dU+Zry5Ie8hbscksA3Ojs0i
	82PzJQ7wrKLRMUIGrqiI5GNNYL4+huHczWdWCPZhlEvgVedE19CDJyxSu2dZ2+B6xl0B+44mT9i
	Ao9WZ07khCQK7b70KGK31E3jzvX2xxjMil30XGj01vj/HrGWUO/Fy5qhGv
X-Received: by 2002:a05:6820:1ca2:b0:6ac:b1ae:6ce3 with SMTP id 006d021491bc7-6b13c69056emr3835925eaf.32.1787150292224;
        Wed, 19 Aug 2026 07:38:12 -0700 (PDT)
X-Received: by 2002:a05:6820:1ca2:b0:6ac:b1ae:6ce3 with SMTP id
 006d021491bc7-6b13c69056emr3835876eaf.32.1787150291802; Wed, 19 Aug 2026
 07:38:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <3322b42b-3755-45ec-ad55-345125f0d488@kernel.org> <10349e29-b583-403f-a89a-9a00c73666bc@oss.qualcomm.com>
 <87dca76c-851e-4cc3-ab91-68949d283b79@kernel.org>
In-Reply-To: <87dca76c-851e-4cc3-ab91-68949d283b79@kernel.org>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 07:38:01 -0700
X-Gm-Features: AcwNN1UJH0MueaAt4fuAnOTplgnMr9BZwDd-FRtcH8UIxmOIWCFCFvjMK1YdptU
Message-ID: <CACSVV01eYr6FyA6XBG0xw0yv2dydvTEhcY-WUy07mxM8WwkZcg@mail.gmail.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDExNCBTYWx0ZWRfX7NSKFd15hBlc
 11z4ZUkpPnky9DN7vEZ1XP5HCZohsIAnyNEgG2+Ruem5swugVYURR86bFBLog3Edx/sOrrPOw6/
 QscjCZfQKAUUEXVmDBmLnBNVIib2jKbpB0ZU0qj0WPPBo4sHcF+lWVtWeKuRq4dyd/A62wcqd18
 c1neV6IZPNVrtIsP2VCc/CBQA98HtvhHgi88lS1AhKgTetzUFTSduL94vqVinnJCmF8tj3exm49
 4puPTBfB/sYA+7OnXhP/XMUHN69kWh/g4mZkSe5DipmwWMtEm2i9Agg0IBMUxRpOtrRWFTDwkj/
 rhx2HrWRM1FlKO2kpeMPKdA5sAAkhRCsCQlw7CpHD7MDPRGu0oV7W2KHGUWeP2FWWartbC19d4Q
 YXVRFihHUAuZZDwMRpjd63HEgk9Aa5CcVyBeQ81qgsMt0N9gnx3PHdxNK9JKB+TlvMFd1ABd8Nd
 phO7VTx+VdFPs4rBosQ==
X-Authority-Analysis: v=2.4 cv=cuOrVV4i c=1 sm=1 tr=0 ts=6a85bfd5 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=OXa2z63zbhD_Ho30eBkA:9 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-ORIG-GUID: 5qjN72anPlvxYxNw0mH8ElZiF5jG5qpe
X-Proofpoint-GUID: 5qjN72anPlvxYxNw0mH8ElZiF5jG5qpe
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDExNCBTYWx0ZWRfXyH38wj6APnAx
 rh+XxtpTvyR99nIiIHylyXIZOvx5GRGpBZgoh+2OKCEsJDYb3RWVV8sxHcN/tgvDz2x1bZJt+Ly
 Ve2W8mzOgAN2ds1cuuJ5MkaRhoZDsKU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0 phishscore=0
 clxscore=1011 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190114

On Wed, Aug 19, 2026 at 7:21=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 19/08/2026 15:26, Ekansh Gupta wrote:
> > On 19-08-2026 00:43, Krzysztof Kozlowski wrote:
> >> On 17/08/2026 06:47, Ekansh Gupta wrote:
> >>> This patch series introduces the Qualcomm DSP Accelerator (QDA) drive=
r,
> >>> a DRM-based accelerator driver for Qualcomm DSPs. The driver provides=
 a
> >>> standardized interface for offloading computational tasks to DSPs fou=
nd
> >>> on Qualcomm SoCs, supporting all DSP domains.
> >>>
> >>> The QDA driver implements the FastRPC protocol over the DRM accel
> >>> subsystem. It uses the same device-tree node structure as the existin=
g
> >>> fastrpc driver in drivers/misc/. The approach for binding the QDA dri=
ver
> >>> to device-tree nodes while coexisting with the fastrpc driver is an o=
pen
> >>> item described below.
> >>
> >> No. Grow/replace/improve existing driver instead of coming with a dupl=
icate.
> >>
> >> That's a standard upstream requirement, basically given on every
> >> upstreaming guide.
> >>
> >> Please watch old talk from Greg - "I Don=E2=80=99t Want Your Code!".
> > Posted discussion threads here[1]. Would seek comments from Dmitry,
> > Srini as well.
> >
> > [1]
> > https://lore.kernel.org/all/3476b5c3-7983-4994-a901-3d7d8bd75255@oss.qu=
alcomm.com/
>
> The rest of the comments is still valid even if you did not acknowledge
> them.
>
> Anyway, regarding above - again, watch the talk from Greg.
>
> You have ONE driver. Not two.

Long term, moving to the common driver framework (which did not exist
when fastrpc was first created) seems like a good thing.  But does
that not allow for some transition period?  How can we get from here
to there without otherwise breaking userspace?  Is there some other
precedent elsewhere in other driver subsystems?

I suppose drm exposing legacy fbdev on top of drm drivers is _sort of_
a precedent if you squint a bit?  I'm not really familiar enough to
say if that would be reasonable/possible in this case.

BR,
-R

> Best regards,
> Krzysztof
