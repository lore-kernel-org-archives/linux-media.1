Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792770373;
	b=J2Fq9mgtKy9tFeUhtsKDN5lecI1cLsFEe72VVS4iDC1lr03Vhw6nwf7/seGgYlhaC5T3
	 /P8njfbRtcbo2px0BMA1wIcYaXOL85eYrM345nbUndxMMBIzeTdkuazxGVwi7yjogQDuP
	 K9Bzs+0wouKh1QC95uAUOPfmGcAXBOf3SdMHzYX7fGkBOj9dhqmdZk24FA+CjoNsavtpK
	 GBNAMzH88pO8K0JIFLHWhkQrVuFPE50s8BwX0fmzGN9R194BlkjjaARrbNuPvMwAQE46w
	 3/vnXRLZD7g6x66r0vgDT/KshsKL7mq/d3d30l2IUjGjD2nXG1JbfMbyZM6opHiGoBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792770373;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=k/oZy3r8kmHxYtAFoxOlyC7doeahiTYoTHRRZtl3TiY=;
	b=wTDH1WGUA8HRNynOZBI29WlIzgCuhcPF1oJBI7qMm+8t06afhqiFjxeMAZZqNxQned6E
	 LK8DknKIclSEf7IbmJSLRotuaEmfJYBfWbd8arHO5VgKm5SzHKYRZskytGZaZvNDPH+EI
	 cv8vNkj5QZAeCi1Cg38ibKLMezId+gyCSXYbNxMEJKLJ/Ig5Tq3sXaZRwJuXsAm6UFekl
	 cF73ruR4lBf6hzx2JhVGU9xD+75g/G3zfgcC6dvmeXlJX8n3+WPxiJHI6yFxp8HDFoN1h
	 5IpGmAXrue/DEwwJE6teXZI9R/MJxqnxXpFF6Xy5IIwUAB2Np8sKCkrbsRxkqGUC3Ew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=evwdBAOC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WsNwSiDJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F9F606A320
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:46:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13F9F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=evwdBAOC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WsNwSiDJ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE5wgQ2109186
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:46:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k/oZy3r8kmHxYtAFoxOlyC7doeahiTYoTHRRZtl3TiY=; b=evwdBAOCvpQwwxFN
	ew1VktCEyBUdmDwDJZmymL2RN2I31pn9KEwh5rPGPzMTrmnvAVHP6kNrUPuZNmzp
	qQYuIA6atgpPESI7tVlDfS/m40nRPIlvta26gviZtTK4Aj8O8VIMqJUIAeRgNuAN
	HmU2YU3kdc9j0tZApI53HTOtUgVu5qudG3feTRst1IMb5N7yEymIXZ1BtKyRwC4d
	Kx1iAY/w6lg+y8D5Vguv6DYpFmTiN5CuVeqmSLjhqI4rSiU91hSAX6nS+A8aLKQ3
	qj5mLb6yDE4Lcj3cwoFiu0AbKSOgOWT5fpAqb0VnZace0f0SKCYzP7QzGb75ao1R
	UhX68g==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms4c81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:46:11 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4fb73e868aaso1560093b6e.0
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 08:46:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792770370; cv=none;
        d=google.com; s=arc-20260327;
        b=nqDId8NT8f54n1BiHrmQvHNpInb9Z/iVS1Ij0huBtAZss28IOaD7dWl/1o1LtlsDWJ
         VKrEzbDOErtXb1eRFJKa7WoSN1tZhPMWiUXF3VngbOsTWvztkXVAtQU79j2MCpJne8T1
         Qm40pdjFjfYhuPTgN+K9IXURyoqsayP+ENWMtO7C455iOkTW0bsj87ZgebzRMKdylgsN
         wFR1hV/67mlQE0+Te4kLdNlkjV7vpO+5B/xRfgLEdT6lAi+Ts4Yh3TpOrd3O61DV3gMx
         +54OTUdb7CgvNfNaXP9ZtggMrV9WUWxlMrFhvc/9p22zuBIicgszUUctd9Fm/LPLzgBC
         Bm+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k/oZy3r8kmHxYtAFoxOlyC7doeahiTYoTHRRZtl3TiY=;
        fh=fzu1rBnP7hOMO1kppp1F5j9vMn8erJWKw7FWHdlUfp8=;
        b=L0ag7CDQ+H8UMMnnL3S+UqZRqOWREKnCJx+wBfgnUNf7PjoY1wMrq+5EB6+NsBhQ3L
         agyHWblfRHM2OcVIeHvuwv63+y6H3c1A3Y7dDfwUYiI6ENdISU0pxb/M+z1lvOu8kRyk
         mrs1wsAl8z5zu84EnA3iyXsinPjLtjUdbmCzux4LZRKDfswZWfcBj+p1j6Uj7JM7tXzy
         eeluG2p4W8RxogNu7JNm6uH5z3TMpDNMB0TfW5szXrCuVrhbyyAT6CLi4e1G/D9tVDxM
         RHf69NC6ciKmqda4E6d1RmH7+lY3ftXBmHdKlvDaX3jP6g4MdLq6vEvV9vOvWgHHCwxs
         B6tw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792770370; x=1793375170; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k/oZy3r8kmHxYtAFoxOlyC7doeahiTYoTHRRZtl3TiY=;
        b=WsNwSiDJcSyHxHSjDy1D4vD09OiWpnMB3do/sPIqTr/PmBvqCEu3+E3q3Lf2uHXIC7
         XI3mfeks4v3orUS7lyDzJDjGqmNJSrv6pGa6WhcMl15IPHdSiKHFKx27cbIo0zn7PTGW
         iB5vcv0z+oCgNciDocn3V/1adwWlsA4ZN9bdc/w8F7SwNY55WJGxAdsH5ElVi6RPO/cG
         IhOPc0dgg/hQQhX3r3Lz8QeSlnttg2tTHTmLZ0en9bIXADc1brV47PklyLMBSYXMaihc
         CT524JhAUGrGfW1TAwi74Mr3SFGeEXX3H1cfmV1bLEvwftoraXv2wtO67yuKLFNhZgWE
         E8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792770370; x=1793375170;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k/oZy3r8kmHxYtAFoxOlyC7doeahiTYoTHRRZtl3TiY=;
        b=d2TcK9MkgzFeBcZBXBAcZVWn/60RiQC4LYMjoBuoPFY3NTqK2iDoSXxR5OshmZ8jcZ
         KEL0P4GTNhjn7gFsvHA9ZGlYgH06wUziT4YBvUrTnW4QnK37kscXWFU0NSvtxpnHXf/g
         9r5oUQo6dNBLvBGaKHgQPVi3DRJy3JrnINj2ImwiAMwaJOATJ+9SHdo7scrPuFBaKSMr
         PTLRLUrri41aBWWEAmjtzyiAHwiNuyMhRDSp9m2ex3dc5vJlBDGDuDLmSS3abi2oUAiy
         dnNr42Iv9EhwxcOXrFVoFDQla7dhUlc940ra3MCmxm4JmhlGLKPYQjPsY5K9Cwp3/p9N
         WQOA==
