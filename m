Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793611344;
	b=5C4AZYm2QNlfZwl66GX/Vs1AMa5e9ARuAeRkmCy/I20AOhdFcprFhCM3LznbVOOTc09s
	 gaDlQEBnqTGKBuDQcZnPQbUnndyucibApHYn2nLwMP3eWxFF5QWcyTJv51Mj2Kf+InDDK
	 SIxE5iLZpsxeskTgQmwSVDFJVcvGU71WahymbFCrTPJr16xOKgehkcvLk6qQ6T5JAUPYB
	 EkQUXvQt/1wNmTPrORrvhqrEhcWYXCeHJEbHdQ/edffMpJeguWetH70kVEgRvb0aT1G1J
	 9RX4+kj7g1/q1mdnPrSaOCfaEa2JVn4laQ6ZNCC1nWJYQpchYnPRI3Y+0AjhWA4T7tw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793611344;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Dm3JXBbc7j2WeaQojaV0U8mTNPXHdm5HnMu/dHnbEVE=;
	b=IhNW9oGRqtXJ4eIwuWmlvdwlKbF5/Vh0TrtA1uk6H2TMdlRPQ8duZqxnw3k+t82G9d85
	 PvMEavpuRN3zEslzduN03Bfyk2iVbshfcpIha3jcSEHfGouPhBHkSmXALt++Ug+v0E9uq
	 YbZdls47yv1X2sRc+AUlBwiKW6qfq3c8QAn5o21Q8Svyi9UiAplCk24xrGEbLOi5Ize5K
	 2Et7dVko3ikD9uT/Xa+hi7HVvyy8DPeQyiYdlGsSNXZavnfCJiAS4EFJTjp8Nm+LFf+rB
	 X1y5eMSm4/WLz6Z3uK6/63tTXv21wFs9T8JiMv1fn+wr08cF33oUKcAaXIvTt5Lz2ew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gMaMoSoe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L8IT2CZH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A7E606A327
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 09:22:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38A7E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gMaMoSoe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L8IT2CZH
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29ASqu2361197
	for <linux-media@vger.kernel.org>; Mon, 2 Nov 2026 09:22:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dm3JXBbc7j2WeaQojaV0U8mTNPXHdm5HnMu/dHnbEVE=; b=gMaMoSoeQgqsgFv1
	/CctkgosPUXCWgDBD9gLv66iZFQgeiM+cuGtVMbnoBflkS6rjquO8F3/2Q4pqYKc
	x+UH0n/rMHsvuXld3O9vI+d7TUOv7D5QSlXeEu0P8LztqIFRAtJ8RBS1JEe7RSS/
	81FzD7jboIH/5GbXPhHRY1dQxtWQhiOc1TgJ/njxbVvf6zR6uM6wppb1QdZsKLQe
	uZ0J1OXzQVatEfEZo3YasAecugdrTRI8rmC3z/8Pa7M3bx2BHCGRUnT5LAUK2DMA
	ARN1JF3zV+LQ7LpAGiP+Jv8E5kF6tV1K4X0pWKjTWYs4QoEftsWjOiYvdoIxmWCT
	fq3P8A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8q7x4ph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 09:22:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9441113670dso658560385a.0
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 01:22:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793611342; cv=none;
        d=google.com; s=arc-20260327;
        b=PRoTvB0pfyrh7Hqwl+R/Tl3BrlWui1NeKXqaTmP1D1VNXyRbS3XGCNq4TznyZ8eWx7
         zdy2MuX3D7xGEbrZ4WsseLlS3I/r/kA0nacT3kXNVQF3wZ0WZEXBHgGGha/O/9hyrYhY
         EcKJLDbv1kpSD7OS/gfOjWwCm/PwbvNpYiULpUBm9tm0fn2hJ3vl22RpfjwxQBjGjWHZ
         44CVvItbDnqRsHTPMdCiUyckQF6RU2gh2Pi0HjuclPpOZNMDce9GSvC8fZypqCs1DRRU
         E6iJn1HNmCBDVMCgLrfRA24qJ4UhuhGre8cY+y20QXfE0xegd3V7WtOOviLzRdP7BcCt
         +rag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dm3JXBbc7j2WeaQojaV0U8mTNPXHdm5HnMu/dHnbEVE=;
        fh=yeS7ZHbVMQkUwyW9zEpS0310RdPpokGmfGHtnY6KVxg=;
        b=G9MaMu/JGWU5/a8YosV0Alzdr63C1vzeN2P70UDDMm4uFpd8P7rxX4ZSFW6IsDIA6U
         gKkxFyOlsq4//sWDoIXCo5K3e+B6ZqWGQN4b0idD/alKl+idlIFj4/mLus4/z7AL/oHh
         KMA22R2M0CjMGwOQQq0/0ZcXKmVCflxvEyJXcFqvcksMUva3DkwdzIeG4pBAjEmAYgC3
         aRK5UttK88udSDpwOvKWdYBaHI3w3dsfwC35TR7iD0OMA9tvnTbXS2HvdX605RPMYFGG
         fVhk8En5F2+GVt2XCwS2iR4A1U8/LveiHin7XU5alw2bedp6P2wFqIgjwMvAHIrvFPgo
         Idhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793611342; x=1794216142; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dm3JXBbc7j2WeaQojaV0U8mTNPXHdm5HnMu/dHnbEVE=;
        b=L8IT2CZHstffVikBa2AjgYmHu63nzOMiwE2su0RLMkKHNmzV3el5a7u7vxOVk37lMR
         El6tZoF9IXk8YJ0sVVf0vu6/lUw30QmoZuLY/vv89TXXHnUQp3Op5gitXFrGz25EXsjF
         JhP88VFwvDwY7X1RpkIoiAS8pIqtYxKG2pYkQvqTJlheslNr8eWPkmB6w8JvYl2SbXcy
         Zty3fdBlRUFexXhtMcmIFzCZZLZCbAnZeE7KCW99QDTdxp6+KYzgZPOaNMON5MvZKuCx
         oHs/SsQqwAp5dZuwtpoEjt69j7K0z3lBlrfKt49H3kPUabUPa+kdo6eyUp6kvpLQ/zFx
         NsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793611342; x=1794216142;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dm3JXBbc7j2WeaQojaV0U8mTNPXHdm5HnMu/dHnbEVE=;
        b=Q0y85u9qyoo+ovUSGMrC+rGMBXY84GkjICLKjMNPKjCytJl6Z/jMoBHFUgjXu2OHQH
         EFF0GZffLuwJgEzlFUSzmchwpi1hpBF0MNGIFCpEwCB3IEtx4rg76ZnTU+1rwG1apqyL
         ylR5yutn9uRvqlmyAFoRsoRMxshAyAFdux8rrNz88ev8WiXI25SzdYnbXLPRiSGpc46T
         4nQ5QYhyOqn4Tq+JNaGP37Nlo2GfeeCrfBGFOKaFupYliJ+EERMO7Vm7r/4TLMFErXdo
         vxgusAj7iV+VRHGnikbx3UaOk+mrscI9D8BN5B6+7ALTwIbxQjHrrGmCNc7tLd8VMmNV
         Sc8g==
