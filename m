Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A7E3D300D
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 09:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785403568; cv=pass; b=gOeLCkHpswx52qjPEfKaa5UJykVmvQvby1di1//oGxymg4i18S4bYHitgWqV/bdLXp27FAXW5xwcbk5cWAVEQvhY8ZmZtRbDyH4ZndBV8lX2VpN993gsWWOLKMABOubsoEMdvMCi589xJud5LcEe7KfgGVZHEv+VGA/YnLZ64Eo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785403568; c=relaxed/simple;
	bh=d6jBdyE9RvlKKjJldB/+re0AqKKURAyopW6Wd6wovmM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ANZuRwDRSkse1YBmWbbu0sWSsdsu0rgVbqGZRDKqcgwZ8FD+j1qmZmbnqk8tkYjRB31xi897p3YhdbennNttGLtQi6gcy/W4GF+6o3E5rdg1s9A2G7wKbJpoQrgiofz79lePz6HvLA11cU41HcIBaZpJgECSGyViN5/GBgO9Xgo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FDP2u/ft; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cuOk13eN; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FDP2u/ft";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cuOk13eN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U9FlR84082089
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 09:26:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qk9h6nzsDMo5dT+RocG4O8A/lOdfDKX3bHop1qBAp+c=; b=FDP2u/ftT3BNPClS
	pHrm3gZy9cvUA4WRh4VSmAjAn8keKOeY2M+hndXYumQvmD+epXd+Qybd3LYj2iYD
	FO0JxrePbPEKMOYfPbvv08aT7TDNCGRSKzm1zl4iXTdc82lmLA1hjf7BmfZpYGb0
	BVh/ydCnlydc0Cv6vhRCi+shywvSI/JiF2+rTs+5bPX7g0akiQNrz+CTdV4gnsvh
	HNRpQOunKhAj4mTrEXpVxzriOe7A/BQTv9Lpagni0UlYa+OXQstb6vmwvQiBaTTz
	s4kDRKmeAOfce082GQdk1jjNaIy7AWeNqvpB5QGEJEGDJcx+qsjK0PjkXcDVWxWE
	kWh1Nw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr3tyg1ed-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 09:26:06 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90410c668adso22357626d6.1
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 02:26:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785403565; cv=none;
        d=google.com; s=arc-20260327;
        b=qTGPy4buLvRTuc8PIoqQH3VroQH0IJYnypn4VqE+lQ5k77nZcV20kUOH6I6E6iFs1U
         a9kRVOv71mDaR2rAhTnX4gHTFw5Y6rRE2sKB7mJ0LTV0AgYwKnSEBuTrzP8VGheBZ9Nv
         ef8XLaF3sJzHCfxLPKbMRmZTAEQgunxQPph+XsXKSgHF4eHrzy/9nEUrQK7RblmvoqOh
         f1ze8vOG0rK1l61jDObD6rqflGNtommYBm/hWYB/x4dYtoMfpIHxphEw36uZfFCsvBNm
         PqJ3E7LDgv0pZ5p1bWwbaxmqWFSKwuWoK3Sy2QOCJeCj/P3h15EMhbhJM5Ocs8BcxECU
         IqjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qk9h6nzsDMo5dT+RocG4O8A/lOdfDKX3bHop1qBAp+c=;
        fh=iioYPX7U5foAV/q1PfBB80i8Sx81wov4tZhir6AA5WI=;
        b=ae66gtAWUsZ3Px6D8HyX3Pioi8/qwMxZgYkncMSum7TsueDSofza4WaeyyLuZQ3DV+
         +WKQjQgNcIIPlliPYdc9YGlnlE766cW0wyhQ1qzEZ0fBLPVfK0lz4vtYfximqSeh/v6Q
         6I+hZirIQzMpMVD5wjaHiR1OCnI1U/8KTwHFC+YF7hNTz6ItMQXcN9N+wtS2nGVTfc59
         MxynW3wgMg6GGrCmA9Ygp/KUizNWVHkLYnTE+B3hiUe8Usiu85wDAb5csp1hkvneOIS6
         e84ED4KU27jVnbCWF9uXXxaLWAVYvQMyEQWQx7IP6EKAjFSVEe0fPn6dKbaJZUrQVR+p
         3yLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785403565; x=1786008365; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qk9h6nzsDMo5dT+RocG4O8A/lOdfDKX3bHop1qBAp+c=;
        b=cuOk13eNWtReVDWgYASJpDsia4O77VPmTutmCPAhbJjCkpPViVTNsh419bGmm/lbBI
         YsuQMizzPnMD3Uc4nWuDcb3GOHGZqsn6uVaMIMVa8N+1U6i9qD8towa/ztJqTdSoI6jW
         feMn2nBF6lfwsDAqystmfkqWpOruABVb8maEEUiKdUW9JcWGrGXTblII4oihTVHH/Onm
         u9MAVI3HNNkiTVh3HobScKcI1Lai6Wrs/5+lgjrDUd0MV/ZHssKtgI32oJEyykKIh3AN
         juVNPcyG6gHuQr40YiLN+cRfVrORxXyk0kfCoIPVSNW76ijvY06yDU1NRBV0V7EsusSf
         EAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785403565; x=1786008365;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qk9h6nzsDMo5dT+RocG4O8A/lOdfDKX3bHop1qBAp+c=;
        b=BbJAIzMe4N95rP+nPM3SE8LT7hC6+GPNiOPNlnXPqZ/ziOpevoaVH1PHCzsEabq9AS
         AovMGvNTitSJoxvglydknL5/Jn4z0UFbnPBVa3sXp8p31xXje2i8AsHwoze3aSNFJKR+
         aFNHK1oMMUJMaFeEGJjCTBIAA6xLmaSAz2DIIFbC0+2MDfTxI22e9MWlFYD/nzBlA3IS
         1wDaG/n3oJcaf0MCSo2k6mXE9FWDQayXLkwy5FDFaY0qJeic1oaqQR08Nwi1QkDR2U+e
         g6lEKC+5KhV2S2HvYP0BKPGUT9An9cFyUPKjdbzFAJfdps31egBILzJqr+SZ7AkvG9/p
         4daA==
