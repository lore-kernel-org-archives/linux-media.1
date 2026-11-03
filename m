Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793698407;
	b=oftSpYBqV96y8N4uIBTGUnzVKmXo6I3VCFgrgQ6fQiJiwY5PxXuegiJtSY0Tfw49Od3p
	 10KunkPAFx7Nmr28UnZBHXT9Z/DmRmvpG7C7gMjstn+ka/b9fPtMOmOrMAP4Q5EdRzvX6
	 r4ei9rJ9o9aCsaV4CKQutVGQawdg1JKYCizOgcUMxj60mERxn5xeSbvDElSyZMYcaBhqq
	 OUIwRx7EqqH5lgsYBP6gMiGBMgLDrU9RY2pljMgnvwbv6Xu/wmMF8LCWI8QTwzzsKHpR2
	 V3n8X534SjbPWjz7myf1xA1UMr565hTFuipz+i66q9+EGkD6aUGuzNFcszJlL0VZaVg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698407;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qKSDB8GXWaMg3pOTXqhHdLoqGBpgsnSDaBVbmRvCOA4=;
	b=UqGU0THcTk068O9/DFuFlMIKCnFqeYKsfRo1XiNKzYNnzmCKWZ5pjJ+KHkp/vSQ+aX59
	 tc3u7M5kR8KyQxkrKS7X/3qqKJXJnK6ZnF5Y9q1sbAaYv1T5rPwt+M4326dMv3tMIOmYX
	 n8u3hmFGqiDwz1aEAUp/C5CSCmkBCnxvQkKvBdPodIqlEM0Se2PPVZ24/6uFxxVitkT/e
	 wzQsq0DAQStV32uvHJtMLBe/7EMtQ4Zx3I4iGikEGdl/BY6Hj8sYzY0+34kOMundHmQR0
	 0UAyZeULONjObAUJtqvESXkBlDv42W/qutvYahP5outgUkdHJJ9J6b9TkaS7HmrS+cg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Iv7tuCh4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TSP8u4IP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9CB606A326
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 09:33:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA9CB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Iv7tuCh4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TSP8u4IP
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A37r5Fl1431348
	for <linux-media@vger.kernel.org>; Tue, 3 Nov 2026 09:33:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qKSDB8GXWaMg3pOTXqhHdLoqGBpgsnSDaBVbmRvCOA4=; b=Iv7tuCh44+CGqboC
	S+tDXs7SWnEBRZTY08koWYlhCpcT32OFgJTzKXKgQpTcgKL5Q6Oo94r0v3locmuu
	pjVS0w2RKdDsiLbwtQKbUP3fRhnBhnDXfAEnRyBuqsPTv01ZPIxE0MR3uY4MVaBZ
	v/ygxMKoz+7V+adSNf4NHcYon2Zmc4Qi1WIxZ6n3GAJDcoJx/XyqyHFkaivoRbdq
	xeZFQz2GSmbhfe00ccnyB3km50+XscI/epeNqF3+Da7yW6sxLTX92MTsDDtFLT9p
	b+P1mRNKzXijh//bUfa2Gt36wuZ+0KIl08b8JWMXnC+cVdv8DT9mD/n8CQqgZWy1
	xGdaOg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq087318a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 09:33:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f20addba1so703180585a.1
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 01:33:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793698405; cv=none;
        d=google.com; s=arc-20260327;
        b=sQtbPNXiypeVLHz4EBSY1aU8MX0N4YKN0nLKmrNfU2jCI+ZPMu4ajePyG0F73wcJlP
         1avkxkpo2s22e2V/kk7eSXy6PUwjviC2Nf5I84ainnUxsueIdxeDyFZTNXFEadgbouC7
         E4sIr4eN/12g31cnqn8deTyB56ZREYWf6AKnsZrkmbMENbPGYVd/Kx1L37NFqu/mAcNZ
         bhHpFwkD9o/PveNIrDyQFcKLxZH3gucnuhONq13UO4ndaUWLrI3i9IyxUbQFRvOvkn58
         humBRY1irbenBeMqRufvlJwS9sLiwLgO32AGaTyLVpl1yGCvkRAme+1vd3yk59XNkG+R
         G8CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qKSDB8GXWaMg3pOTXqhHdLoqGBpgsnSDaBVbmRvCOA4=;
        fh=Yv5N8DHiRRokCido6m4uSeDmNPGiN2W0Vhy+PsEHsqY=;
        b=cG/p2BCQX9wUE+Xw+NxKo+fXLFkqss+qhDxPvnQTJ4A+rZPrwMIVGlBrQ03gLPJi6e
         CAdQAuQTaycMW/q6h/zHF1qp/Se5UoP7/HjV325GJ0ktDnIHgyQwjSG7mwrAVUialts3
         SiakP7Z2CnmVSxs4eG7m6gE7z/OHd1e9mt3ttOpthkoneipKczNcI5tK8KZPtYUVlxaU
         UNSGRoLSnQIOXrFKCguzBBClVUDx22mrtDBBMDC/GU+fLwrfwfmcJU+Qwq1Fv0mDaFcp
         Scd0Vn2UfeoElmVKG98lwD46rOWFjIF37093Z75/A9dxJqi4ybUB2jxUJHFRHLOU6+LZ
         9LOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793698405; x=1794303205; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qKSDB8GXWaMg3pOTXqhHdLoqGBpgsnSDaBVbmRvCOA4=;
        b=TSP8u4IPna37B++prxYE/LAi7sHIVeGPxivsaV5QKF9CxFQIfLgotVOpSqhDyrF2Ah
         RVErf346Ge4dTRkfqShk4jPcrnWq0VmS/4VRLK3NmSFEs/Nd+ImY0PAG7ZVkQsgLHjgJ
         lnvXnryncBPcUljhqiY4d0fbbUzpAw5QABKsrPPEc3upwetZueYopfcH09hPDYFo86n7
         beASvvMIb/1Bhl+nrvqx65myMiJeO9eBoLfAdyX8GIlZUfecJcZ/iZmh+4ivxhib2bP/
         E+Lq30AQv/Ev63nJkBfYEZoZLwBL5I2IIpYWZayc5sKuNa7VOYABl8QQXMbcLoGaFtcZ
         qPlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793698405; x=1794303205;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qKSDB8GXWaMg3pOTXqhHdLoqGBpgsnSDaBVbmRvCOA4=;
        b=BRVfHR376QZHpG/FqUmGwovJnzktFWI6bjK5oh9bMcUuopulPH7/K2DSawhdRaur6e
         i63a9uF+au5n1FWDdCuHDRauzAAIP1G8HZt7DDZkh/pybNFdbWsl7ajRsOhsJo5rg563
         EGjqfF2JO0MkrJPuSFs1DUftuWxeCOHZ/GlSAvHsdM1kRzq9Vo81glfVxm9ARAjDnv1Y
         P1XWqdJOKefwiS2WEUD9ljKlxP9VjVKt66h4FWH2VuO22BkEgOkzdGH+ezCexY/TCcBN
         lZpHoXj8e4wntACc6x+9GVps8vRrupGIE+B3rGVcJz2M0yXwbkrKG9KL2vCKuK8eU3zb
         7rmA==
