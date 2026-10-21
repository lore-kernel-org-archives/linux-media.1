Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792567223;
	b=RjcX+JZP331sGUEQaYpqOT/Lktn48iVG5m17e/kxNcyRuf6Ln18HKNecuK0+vaobAju4
	 nw611rgRB3Lk0OW0jAuFABmV/uaBDuM34WXxWO5/ua5644qRpzu6te1dtnI10vAbbCu8p
	 ELkD2X++QTj5stMMBfyjbWi5SDnNE+vFTodJPSW9Y9sgP5aaeX6h0couLT4Y3RCRdB24c
	 i0XWcAEuM/S6iwYUuWXcKkdQ3eMOv8mjPEAzptUw2/62Sft/jAp4iYhASc2p9LegGjUiV
	 9DVYiGsyX/78aIbQx88JVhUkAUn2zjxT3VGozngdzUG7uF8QD9zPvAj9Y2UZ0igXGPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792567223;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Vyw8xlAE2+V3gWsuPQfIkm8MHQNj4BK+dYXwJch3hNE=;
	b=VMcj/A37JxCETo/2VvYB6PKf5SAm04MGrKgWwbJpwVIEE9l/p7MgeAnkw/KHJHniGd5s
	 nBp8mQ5xYizMgr9Mjtnjvhl5a5qoNzX2/S4NaD49ja4HAdXgt26bdmUbknvqweZ9zbiTV
	 QggnqeDMDBSwc1ImQfIfZ1QrTVgaqXA63Xst43gTKIq8wAc2KYvyCa25ab//0pDVEvnkp
	 uSqpLBZX5l7Ju5sqiKbAMmceY0w0Wi9oOemFFB0AzaPUSW8gfhYI63M4aH7Ce3gJZiZWw
	 r3nSHIsQvEO8Kv7MSGST8XcZXJXbuadvjTUy+3MrJvrLRjcu62rTGfLNBBl37eG2J5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hGTqGpQT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eI6HWg1A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F9A606A31B
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 07:20:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1F9A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hGTqGpQT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eI6HWg1A
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jhYe3573923
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 07:20:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vyw8xlAE2+V3gWsuPQfIkm8MHQNj4BK+dYXwJch3hNE=; b=hGTqGpQTnyw3Y/zm
	HjoYc5lye/Mu900AVh1RHHDLmp1qkre8mvTF4kXSMbvJRu3/K+FO3PwEeamjsCqL
	hcHK9qyyCJPtnQo1ZHphKccJW+rpkYRztarOXRmsE1NH7v6wJszC+1WzC8QKmrkx
	0KUTGEMiYAWUFDk1QxYmNf8supa3K39VcUZAplUI0IGRgQcyW63/h2sjsjt5Q9ot
	zOZ+DeCrpqbpmnph33ykoRUC0TEKFgOw+CEx6JTpw9zWOwEO7Y2IWHu+K0mwZLWV
	+XtuY9LFnOM8A3qKEumUO76tSg0mPIH9DtSAVGXecsLznVLygzUJjYGRDfnvgIig
	PT9SQw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9hthhv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 07:20:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ecdc701a2so53807585a.3
        for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 00:20:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792567221; cv=none;
        d=google.com; s=arc-20260327;
        b=C50FbhY6GmOYW4LGEtNyw8cycC81PoRJNOF40cShUqOdfJeUa1jH3tP6zioE87Cvls
         LSfYlBrEB9NQ7URFXHlOFanmmrYNxF3qzuLl3ELBc9g1P0h53BGGFsOSVsYdZaf0b/3s
         PTSxozKYws7yXvlhigcdMvZm+MyUCSdTgCaKa55pzlkMVTsmdzayFIg9O/4cLzZ4zyOG
         zN+AodNSsu2piOEK32tSev7zeHaF1aEKlIu4NzOiweKTwmKveyHjnevG8264W2yAvRzC
         Wbko/VnYZVVeyOgFtHrvcsAVfC8QvGvUyw7x0Yleyv0EZtXkBWm1huQYlZKgD0LYKxsh
         ml5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vyw8xlAE2+V3gWsuPQfIkm8MHQNj4BK+dYXwJch3hNE=;
        fh=fX3XiR9QQHyHczuVca8JzkBBsuxpY+LpczJ2DTrm+/8=;
        b=UCWDxYeUMdDx+bVyM4x7GN0D7eC/gabfcIBskWoUAbhawyQV1TNoVdIP28EhIreIZt
         U077yeADBVHV8jUnf0GtsNbE72KSf7c2xW9apPLvrAesJdC1btLXMCFbrjQImYBsdt//
         3Rr+yUQVsnH5E4YCpMOcKsrkLo4OBQn7YNWnlxxiDB6lfQ6nMzy/a6+hlYbQlMW30Dno
         TePHMx0R+49Lgu0ESbwAbw1dYKFoESke9pFhclautU6rrzNnamXOd8CloQ/hVWlzOab4
         0UatuXdZDQG38nGvsDzGIqt0MsV0jbqwPoCkAgncqAFroL6ay6cKKY+vM9it8hr1tLg6
         rwIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792567221; x=1793172021; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vyw8xlAE2+V3gWsuPQfIkm8MHQNj4BK+dYXwJch3hNE=;
        b=eI6HWg1AmnRQa9/t7EIYa9FGcaUYXuj2QoMymB4mB0PpTRjbOo/PeY1viyijmkcGMQ
         BtADHNWFC8OZyHpubyUlRs0wg0hKv1y8XyDPfMhZ+p8KYg2bS/L5iciYST417kP7xX5f
         rGYcp2ZaVnXnBY0lcjqWEY04e8IVTcTVt/MllZ1LxkiLHwRsX2xuWnsXlMYIjcluJvF9
         LzYElWzOQWEPWB+Ry8CrY5wTMZtuHlUO7IBUcJbJLf2pFqGhUn0aQsV53VLIKQ6LoHnO
         Oqmfjz/i8NsWlUFVPDPpZlrzRvmwVc+s33lEl3V0mi5W2+JAQqz6oB/JLKQL1I0OXvEd
         FYYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792567221; x=1793172021;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vyw8xlAE2+V3gWsuPQfIkm8MHQNj4BK+dYXwJch3hNE=;
        b=hVS2qEQMiznuCBIrNRdjaQ0evtfFATwVUXKzvnM/WiUHreyimbfyqTHE763hiGPL6w
         Tgf8XMe8bMMXNvwhkpel69VgmPojZtHpRDKlzhPjHhsk8OvdfL0SlCEK7PSiijqJW5MA
         JtAgZWXI8+kF9ZsNAPV5gEcE3GlVJam8Q3KKD3NesPy6V40matOhudvtuGr47TpWZTnz
         m9QK688rQ35SQNSEnBWOw21mM9f0iVi3jH2dg4g3P08UW2yBAMqCYYc4ZgvRm81HbDIg
         lingmvEI5JHk8h+c9wwEBrqcTy72IIKqUEQrwiMj+XzO/fzJquAa+fr9FP8luJVe8Mpr
         gqxg==