X-Forwarded-Encrypted: i=1; AKwUvBwPKoFcPwcLSo2U/iE7qSkzga1pZs7AyGx97UhoFMmyV8yrqvVQz8sZQpJ3li7tHj00/ryHcssf8FXl+g==@vger.kernel.org
X-Gm-Message-State: AFq9FYJXBQ8mxwTC8ezLzq7csNOd0vSyu/XP515hpqmx5K/GvfmT2Jul
	hoSJ3zKtERpvgqdxRm7EvO128YcYTrmZcx2/4H7gxOHcA81ewyD2HgZSaWFFO8e6tlCKC7KlRAY
	oAtIL7rOmpMM4KlS9GFNh/qYriP/3orH4b1952kkU4dB2eLcLIQDUiFap2Ryp2dDtwW4dvB082N
	ldnxDC0qGSkLMpdVnWUKSHC3+b/wHpBzV3pk1orWY1H99yjX62wVmgsg==
X-Gm-Gg: AYBFou191Viiakbif5+GIjvizY2+Fd45ydV5Tpq8VP25wo0eOMVCu5spxKHuDhJCkZt
	5TUGKA5acneBxSjGX5eTMUyjYYpKX5O2Cu33Vkt1twzDXGqxdQ1PogtUo8oOWosUK+Nmlm6EWL7
	0UjzORIiJRA018FSyM3N3GIQdBz41sv5PUTS3y8dduQ1lcb0ThLWykCv0IVA1L/q2rshvo0NscS
	BAA/dPriLalarZVOaQUmKC/ocwxnPBieQP+WPkWEvBb7jayiafhUY04RJir+j/HWzEpdcSRNow=