X-Forwarded-Encrypted: i=1; AHgh+Rog52ihpSoMGuTbO+xoJ9bAtQUGwwfqmh8+RVM/mFKAPwa5IyHvISNg3KKcq+B4KVm97TyeZJmQpukJxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXVub5Bwn7vqf/TdGx8S+K3S3lNbA6EXB1lPeWSGgAA2ixS+87
	1QUz+0AiJW9vL0pv+RCxOMy5rO3KQaUZTU+m/xEFDD2/PaaIXCTqNc/SYKrhAsvHuRywxLHgUZ7
	wfAdYFfO200BV0Iy5mefY3FDIiT3fhK55z+sKc5TfovlBX8NOFBl8USRCClxbrqi7A9HejLgWmW
	5zOlQnpwC4Gxidl8gGAYSTcpyGwwk5g8I1zRcO+gxJ
X-Gm-Gg: AR+sD10385pGxq1avfH92yAecwStXCHHwhUuSbi1iWE100WqtmtsnUZ2ecSt2NdXMtz
	PY61umq/hJMnuTvJK6yDnRZOJCn0C39bGyXAfuqYfm5JgTedfkGxq8t076AueGZW3DsWhtGzh8S
	nYXMesREsKQ9fTY1redwascETjIbrzrR/BS3h0qO1sN4wvdKDsKKkuxXf9i0Mw2jisUNwqpYypP
	w7H4U4hXSfXXElKoYXb5u+KkV7EYf/sZNqBzVMUjWJ6gBIwWGlxQPOsJ9vCWhClk0z4UzIYImE=
X-Received: by 2002:a05:6214:5702:b0:904:2a2a:d3 with SMTP id 6a1803df08f44-908347eb8ffmr17145876d6.47.1785403565329;
        Thu, 30 Jul 2026 02:26:05 -0700 (PDT)
X-Received: by 2002:a05:6214:5702:b0:904:2a2a:d3 with SMTP id
 6a1803df08f44-908347eb8ffmr17145746d6.47.1785403564947; Thu, 30 Jul 2026
 02:26:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717-camss-version-v1-0-7ed71fea95e8@oss.qualcomm.com>
 <20260717-camss-version-v1-1-7ed71fea95e8@oss.qualcomm.com> <a4a1dc46-ff07-4ecb-b41f-341b6aacb3ab@linaro.org>