X-Forwarded-Encrypted: i=1; AKwUvBzvonuh/b5WWcX8ovtGqCPLE8Ata4sWmP66Zmw13qdIzkexA+w9PEM2OlZ7rfppKZcqkfk9Ta7dDIQJ/g==@vger.kernel.org
X-Gm-Message-State: AFq9FYJedjii7BF5hMs6GhT6Vjzp8Jemn7/h7prltnUzqM9lA6EovKkZ
	8lUJLwBjkmingpnn3Kkcuc+secZtUoK0MWwm2b6SRD5+LliP7mvQjM1wQ/qjzwnBHLpChIBLIHi
	V0OGSz9ztxlR4NlFglhLRJCV6qESNAKpvmRRpOlrGk6R7py/t8Iofidrg+YT/1m/gJUjUQjFO0Y
	TRoMJojl/9/goirkmljjIXZPR0xxnQQ8k34PyZfmB/
X-Gm-Gg: AYBFou1+V1uRu+nvxV25YhiiYvKSTy+9etJIZ2kQNKMjsSYL+5A0wfbRMQ3fxhlQfBX
	8sxumCR5uxeRn0vdg+KKpM+RUYM0EyWgnQOrzOHDDfflaM2a9Di2IbUDZOmXZUw3zhe14+4BvWr
	v73YzZZlrNulZTnD0p+XedSeh7hzCsNo8vHfHWZ5Qf49zYakKSSX1c32ztq0hTjrrpGlSV481xR
	y/BNMI4AzdHn2i9ZHS8OF5AqoB3xZGHsKDdIVf1+7W2mTlha8hyf05Nc2AI2Npyv8fvI9gKDv0=
X-Received: by 2002:a05:620a:4010:b0:93f:3576:d428 with SMTP id af79cd13be357-93f57f65fedmr280274485a.22.1792567220767;
        Wed, 21 Oct 2026 00:20:20 -0700 (PDT)
X-Received: by 2002:a05:620a:4010:b0:93f:3576:d428 with SMTP id
 af79cd13be357-93f57f65fedmr280271585a.22.1792567220118; Wed, 21 Oct 2026
 00:20:20 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020193946.51478-1-birk.skyum@pm.me> <20261020193946.51478-2-birk.skyum@pm.me>
