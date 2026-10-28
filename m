Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793198540;
	b=yFzGIhlhBaTIhhwzuleSCZrAU2xbH8i9cspo+1zM9UOUPh2q5q2qz2EyUVwKYD0bgReL
	 fyK/rPAcIjEEPLAeoh2Ydi3N1csIwR/c+XR/kUYmbpULBT0RRYv0mx1mNqY0fJ+5aKCGi
	 f/LoPcTADGh7LiYB1Yh5Ex5pJQkt1vrCUpU3ZEbNzGwO2JTsENhbGVOE1QKEKId0dt5Yr
	 5IauYJC+yVxRDDDFdwSy3430J9aI4nJcFJzINzW24I29Poh39SWaAUWoNuJrJmeWKTDhG
	 kxrTwqNn8HZpSwM3SHcszknZsC27zEXbp0yBqt/UX8OOB3KN8UNlM0JE2uBDdnXfqKQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198540;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=oy8t8dL+tbzHFQVjWnPDle/FUH/VrtTjk8J+VaYpPWI=;
	b=hdSQDWTg1yqOE1QEk7MDgfoOx8IRjgzcjSqVKkFUJCeqii99C+f6kNjNrSzAafm5DVV/
	 10thFePkm+hfS4i5byIBKdD7wrgonmVeZURUbkuR14tIhCXfO24qmvo5J9FcO/ZEvTSs1
	 xWg6ik7DP9z81df5Xu3awAT/1MUm2S71H0vYtITdLZ/U1U4XoR+FCZTlga9l28vTZCIfu
	 RLuJ0QXfCJMlwNe+t/bA7CncYv4zKx74I7Y/2bEzXCUWZi9cVj/uyb56wS6y6RLgIqVyt
	 RFXAf617hgjPv2ZWAfjMxMHV6B/g4mn5V9xnwHhwY4jXqBqKFeYE7rYhcClFp4qgNYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YeBiKAa9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kSmXJE+A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA4F606A31C
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 14:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBA4F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YeBiKAa9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kSmXJE+A
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe9FX692131
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 14:42:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oy8t8dL+tbzHFQVjWnPDle/FUH/VrtTjk8J+VaYpPWI=; b=YeBiKAa9b6ibGVMP
	zD5FaH6RyPG7SX1r4bhwx1061cWgWl6ClVcoFdSTTs7KWxpVr3VaCnpwT4UsIqCu
	/lJ5NOcTyIUqyUwesIv3AP4VMSBVSCxJdK6sqz6EVLogqhvDtla+Z/110Lq42lMC
	Hts76iCn44k0Z/Fm+YzrlDP2j83NvD8JXgCmfquVPiURd7BTnYhnCllIE5Zw4VbR
	FQFK6LKpek3bHMbSF6fDHCtg0kcT4LcnE1x4BrCkJ0eEiqj2CPLddnpE+veM6QgW
	d/HbSgzhO7DqMT9ncs/BfXzCD2594ZCuRSyD7ybqyfkSTyW9COHdAL3GTqcznY/A
	/6h4yw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6be2y9k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 14:42:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f559420f3so89674685a.0
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 07:42:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793198537; cv=none;
        d=google.com; s=arc-20260327;
        b=OX9VYBqhleFytogIy+I87Dvoavxt7QZXm/pzFN6J48UKMrfXm2mro4gihxn+X2WrZE
         tpKXRL3e7QcfT/I2XJ9pW4w+gM8Cr/ewdzbQTHmFu8rdn5MH7f67wBbXOfJXDqQUIYhx
         VdSfZZlo3kx9DqwiKivPtysWPJ1ohcR7X5HNUH2jVtVTE118u/sV3SSLorLOZxTmYTko
         SZsPtg7fFffUkLNSXMJb1tnZW36pBi3J5cCGAYTAudKOwpjEUp+3cW7fPEtcbOtKwBUl
         9a83/M+OXibmqh/14ugmNWWEUmhu2APBfBPwfJLDPduAMWQGpodX+ThcqweJp8k1G9EM
         e50A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oy8t8dL+tbzHFQVjWnPDle/FUH/VrtTjk8J+VaYpPWI=;
        fh=YTcEnSPZFDlc/ei11D6JmpegQ3hwCgeY4ikROjju7tc=;
        b=XjmGUPmHApcnhGBfxiQqUMTIt0+0VbaWdzHbYcMQfHecaco2f8hfHk+wfYv256icTd
         1+NfWZYpg53nsZVvfV3ipxo315NTlLM0stcmKFnlx/ne1+H38/BrKbGAg9+gY0Lt+kL8
         P+o9OZrPGoSF3cBFFsDIHq9vSV8tE0Spf6vzkV0N4vcQFrIvVB9lhWf/Ou1bwJxdgSDB
         L5Cu8OOYKJ9WUQ5vszfUogwx74BpElCOh/4IssCprzSrpdBmTo9H5WWYhcCrgQzCM3Wm
         ye+68bsQbyJJiVd0htfePUUvUoQyhdWT5LrTveZrIrnS+OKLHT4LzohqO+JprluDoUEn
         7mZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793198537; x=1793803337; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oy8t8dL+tbzHFQVjWnPDle/FUH/VrtTjk8J+VaYpPWI=;
        b=kSmXJE+ARjY25lCSDEnngGr23+BUgERkgr5I837H/7eIkW1CAF12nqlVVEnLT6kBCa
         08bejCS/tdGpjezeDQPzrEeiCkf5ulimWqlmxZ08bjl887W1p7X6nrwLzKaBUqF7soou
         yMDvzlL1yX8IjCHntXcFQsIzD6rlNr7/AOKca3TxuQsn1bITJ9xr8/b23mwaC9PFGwBv
         KebP0aEPB96O+f2GIPxuyQw0olNuSkmAZV/CYwW7YBVdKEl35q6hwqfUN7V2oa/4m6S9
         F6kijy8PxzKNoTds6wjFg+usPUNYktUxJ7/X8KJNxImUs1+F4etNLw8YsuRID1ZDaJND
         vBmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793198537; x=1793803337;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oy8t8dL+tbzHFQVjWnPDle/FUH/VrtTjk8J+VaYpPWI=;
        b=nufVVqR5a4szdINm0YniXefuc4Ba0YcE8rKOedY/JQxTxJt4IIozCnR48QXZMZZVdc
         Sv7xdb2zHtC5M2wIZPmZvIvvzlkzBYPY01nT3ckgKqKVLj8CcLlUx8/YXgWBaXVLZtdx
         iPKz1u/Jo1V2yZTeBy5wvOR/ulUE82h8o6OdvW8WrP36xvB/saiuSDZTPq+/ubwAmtU0
         HgWL9a8KPo1gzDb2dAFofxfGdtINQ2/4vWL2QwEUrF0pNRsuzITDX8+dXrSmZ96KvlG1
         4V4LizLp/eBOXQ0RhBuEnwVWiotCvAYPhhLD7BUT2Cc1eUHpit544kEmttOwKi7Y27o5
         WWfA==
