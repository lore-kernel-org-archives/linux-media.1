Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793288814;
	b=1qAgeRi4q1MXzZvkRQLcOW2z4xp8q/6fjdC5MuLKJZGHW6RiT1JlRXY1SCH0qhG3x6oS
	 r6rv274LSp72ElE64+EpJFNq+mr0MQtxCst33XPyx7utuj21dUSo9SM0dWvAzaMH7jpW3
	 ergOuX5viA7C22qLRJtbkQV0OucVaFO6gG1Dlu244f3vvewz/74HMnb7nH1bY7KUmFH7u
	 nGUmR7Kw8ZC3yebNOb75H2HFWJtqRaRm4Z+MSynUgvbB0GBO9IGRokrvYQapiXgK0c8gb
	 VG+neT8GgP+861YRoYfJo/mpHN/xA6//S0BNSxZg7EpAdXpyErFZ1rqpE8GSWbV9+tg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793288814;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=U5k7ep/bgn3vdewOJj/rsgNI+AnmG6o0USKHcFo6h2g=;
	b=xTxgZKGkr1sfs9Nx7JqvaL7ENXeBjyZUe+ASYwiuuF34ET4CM/Hg+RItJJl7EmOXLP4G
	 XCTRo3YijmB1+zXTE22DV8qPBihWE2E3VIdbydUMxNgsjYXqi828YO5Qo+fzHzgarS8W9
	 H++vxL4bKEIYeUZoZdxenoG/QVv+NSgXFTlJfnCzW4vqlcAPrvWt8ViG7ExajSK5UsB2d
	 ziozP1VURqd4BV8BjFLB60sljvuss3fiUu/COYVPmZajJQjFaMGsqdYtytkUA1FAZDl1k
	 9xWjo6v6lf4czZlE3U7DjvAOgH46OAWHF2Um9/Me6eSfGwEaebvLBzHcp31HY5652kw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LVsOp0qL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I0kEtLQZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDCC606A325
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 15:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEDCC606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LVsOp0qL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I0kEtLQZ
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCe6NK3944008
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 15:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U5k7ep/bgn3vdewOJj/rsgNI+AnmG6o0USKHcFo6h2g=; b=LVsOp0qLhcYVcsik
	p9Vh8cqrpVhZ25bJ6bZCNQ4+y29Pji8XE03dp7QH865xOaxNjXUOg7vqhG8OO5pg
	QFIap1Z6F74gPfv6TL90/UOm4J4E+etmyCZlQJOS/idUSFj6zGiYjYV2HiE5/bOz
	3Sl2tZNzkRlvKjigaMP4AY81t7Nd4/Gz6IsCWSxJK5WVFx6hL4VRYqT8/86K8dJ3
	iGXAzmfKNbP0R5tWfZUh9+xQ6EJwnymeJydZK3j3bOOfFb6IwcsC87BmZ9L/s99w
	v1Y1c8EiZ/wFgMsuFasuVhz4MIpUngOFHfISM2tX+5JLZouy1LieV176OOF0UVEJ
	wN+bnw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm42fhbyj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 15:46:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f3969a2a7so324671885a.2
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 08:46:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793288812; cv=none;
        d=google.com; s=arc-20260327;
        b=XgFS5c9cIr8atITJeF62OA8D9766cyE0SZ1vzDk4OigEXCSszJNu6gcApjIYfxD4Mr
         pJgi95DjeVjRiPssqlHW73HuHlIQmAlHAOWkdiiVkOUG462KupfjLDcDAKUvC6rWGifo
         RD/o/ukrMXz2rw/if1nBthinsNETZk2l6Q9VCp04OKzVToOCwsnqggZxj2trgbcfOnIZ
         iUY9NZcso1Ygf15RMUCHuxKvHKFJp+UCaD1VYAATic3drmUS2mTncxCxPk85B08Lidtw
         crUwHDOWzS7yF/2tclZBMQCm2X89Fnic2f3h8/nK9i9yIpA1JxPVISkCS6koFdHooInL
         Xilg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U5k7ep/bgn3vdewOJj/rsgNI+AnmG6o0USKHcFo6h2g=;
        fh=uT8VMNRKsEIjAGh+2qhCE2+aZAsJxdKjnhUwBbOhw2M=;
        b=QXztEV451cKwnS/ohVYhAf3Byj2ZnDd/HjdYYS1RerNJGHjaBR2/afhrshR9J5RK1G
         tMdPgVUQXuG5yukyOvQQLfI0XlgVUcYKHsKKeC+dwm5o2cYTmPYnGXtLj4r26SZGCmih
         9jDdABtbiQxs8+b/XcEfiZBqwVHO81CRYdrGVQlRiYvqaNsAcIl1UsxIBhMgs44Oln+Q
         7cdMtGMaE1K+P9MC2JFBPlSksa2GbfPTzkx4M5VziHdgV2+7XIdHlUY10Nd6JMqi+XCl
         aWD31AGgHraPR9485uLdmYJ2jNAk8d5DrU13VcUGedSwbgWWUFsUnKW+p5I3bbJ5TSqB
         A/Lw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793288812; x=1793893612; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U5k7ep/bgn3vdewOJj/rsgNI+AnmG6o0USKHcFo6h2g=;
        b=I0kEtLQZ5FWySmkoeXx0IjZhmDaiQZm9UIp4C2TF+/dPMcqgvtBuz7I+g/8pEfYn0F
         D/Lday1v6JXM4l3MBkcgLJTIMcp8jkUtnzdod3S+zXDr/JldwSb7JDbR7th4tDW/PI+r
         aNk9IVj5Ghe0ivs8i0E3bwdIr2IPtzBHn3qejZ+IICHe39JJgIDOAgMplqRFRauXqqdk
         TFufWRom815JPyadNASzzddMDlJ1f2Hsu+5mb3Chpfw9lWIP6DuVylpUHHGPpOPgPEUF
         aeS9LOj4EdsWUpOHwuACqUzWuhjUzVTbIxrq/Nd5hI7zFc2jAZJTn13asD0SHyT6OwKq
         a/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793288812; x=1793893612;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U5k7ep/bgn3vdewOJj/rsgNI+AnmG6o0USKHcFo6h2g=;
        b=bbMktlN3HfWaRtrThqjTh4rOjGXyarATIGdQSNUsR2XROZuscNilXhlnujBo7HpvB0
         Hi55dTTj3l4qvrjibHne3wAtiRccqZdprTR0gyKmsi1ghR3zFLfylc2qjVIf/eypIwY+
         zTtlQuX8fJQvotCSua/kzhJR7aPND9s1cOa4UXHOoLfY8XMpGFRfc9cxrWHPxlffhycX
         31jBViBVcQMTdxqMOzuKxMKvwjdsgtRPeOnk1WElLH15tg09tQkAAjqaSf6sl1gz1daT
         7nRHIJ7Qj2t73LdXyygAU0R7f/xAiM17bEObLPTsT96MsNbyhpGkqxgiDU502aAG3rWd
         1HLg==