In-Reply-To: <a4a1dc46-ff07-4ecb-b41f-341b6aacb3ab@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 11:25:52 +0200
X-Gm-Features: AUfX_my2K2kAR81YYtKMh29QHm6PVDAYVdCeK_BkR_HVuUNHZjZo17pEJloalkM
Message-ID: <CAFEp6-0ZBEb6x52dabGjF1XLgq4j6Ty3dKtMDJ1qNUTPGS+kHw@mail.gmail.com>
Subject: Re: [PATCH 1/4] media: qcom: camss: Add PM clock support and
 integrate with runtime PM
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: pddID_FlefUSfhg6LekQG_w_AIaE8fdU
X-Authority-Analysis: v=2.4 cv=JZOMa0KV c=1 sm=1 tr=0 ts=6a6b18ae cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=RhRaUx0EnXGA07yME0YA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA2OSBTYWx0ZWRfX9SWebJKMiA5A
 bRiy5GshkxYRliqXqnl/KKdMw43epKEre56MWj9cl3+0hlGYy6OoqMwSEBihk0QfvkMt7+VDpLI
 WwZZBK24/13XIRh1Y+9WYQQ/YGyyO+g5FzDOGd6ernDmucfm41SC48bq9PLYQrjEnQsb53qA6yx
 xS8umWc4v2wYlecwJSZNtVkRMbrCUMhHBSuTk5cRzbFNV02YgQZHCvcu+/mzwbLa8IkreaGsq1f
 e001pOQfew3jw/nfMx+943FUXqaa13oYKYn8Mxu4IHH19c2ZGcECgbnxLpqtB9LzQT4JEIPZM/X
 Z8ywFXUKmtBCVYlUcM1yrnascIUWWNbCcOfnBjyFxj02Mkcs70JXQwMUvUi/RObCGPOFIpQED4c
 ntnDD3SaPm1EYx8wFnclUOrxeZL95OERq/3t1uvSRbYWTF2cdCxo+PE7GiVkET+PJ3gTxXLolxU
 6JaWSj+7Zw40I5xz0kw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA2OSBTYWx0ZWRfXzotvLLbb5PWa
 G7szHrzP+hhxR7AJZnagiLmusCy8epA0qPlB+5IBVeV+rmjPEwSA+aPHgIVw+wbDSMCb1xVdr0D
 WWsNg20uCxNAmoUiZBfourKTgy5ro5M=
X-Proofpoint-ORIG-GUID: pddID_FlefUSfhg6LekQG_w_AIaE8fdU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300069

Hi Bryan,