X-Forwarded-Encrypted: i=1; AKwUvBywThuuXfRx/hxiWaqh4PkYgQzax+ajReFVZeNn6IrhwaENM1enmWrGpYOdoCY47y284qIzk55ZgJlOAw==@vger.kernel.org
X-Gm-Message-State: AFq9FYL1a8yZNJHyLV6eZBRmY31XGjK4URo0lJr9U2sHE4PmAf/2qPAD
	Aj2pQ4EcbnhhU6DNaWliQMuIFPjI2H6W9Q5RBfEKzO2bvozZZXW2bGyZet0JGTksUvFLAx/LpAs
	oGS2bj0W+RqSyLZRcayMK9/Jg7DOxuMGXE6K6HKEPsEpNhQpLPSBySa1dCd/xk5f+eOeXUQ1xIS
	QohXwW+8JvY6Wy7zZ2ql6aLdsAQVlR1IaHe4iVnI1H
X-Gm-Gg: AYBFou0f5r0+MINHhkmDg3JlVXNEW4oU45UMsoemjSSs+WHpKJD98BFKUauzVV5WWDI
	xr7lMUJUm7I8YmYaHSHpJSmhhsF4SE7nnZFhhEFzCJ+RS/4PqcDhZgsPTFwHgcnI3TI55QyPiOt
	tUtqe2xqKf7tRjLABU1J3s287gtbsTFeY44s/0Zay1O6yyyfS4psUAAw5gSZ80dtIy7v54mg2Ib
	JAevzzHHKsYRSspzhJP0xNBQzJmkKR727Jk6IxlXZcQSv4f7psAzeUyaksXNH909c3fSZxTTKY=
X-Received: by 2002:a05:6808:c1a6:b0:4ec:77df:f4b1 with SMTP id 5614622812f47-55be836805dmr1796786b6e.25.1792770370311;
        Fri, 23 Oct 2026 08:46:10 -0700 (PDT)
X-Received: by 2002:a05:6808:c1a6:b0:4ec:77df:f4b1 with SMTP id
 5614622812f47-55be836805dmr1796757b6e.25.1792770369786; Fri, 23 Oct 2026
 08:46:09 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com> <20261023152857.2859767-2-atanas.filipov@oss.qualcomm.com>