X-Forwarded-Encrypted: i=1; AKwUvBxMy5E784X02cNx8f+HYGzGY81mXEuaUJBlBHva4Ra5NDxjNaaL5FRnuFdKS3y88dCujCvOb79+ccvECw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9kmpmgSZYw1kFYJ6xncMMgVkR/Z5YJiFtmbebopWejeJXZ6HPC
	yzt22FexKFHnWbPBkAPcqGt6pN/SEuivPHK/323x2JdH1YEGzpOV8WfMYLAg53t4q7AuOhkGEPb
	HCcL7VkY1zQNPPvaknwQqngeVKyFv4QbhgcgHtAez0PXHPM/5G6FvdkLk4WoyTLtNlXeL2QRxSY
	2CRb4pOHQ05OTj1w9G4uYLFvCN+nI+3dBSN5/pMOCl
X-Gm-Gg: AYBFou1ZkALxTEYBf52WEdqLmr1I1kGY895QNbHqfl1eu6EafA568RUKYqAt9UDGR7C
	LS7fqEd/nnHOO4yS2c+ieHeRujf/2CfDT7TKxFRH+ZOpMmwlugcof0GPYetKm1wohTaNp56PHpW
	qNbTevMh+4aFw4d1+dgK32JewFHLBJ9F3ahLnMI0yadvg8EbEa02R7MKizIKXvLVVHyt6EjYq1t
	pIEL5IY1dSeQm8WeZx2HNCEKG8I1xW0gCQfZUhb3Sd6rnZqt63CyyJyHeOx9FPBxUwZLRjMAfA=
