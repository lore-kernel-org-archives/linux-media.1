Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792675622;
	b=AViDebw3jy6oPFz8QxyOsEXqqtaaTNxOhWWMrkLpIx8quGI30+N59oOO27ALF/rHFPoh
	 h4KVFeRywNwHOp9cR2Z7+Xt87NZZRCShZAu1YD64gSsq8/5aP6Qv5wyAfxcIZbCexJIxQ
	 7dWxcuPtibCqC3g6p4ZozrlfsIu6C2n7lzgE+ft0IyWthvJqi25qygEJ3psaI9DoQa96g
	 LEqNARtY6ZHuRFCN1a9uU9Mqy40kdDf8cqagqsGOjsdwNfiOZ0hL7JNRzmhE1KCJLvKrU
	 qhZq4RhQ2FatByuBcC/cxnaXD4T7G+JjjMQR7Ba80GGEapd9JOIDOyz/OXB+SSS9XKQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675622;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jkdBGMrXl2ogSNgP+aCYhlNxyIfloe8YrYNUTMrUXHk=;
	b=eGpD94TS3pSrv3PygNN3nPBJlpXQ1Pb0yv78vheSvlU7xm4JjX++x/Eb0maihoflfcWH
	 qb08/Vvc3zNkP0aaz11FdVDf2dtlmJOuGAP+pT5DM7UgToqh3LcCDoT3u7NfWUeDHakH9
	 /LnWHlx1hoHFEXOzemjHvXKY1qBiVy5ep7QNyuTA+DrQJuAYQ/gCTEJga5obqJXiXTZYk
	 eOb+leX2PtKSk/qBWyVEdoLPcHSEkMGWbJkhS8rFdElmF1KMmu2qgFqqkXQfMwAKPHYDZ
	 y2O65Obstmqyyxv7dgXph3hn+l+BRfNHNvvdvc7gdnZkKtSbWtEyIW1rLLDhYSk+CDg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e0XK+CzR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cd8Bs7kp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDFA606A319
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 13:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FDFA606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e0XK+CzR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cd8Bs7kp
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0CaS2918802
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 13:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jkdBGMrXl2ogSNgP+aCYhlNxyIfloe8YrYNUTMrUXHk=; b=e0XK+CzR+w5dGiD+
	JLK5GhSH9gEEMnUrcdYTBve4Su/QQG6SCAN8Jug2OIxpNqE3iRM6fH0RDnlM+ZRt
	Oggc1GiRGXO/lxF4SDGO7WTxKcAmqxwEBgKJKD7drycDGuvjqeBnjUF4nq4vfbae
	LnDMUqX0Nuw2BnoXaB4p5tbP385AYmPmiXDFTssc/OnJO4iMLsQtue+W1SQoPTSP
	W03UBc1G62vkqlb0RjlmZ6UISZNXKwlTyzo0rJ2a8MfXhtT/7ZJMYWHgClwY8WnJ
	MAeMd1og4dJYQJ6GLwmzQ04BDpRA6AkLCtCcay740UFOClG3kI+BfbADg/BbjetC
	wSnyRQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93abp8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 13:27:01 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b37620eb73so2921819b6e.1
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 06:27:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792675620; cv=none;
        d=google.com; s=arc-20260327;
        b=jw9oiIHoil5ii3z2G8GnDlhcpMcq6KGds4SjPi4+oTUKFMCHSiub2TBZ3rv+d9bi7p
         jXP8IERQ6rLvKFQT5inUMUkgt1djmtf+msBXOH0Qps+xnqGk/2roTrlexcCmbUF8AtTQ
         WPfDs47qKHsQhr9NQ4niyZvMi2MCZMGSY2g9APdgYNM0MxYo8IRIIqMBmGvAUtFmdbBf
         Jyc4HVjBUTLUNpXHf8iozlSf3Xrrt7FbDfmULxjKQZ3LLoj7/YG3DHmbSuV3Y5Rp9diR
         S7Wu9bU2q9hZbeI3vBsRBQE42QXCz2sx/2rcWFpkaSbGvQUGvn9orCOOKYd9JN/2gcOC
         sZlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jkdBGMrXl2ogSNgP+aCYhlNxyIfloe8YrYNUTMrUXHk=;
        fh=HsMomsB0LTDSe5bDL/IISftygJ5HOoLmp8y4Cn3QxKk=;
        b=K7Tlxs+Z5LN0aHATd9+SlRfGN3H6jms1IMVBCHdKbdzK1RYvPjhEz5XK7JsrOzq+Da
         NglmLvtgPTNVyRJtlfSzoIODAM2B9o65062sFF/w79Kvb69Ot5PKn5uxx5bBfL6dSgvg
         efe0CaHo3KgUvdaVo1R9t5rQpqWZAqH3G0PIEE+y9A8Yl7Ntw/yBFeMy4h69L9cE7UeS
         zCzf4y/YBboYjialCK07ZAi+u0Mm8lmuiWzZ3foOx2odQugx9iUTDKrC6rdh0WMDnWc6
         9uREK24GcPzz/KLf5yPUcrUihrTiDNFBY+doLi+0YQqwYdOAW9Es4lbfZppKhi3bmDve
         JjvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792675620; x=1793280420; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jkdBGMrXl2ogSNgP+aCYhlNxyIfloe8YrYNUTMrUXHk=;
        b=cd8Bs7kptfEBPAeSdhJnCBWKk+TgqNJP0L+9BZojSBPsREJKht+YOFgpo6bWDtCH0K
         46GakeEAeeieY8GHoMH9E/ms32opi2OOl7bJkAyIMwxHpGVKeHqnxie2pT5yoR+itXQn
         xwxchSqJ4H5kjq0Tr/8MNIbZndqNlJBIyPTqKxU1okQlJY9PXvvwJVS1dUg3DRc1vzLS
         9qR2zwordUjpan4aQJ37KJ7ingMY/xW6odj8at2zbnFhxDRuJIoXPGKcNHL8cr613uWa
         4Azhtzka+6IwFuKB5sAcFtihTzZIoeLM9jYb+R8WE2+pugfm/Tpyp4p4YYeoqbc0/NdH
         ZU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675620; x=1793280420;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jkdBGMrXl2ogSNgP+aCYhlNxyIfloe8YrYNUTMrUXHk=;
        b=1WsqYaqvJq+QjT89FWgMn3uwAZwlXoZHZOVop4QqqfRI0laIUxmVrMKJv35NDmMNLt
         +Q61S15OjtBu8brwRfpAQZw5WIBeKVYMdjx3EVR1W96jzDwYoCYFegrEX35fAj/nUaoa
         xNGmhHaSXpc8/VWr67ZxzdICXAF21nI47nDDgcCGHvdkODSE3uwt49REMrg/pwtrE4Cu
         lrFtJCQQTtl3+jZKSMUSMlPOndQwj91qC10+ZR/wFciiPO/RXawcj5wX+2KpywX2EKCz
         1c2Cg6Ij6x+7yajeCxgSqZqj9mXJMVmh474jRs7kE7DAL6nuS9QjVGWhJPpX5WuCLnJK
         w9SQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmCv1RXcquWER1z7Ig+89OY1gIroDk1oTBHfY+eHqlRdxL5yhQi76GMHjZ+VexYt7LFJEL29AqKNMHew==@vger.kernel.org