X-Forwarded-Encrypted: i=1; AKwUvBywjBjO7teVmg9vv3BH1SEkH1KJMb0OyBvB9y7UXrNwsDMXmuf9djYvC3RNTIry3YFLw0EENaZkUyALrw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJBFU+jUqP+X0ZfhJwFO39oLMbAX28Hjklzf7RmwDajUt6kS8r5
	nHv3A3nQukdXl12FygVmVC9kcruLTSLMZOd2tOgx1ccOQsOocMw60hmG37ztU1HKDkW26tkxxBm
	8HkHM00YGEWzW1e7IHPuostmKaihf5VxsBNIdTSP/sRpgvEnWPHu1pjvMZKtntTwE0ZMECyxotg
	hPH+iMoPHbEkrkNLkXKU8Y84flwM/tBh3epWvVee+N
X-Gm-Gg: AYBFou1GrZdJjMpaS2si86XUi/JsF7hFVTs82nVCzBvsnnAbHAVOfnY8LIYE3/sXquT
	ax8wK7/Cy+o1kNwsRFxwT980ifHxEqs3IpAzq8ynotD0DCvs18+x77lRplnuXpLyULRHTJ8Kjko
	Iu5weGefaiAmBIga7JbHcWsJPOTEY6mkzh4IFONtLQSHQQgswyK5FsuJ/yov3fb2aHBd+eo70O5
	wgigMKitPLJAGe/KPukYsY9O8eEOHKNfP0n2HrJrCicZJxrG2k67OBWPk3QEj+GubqrhfKEOe0=
X-Received: by 2002:a05:620a:288e:b0:93f:167e:d98d with SMTP id af79cd13be357-94408ca8f87mr354367385a.43.1793198536850;
        Wed, 28 Oct 2026 07:42:16 -0700 (PDT)
