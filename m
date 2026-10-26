Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793025362;
	b=pscMgX7DNF710nXHLJ0/FC3qdz0SVL7vW7lNwkOZfVjyQGILMrXhOoMWekh65U3FOYuP
	 aTbKdudUOo0lh92goG1QcDENzWL6rgfo+lNpuE401ZeoPu6a29mTTIv1D3TIvht+dric6
	 2EnfJ6qylONxnTs0NTYMQVnnkqbEC1Duq/MJbB7fA+kjS80vMfgsHzxOxdyWoD/OjYUrH
	 qayXN3KMHXk9GI0hbzeTWwxIb1DRi+pyfEcLPU3aWC8O2fCuYM5oGnKq9CE4f5tcjOeex
	 5oBYn6FOjvfKJ1a3VX8Vn1mRBnDiHShDEcFVMZEItmooHs1VyqlK3dUOkaRSGaDqY2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025362;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=S+JRRDApvXRAeSSQCjaG1QiBvyJih1Y3MB4LV83KBHg=;
	b=mUxlza6USiAil7+4V/ENxoCtTDWszxg5Q78k0EH4vaI8+Les4I5u35venomwkYzN+xge
	 AUTBE4eWFgHLUuLHtjoyLkEPCmIGs+DnoUg6e3J8AQkvzq1DFNFIomlit8xn7hFln6G08
	 pwdwK511waQAcLTz11Rz1fGEvYD1LRapizqfzajQ0TaWpfFoP/DLlsQKv/OlMg2oo9xfF
	 9kHAGV/iAEIi2zH9K+VUARQMxwFKfGjYNICtoOEniwhmG9G1Yqdz8KpuT/edlBzdQqMw+
	 7c2Lgz8bR9qysZvEasbUsMPT3pMcBDdZh3/d1lc6QYdmfRzg5TRCnAR77aOu/MTbRDg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EHGtbtwJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="CkAXmMK/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5375606A31A
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 14:36:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5375606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EHGtbtwJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CkAXmMK/
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt2QP3632933
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 14:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S+JRRDApvXRAeSSQCjaG1QiBvyJih1Y3MB4LV83KBHg=; b=EHGtbtwJtHX656L0
	VCwtg6AIMWk2kc4VhCpy8BWuEiOX4eTg833nYFQPfNAS0e1Hm32ueIZH3vikGd/S
	W0DQPIwix96napKYa+NEzFqVbi0QvIRnGtHR0vIs1O8X3fDf2tDIsgmTPbruSBiT
	7OCgWwybDzHuZIfN3hNKCX9jp8miV7Wyz8tTAX2FrMp73u109AmcLa6QYtqZR6pz
	7njnIOiAJurQ5/eXVE/LXxqZi+DNqIRXWjfztmTEdhzGVBSbnKh/NZZgQrDDhZoV
	AwwhDjvfRY5+ktep083DpFvUAXFsnYomOZdC/jkAsou5Jq+B9sJ0UPAYcI0d7xSG
	zXRc1w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4sf10pq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 14:36:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93909014c85so635456585a.0
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 07:36:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793025360; cv=none;
        d=google.com; s=arc-20260327;
        b=Ld66f78KF8e9Kph9eFAPwV/A5iYU6xgg21F278xGi6oxkj05kcX8uG0WFijbhNAaY/
         mbDZFXpFIGrmZrhq/DgWVBH7UsijDXGFT4oR4Mny2BqFwzE8vmJUi/trcxlo7ax6/Wiv
         HBQwz25dkFk7JGUvu0DEFBwd6eyDI0CpfaKGaGHyQJXqw7Lfoz4oPZfUdAgoGUQX5+QU
         a+tQ80nP6y+R/gA50274GPXBxwrpV6CljolElmRwbtmLqI8pTc68GShlKmBcRaQwSTVe
         hcCGq/dwAZXCZCZ+PV9StG4P39DCSMaGZ+D2EjoC5k84subHIMmDunVcDeslp9IUcY2j
         mhxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S+JRRDApvXRAeSSQCjaG1QiBvyJih1Y3MB4LV83KBHg=;
        fh=iEdi6//zBoBPpHboR17Sf7fMx2OcPZKz3MvevLj2XPc=;
        b=RcsHXcRB38OmrejklGThRxJkqjkxgWbPe/Dwu29SJRNZK7160+yEK9QenUY09FT3+o
         Svu2E0VU+Wqx8lfjcwPb3uOF1tWzXg87sIw2/a1ARR27zY+NnKbEfDKT5oHPIphncIUb
         dXLOHOLaLb42wmx7ZEa7t7K66HbNaQA6QiiMGy3b1by2ej5ZzEcBHbnaCL2rbdblwGPF
         0fpw/5R4i8VqqI/ZrXbEea3Qfr5Zq4sXJv5W3AvRrf8S86FADCS1rb4l2Dx9E5FeRjN4
         Kf4mjwVjfnpjUFfjsKT8vAUh525E/1DufPStW6Xmz4Nw2X74C4UHzsjd1P0KT3JoIdfh
         N/2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793025360; x=1793630160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S+JRRDApvXRAeSSQCjaG1QiBvyJih1Y3MB4LV83KBHg=;
        b=CkAXmMK/gDoEX2QkKcjbi86v9b25SoBtQ+PnErD6dSQ1iFKJNypYKQa/uU1hgPYmu3
         iFVZ9CgVpzGd6a6+Vh5x+cCJBGnVaNXZc7EmCykRznOMZf4+97zU4jlCplAAos54BDD/
         JmUBN0t7C0VLUqdV+vYdMg2A/2oxdmO4WScc8Vpws3wzUw9+SWPrHou542u6cLKKnOwf
         hwtUd3hFcQKa787D2cEfzmOee7cjxs2BjoFP+eW3SaAq7eQMfCiYtyIHVMn27SCad53/
         hsgRndS30VYXm26qtRO56dGJbL25fXn8CvrlHij5mY+S3XOLhtDQnHAkDdie8Rb7xRqm
         l5vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793025360; x=1793630160;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S+JRRDApvXRAeSSQCjaG1QiBvyJih1Y3MB4LV83KBHg=;
        b=XT3zcT4irKSgEuTF3+/UoJKpMZRY+C1aiq6C08wloS1ZPkVetN15alE98InluC88Za
         SYLsb0zFSvB/sqlE8U/HHNYNA5l8iXxLb0OEHqvoG7c9lpwQrvUAt7rwV8OWYGUDP/Wf
         ZydgHaQrDMCtxR7ovee3N4R/Quxc2jnuJQFapsVnoUspiUyi/IRygGTCIzc+MkyAXVe1
         Z23HNivy71HzDocPNLMHWSL6+nIyEjoV4cexN+KNklg3XMmig3WCpU0vpO8A/X3p5AMB
         ssWSEcqIhayN81W8kMxJbRMrGClra8G78ag0FG5W2Sx3RbLoY/v6unqYwUF47ye0LOrZ
         u6gQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOpbkYIWrici3I4vhQJrKPfQ6iuBvq6M+E0NKkmwqew7t72Bj27qXZITsnW2+0TwSbHbQpHjoRn7ffLA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLIBzHEi1NYhVqPgivr85jUHpH5RgyFPZkk4Ju7qvJIwiXc6LRw
	zRlitj42/NbxPMDtIQjB91RIRE3lwRLjdjEe8j9agNaM4xKZbPPhG09HEKR6NRpflmnWjqbrAaq
	qdzJnrpIq9ifepDUaDyAT08eJDl8PJICga6vfH6TP2CftJl3Ucjg4LjObq+CtNBVe6uR9bLdKmF
	luVMnsdBpNMwoRtgYHN2hpABgkQwBkx41sxgoWvm7p
