Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E596B3CB551
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 07:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784534199; cv=pass; b=cZpBnte+oGlZWr6eW2VekSr6S7sOOX/6yrjzFc4/0fztshIP4VEhj5UPfJfDbwf4TjvQvyf7zY7kRb0qKWG6VTlmaQAF5kHeUzHa+xuSF95edEkechukpPcZET+DVagAXXDh2vOab7cID9zm+IM0L71acQsZq7bbc5bHtIQCGVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784534199; c=relaxed/simple;
	bh=KNawkbizrPB6DQqEzM2VoxGVA9Emo1zXV/i7J6HcVI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r/JN+tDnPO+vgYw412oG03W7tZ3rkfpHCW/bTEYNrBIu0IHcablKAj267Fy5l1EZ36kX37JNZVmxO0oyJMigUQpL6SThJYXd6kErqVHKXTarXqP8y6Mp3lL2p6t5IGSSuU+BqmeFgo9EKYeTQNYVa9JYDjYy4VlGgAhCOxfMhPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pM51J8TH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gTroU0zQ; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pM51J8TH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gTroU0zQ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6RVYP1762334
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 07:56:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tAPRRZ+TA3ldu2LmmDWYJeO7tH/NEtq5gig3wDLzRro=; b=pM51J8THMxVSmfZ9
	oV83G0nt9ndIi41r98gZXwFtTa2H+P5HW3RFnw2hef/TUvzkKgaAfPnRpntT17UW
	dtExUqziRdHdOhv6TwJKgnyOxe8HSm1EL+Ru0/xQ1zxuxBC7wChhPFLWNELBSnNu
	bwq3agvRjaXh6k9SpXok3doTlDiL1+tSPBXZ1Wk3vqcuhrQ1saSDrHn2pW9OGUL2
	iwxakjITZmBUvGk0zh8C7PPSu1MTEXDIAn9+IJoPlnK60ZgxbzqYoI2FwPIWhXF0
	tDOZBh49n3qLdQ+g69DDzVNVNfeUfj4KThZ4R1IFl+HISWmSaet9NaO0u5GbCMKi
	6tfeUg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2bnn2nk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 07:56:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e56b2b350so2253606885a.3
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 00:56:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784534196; cv=none;
        d=google.com; s=arc-20260327;
        b=pfOIpPlz3bY4fsE8m5PdzJy7+EUnvvAvYkTH8VK6O7s+9W9zJuatI0Kl0SzRqVoYzZ
         +esHY4TV0qWfYwWPozV/fcLDLBHzZFf9S36FLilmUx013fsjVgOUpSky0pXUah/sKzia
         huouOzzYxDE4nFMLvy4JMQWu+nNPs/iAE2CIrbsciVI08yaUaEysM6/mBGqcFqOcMvJd
         kWKRI+MJIxewtynbbb2UsvpU8PDYXyaamVffZ09g0fs2M9CDSQFge6kwoxgdG9NYPn13
         aNiYuaFCgf/aDCcmRpbL+7K5dpHIhBpuTjvBjbQryVIawvLLWRwOm8wjUMk/pn1IEJfq
         hwGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tAPRRZ+TA3ldu2LmmDWYJeO7tH/NEtq5gig3wDLzRro=;
        fh=4n9pzO13HG2WmihlnI0dbXeekDhpx64ATwvEcAnaCsw=;
        b=Z6sALPzCQdWJrpprGhCnJDaAci4heOaPUxpza7kXELJRaCy7kGurTIa5whT1AX6HsG
         /SnEgIhoYk5v/8Kg0VoQoEmM14vxVYeXHFEwn/bOwp/CZwBJ2iQ4ZWgkyLeTDS2CPgNp
         A2xch+1FTsNDYY4JlCIww5y9ZxwP2Vh1CXy0MooAMNk4UFjvfn/KRFVORpwzT0qZPP8B
         OqOgBFeZe3oFgRYgRJHeYl3tdnlWOIMqqATncg/2YgYOTJ/oEXB/XvXkQlMWCpij9gwf
         yB+QnmV8Xr8A2iPMlYPDO4C6GC5BXhQjv2IgUEEFn+/1ZBA2Fg1Urfb5hG2+oGpJJPTA
         2chw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784534196; x=1785138996; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tAPRRZ+TA3ldu2LmmDWYJeO7tH/NEtq5gig3wDLzRro=;
        b=gTroU0zQzShciE1licOraIhytNVP/07uFDumYXHGBM0KqK2j4GD2QnnFzGErsKsb4g
         aJPIGKQan11k+Bmra1fCypoTl6OMt7SC7XRT/4RlsxiETHmPr2kGVwr0VshwcvZ6No1R
         WBcRUnOImn3ej07USVODQpVFq3k8ot2ZrEljbtJtUWO58nztx1QUWTHoGjZFFz47DI1l
         ZmBJy9chHioin+6TpYIalB40RtMOi75Ga/PZEWe0CtfdIb4OsXrKYJgCIce4mxDvt9No
         FAtEmkVPKb7FvrYfDKLP0RXx/zSlmYFhY25Ch+2bsUkzOVQQWFgCabKKVG90Y6g3JXrY
         49aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784534196; x=1785138996;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tAPRRZ+TA3ldu2LmmDWYJeO7tH/NEtq5gig3wDLzRro=;
        b=nwv9o/rZYSjVDodyzk086ziduWWAQA60YIfT754+Wn2soqI2jgLcAzg7cy5Y6bCQHo
         ZOBmysCCF9IhjyCLwNe9Jt+0qE7EsRGlOb74dyVi/cQuEpYRWK6hBivL3CtA1gWp+p23
         G2Yvh5ALVzaYWxjTj3w24UpIp8vOJ3n7htO4mhzBDpeP57safN2uEmNET1uE1YtcjntF
         6D6VmoBs4vlwQLw8e1YON9O1wiArpx2riw6ki+R8LA26qj0h8g6HJwHRF8u9hU+NEijk
         /ToAgyHFwhWt2HZ43yqYykBwp0Q34na4lgj3nkX1nr2dVc8UKGDZ+tAo/wWRKoLdyi58
         cfYw==