X-Forwarded-Encrypted: i=1; AKwUvBxCjxRzZ92T3PvbldMnBvmOAul9O8SsZg7Tlyg607TFsk/uE3QWL6skCaZFAHIHsjZ4UTSferBbmDotZA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKYCZH086zT4jdf6A8d+/i/aL52d0GPx67acbNOWZ2ySjoU28gT
	4KyxPBznQPlItcG2q8o5PEouY4Jfd30VCIeiN3pxxKoSKPU7dldW72A3qxrV1J55y7geL2GIG3d
	xqEvV2slcIKxt0eDv6vC/esn8Z5fAITLtce51Oo7XLdVKHifnO/4Fgi7ptK0FhAB7ufIKJ4xdpz
	CO8mxaCqkVB2Ly3wjVvm6HmkwJwd/j2838+HwsI5R4
X-Gm-Gg: AYBFou0cGrQWLPecug2RBQTzwNGRuim99gOZNpDiUJGF+8UhjrGhWtwnVq0id7imD7n
	bPmoOQ0zYB6ACb5DJqHGvx0vyY7YKBoRqVReIaaKq1r5UebRlZTDnHREO1S6EFtV9w2Ao798qZX
	RQyp+Vj6nC5o9W5fWZvyKPCL+tMs1yPy9FhdvMgdG35JWoyeD1vsMrSzqfgY1NQKZM6KJWIoye5
	+W5onX2AJJZV8TRp8gf2M0N9cysiSrm47nlFtBDYRy9befffBDgDTGuynIKanDQ9AN/1FB8Jvoe