X-Received: by 2002:a05:620a:318a:b0:93c:6738:c2c1 with SMTP id af79cd13be357-9442158805dmr1513584185a.2.1793611342274;
        Mon, 02 Nov 2026 01:22:22 -0800 (PST)
X-Received: by 2002:a05:620a:318a:b0:93c:6738:c2c1 with SMTP id
 af79cd13be357-9442158805dmr1513582385a.2.1793611341849; Mon, 02 Nov 2026
 01:22:21 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029123107.28705-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261031041154.308030-1-xiaqinghuan@mail.ustc.edu.cn> <20261031041154.308030-3-xiaqinghuan@mail.ustc.edu.cn>
In-Reply-To: <20261031041154.308030-3-xiaqinghuan@mail.ustc.edu.cn>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 10:22:10 +0100
X-Gm-Features: AclHuK-lrKv7QKtCbq49GJ8Hz8MVkUY0WCwRGtxP81qzPU50sKw5_37IniqXuGk
Message-ID: <CAFEp6-2PjOg6wJ5SotsdGkkOvqeDHLbZo8w9s746LgfJTnpfvw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] media: camss: video: factor pipeline stream on/off
 into a helper
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: D7nHTvl30XH-F_mDsyLEwU5rB60YQddM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNyBTYWx0ZWRfX8UjsVxNJrz1o
 le2DHZDLEj2ihLVIJQ6+fNPuoTNZEDFSSdoTHXiDHxOy6uzDYAX5Ph6PJyVr/Vf3qnWUdZEKx0I
 LlBc+aI7FsSf6puyOQssoxl7sw8ahCI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNyBTYWx0ZWRfX2HEVa2vh7Qda
 6INlo5CKrOGvSUcy8Y+xTe3zyMXmV02d6qP7nyZB3mUSySS8CrlR/R9z4Mlv0WZtTMEXfLzJzOr
 KB5R5JpQUkYlwGrfOiQSSvca4RAPdGfgN6W4VqHbzivUJUc21JfrnWbk9WPlz+kh0dmTz/HxAcV
 hATdz7Cea7UnX6rn7Z6hajeEvwm9+Vr36o6SKXsa0MM0gOfowOl1kufAJUAAtDu66dPzqc3c3Jv
 OO37V4ZbG4ITPVF2ASDu0C0SDB4hQ9W+7SQ8fCOHi7/B2ps/oe9EEJr3yTG/YRjtenu5MiS1pW0
 tj8l44qT07/c3AR0C72IyWjY642u6CHVVP7LhomxHGgRm8Dk2Jkmv7llO97kodf0quVfrUy+oR4
 DrVwUhBmQfdp25pc/Kj0vzxDDd7x+jINJJFVlth57iR8mFMeFc66bGMSVxofGBCZzmW9uLeUWqS
 CaaZOzer5iZofT4xX/w==