On Thu, Jul 30, 2026 at 10:39=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 17/07/2026 15:20, Loic Poulain wrote:
> > Add optional PM clock support to the CAMSS driver using the PM clock
> > framework. This allows CAMSS clocks to be registered once and
> > automatically managed during runtime suspend and resume.
> >
> > This is especially useful for global CAMSS clocks that are shared acros=
s
> > multiple CAMSS subblocks.
> >
> > This avoids the need for each subblock to reference and manage the
> > shared clocks individually. A typical example is the set of clocks in
> > the top_group, which may be used by CSID, PHY, CCI, and other CAMSS
> > blocks.
> >
> > Introduce a small PM clock descriptor table in the CAMSS resources
> > structure to describe clocks and their optional rates. Initialize
> > these clocks at probe time and delegate clock ownership to the PM
> > core.
> >
> > Hook PM clock handling into the runtime PM callbacks to ensure clocks
> > are properly suspended and resumed alongside power domains and ICC
> > paths.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >   drivers/media/platform/qcom/camss/camss.c | 40 ++++++++++++++++++++++=
++++++++-
> >   drivers/media/platform/qcom/camss/camss.h |  1 +
> >   2 files changed, 40 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/=
platform/qcom/camss/camss.c
> > index 2123f6388e3d7eafe669efd6b033e22d8eb5cf79..6a2bf3373e8755805c8cd0f=
8fe5037b788d68fa2 100644
> > --- a/drivers/media/platform/qcom/camss/camss.c
> > +++ b/drivers/media/platform/qcom/camss/camss.c
> > @@ -18,6 +18,7 @@
> >   #include <linux/of_graph.h>
> >   #include <linux/pm_runtime.h>
> >   #include <linux/pm_domain.h>
> > +#include <linux/pm_clock.h>
> >   #include <linux/slab.h>
> >   #include <linux/videodev2.h>
> >
> > @@ -5346,6 +5347,35 @@ static void camss_genpd_cleanup(struct camss *ca=
mss)
> >       dev_pm_domain_detach(camss->genpd, true);
> >   }
> >
> > +/*
> > + * camss_init_pm_clks - register shared CAMSS clocks with the PM clock=
 framework
> > + *
> > + * Clocks listed in res->pm_clks are shared across all CAMSS sub-devic=
es (e.g.
> > + * top_ahb, axi). They are managed automatically by the PM framework.
> > + */
> > +static int camss_init_pm_clks(struct camss *camss)
> > +{
> > +     struct device *dev =3D camss->dev;
> > +     unsigned int i;
> > +     int ret;
> > +
> > +     if (!camss->res->pm_clks[0])
> > +             return 0;
> > +
> > +     ret =3D devm_pm_clk_create(dev);
> > +     if (ret)
> > +             return ret;
> > +
> > +     for (i =3D 0; i < CAMSS_RES_MAX && camss->res->pm_clks[i]; i++) {
> > +             ret =3D pm_clk_add(dev, camss->res->pm_clks[i]);
> > +             if (ret)
> > +                     dev_warn(dev, "failed to add pm_clk %s: %d\n",
> > +                              camss->res->pm_clks[i], ret);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> >   /*
> >    * camss_probe - Probe CAMSS platform device
> >    * @pdev: Pointer to CAMSS platform device
> > @@ -5434,6 +5464,10 @@ static int camss_probe(struct platform_device *p=
dev)
> >
> >       pm_runtime_enable(dev);
> >
> > +     ret =3D camss_init_pm_clks(camss);
> > +     if (ret)
> > +             goto err_v4l2_device_unregister;
> > +
> >       ret =3D camss_parse_ports(camss);
> >       if (ret < 0)
> >               goto err_v4l2_device_unregister;
> > @@ -5775,7 +5809,7 @@ static int __maybe_unused camss_runtime_suspend(s=
truct device *dev)
> >                       return ret;
> >       }
> >
> > -     return 0;
> > +     return pm_clk_suspend(dev);
>    CC      drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs=
.o
>    CC      drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.o
>    AR      drivers/staging/media/ipu7/built-in.a
> In file included from ./include/uapi/linux/posix_types.h:5,
>                   from ./include/uapi/linux/types.h:14,
>                   from ./include/linux/types.h:5,
>                   from ./include/linux/kasan-checks.h:5,
>                   from ./include/asm-generic/rwonce.h:26,
>                   from ./arch/x86/include/generated/asm/rwonce.h:1,
>                   from ./include/linux/compiler.h:369,
>                   from ./include/linux/err.h:5,
>                   from ./include/linux/clk.h:12,
>                   from drivers/media/platform/qcom/camss/camss.c:10:
> drivers/media/platform/qcom/camss/camss.c: In function
> =E2=80=98camss_runtime_suspend=E2=80=99:
> ./include/linux/stddef.h:8:14: error: called object is not a function or
> function pointer
>      8 | #define NULL ((void *)0)
>        |              ^
> ./include/linux/pm_clock.h:77:25: note: in expansion of macro =E2=80=98NU=
LL=E2=80=99
>     77 | #define pm_clk_suspend  NULL
>        |                         ^~~~
> drivers/media/platform/qcom/camss/camss.c:5841:16: note: in expansion of
> macro =E2=80=98pm_clk_suspend=E2=80=99
>   5841 |         return pm_clk_suspend(dev);
>        |                ^~~~~~~~~~~~~~
> drivers/media/platform/qcom/camss/camss.c: In function
> =E2=80=98camss_runtime_resume=E2=80=99:
> ./include/linux/stddef.h:8:14: error: called object is not a function or
> function pointer
>      8 | #define NULL ((void *)0)
>        |              ^
> ./include/linux/pm_clock.h:78:25: note: in expansion of macro =E2=80=98NU=
LL=E2=80=99
>     78 | #define pm_clk_resume   NULL
>        |                         ^~~~
> drivers/media/platform/qcom/camss/camss.c:5851:15: note: in expansion of
> macro =E2=80=98pm_clk_resume=E2=80=99
>   5851 |         ret =3D pm_clk_resume(dev);
>        |               ^~~~~~~~~~~~~
> make[7]: *** [scripts/Makefile.build:289:
> drivers/media/platform/qcom/camss/camss.o] Error 1
> make[7]: *** Waiting for unfinished jobs....
>    CC      drivers/media/usb/pwc/pwc-misc.o
>
> Please fix.

Thanks, I submitted a v3 with this fixed.

Regards,
Loic