X-Gm-Message-State: AOJu0YxUWA4NxuNJJcQAb3wBRyd761dXW7m8s0coPxKFpM3Ee5RDZ27l
	WE1a4+Y/wDGxfv3sDD0GKbLQ6yQzxEffsSjPQsfbowLEeFdlvfeaHOEM3vxxno7eDOReCUm7AYO
	rAwEXcWYA5uJv0AhoasvjPFF8SHWNnla3NwMiJDIN2rOx6WxS+bLFJApEHOksvjGn0hdE85uBvy
	7HN+qHWdtWfugp8Kq0xhJJZDJNp0AIq59cWbIM+AiJWPAPZ1il9NLgIQ==
X-Gm-Gg: AfdE7cmrRixdCokcAmF/RW3NLIxTfSG3MVfLKNUtPDlIAg4P/k3kPOk+mqD7mKVxcIG
	Iet22/TXDZF4FS8Nas7KQfijOvXCO00X6MItuGG3uRUMr7ghJPQljVUK4eJ08myHvrENomtpo4F
	Yc4mMGjKFgt/xwESUOZTAYrSPtLw6k9im3mz8HiU6gShJSv26WLpEu1x5G8j5F3+dhrb8wyl4XG
	4lVczrW9sqewT9i9HHBLuMD0FUkicyn2JadQwpoUXVkkMr/nQKZ+c0VX32IVC8bN4GEmHQ/W9Q=
X-Received: by 2002:a05:620a:4505:b0:92e:c118:18bc with SMTP id af79cd13be357-930b43dfac4mr1345111485a.91.1784534196004;
        Mon, 20 Jul 2026 00:56:36 -0700 (PDT)
X-Received: by 2002:a05:620a:4505:b0:92e:c118:18bc with SMTP id
 af79cd13be357-930b43dfac4mr1345110885a.91.1784534195669; Mon, 20 Jul 2026
 00:56:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717231331.1229693-1-anusha.nandi@oss.qualcomm.com> <20260717231331.1229693-2-anusha.nandi@oss.qualcomm.com>
In-Reply-To: <20260717231331.1229693-2-anusha.nandi@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 09:56:24 +0200
X-Gm-Features: AUfX_mzE5vqE9IwGS7O0FROooFx64JOH68KLJ_NIf2jV_ur-HQPARxyzCPheAms
Message-ID: <CAFEp6-2epusvgnSthNRBvOq0vONk3hu7v6tq6SF-HjnSWgpstw@mail.gmail.com>
Subject: Re: [PATCH 1/6] media: qcom: camss: Program CSIPHY common control registers
To: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bryan.odonoghue@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jigarkumar.zala@oss.qualcomm.com, gjorgji.rosikopulos@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA4NiBTYWx0ZWRfX1iNCoW4Ok8T2
 nuo7bPu3NTBMo5aQCfC6d/tZ610fnYMl9S7piQhpxjOQcQxs43tFX5w4LmAmXUcq74LikiN+bpc
 94fO+lX5VZDtxEFmJxX00yTsLICD6n8rU+CUykN8mHL/6VlQjg/1RgEQklW50kXxviaCGf6ngsI
 9/oDWCWUvtr/Ck2MZMVchO0zbk+nZeZNDS9fA13pKQ4J4GRz6iSM9me6jvshz0OnQH8WOdC/4AY
 zoqpsJYldksBDTXkVfYByPQAdjMeoGoEjBmW66af1OqDrez/5fZF2pyYYF3z5oXUgpzyTyeiqfJ
 NfKxtJSEDuygmpFsyQooBjSGiNkRDMtc9YwWuxqDJZgte30CbnKG8fQ8k25fuNcosOUu9f/DCKs
 1eA/kuDWn6fRPBA1HBLE8jfbDTZUfP/m/KDZ9h/Yiw9EHBBwyMs8o5HIy2q5PULZYrwZ5xTfB6R
 R6I63NUkyptTZqgcZ8g==