X-Gm-Gg: AYBFou1YdcKz6nkkvUDpqzdXuxbZODBuJkW7zdrq8QrMg733/V95LAB1T22Nf5D4TER
	LTlJyV62dpTFrL2cB2ol3UNH8Yur4bFEqz9WzUfMAA5fgcrCO2/8EXsSHmsOqpDGzFuXmR/p6fT
	MEITxk7Nuw/8jM92ZV1Otb1C30aIZ+gDca+I8CmtH7et1I2JopEHZxfy7uXv2PF8KLzECt+VhZf
	NrktpcsT61sj7yvGOCA8e78ZvqVG+IcpzAvLHKlt4Hx3BaU/4mBX5NTB5Ipm9lTm1bS9ZnURjmj
X-Received: by 2002:a05:620a:40cb:b0:93e:c12c:f11b with SMTP id af79cd13be357-940ef94ce57mr983805085a.71.1793025359843;
        Mon, 26 Oct 2026 07:35:59 -0700 (PDT)
X-Received: by 2002:a05:620a:40cb:b0:93e:c12c:f11b with SMTP id
 af79cd13be357-940ef94ce57mr983798485a.71.1793025359283; Mon, 26 Oct 2026
 07:35:59 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com> <20261026133726.3249235-5-atanas.filipov@oss.qualcomm.com>