X-Gm-Message-State: AFq9FYIT6syz0IbK+HyvqPx/2bR1ia1aWjaaGJ2vuC4AZYvT9O+L5SAI
	Of5K6wNzdLNzSPjVyXBCEbPS1Tr1MFgvMZ759vayO0CEPeJx1mAl8zEY+4k5BmfU5dTiYtf+fuS
	Ktr0qok9qJlq0OHJGpUhGG21Pw4U0ZyY1xcT9j2uuvNf2RSr9o58coW5czVXOKzReXK7UVPW/sH
	Vu5X4mutyKPOzRpAnoti5Uwma0224hE3CsdwGn0cDF5Um7rp/9y8elNg==
X-Gm-Gg: AYBFou1oBPOtDuVqsFqwI0Abf8yIztk9S2o0tjXlhRKWQZb8C4ds8cjBO9hxwczZzzu
	JooWG9JMG5/3wuK98o7MVZ4B8Ytlx4OSz/vPO2U0oy831OyOiSOuopAKk66gdvO4I6XdzIdYYeY
	cQGygcG7ZuLcN5aUN3BlOVnI7PCbquQNUZ8e/SecbuuvuiFSEycVYgAWSgME9BpRyAL0uy+EAWD
	JE963DCPv/E9DPqI9zplenzoQehiBSE676RwZu/SA+RCSBf9My6AGozCw9Cxc5qjcCODkYXWF0=
X-Received: by 2002:a05:6808:508b:b0:53e:42e4:47c with SMTP id 5614622812f47-5535a28a8ebmr3850175b6e.34.1792675620236;
        Thu, 22 Oct 2026 06:27:00 -0700 (PDT)
X-Received: by 2002:a05:6808:508b:b0:53e:42e4:47c with SMTP id
 5614622812f47-5535a28a8ebmr3850158b6e.34.1792675619795; Thu, 22 Oct 2026
 06:26:59 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022071418.26895-1-bjsaikiran@gmail.com> <20261022071418.26895-2-bjsaikiran@gmail.com>
In-Reply-To: <20261022071418.26895-2-bjsaikiran@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 15:26:46 +0200
X-Gm-Features: AclHuK8flPST7fFs4KH2917QipXg6lzf73ICNib5r7yG-3sF-q7lhsX38NFcO_w
Message-ID: <CAFEp6-3iqL_a1c0u0tXhtZBZ+k__=KjQX7y2-0djf9qbBzS+Mw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] i2c: qcom-cci: Select pinctrl states during
 runtime PM