X-Proofpoint-GUID: D7nHTvl30XH-F_mDsyLEwU5rB60YQddM
X-Authority-Analysis: v=2.4 cv=PucG/AM3 c=1 sm=1 tr=0 ts=6ae8564e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=VJ0GMoCyF0DcjFHwqmgA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020037

On Sat, Oct 31, 2026 at 5:11=E2=80=AFAM Qianhui Xu <xiaqinghuan@mail.ustc.e=
du.cn> wrote:
>
> When one subdevice fails to start, the ones already started further up th=
e
> pipeline were left streaming, and the next start would try to start them
> again.  video_stop_streaming() returned early on the first subdevice that
> failed to stop, leaving the rest running while the pipeline was torn down=
.
>
> Factor the walk into camss_video_subdevs_set_stream(video, bool), used by
> both start and stop.  A start error now unwinds the partial start by
> disabling the pipeline again; streams already in the requested state repo=
rt
> -EALREADY, so the subdevice that failed to start (never marked enabled) a=
nd
> the ones above it (never started) are left untouched.
>
> Locate each subdevice source pad with
> media_entity_remote_source_pad_unique() instead of assuming pads[0], and
> toggle it with v4l2_subdev_enable_streams() and
> v4l2_subdev_disable_streams() instead of the legacy .s_stream() call; the
> camss subdevices only implement .s_stream() so the helpers fall back to i=
t.

So the patch looks better now. However, after looking at
media_entity_remote_source_pad_unique(), it appears that it returns an
error when more than one source link is enabled.

This works with the current driver design, but Bryan may want to take
this into account for his pixel-path support series, as the VFE
subdevice could eventually have multiple active source links (for
example, from both CSID and Parameters).

So the change looks good to me, but I'll leave it to Bryan to decide
whether we should merge it as-is or address that future use case now.

Regards,
Loic

>
> Suggested-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> ---
>  .../media/platform/qcom/camss/camss-video.c   | 109 +++++++++++-------
>  1 file changed, 65 insertions(+), 44 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/me=
dia/platform/qcom/camss/camss-video.c
> index 0852eb6f13..9a633ca066 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -249,13 +249,66 @@ static int video_prepare_streaming(struct vb2_queue=
 *q)