X-Received: by 2002:a05:620a:288e:b0:93f:167e:d98d with SMTP id
 af79cd13be357-94408ca8f87mr354362185a.43.1793198536298; Wed, 28 Oct 2026
 07:42:16 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com> <20261028132403.3505037-5-atanas.filipov@oss.qualcomm.com>
In-Reply-To: <20261028132403.3505037-5-atanas.filipov@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:42:05 +0100
X-Gm-Features: AclHuK_gLvTlNwq23MTxsJpLq4bAZNAxAi8aAxw_j7mRJtSmK53xdtsDAZuh6no
Message-ID: <CAFEp6-2SJOS6tdr3cD09gCzDLqnEzX-RUSeDMxrk0_DgRi45ow@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] media: qcom: camss: share VFE clock sources by the
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
X-Proofpoint-ORIG-GUID: 5WRzrxwZiA12phkoxZnPtSKLQTbTN6sH
X-Authority-Analysis: v=2.4 cv=HeuB3SE8 c=1 sm=1 tr=0 ts=6ae209c9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=9_-UM4KCnb9qNoQB4c8A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfXwhjFDVTZm1yt
 H6RLoEWZ5iLQxVUBZWzdlM941eDHw9hHqidBpV1TDzUNNz25UvpA00QpY23ODjgy3fHMYGri4uA
 qlbCrJybucGjI3yXFRulunHEixoJE24=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX3EmkizvNNUjD
 ZdVikx3H1p8ok2e8YvfnJQieoUb6UAErEEgS7ApP6cntRHrLbWi3Ra3R14Ha2w/lQl3x2wrfTVp
 EObsqKktO3jZ60R52RdldFhSpDOlfgCdzb4KecHS6d/qrxXefoQqxHPcgiJMiqy0fIA3bydSvS5
 5OQA/DzXwjBnfHcEaOeDVSGBDDITC3XU4wlhymnAclmfcin0BdjC42mrlUmm80Zx0ATQCvW+239
 T32DAMc7mASnjo+uNM2I9cmqq9sEjf9tUZPjPDAasrwfAIoN6X9GrR+DIlDOLhv1dd06tlNT76s
 bvxBm7l+CAZ0EButtSw+72dxMie7Ti5r62ATL+8d8QUjOINUXk7nmoZIamdHu3xUtGwNKZb9bH3
 F8oB4NkNj/q/dwDsw7OkbjTIeLO45B/ZgtDEGLgVB2R2XTX0x0lwX2mMk7xgndjT0BsMjgdmmOk
 8ePRCjV6YLsONef/piQ==
X-Proofpoint-GUID: 5WRzrxwZiA12phkoxZnPtSKLQTbTN6sH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280058

On Wed, Oct 28, 2026 at 2:24=E2=80=AFPM Atanas Filipov
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
> Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
> Changes in v4:
> - Use clk_set_rate_range() on all SoCs, drop the vfe_clock_ranges flag
>   (Loic Poulain, Bryan O'Donoghue)
> - Add Suggested-by (Bryan O'Donoghue)
>
>  drivers/media/platform/qcom/camss/camss-vfe.c | 39 +++++++++++++++++--
>  1 file changed, 35 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index bcc2c1929af1..46674bc30e6a 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -1037,7 +1037,7 @@ static int vfe_set_clock_rates(struct vfe_device *v=
fe)
>                                 return -EINVAL;
>                         }
>
> -                       ret =3D clk_set_rate(clock->clk, rate);
> +                       ret =3D clk_set_rate_range(clock->clk, clock->fre=
q[j], ULONG_MAX);
>                         if (ret < 0) {
>                                 dev_err(dev, "clk set rate failed: %d\n",=
 ret);
>                                 return ret;
> @@ -1088,6 +1088,34 @@ static int vfe_check_clock_rates(struct vfe_device=
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
> @@ -1111,12 +1139,12 @@ int vfe_get(struct vfe_device *vfe)
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
> @@ -1141,7 +1169,9 @@ int vfe_get(struct vfe_device *vfe)
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
> @@ -1169,6 +1199,7 @@ void vfe_put(struct vfe_device *vfe)
>                         vfe->res->hw_ops->vfe_halt(vfe);
>                 }
>                 camss_disable_clocks(vfe->nclocks, vfe->clock);
> +               vfe_release_clock_rates(vfe);
>                 pm_runtime_put_sync(vfe->camss->dev);
>                 vfe->res->hw_ops->pm_domain_off(vfe);
>         }
> --
> 2.34.1
>