In-Reply-To: <20261020193946.51478-2-birk.skyum@pm.me>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:20:08 +0200
X-Gm-Features: AclHuK9V7aVQiTOHc0vqWeOOfVJ0Ma-H2IE8l1YY-5LJtcIK6v0ZsdlpKcyDMMM
Message-ID: <CAFEp6-3s9ER_V_B89W5f5PVkRnLrgSwnUwE+tmftbUGB-1_BdA@mail.gmail.com>
Subject: Re: [PATCH 1/2] i2c: qcom-cci: Reset the controller when it resumes
To: Birk Skyum <birk.skyum@pm.me>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Saikiran <bjsaikiran@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=YuKa1IYX c=1 sm=1 tr=0 ts=6ad867b5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=o4kKvnnIlv_pODaOlxoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAyOSBTYWx0ZWRfX1GYnRxFifYbj
 3ajVYFZhzW7WE07pizuJVJ1CMImKbfWxCn53AUxxFvRY4qgfGtWUjHx9PvmdKLEMHPG9fxKVLK8
 z1ZmVthO0Uif4r+mdhOCtZDfzPbztv4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAyOSBTYWx0ZWRfXwUdW5l/WzUQ/
 WQdSPwlVH3y10PikeSIAwBpDwXNKhxfUwjD8DQfXwhXcvDMOiDC3e6mBsItgr1E107fjg9ubqqQ
 L77Em0HKA4ypF7se0Nk9f30bVUgmrOhk3ZyxZW1wR6DhgizHSTXSffTeIIXhg2frthgCg6PwvJ3
 6thDr5U/G/Xw74UQ0riaAE4QZsRmhBy7exlUegRbb5oaySRKejS1F+8nX45GWo3KPNEhAjUcE+Q
 6pN2N3scz8tKjYVzHJjTW2fxjaJzmqyoWCmbE3z13repCLUx9PGAp6l9qB0ROhTJkxps7pLI+Qi
 q0wZHrwVhipS93RfynZ8fvqOfSd+mTQmRi24Bu4ZoQdpMQqlzF0NqFqqkftyzeR7T/h/g/CnjNT
 jQZJtXeHCdpM9riLG96kQ4U/LWJUgJes9DHV4VbSQIgl3ni8WUPVV0xh7d3yux6OKetZkm4vIfY
 ylZP2qTqYG9tEzy7png==
X-Proofpoint-GUID: ELo5t7e8QLct_7HzQTotHt574dP4qAd3
X-Proofpoint-ORIG-GUID: ELo5t7e8QLct_7HzQTotHt574dP4qAd3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210029

On Tue, Oct 20, 2026 at 9:40=E2=80=AFPM Birk Skyum <birk.skyum@pm.me> wrote=
:
>
> A CCI master can stop starting transfers after a target on its bus was
> powered down and up again while the controller kept its clocks running.
> The next transfer's queue then stays on its first command, neither
> CCI_IRQ_STATUS_0 nor the queue's report status changes, and
> cci_run_queue() times out after 100 ms ("master 1 queue 0 timeout").
> Only the controller reset in that error path, or the controller's power
> domain collapsing while it is runtime suspended, brings it back.
>
> On the Lenovo Yoga Slim 7x (X1E80100) the OV02C10 front camera is
> powered down whenever it stops streaming, and the unpowered sensor
> holds SCL and SDA low: both read low at the TLMM pins with the internal
> pull-ups enabled. The queue registers at the timeout show the stuck
> first command (CUR_CMD 0x08010339, a write of 03 01 08) with the bus
> timing registers intact and no error or halt interrupt before it.
>
> cci_resume_runtime() only programs the interrupt mask and the bus timing
> again, so a controller that was runtime suspended without its power
> domain collapsing keeps the stuck state. With the camera's TITAN_TOP
> GDSC held on and the controller suspended between camera starts, 3 of
> 40 starts failed this way; with a reset on resume, 0 of 40.
>
> Reset the controller on every runtime resume, as the timeout path does.
>
> Signed-off-by: Birk Skyum <birk.skyum@pm.me>
> ---
>  drivers/i2c/busses/i2c-qcom-cci.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-q=
com-cci.c
> index 76a5ded..51ce174 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -651,7 +651,20 @@ static int __maybe_unused cci_resume_runtime(struct =
device *dev)
>         if (ret)
>                 return ret;
>
> -       return cci_init(cci);
> +       /*
> +        * A master can stop starting transfers after a target was powere=
d
> +        * down and up again while the controller ran, and keeps that sta=
te
> +        * over a runtime suspend unless the power domain collapsed. Rese=
t
> +        * the controller, with the interrupt mask set first so that the
> +        * reset-done interrupt also arrives after a power collapse.
> +        */
> +       ret =3D cci_init(cci);
> +       if (!ret)
> +               ret =3D cci_reset(cci);

If we don't know the state, it's probably better to just
unconditionally cci_reset().

> +       if (ret)
> +               cci_disable_clocks(cci);
> +
> +       return ret;
>  }
>
>  static const struct dev_pm_ops qcom_cci_pm =3D {
> --
> 2.53.0
>
>