X-Received: by 2002:a05:620a:1a20:b0:93e:592d:f5a2 with SMTP id af79cd13be357-944089303camr914161285a.11.1793288811673;
        Thu, 29 Oct 2026 08:46:51 -0700 (PDT)
X-Received: by 2002:a05:620a:1a20:b0:93e:592d:f5a2 with SMTP id
 af79cd13be357-944089303camr914156085a.11.1793288810985; Thu, 29 Oct 2026
 08:46:50 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
 <20261029-v4l2-frame-sync-v1-5-d37992559c58@kernel.org> <CAFEp6-2ykusk85REekU3mmFw=4g3yjB=doOi=i=1LS5JEe4T3g@mail.gmail.com>
In-Reply-To: <CAFEp6-2ykusk85REekU3mmFw=4g3yjB=doOi=i=1LS5JEe4T3g@mail.gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 16:46:40 +0100
X-Gm-Features: AclHuK_dWimsnhoH0_XzQl8ZjHm1ns8Wq8ivGHA1U2MkUrMeF4i5qln3flFwdlc
Message-ID: <CAFEp6-1Y=OyFHPnGER0GvGfTpc4o3_wTvXncvLWM81T9M-7+kA@mail.gmail.com>
Subject: Re: [PATCH 05/14] media: qcom: camss: csid-gen3: Enable RDI SOF driving
To: bryan.odonoghue@linaro.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2MSBTYWx0ZWRfX+7VtmKtdDT59
 B6ipiHO3rXjwj9bMkWHHldygyYL3OW9oQi/TvPDm8+3zj6ofWJaEyYhv3xCKwHG3ykDtceVFmar
 kMPQL26jbkYQagXMalpGqYeJzMczEkw5whK/uvCaR/ElGYfiS9X1p3SsolsPQ6mhwwZdYemTdpy
 pvmttwtPwKmPEdMSTPiVol5HDKGktaV5Q4sTv+oJSVeo3t6bmulfACzeTwGcyF9w0A2uQROLl/l
 4mWSr0sVW8PmQegYH2OZ3CqWMT3SjIjAG1IbBE5v6II1Y86OvZBur0Xj0VLK3ldu5CMogkamPDj
 u6/lezhMxl3NiYJoRjw/au/qhGQwBKxDJWHWm67amHF+HyA0+aT1vJfMUTMd3VRhMR9E7QXb+O8
 0sV5kn9jEUJ1/FdxS0JEDPuMDC0vLJoCMg+GHX0II5rVznlT/Qm75lXflqRanLJ2u9owaa7PZTQ
 201KgZ+wyDDdey34i2w==
X-Proofpoint-GUID: 3lMCkrUvNxOBeOSpkfICMMTO7zFulD6a
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2MSBTYWx0ZWRfX+7QnWuPcHsBs
 q4GtYNLA/iTw0fzfVVWGm+WNg6xnTQS0xX/e6hSimYOfDH40jNY6bGb3iqXBtgCc2Vj2ZNz4ACi
 H4HQJAedTS4SZgS83I/YfZboa9WfFPc=
X-Authority-Analysis: v=2.4 cv=UN9Ijyfy c=1 sm=1 tr=0 ts=6ae36a6c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=qRbGgoc3eL5JOgqkpqAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 3lMCkrUvNxOBeOSpkfICMMTO7zFulD6a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290061

