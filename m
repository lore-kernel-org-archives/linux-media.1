Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792568694;
	b=eY2NESfeSDHaBni0Gkk9jUQDfxnF1iMcEVpTb9DLIqEznMErz3lRdkNBHI+xtaz8KoPm
	 jvQLo9rotQlBlVF4uLSO+IVTTsSZDbtjM91aAJSAd496GfZKRb2gIFM0L6uFJ13sjvd1u
	 fyO5Ay5qo/a54oVsfhJyHbA/bPyYDA//5JWjj5cATbYQT2q0Wfz+tALu33cyg3y3hWm10
	 RMk10X38fyo1mEysXhA/9woKvZQ7RpZAYPkJBkm3cB/l+SSTd5WZb/GVEEXeL0kUZRRIB
	 Hv9PPDvXIvBVzoPiM3guctcjG56wFZ2TCdA3+TJRSR0HoLOYneLNtp3uONSzM5IdDTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792568694;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rUepUBVvZqTH1fHQ+aT3wHsXwm6+pjQiNT04ccwpTr0=;
	b=cUPx8NrXL8y0X1EMy51Sxrpo1TYzb41pjCeRtuS23YfQMHx88qhZelgBRnYK1b2uHCTJ
	 WSoZJ4mxnkA14E/dYNpXhtUcUMv7Q6+wmi7w0g/QZlo71f83+oRwC6FPJrffq1RFzSETc
	 jwncf7x26orjL/Gjm/QlbMiqNbuoXOHru/rBsJwUi3xigcQYU75POOxshZBuBP2jS5mC5
	 LCGbKMw1Kk9lIr11xoSV9q0v+CtAU/C8DuGEUykwLGIHtMNPuU5aLlW2iLe4UoJ3hZ1oC
	 uSnnFqecrD0HrJ3xG28Gm0JHeh/WiYgmWuN3gDkWESi74NaiSE0tSxoImx9mNsEMe4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jdxo1FD5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JmwWMyb0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E68606A31B
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 07:44:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96E68606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jdxo1FD5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JmwWMyb0
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j6rj2411263
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 07:44:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rUepUBVvZqTH1fHQ+aT3wHsXwm6+pjQiNT04ccwpTr0=; b=jdxo1FD5E9Y1CbK8
	wJBF3T7px8WGG3gXrO963dXhMxvwAJS8yx9tXnrCwq/OaFfc+2aqeJ9re5lH8yJm
	2FAjfPD+Oc0TY8kifDBMwzPhN2/r9RrGOqTwwsdu8SLmqBtjrkqTs82W34gjXcb/
	rdEUsc6ANKPtkjcaJs6I0opoOzqyRxj7eZzlVr9skQYeQ0XTnzAJHnrVwUguJOxs
	Wb1rKqEqJSUe04ovRZfTWcfKeDBK6PIv44wnmTv6uFeaxa9PQnzFg7tduJfzp+fo
	U8i3HX93Sl6MoK/lLpZrEszvHUEaa0BMpcoZZv3IVeTXK73B3GZDQSsK3AxVnwt/
	5Z3C4Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7hvc3at-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 07:44:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f32050e72so155158285a.1
        for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 00:44:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792568692; cv=none;
        d=google.com; s=arc-20260327;
        b=Cc2jl7uyV8aTga6klKakYYbGy9/+GV9OkYXBOHmEWTgPUbAkj+6Utk+wwTh+ENXVrI
         9HdnyWaX6HheQs7hJiM9EnQM3gaghNnLdDr2bpNqvv68S3Cq/5m5WMvX+nvXyAGcW57P
         xk4wOlpOAzFfNz582GEJWD0sfg3bvhSVmYidzl9iXLBpladDhzcNhliCtB3Ha+QJuNNy
         O9Z26eL9+V81MXIBaEidrpdsymZZAYJrYYkCHxnK5WDyMh+K0HnlYNUg0+t7+ibGY9EI
         sdjf9ObdSDcHe0GJ6tRq7QBPS/CIdxZjfO36N1BUbPNSLjMt89QZLNJshexDIlPC6lEa
         p5jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rUepUBVvZqTH1fHQ+aT3wHsXwm6+pjQiNT04ccwpTr0=;
        fh=UZBJJKVB3gOPoSCCncsApcUVUN91+Cc1+vu9O1oqfbU=;
        b=ffjbpYfAk/4sbxBaQQJJqSxPZ5LvTd2RM3p+r+R/ADJ+dF/tJ1VbkHjheePKKJsZay
         fn9IHH7maJkgzYse0cpm5qVfii+MljEznTrHWkx3DwztSwu2afoAxS+iK8B5U0l631rd
         qilBdxbciGIskSo/9rYp+VlmIxSVpnv/cWgi5v9wuhlReGYgLoVtiR8juyQd9tDze4uL
         v8Hm6tZwVg9UpayXwh4Mhdcok/1ZQp0Hb98GAyY58rpQ5xN7WfjEb99NnQMMKsUl8g84
         c8JZHp0eYC6s/FUgVAGMs+VdB8FXWszYt0x73EJ75S2A0yd57OFHmFO3kRaWTMmbOL8T
         HU4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792568692; x=1793173492; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rUepUBVvZqTH1fHQ+aT3wHsXwm6+pjQiNT04ccwpTr0=;
        b=JmwWMyb022VDqs2dVvgQPo2irMuTnmV6fLk8pAuN/vZGs4lhWpsd3UaPdet2pXrCOI
         s1NpjLlLr5CWAczCdVhggYP2P3vVB/aJGm3h9qjQ4dkiMeC8alqwLvlWWFVO/zCuncZ8
         I/noH2qpVA8I6zYbJGykmUBtJ787jgrQgT6OQTXt6+SiJp6mn7vUYaA/4iZjAVuy0YPd
         aU0B+2cNPk7dCHc4jxT1BPVVJsaU2tqAhYeC2dc63h1lzTg1p9Usgue5YzYI46XhkfWz
         /x7LUuS8mm02/djjUANHaXBjaKZ3jG2eunC/0lfe+Vy8L7BMv1T7/kyRhJbQ9Zv5wmzd
         THGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792568692; x=1793173492;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rUepUBVvZqTH1fHQ+aT3wHsXwm6+pjQiNT04ccwpTr0=;
        b=GECMhLBrKcBYNe3FtpGhiWckcKF99AqpYZIJ9JyQei7LJDIDNKRkWvx7RHTWkj3F6y
         9jNnyyq7deORnu4+wNnhX1K0n3m5cHF2l8xqOE7fPoHUscDEpy6mlWPN7zuGlzTm5gQm
         z+1kZ4BivD5/lSvxcpTkPS/Gq9+ZRhHhB2a1BqCah/TPUx8TBUPD7Wvo7KJy7vIEhV1b
         HvbOBD9gkNNr1/9KmO0wkmNvY9oAc9Ejwdj0F5jK0yGxtM/fP55sLhqNO62aAEjnnc8p
         roTXztCv5HB0RFwR73yeSLM1kEMx+X68FKQ7NII8kXqsXOIP2crdPQwof2hKKw1yFYI2
         FO/g==