In-Reply-To: <20261026133726.3249235-5-atanas.filipov@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 15:35:48 +0100
X-Gm-Features: AclHuK-WgnrBpFbnFE8ORrtoTXmqjFg3GlSY6-dUL4UNW227jGN0ErEq6Mww1OE
Message-ID: <CAFEp6-29k2AoJq1+Rv8a3GE8Da1sZ4E9-RUd4ez-EwOajx0RTA@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] media: qcom: camss: share VFE clock sources by the
 highest rate
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1OCBTYWx0ZWRfX/mOr2vjCWfCV
 O/1v2Y8EP2IfS7m3bJuUFrrs2SDPh51W4InF9PMJltP+EepDPDNHU2MiBM4knk0UsIAbmeFYvDd
 yEupMGeJzXGjJTRyuh2eRurG8DTmWq4=
X-Authority-Analysis: v=2.4 cv=ZOdCCn7b c=1 sm=1 tr=0 ts=6adf6550 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=cFAwxtyTOyGjYM3jHOcA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: BdOwNl0sHgzH022H5Tl23MfT92qn9SVf
X-Proofpoint-ORIG-GUID: BdOwNl0sHgzH022H5Tl23MfT92qn9SVf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1OCBTYWx0ZWRfX4ebMpyvi/ybw
 e9tMZAxBqGvwm46EGWJAn58N16HQUfh+lSw91A4BYwNRNe+sbx3cVeOLD2PD7xJX9Ne6NlnGjl5
 vmWgBpnUwRCHjVD6kWpDLmFpZeX0ofKhk7SrLvogBCpEPCUd4O9eTo1GiSohz3AnALrMbwHr4e3
 vMxPn4DOuLxeiZn9EEjtZuW7z9chL8SOLcnyMq5Ciy1EFDS6ZQRlmDzKStoIUn/SvWgdt1uCl0o
 K+uBU5Nn5OFpeIbtz18ULJQs658CcIaNNDxcqhdZAwP5dn0hhbyIjdTGlXnyDcCi/N1c+HgYVZ3
 WlxxChZyzTIfj+NblKzNccQcPkB8KwXrdwPispB1WrDtZ77GT1FEWBk1Y92JGw3cOAH0baNwNug
 1LNGN1Z3OnjDSbL2g+Oklac9ibskxXisdJe8aUQ0X0olp7Bbu+6C8W9YNP/UYpE/nkj/ZGcv3qc
 MjYG0DwhnnHtB9UA+IQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260058

On Mon, Oct 26, 2026 at 2:37=E2=80=AFPM Atanas Filipov
<atanas.filipov@oss.qualcomm.com> wrote:
>
> Clocks of different VFEs can be fed by one clock source, and each VFE
> sets such a source to the rate it needs. A VFE started later at a lower
> rate then lowers the source under a VFE that is still running.
>
> For example, on SM8250 the two VFE Lite share one core clock source,
> which the VFE sets to 400 or 480 MHz from the pixel rate. With VFE Lite
> 0 streaming the CSID test pattern at 480 MHz, starting an imx577 stream
> on VFE Lite 1 sets the shared source to 400 MHz under the running VFE
> Lite 0.
>
> Request the VFE clock rates as minimums with clk_set_rate_range(), so
> that a shared clock runs at the highest minimum of its running VFEs.
> On power off the VFE drops its minimum and sets the clock to its lowest
> listed rate within the remaining minimums.
>
> Rate ranges are enabled through the vfe_clock_ranges resource flag, so
> far only on SM8250.

Why? I think it would make sense to use it unconditionally.