On Thu, Oct 29, 2026 at 4:43=E2=80=AFPM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
>
> On Thu, Oct 29, 2026 at 10:55=E2=80=AFAM <bryan.odonoghue@linaro.org> wro=
te:
> >
> > From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >
> > Add in silicon enabling code to generate SOF and trigger the routine wh=
ich
> > produces V4L2_EVENT_FRAME_SYNC based on SOF per standard v4l2 behaviour=
.
> >
> > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > ---
> >  .../media/platform/qcom/camss/camss-csid-gen3.c    | 27 ++++++++++++++=
++++++++
> >  1 file changed, 27 insertions(+)
> >
> > diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/driv=
ers/media/platform/qcom/camss/camss-csid-gen3.c
> > index 0fdbf75fb27db..6a538d825f78b 100644
> > --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> > +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> > @@ -34,6 +34,7 @@
> >  #define                CSID_RUP_AUP_RDI(rdi)           ((BIT(4) | BIT(=
20)) << (rdi))
> >
> >  #define CSID_TOP_IRQ_STATUS            0x7C
> > +#define                TOP_IRQ_RDI(rdi)                BIT(8 + (rdi))
> >  #define                 TOP_IRQ_STATUS_RESET_DONE      BIT(0)
> >
> >  #define CSID_TOP_IRQ_MASK              0x80
> > @@ -58,6 +59,9 @@
> >  #define CSID_CSI2_RDIN_IRQ_STATUS(rdi) (0xEC + 0x10 * (rdi))
> >  #define                RUP_DONE_IRQ_STATUS             BIT(23)
> >
> > +#define CSID_CSI2_RDIN_IRQ_MASK(rdi)   (0xF0 + 0x10 * (rdi))
> > +#define                INFO_INPUT_SOF_IRQ              BIT(12)
> > +
> >  #define CSID_CSI2_RDIN_IRQ_CLEAR(rdi)  (0xF4 + 0x10 * (rdi))
> >  #define CSID_CSI2_RDIN_IRQ_SET(rdi)    (0xF8 + 0x10 * (rdi))
> >
> > @@ -219,6 +223,25 @@ static void __csid_configure_rdi_stream(struct csi=
d_device *csid, u8 enable, u8
> >         writel(val, csid->base + CSID_RDI_CFG0(port));
> >  }
> >
> > +static void __csid_configure_rdi_irq(struct csid_device *csid, u8 enab=
le, u8 rdi)
> > +{
> > +       u32 val =3D 0;
> > +
> > +       if (enable)
> > +               val =3D INFO_INPUT_SOF_IRQ;
> > +
> > +       writel(val, csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
> > +
> > +       val =3D readl(csid->base + CSID_TOP_IRQ_MASK);
> > +
> > +       if (enable)
> > +               val |=3D TOP_IRQ_RDI(rdi);
> > +       else
> > +               val &=3D ~TOP_IRQ_RDI(rdi);
> > +
> > +       writel(val, csid->base + CSID_TOP_IRQ_MASK);
> > +}
> > +
> >  static void csid_configure_stream(struct csid_device *csid, u8 enable)
> >  {
> >         u8 i;
> > @@ -230,6 +253,7 @@ static void csid_configure_stream(struct csid_devic=
e *csid, u8 enable)
> >                 if (csid->phy.en_vc & BIT(i)) {
> >                         __csid_configure_rdi_stream(csid, enable, i, 0)=
;
> >                         __csid_configure_rx(csid, &csid->phy, 0);
> > +                       __csid_configure_rdi_irq(csid, enable, i);
>
> Is this something that should also be tied to frame_sync_en?
>
> Also, just thinking out loud, are there cases where we'd want to
> toggle this dynamically at runtime based on any V4L2 configuration or
> pipeline path? For example, should it be enabled for the pixel path
> but disabled for RDI?

Obviously, if userspace subscribes to the related framesync event, we
should enable it regardless.

>
> I'm asking because one of the appreciated strengths of CAMSS is its
> relatively low-latency and lightweight capture path. As we add more
> features, it may be worth preserving that characteristic where
> possible. Not saying this particular feature has a meaningful latency
> or compute cost, but more as a general design consideration.
>
> Regards,
> Loic
>
> >                         __csid_ctrl_rdi(csid, enable, i);
> >                 }
> >  }
> > @@ -279,6 +303,9 @@ static irqreturn_t csid_isr(int irq, void *dev)
> >                         val =3D readl(csid->base + CSID_CSI2_RDIN_IRQ_S=
TATUS(i));
> >                         writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLE=
AR(i));
> >
> > +                       if (val & INFO_INPUT_SOF_IRQ)
> > +                               csid_sof_event(csid, i);
> > +
> >                         if (val & RUP_DONE_IRQ_STATUS)
> >                                 /* clear the reg update bit */
> >                                 csid_subdev_reg_update(csid, i, true);
> >
> > --
> > 2.56.0
> >