In-Reply-To: <20261023152857.2859767-2-atanas.filipov@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 17:45:56 +0200
X-Gm-Features: AclHuK9Xw89HwOv4R7obEy-u5Yu2BoCinp6XB8olJrV-htK4CS6bpM5IbHuaQqk
Message-ID: <CAFEp6-2tC+uFJSG8xOhQdrhfCqoDuhm6q0rYc6cROoUG_r1vtQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] media: qcom: camss: clamp VFE clock rates to the
 highest level
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MSBTYWx0ZWRfXz0l+LDgVaFk2
 ErTLhWZkTMZf1um839De7tsQlvXiIOZAQmxZ2RTdb4hYEG9M8ZykIdAU3L+GmgLcPwDIg+wxfyk
 ikZAbk/P/hQE8EDyKehaw0mWfK8mu5eQvMmf390YhhENf/k8OLYHQtGin2sxXqnJSeyPbWwLg2n
 AUTXG+Q2an9HHIiLtTFKDX1nuaa4GezCf3sjLW+CaLnLD04BcLzLItgXqByJJgHaXd2tLfok5Y6
 Lq4zVZWlykR/5DVHhcItRNt/3ux2LLV3WWDJOdhGeNnJlwuDgaoJUyeMW8a5lIaZ91XlMgWjIQF
 2Wl0OhrgydZxtok0JUU1KN/RlJugoxRHynVsigYg8ITo+xP+HMOMqxE67FwBnOhyuaGbWBgoSfo
 eqJliOjZ0yvZ4d+34LnekgughrBUzkbnEXjog42rtMcMR7LlmuHkX/+Etkk3lEaHbzuxPBlQfk7
 CbIxJsduLrTTY7/yoOw==
X-Proofpoint-GUID: rDYdv3A7oPM4M2V7e9SJwPfQX_5mCvtK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MSBTYWx0ZWRfXz2NCN+q2ALhA
 zqHZ1HbLHeSodP4wNUQSbGr22/3Kbxv/Dh8DauQwzhCNIJhZSnz7VIrJj8fTmHlqezpMGG0IWTL
 xjUupSLqU2VlPyZIXpFF3umSoTbV2gE=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb8143 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=vVGVp6KvjHsgx-TnZO8A:9
 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-ORIG-GUID: rDYdv3A7oPM4M2V7e9SJwPfQX_5mCvtK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230061

On Fri, Oct 23, 2026 at 5:29=E2=80=AFPM Atanas Filipov
<atanas.filipov@oss.qualcomm.com> wrote:
>
> The VFE fails to power on when the pixel rate exceeds the highest rate
> listed for any of its clocks. The rate tables of the VFE clocks are
> independent and need not have the same number of levels, so a clock
> with a lower top rate than the VFE core clock, such as the SC7280
> camnoc_axi clock, makes the VFE reject pixel rates the core clock
> still supports.
>
> Clamp each clock to its highest listed rate instead, and warn that the
> pixel rate exceeds it when the clock lists more than one rate. Take the
> clamp into account when another line powers on an already running VFE,
> so that a clock running at its highest rate does not reject the
> request.

IMO, this function has become a bit messy. We should split the core
clock selection into a dedicated helper, as it is directly tied to the
pixel rate. The AXI clock scaling/selection should be handled
separately, potentially through the interconnect (ICC) framework (when
available).

Regards,
Loic

>
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/camss/camss-vfe.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 2680a9914765..87096095b1eb 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -982,15 +982,13 @@ static int vfe_set_clock_rates(struct vfe_device *v=
fe)
>
>                         camss_add_clock_margin(&min_rate);
>
> -                       for (j =3D 0; j < clock->nfreqs; j++)
> +                       for (j =3D 0; j < clock->nfreqs - 1; j++)
>                                 if (min_rate < clock->freq[j])
>                                         break;
>
> -                       if (j =3D=3D clock->nfreqs) {
> -                               dev_err(dev,
> -                                       "Pixel clock is too high for VFE"=
);
> -                               return -EINVAL;
> -                       }
> +                       if (clock->nfreqs > 1 && min_rate >=3D clock->fre=
q[j])
> +                               dev_warn(dev, "Pixel clock is too high fo=
r VFE clock %s\n",
> +                                        clock->name);
>
>                         /* if sensor pixel clock is not available */
>                         /* set highest possible VFE clock rate */
> @@ -1041,6 +1039,7 @@ static int vfe_check_clock_rates(struct vfe_device =
*vfe)
>                 if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_=
levels(clock)) {
>                         u64 min_rate =3D 0;
>                         unsigned long rate;
> +                       long max_rate;
>
>                         for (j =3D VFE_LINE_RDI0; j < vfe->res->line_num;=
 j++) {
>                                 u32 tmp;
> @@ -1063,6 +1062,13 @@ static int vfe_check_clock_rates(struct vfe_device=
 *vfe)
>
>                         camss_add_clock_margin(&min_rate);
>
> +                       /* A clock already at its highest rate cannot go =
higher */
> +                       max_rate =3D clk_round_rate(clock->clk, clock->fr=
eq[clock->nfreqs - 1]);
> +                       if (max_rate < 0)
> +                               return max_rate;
> +
> +                       min_rate =3D min_t(u64, min_rate, max_rate);
> +
>                         rate =3D clk_get_rate(clock->clk);
>                         if (rate < min_rate)
>                                 return -EBUSY;
> --
> 2.34.1
>