X-Proofpoint-ORIG-GUID: jizRgu9tolRS2kuB0f3GIvaAboP3tkS1
X-Proofpoint-GUID: jizRgu9tolRS2kuB0f3GIvaAboP3tkS1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA4NiBTYWx0ZWRfXxnnZxF00AF+D
 dvTj8cimqy87BKvd8FXeKroVEwwqY/XCEyz+F3+NQ5Wp7MCyPHug7wFQwhVk01uoOYqNaGXRbI7
 ANoF4zbplvIDW52UIA94a4e/fZh5WKQ=
X-Authority-Analysis: v=2.4 cv=deOwG3Xe c=1 sm=1 tr=0 ts=6a5dd4b5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=evg9lOI5Q1fJqvf7AZkA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200086

On Sat, Jul 18, 2026 at 1:13=E2=80=AFAM Anusha Arun Nandi
<anusha.nandi@oss.qualcomm.com> wrote:
>
> From: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
>
> Program the CSIPHY common-control registers during lane enable so
> SA8775P uses the required 3-phase 1.5 Gsps reset-release values for
> both C-PHY and D-PHY. Keep the existing reset-release value for the
> other CAMSS variants.
>
> Co-developed-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
> Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
> Signed-off-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
> ---
>  .../qcom/camss/camss-csiphy-3ph-1-0.c         | 36 ++++++++++++++++---
>  1 file changed, 31 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/d=
rivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 25a3554ef201..11b7a236e607 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -1031,8 +1031,6 @@ static void csiphy_reset(struct csiphy_device *csip=
hy)
>         writel_relaxed(0x1, csiphy->base +
>                       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 0));
>         usleep_range(5000, 8000);
> -       writel_relaxed(0x0, csiphy->base +
> -                      CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 0));
>  }
>
>  static irqreturn_t csiphy_isr(int irq, void *dev)
> @@ -1343,9 +1341,37 @@ static void csiphy_lanes_enable(struct csiphy_devi=
ce *csiphy,
>         writel_relaxed(val, csiphy->base +
>                        CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 6));
>
> -       val =3D 0x02;
> -       writel_relaxed(val, csiphy->base +
> -                      CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 7));
> +       switch (csiphy->camss->res->version) {
> +       case CAMSS_8300:
> +       case CAMSS_8775P:
> +               if (c->phy_cfg =3D=3D V4L2_MBUS_CSI2_CPHY) {
> +                       val =3D 0x5A;
> +                       writel_relaxed(val, csiphy->base +
> +                                      CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(re=
gs->offset, 7));
> +                       val =3D 0xE;
> +                       writel_relaxed(val, csiphy->base +
> +                                      CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(re=
gs->offset, 0));
> +               } else {
> +                       val =3D 0x02;
> +                       writel_relaxed(val, csiphy->base +
> +                                      CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(re=
gs->offset, 7));
> +                       writel_relaxed(val, csiphy->base +
> +                                      CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(re=
gs->offset, 0));
> +               }
> +               break;
> +       case CAMSS_7280:
> +       case CAMSS_8250:
> +       case CAMSS_8280XP:
> +       case CAMSS_845:
> +       default:
> +               val =3D 0x02;
> +               writel_relaxed(val, csiphy->base +
> +                              CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offs=
et, 7));
> +               val =3D 0x0;
> +               writel_relaxed(val, csiphy->base +
> +                              CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offs=
et, 0));
> +               break;
> +       }

I don't really like this big camss-version switch case with magic,
which also introduces more magic values. Maybe we should have a
different version of csiphy_lanes_enable, based on the phy compatible
or revision.

>
>         val =3D 0x00;
>         writel_relaxed(val, csiphy->base +
> --
> 2.34.1
>
>