X-Forwarded-Encrypted: i=1; AKwUvBzenafNF21wyZrWUuW9MPa1JHTZwlFh9WgEOX9VcxGUrh0k5oWYc3p95+dWJXFD+CShSUbrSjGLoZHE8g==@vger.kernel.org
X-Gm-Message-State: AFq9FYLdpEIDrFFGe+fn/zhTTdw7vuPSHatcdzwoyIHouHyeU0zjMD8M
	3ZRlbvGhHdI4bM0KnzEJuEXcb0tnCpZssXRznorwMGAE6gqTOHtdZqlDZQ/gzjzkS6LEGLwQQow
	LXNdBNDDIDGwfz0BdfStmyoWlzidXTAReOpsujze+0WHDXoJae7f2J5GPFfJryq0CG0ldeHM2Kw
	LyRTalmFbRVB7qvG44UmPC5t8F1/6ZPZk9ByKtmVqV
X-Gm-Gg: AYBFou3R7bkpo1kBi7joZUgj42D4u1rT8MeYqmzLs5cJJdlFZ6c2j/Q6/J2NeUDLT6W
	KMmmLShsJG9Cqudh8Kro7JXB8i5oMhAZ5lDjSD286UONCYMe4uxXb19CMkRnCoUm1/1B7nwolZf
	4053V7lUSMwvVFZFDNsgPbRK9SbJRe3l0vdU457Lwq9wdi9F2mzndVlnq4qmJUC1psBkqq2nS6M
	26VdZa79osWJe9PlGga7zxwY/dc0Jnpm2NSi1bJkAnUOv7zYRnvsf0zg/+XHzEGDsR+5sAHZc8=
X-Received: by 2002:a05:620a:4452:b0:939:de48:e41f with SMTP id af79cd13be357-93f57f4a770mr277891785a.31.1792568691674;
        Wed, 21 Oct 2026 00:44:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4452:b0:939:de48:e41f with SMTP id
 af79cd13be357-93f57f4a770mr277889085a.31.1792568691247; Wed, 21 Oct 2026
 00:44:51 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020193946.51478-1-birk.skyum@pm.me> <20261020193946.51478-3-birk.skyum@pm.me>