X-Received: by 2002:a05:620a:801c:b0:93c:5958:9de9 with SMTP id af79cd13be357-94421737389mr1925345385a.33.1793698404927;
        Tue, 03 Nov 2026 01:33:24 -0800 (PST)
X-Received: by 2002:a05:620a:801c:b0:93c:5958:9de9 with SMTP id
 af79cd13be357-94421737389mr1925342985a.33.1793698404383; Tue, 03 Nov 2026
 01:33:24 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
 <20261102-v4l2-frame-sync-v2-2-25cbed7a772f@kernel.org> <8196a664-f73b-4da1-aea0-0ea49676a4eb@oss.qualcomm.com>
In-Reply-To: <8196a664-f73b-4da1-aea0-0ea49676a4eb@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 10:33:12 +0100
X-Gm-Features: AclHuK_hAJNMdcggM-t3OB-XwNys5QjccTnPIaxMgSrXRRvM5JChrPyvvoLuA3I
Message-ID: <CAFEp6-25K=DURpYM96o8vMO8pkVr8uf=r2RAP-kcM=Rme=8JgQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] media: qcom: camss: Introduce SOF sequence tracking
To: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzNyBTYWx0ZWRfXwf9cBgK0U39v
 NRTLsoINkol3W+tBX/zAspKH4KgLgZkXzgd33TZACVHZdsjo2rK77QdYPoP9bxunc78zd0Hx6kP
 R3PCZuuyPEefMwLpsnrTJEDjMChr/ks=
X-Authority-Analysis: v=2.4 cv=K9m3jCWI c=1 sm=1 tr=0 ts=6ae9aa65 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=K9HSDwGVA6T88df_oCgA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzNyBTYWx0ZWRfX50kJb1JR77zP
 Af7ELdBBDuHehjLu3cV2OOeWLloFcp7i5mnyFJLDER5mcSiO/GBTLepUyneX5XZP9s7eusfrJOe
 Zj5u3cC/ZJREiCtc6vdSlI3nYvlQds8+XvNQz/3P+CZVqtmC1Y/S3rbGoG9kH5sx7PWQSI8ntJk
 WlrvzZU5SDgV1S5li46c/g+iG4P9BROSoEpLtwofHU6YQbFtbdDyozTIGZpNG4VNtbsCE5MeKRN
 b2e3FzZ3ZFwpnssPQ3zr91czByMvRPws3Q2QZvZUydbdBRpDVb5YWgvjf0Ths66gQTwj4OPHsOD
 lfoFTY4bmlvZ3d8G3ZkJqg9C40Vut70u07D398UlVTN6GcGb+N69nYO4d/CxZlB254T+Xg8F7Ec
 mHifCoC1nydEP18fGns2gDIWxhuqrIzRZW5GBOUjoZko6HzKv5JneMnBSEAwY1xmAAoD/KwAiTj
 DYD1/x8hkj673/L2yWw==
X-Proofpoint-ORIG-GUID: C-N7b3XRt1ZIWSX-CiVPN7OnqC4RWluG
X-Proofpoint-GUID: C-N7b3XRt1ZIWSX-CiVPN7OnqC4RWluG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030037