To: Saikiran <bjsaikiran@gmail.com>
Cc: rfoss@kernel.org, andi.shyti@kernel.org, sakari.ailus@linux.intel.com,
        hansg@kernel.org, bod@kernel.org, mchehab@kernel.org,
        vladimir.zapolskiy@linaro.org, jishnu.prakash@oss.qualcomm.com,
        birk.skyum@pm.me, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=JudkP84C c=1 sm=1 tr=0 ts=6ada0f25 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8 a=i_vyvEnQizJGaKJi4PUA:9
 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-ORIG-GUID: k4R3GQPw_YPASHFwnDaZ3Ud0hggm7YO_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX0/V6KpNxALlD
 mjNN7+E9d6r/2OsJ3XOxexCndFgPBLUjTq5FtxNe0WLhHRb1ZUivg9IyL0z5+7Zq3Hw4rxjmNtE
 R3ZpyNY2WXJXSPchGrenPfDRIeUuiIQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfXwwzg7qwx67Nq
 zPs4+bL4P/ViVJCrSVQz6RJkwH7WyB6xTX44oeEE1ktBUK/DFJwVRUbaWzkR22LBasrwuEAwIkH
 bv0LNCgDC6uPSid2NAlKRzY5bUF+0f7mRuJTuuI0kdGd6aL6wr9UJtRId899S07JFiLPtxQdyId
 Ja3ewW6ebBFxFnhjJkz7eSeT9vUrUGqX/FAmketRtIkPBMbC6EBTQLfaqUfj7inI/OWSpKtX/XI
 w3JExtagoK1ycIIPAr12UbOPrEOcqmlQR5ILFBcLddeW1sIcL1WqVTgROjSvzNGaYJqr0GVJJf3
 lIE1siCErpbxzX3U39UJbcwsU0deLvHYJl5QMcee0rHrvZkkcbhvtkZ4/mUZcAoJ3Xp8rHUmrn2
 1mm0yE6tNWd0B+td4xN7hMIcU5qOKU4GyYxHWvIGqFKXRvOczuZ5w5N8so/ZXHFswhQvt6ggjaE
 N1g9Z/i3QCyGgtmeumQ==
X-Proofpoint-GUID: k4R3GQPw_YPASHFwnDaZ3Ud0hggm7YO_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220053

On Thu, Oct 22, 2026 at 9:14=E2=80=AFAM Saikiran <bjsaikiran@gmail.com> wro=
te:
>
> The CCI runtime PM callbacks only gate the controller clocks, leaving the
> bus pins in their default state while the controller is suspended. On the
> Lenovo Yoga Slim 7x, this can back-power the camera sensor through SDA an=
d
> SCL after its supplies have been disabled, contributing to brownouts on
> subsequent power cycles.
>
> Select the sleep pinctrl state before disabling the clocks so that the
> configured pull-downs can take effect. Restore the default state before
> enabling the clocks on resume, and return to the sleep state if enabling
> the clocks fails.
>
> Tested-on: Lenovo Yoga Slim 7x (Snapdragon X Elite)
> Signed-off-by: Saikiran <bjsaikiran@gmail.com>
> ---
>  drivers/i2c/busses/i2c-qcom-cci.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-q=
com-cci.c
> index 873e901a23d7..fba5f664eeaa 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -10,6 +10,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/pinctrl/consumer.h>
>  #include <linux/pm_runtime.h>
>
>  #define CCI_HW_VERSION                         0x0
> @@ -474,6 +475,11 @@ static void cci_disable_clocks(struct cci *cci)
>  static int __maybe_unused cci_suspend_runtime(struct device *dev)
>  {
>         struct cci *cci =3D dev_get_drvdata(dev);
> +       int ret;
> +
> +       ret =3D pinctrl_pm_select_sleep_state(dev);
> +       if (ret)
> +               return ret;

You should perform the do/undo symmetrically in suspend/resume, so it
would probably be better to move the pinctrl handling to the end of
the suspend function after clock disabling.

>
>         cci_disable_clocks(cci);
>         return 0;
> @@ -484,10 +490,16 @@ static int __maybe_unused cci_resume_runtime(struct=
 device *dev)
>         struct cci *cci =3D dev_get_drvdata(dev);
>         int ret;
>
> -       ret =3D cci_enable_clocks(cci);
> +       ret =3D pinctrl_pm_select_default_state(dev);
>         if (ret)
>                 return ret;
>
> +       ret =3D cci_enable_clocks(cci);
> +       if (ret) {
> +               pinctrl_pm_select_sleep_state(dev);
> +               return ret;
> +       }
> +
>         cci_init(cci);
>         return 0;
>  }
> --
> 2.56.0
>