>         return ret;
>  }
>
> +/*
> + * camss_video_subdevs_set_stream() - Enable or disable a video pipeline
> + * @video: The video node whose pipeline is toggled
> + * @enable: true to start the subdevices, false to stop them
> + *
> + * Walk the media pipeline upstream from the video node and toggle the s=
tream on
> + * each subdevice.  Each subdevice source pad is located with
> + * media_entity_remote_source_pad_unique() instead of assuming pads[0], =
and the
> + * stream is toggled with v4l2_subdev_enable_streams()/
> + * v4l2_subdev_disable_streams() rather than the legacy .s_stream() call=
.  The
> + * camss subdevices only implement .s_stream(), so the helpers fall back=
 to it.
> + *
> + * A stream that is already in the requested state reports -EALREADY.  O=
n the
> + * teardown path this simply skips subdevices that were never started, s=
o a
> + * partially started pipeline is unwound by disabling it again: the subd=
evice
> + * that failed to start was not marked enabled and is left untouched.  A
> + * subdevice without a streaming operation reports -ENOIOCTLCMD, which i=
s
> + * ignored here to match the previous .s_stream() call sites.
> + *
> + * Return: 0 on success, or the error code of the first subdevice that f=
ailed.
> + */
> +static int camss_video_subdevs_set_stream(struct camss_video *video,
> +                                         bool enable)
> +{
> +       struct media_entity *entity =3D &video->vdev.entity;
> +
> +       while (1) {
> +               struct media_pad *pad;
> +               struct v4l2_subdev *subdev;
> +               int ret;
> +
> +               pad =3D media_entity_remote_source_pad_unique(entity);
> +               if (IS_ERR(pad))
> +                       break;
> +
> +               if (!is_media_entity_v4l2_subdev(pad->entity))
> +                       break;
> +
> +               subdev =3D media_entity_to_v4l2_subdev(pad->entity);
> +
> +               if (enable)
> +                       ret =3D v4l2_subdev_enable_streams(subdev, pad->i=
ndex,
> +                                                        BIT_ULL(0));
> +               else
> +                       ret =3D v4l2_subdev_disable_streams(subdev, pad->=
index,
> +                                                         BIT_ULL(0));
> +
> +               if (ret && ret !=3D -EALREADY && ret !=3D -ENOIOCTLCMD)
> +                       return ret;
> +
> +               entity =3D pad->entity;
> +       }
> +
> +       return 0;
> +}
> +
>  static int video_start_streaming(struct vb2_queue *q, unsigned int count=
)
>  {
>         struct camss_video *video =3D vb2_get_drv_priv(q);
>         struct video_device *vdev =3D &video->vdev;
> -       struct media_entity *entity;
> -       struct media_pad *pad;
> -       struct v4l2_subdev *subdev;
>         int ret;
>
>         ret =3D video_device_pipeline_alloc_start(vdev);
> @@ -268,22 +321,11 @@ static int video_start_streaming(struct vb2_queue *=
q, unsigned int count)
>         if (ret < 0)
>                 goto error;
>
> -       entity =3D &vdev->entity;
> -       while (1) {
> -               pad =3D &entity->pads[0];
> -               if (!(pad->flags & MEDIA_PAD_FL_SINK))
> -                       break;
> -
> -               pad =3D media_pad_remote_pad_first(pad);
> -               if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
> -                       break;
> -
> -               entity =3D pad->entity;
> -               subdev =3D media_entity_to_v4l2_subdev(entity);
> -
> -               ret =3D v4l2_subdev_call(subdev, video, s_stream, 1);
> -               if (ret < 0 && ret !=3D -ENOIOCTLCMD)
> -                       goto error;
> +       ret =3D camss_video_subdevs_set_stream(video, true);
> +       if (ret < 0) {
> +               camss_video_subdevs_set_stream(video, false);
> +               dev_err(video->camss->dev, "Video pipeline start failed: =
%d\n", ret);
> +               goto error;
>         }
>
>         return 0;
> @@ -300,34 +342,13 @@ static int video_start_streaming(struct vb2_queue *=
q, unsigned int count)
>  static void video_stop_streaming(struct vb2_queue *q)
>  {
>         struct camss_video *video =3D vb2_get_drv_priv(q);
> -       struct video_device *vdev =3D &video->vdev;
> -       struct media_entity *entity;
> -       struct media_pad *pad;
> -       struct v4l2_subdev *subdev;
>         int ret;
>
> -       entity =3D &vdev->entity;
> -       while (1) {
> -               pad =3D &entity->pads[0];
> -               if (!(pad->flags & MEDIA_PAD_FL_SINK))
> -                       break;
> -
> -               pad =3D media_pad_remote_pad_first(pad);
> -               if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
> -                       break;
> -
> -               entity =3D pad->entity;
> -               subdev =3D media_entity_to_v4l2_subdev(entity);
> -
> -               ret =3D v4l2_subdev_call(subdev, video, s_stream, 0);
> -
> -               if (ret) {
> -                       dev_err(video->camss->dev, "Video pipeline stop f=
ailed: %d\n", ret);
> -                       return;
> -               }
> -       }
> +       ret =3D camss_video_subdevs_set_stream(video, false);
> +       if (ret < 0)
> +               dev_err(video->camss->dev, "Video pipeline stop failed: %=
d\n", ret);
>
> -       video_device_pipeline_stop(vdev);
> +       video_device_pipeline_stop(&video->vdev);
>
>         video->ops->flush_buffers(video, VB2_BUF_STATE_ERROR);
>  }
> --
> 2.53.0
>