On Tue, Nov 3, 2026 at 8:11=E2=80=AFAM Gjorgji Rosikopulos (Consultant)
<gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>
> Hi Bryan,
>
> On 11/2/2026 3:56 PM, bryan.odonoghue@linaro.org wrote:
> > From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >
> > In order to communicate to user-space CSI2 SOF events we will need to h=
ook
> > into and control v4l2_ctrl_subdev_subscribe_event. In-line with other
> > implementations of FRAME_SYNC have CSI decoders which support the event
> > always generate it in our case if and only if an atomic user count
> > indicates it should be so.
> >
> > A flag in the CSID descriptor indicates if frame_sync_en is supported s=
o
> > for each SoC that supports it this flag should be true. Since bool is f=
alse
> > by default no negative enumeration of existing or in-flight CSID is
> > required.
> >
> > Subsequent patches will enable on a per-CSID basis.
> >
> > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > ---
> >  drivers/media/platform/qcom/camss/camss-csid.c | 54 ++++++++++++++++++=
+++++++-
> >  drivers/media/platform/qcom/camss/camss-csid.h | 12 ++++++
> >  2 files changed, 65 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/m=
edia/platform/qcom/camss/camss-csid.c
> > index a00791b00feb7..e9b399fcb9c7a 100644
> > --- a/drivers/media/platform/qcom/camss/camss-csid.c
> > +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> > @@ -760,6 +760,7 @@ static int csid_set_power(struct v4l2_subdev *sd, i=
nt on)
> >  static int csid_set_stream(struct v4l2_subdev *sd, int enable)
> >  {
> >       struct csid_device *csid =3D v4l2_get_subdevdata(sd);
> > +     unsigned int i;
> >       int ret;
> >
> >       if (enable) {
> > @@ -778,6 +779,9 @@ static int csid_set_stream(struct v4l2_subdev *sd, =
int enable)
> >       }
> >
> >       if (csid->phy.need_vc_update) {
> > +             for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> > +                     atomic_set(&csid->sof_seq[i], -1);
> > +
> >               csid->res->hw_ops->configure_stream(csid, enable);
> >               csid->phy.need_vc_update =3D false;
> >       }
> > @@ -1316,9 +1320,57 @@ static int csid_link_setup(struct media_entity *=
entity,
> >       return 0;
> >  }
> >
> > +static int csid_frame_sync_add(struct v4l2_subscribed_event *sev, unsi=
gned int elems)
> > +{
> > +     struct csid_device *csid =3D v4l2_get_subdevdata(vdev_to_v4l2_sub=
dev(sev->fh->vdev));
> > +
> > +     atomic_inc(&csid->frame_sync_users[sev->id]);
> > +
> > +     return 0;
> > +}
> > +
> > +static void csid_frame_sync_del(struct v4l2_subscribed_event *sev)
> > +{
> > +     struct csid_device *csid =3D v4l2_get_subdevdata(vdev_to_v4l2_sub=
dev(sev->fh->vdev));
> > +
> > +     atomic_dec(&csid->frame_sync_users[sev->id]);
> > +}
> > +
> > +static const struct v4l2_subscribed_event_ops csid_frame_sync_ops =3D =
{
> > +     .add =3D csid_frame_sync_add,
> > +     .del =3D csid_frame_sync_del,
> > +};
> > +
> > +static int csid_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh=
 *fh,
> > +                             struct v4l2_event_subscription *sub)
> > +{
> > +     struct csid_device *csid =3D v4l2_get_subdevdata(sd);
> > +
> > +     if (sub->type !=3D V4L2_EVENT_FRAME_SYNC)
> > +             return v4l2_ctrl_subdev_subscribe_event(sd, fh, sub);
> > +
> > +     if (sub->id >=3D MSM_CSID_MAX_SRC_STREAMS || !csid->res->frame_sy=
nc_en)
> > +             return -EINVAL;
> > +
> > +     return v4l2_event_subscribe(fh, sub, 0, &csid_frame_sync_ops);
> > +}
> > +
> > +void csid_sof_event(struct csid_device *csid, unsigned int id)
> > +{
> > +     struct v4l2_event event =3D {
> > +             .type =3D V4L2_EVENT_FRAME_SYNC,
> > +             .id =3D id,
> > +             .u.frame_sync.frame_sequence =3D
> > +                     atomic_inc_return(&csid->sof_seq[id]),
> > +     };
>
> On first look this was looking strange because the id is used for the
> control id events not for frame sync. But on second thought it may make
> sense, but the question is how the userspace should interpret those ids?
> As of today userspace does not have any info for the VC and csid internal
> pipelines (so called lines). So with the current state of the code
> the id is VC which makes sense becouse the SOF/EOF packets are recieved
> based on VC. So i am thinking of two options:
>
> 1. Move SOF event in vfe (rdi/pix sub-devs) we have per line sub-device
>    and will be well known to userspace for which line is reported.
>
> 2. Add and propose extension of videodev2 documentation that
>    id of frame_sync event types represents SOF per virtual channel.
>
> Personally i votoe for (1) because it will well fit with stream-api
> support and usespace will have clear understanding of the SOF to which
> stream belongs.
>
> Given this in mind it will be good to open discussion with Laurent, Sakar=
i
> regarding SOF event with stream api and GMSL cameras.

I think both approaches can be applied independently, forwarding the
event through the VFE as event proxy would likely be a straightforward
addition.

Note that the id here represents the interface index. While it
currently happens to be associated with a VC, that is not necessarily
what we want. Ultimately, multiple interfaces can be configured for
the same VC.

Regards,
Loic