In-Reply-To: <20261020193946.51478-3-birk.skyum@pm.me>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:44:39 +0200
X-Gm-Features: AclHuK-A2tHFi1BbsII8WbD0jiKjbsnoXE2GHZ86KIPcCe_VjivQo4KKDrbb9oI
Message-ID: <CAFEp6-0wmUYhcF+_nv8U3WovxyHVJJFs1FWfN8xb9ogMOxpBRg@mail.gmail.com>
Subject: Re: [PATCH 2/2] i2c: qcom-cci: Suspend the controller 50 ms after the
 last transfer
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfXxRqcR0J7qsmk
 Yd0RoQLdI/22G9ZJgiHgOIAsKCyHWyI5rSb6GcHv5fOl4ruIFfLBCvf0QA8UDahhPHUtRP8hj1W
 uKhjf2rEXJ8hlsNdVee6dLx9LPEiju345MYElkA9isLcUNzgWl3Sbx02S9fOdCLdMEk0g2VdTqB
 k/6yU9aZYvCeDs55lds+FPoJn2CYML6DhYytizGn04alab0Vhmnlaj6Y8Alxun+1Psk7tuyFbtZ
 vIvXw5FO6U35fVgam6IEL4HlAuvr65BktNliIqOisJ7LoJX5xTHyCLjTbt2W/8b+wA2J5U17hJ9
 YGvx4AWyWrN6bqyUxG9JqfftI5Ak9yA8/eTvHOfJi/oqlnFF7WpcMEzsB8LsYxl1tI7z0fP4+oz
 CrrBPaKgv68/883OVh3zE9PL2Jj6+Rl4h2JoLKe0Rvx7oqfK08NG7TRGvXr8yl17BhzvXPoRWjT
 H9WOLohIjbdasiWoezA==
X-Proofpoint-ORIG-GUID: VEQhQMIY3xPdBvgANtR9S5UYpGqgJjZD
X-Proofpoint-GUID: VEQhQMIY3xPdBvgANtR9S5UYpGqgJjZD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfX5tP9GanjCnUK
 frI/XiOrEbdtACcjzSdMD56MUzsE9QWM4xwvOIPDQ0+faHLJajQlcseyXEizA8qCIYG1ti3cbNG
 TdeOIxGKBbm2N1zMq3teAfdErQRU/ds=
X-Authority-Analysis: v=2.4 cv=NppE4MdJ c=1 sm=1 tr=0 ts=6ad86d74 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=ZovgdgjKAAAA:8
 a=Bu-N7aw3tzf4DBNc8b0A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=VOxKbm1zgHvARWIDjr3b:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210030

Hi Birk,

On Tue, Oct 20, 2026 at 9:40=E2=80=AFPM Birk Skyum <birk.skyum@pm.me> wrote=
:
>
> With a 1 s autosuspend delay the controller stays clocked across any
> power cycle of a target that is shorter than a second, so the reset on
> resume never runs in between and the first transfer after the target
> comes back stalls until the 100 ms timeout. Camera sensors are powered
> down when they stop streaming and up again when they start, so closing
> and reopening a camera quickly hits this.
>
> On the Lenovo Yoga Slim 7x (X1E80100), restarting the OV02C10 with
> v4l2-ctl after pauses of 0.05, 0.1, 0.2 and 0.5 s failed in 19 of 20
> cycles each, and in 16 of 20 after 1 s pauses. With this change and the
> reset on resume, all 100 cycles started, and so did 150 of 150
> libcamera starts back to back.
>
> Transfers come in bursts (a sensor mode alone is a few hundred register
> writes), so suspending 50 ms after the last one costs one reset per
> burst.

So, no, we should not rely on runtime suspend/resume timing as a
workaround for this. That approach is inherently bad and fragile.

Have you been able to probe the CCI I2C bus during resume? It would be
useful to see whether there is any activity on SCL/SDA and, in
particular, whether either line is being held low.

I wonder if enabling SCL stretching support could help here. One
possibility is that the sensor (or another I2C slave) is not yet ready
when the transfer is initiated and therefore holds SCL low. If that's
the case, have you tried the change below?
https://lore.kernel.org/all/20261007050147.274096-1-hitesh@ebytelogic.com/#=
t

Regards,
Loic

>
> Signed-off-by: Birk Skyum <birk.skyum@pm.me>
> ---
>  drivers/i2c/busses/i2c-qcom-cci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-q=
com-cci.c
> index 51ce174..62b0fcb 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -794,7 +794,7 @@ static int cci_probe(struct platform_device *pdev)
>         if (ret < 0)
>                 goto disable_clocks;
>
> -       pm_runtime_set_autosuspend_delay(dev, MSEC_PER_SEC);
> +       pm_runtime_set_autosuspend_delay(dev, 50);
>         ret =3D devm_pm_runtime_set_active_enabled(dev);
>         if (ret)
>                 goto disable_clocks;
> --
> 2.53.0
>
>