>
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/camss/camss-vfe.c | 45 +++++++++++++++++--
>  drivers/media/platform/qcom/camss/camss.c     |  1 +
>  drivers/media/platform/qcom/camss/camss.h     |  1 +
>  3 files changed, 43 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 359b5942df89..30504e614e4b 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -1016,7 +1016,10 @@ static int vfe_set_clock_rates(struct vfe_device *=
vfe)
>                                 return -EINVAL;
>                         }
>
> -                       ret =3D clk_set_rate(clock->clk, rate);
> +                       if (vfe->camss->res->vfe_clock_ranges)
> +                               ret =3D clk_set_rate_range(clock->clk, cl=
ock->freq[j], ULONG_MAX);
> +                       else
> +                               ret =3D clk_set_rate(clock->clk, rate);
>                         if (ret < 0) {
>                                 dev_err(dev, "clk set rate failed: %d\n",=
 ret);
>                                 return ret;
> @@ -1060,6 +1063,37 @@ static int vfe_check_clock_rates(struct vfe_device=
 *vfe)
>         return 0;
>  }
>
> +/*
> + * vfe_release_clock_rates - Release the minimum clock rates of VFE modu=
le
> + * @vfe: VFE device
> + *
> + * Drop the minimum rate requested by the VFE from each of its clocks an=
d set
> + * the clock to its lowest level, or to the highest minimum rate still
> + * requested by the other users of the clock.
> + */
> +static void vfe_release_clock_rates(struct vfe_device *vfe)
> +{
> +       int i;
> +
> +       if (!vfe->camss->res->vfe_clock_ranges)
> +               return;
> +
> +       for (i =3D 0; i < vfe->nclocks; i++) {
> +               struct camss_clock *clock =3D &vfe->clock[i];
> +               long rate;
> +
> +               if (!vfe_match_clock_names(vfe, clock) || !vfe_check_cloc=
k_levels(clock))
> +                       continue;
> +
> +               clk_drop_range(clock->clk);
> +
> +               /* Round first, so that the rate respects the other users=
' ranges */
> +               rate =3D clk_round_rate(clock->clk, clock->freq[0]);
> +               if (rate > 0)
> +                       clk_set_rate(clock->clk, rate);
> +       }
> +}
> +
>  /*
>   * vfe_get - Power up and reset VFE module
>   * @vfe: VFE Device
> @@ -1083,12 +1117,12 @@ int vfe_get(struct vfe_device *vfe)
>
>                 ret =3D vfe_set_clock_rates(vfe);
>                 if (ret < 0)
> -                       goto error_pm_runtime_get;
> +                       goto error_release_rates;
>
>                 ret =3D camss_enable_clocks(vfe->nclocks, vfe->clock,
>                                           vfe->camss->dev);
>                 if (ret < 0)
> -                       goto error_pm_runtime_get;
> +                       goto error_release_rates;
>
>                 ret =3D vfe_reset(vfe);
>                 if (ret < 0)
> @@ -1113,7 +1147,9 @@ int vfe_get(struct vfe_device *vfe)
>  error_reset:
>         camss_disable_clocks(vfe->nclocks, vfe->clock);
>
> -error_pm_runtime_get:
> +error_release_rates:
> +       vfe_release_clock_rates(vfe);
> +
>         pm_runtime_put_sync(vfe->camss->dev);
>  error_domain_off:
>         vfe->res->hw_ops->pm_domain_off(vfe);
> @@ -1141,6 +1177,7 @@ void vfe_put(struct vfe_device *vfe)
>                         vfe->res->hw_ops->vfe_halt(vfe);
>                 }
>                 camss_disable_clocks(vfe->nclocks, vfe->clock);
> +               vfe_release_clock_rates(vfe);
>                 pm_runtime_put_sync(vfe->camss->dev);
>                 vfe->res->hw_ops->pm_domain_off(vfe);
>         }
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 7fe12049b78a..80eab898611d 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -5736,6 +5736,7 @@ static const struct camss_resources sm8250_resource=
s =3D {
>         .csiphy_num =3D ARRAY_SIZE(csiphy_res_8250),
>         .csid_num =3D ARRAY_SIZE(csid_res_8250),
>         .vfe_num =3D ARRAY_SIZE(vfe_res_8250),
> +       .vfe_clock_ranges =3D true,
>  };
>
>  static const struct camss_resources sc8280xp_resources =3D {
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/pl=
atform/qcom/camss/camss.h
> index 7dc2fd9f03e0..bffff5b6bfbe 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -120,6 +120,7 @@ struct camss_resources {
>         const unsigned int tpg_num;
>         const unsigned int csid_num;
>         const unsigned int vfe_num;
> +       const bool vfe_clock_ranges;
>  };
>
>  struct camss {
> --
> 2.34.1
>
