Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793286070;
	b=YyGO0VxWLteuvCruyxE9r23G+6co6LInLWtZiVPqWMsSOuG3+Xu/ygqHi3hBjEoct3HN
	 ccsUHhpvkHc2+Fz0+UDyWTWgoe8UkUEF7Gg9aQpDZittJVVkxrvfkplauAcKg6P+heNL9
	 4SdLrgiV+AuYWW8QPXBcX0iAQ6eXN3wRIwkliO82lg1L8vNfcOyO/rdbjawQivA7hR/pd
	 bfzIEhemnutsKxxN1lHnjsbJYImOYv7M8lOH3UXNcTF4w/+KiVQWHYiXLa7bbfEGwp+f/
	 jb6cWcxa02jbqbP3fz8cuYtmZ66/Ps70hG8CvbFkW/4KSYWOtyRucsMAFamBQpP7TMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793286070;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HvBmABCBvRkJYUzqJ00flRX6ofUPT6tR//UvYXyfRJA=;
	b=VSUBKnp351TRF/WGvyGuqDC+UiszNuy/sPc1YQi7JBwZv7E4RJprwkgaqhkpR50mLcpS
	 RqiRBDAtCWj8M5WwEXbr1Y+H46Cl28xLGMD26KaMm1TYHi5v3LyQSl/MxtNeOcBYlSJtz
	 QyaZE7EAbpPTcKiEjSCU41fzJG5g2ZhQbiDNPlFY90vmA0yS0yGFuB81qat5iusPLv+TP
	 rQu9K1u0fEaBnp5knvLFUeU+0Mhh2En9NJ5+ANCDSGpKqW5B6LrclGq0B28WzCJHva8yE
	 DrXt9MkbxG5WJKW8PYvvy1B2Da140NJzGckdSgyFsfVKjg6XyZJNaf1+rC+vruTRDOg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D3h6ZnZP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MFUjnK8x;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB0A606A31C
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 15:01:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBB0A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D3h6ZnZP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MFUjnK8x
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCdvjw1147371
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 15:01:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HvBmABCBvRkJYUzqJ00flRX6ofUPT6tR//UvYXyfRJA=; b=D3h6ZnZPaYF3lbYG
	blUwG57DFfm8azwZ3tjiyes/cCXXOepQ7KEpiVmDR2F5Q9tz/C3T1AJ+jjUyx04p
	NvYfJp/IwPiUDRqbwkDw9OrBNvQNrMyN+NT5jnZjLVmn6SDd3WHnuWcwMwgSPZxE
	Ps1KKeLOcGe00BSyUS8x4J6ASp3t3V+0ybmCctvmCP1WldtXbw/mWHfVDtrmegJh
	i2uv/tBpvWN72SX7y0dGF8GZe3pvvs36O6uK9Aa1cHue3E5Xi92iW8nOMt1o8xaU
	jfnZpRKx+KGZOT4bhwzL6IxnIDJ0r+xxSX/+BDXyVr00pxoIRlYsjPgKT9NfOTEn
	hUzoPg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm44q92mt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 15:01:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ecdc701a2so261720385a.3
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 08:01:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793286067; cv=none;
        d=google.com; s=arc-20260327;
        b=maPpyHgZeOFwxSG0h/i/CTAUmEuFGKHk6kDjD61w8jzpUyLSYp6fBeSFMhA0VdVQ65
         qpspbmSKMjXghgFg7Aa6cwyWoFXsHKMp4QsFWUyzOjtWR19Dfvij2yz5MnbnR7UYTFw5
         XqdC4jmXhkLVDZY3MgU7EHYRzMWvEmwYqIeQw/Mms/Zzw4YtSISk0qSTJ+7raKI1cUBY
         LFyHzZ3Iw3tDYvyEQC+EYI34FOk8aGlp6qkU/x9LcVT57eaOoR+5h7mKZc8ZWaI+8YNM
         SSu1LtqwdVVqQYr7u/gI6Fb4zNGOMUGKQ0Vdh+iD4EwId4anEiuk1lflDBe17ZL7JbtK
         cjIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HvBmABCBvRkJYUzqJ00flRX6ofUPT6tR//UvYXyfRJA=;
        fh=vcepUFd/j04xMHdq9DqLt/0qM84iuQ7ekF5irQrHM+g=;
        b=qZJoy3gh+7PB+ru0nNK5nTq2nisp2j4fzqOgXnIv7kznpHXa3e5TLha84+CRZE6TCt
         ATfDxw7hFGk4pQNvwUCCV8eBbAXMQ5ZmCV3nezz7Em9p8nu1ce0d4MqtoeOoH/Zo6CTn
         bCWiYxxlzu+Pl+a4Oa5NzlVk2xhqAZwsq4GyPHAWPRgKOi2SQPuDxCH84dDm+OIyobZb
         eHTB5W798SrU+eiFi/we9dHpTfvodMYa1pz/tDEintrlbrNMBy/ZnYd38Ss161v48ejo
         GDpFdEIa6Cnhz2bCLqPISFsLQCaNDjNUJ1y4te8G8DiyDV10PktoELg1tIgQw+I27b8M
         +lQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793286067; x=1793890867; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HvBmABCBvRkJYUzqJ00flRX6ofUPT6tR//UvYXyfRJA=;
        b=MFUjnK8xUxOoUTpf9K+jRGJn9VxrFvK+DrOTDUePxG6bYa4GqqxySoq0emInnuA4Lo
         +t+Qur0toWNggXNXXOqkXMF0yVjgAggEQ+tKFCjHw59+eVslqo8eKuPmK3/nwt5P4Xzw
         LNtF146jgoHEEecooF2kgrQZLBSPwyrJFvxRtWDYHakz/wlzM38iEYJWQiFYDMTvgkgy
         zS1p3y5d5I9urByrlgg//Phko0uONJczxyHFblW0PDiCtYevi3oN6uOO/cb//Re1d4P4
         YjEezXED23PbMLXE/4VyOPDCeU1Hzo/ioIxYkMJh5oF+P+R4VWXddGhCkJk9fQKCbh6+
         lbHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793286067; x=1793890867;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HvBmABCBvRkJYUzqJ00flRX6ofUPT6tR//UvYXyfRJA=;
        b=R8SLKED8s00znNZANyFeOlLLZfFRxVsPKwdv14n3coxbT6t7kGakeLaA1FnpxK+IBt
         BvOQ77bWH1NYN/cSsjC5Xa7Zpd4gyieYj27VTrSkjpuR6qYF8QJT1bKeuXkwhUUwQsFr
         x08HxdrIPSYyLPSBCvckxGk2368XXRwE2BdWP0g/wI2KnSUD4Fuu8s8a8YOZqOfhWFu3
         EQgni6d5iCJkOicLJ00EJmwlWCPhU9oEztEBrSk4AWzBxy+rYPY0Vf2VI1C1BgnrxIGS
         Q9SdCuieaoQlgsvEifosfugJ7ec7NUQxuKnwNhog5OArYsHdCnpGivv/JOYUrp14H6QH
         xBXA==
X-Gm-Message-State: AFq9FYIznIV+oP/eHyA/0mhsQ5ruq7zhpObJktbsGQ9LhqulUL5xliQP
	uwCgjkgNn6j9y6eLXcWsSImCJJAtgomsxvLimTbenihw+Pu4f/i7vNtgUUSqCb6EqnaaUsUxyk8
	1BZm6nsSZe7nn3tRQNl3SKcF5gr4FN7KGjC3tDa4DwC8TNjKuw4FhxMkrh7gsFGV9maGwirUIw7
	HmUeCJapKZyBwZRKKvoyM7QHCVVetBRTwDgMCZsreJ0ZvKHl8H6lR7Ag==
X-Gm-Gg: AYBFou0eOhzKiQEkqBFekggQstopXSMOmZT8q8RNkGtswHX6c5CcttnVXR8OtTTHSMI
	xn8UzuX+Dbg+zw2TsDXN9J8m5MVcIalF4blpQ7K9Z+buFKv5myU9DGS4iC6ut24JNMV++evxKbc
	NaNwgHrJAWcGah1dY+eyRQExfDwH2FwlncLf1goO2Eh6bmDFzDmktU5DDewISNHmmiGBnPBovLC
	R4pqy9l5y0JMPb6d9bSFWpdya4RVRnnHnlw0LAhEstijcSPTtIhGoXvB0CgnuU1r5TBsTrctRz1
X-Received: by 2002:a05:620a:4505:b0:93f:2ed6:1f3a with SMTP id af79cd13be357-94408cc0ba3mr830856585a.49.1793286066057;
        Thu, 29 Oct 2026 08:01:06 -0700 (PDT)
X-Received: by 2002:a05:620a:4505:b0:93f:2ed6:1f3a with SMTP id
 af79cd13be357-94408cc0ba3mr830847785a.49.1793286065425; Thu, 29 Oct 2026
 08:01:05 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029123107.28705-1-xiaqinghuan@mail.ustc.edu.cn> <20261029123107.28705-4-xiaqinghuan@mail.ustc.edu.cn>
In-Reply-To: <20261029123107.28705-4-xiaqinghuan@mail.ustc.edu.cn>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 16:00:53 +0100
X-Gm-Features: AclHuK8PQe0DwZ8FBjrux1Zc5_4AUwT8-TJVyvWYZ5AuJYjpyLWFa_T86llNyPA
Message-ID: <CAFEp6-1dRNJ9rr5JWJ0W-XawtE1nby14a-ndCyCxEnd0K=gSYQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: camss: video: stop the subdevices already
 started when a start fails
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1OCBTYWx0ZWRfX7n6lslWAAV+Z
 ffZfolylsRniBO3KiP6KcHIIaxFqGjD3lUPWtZCrBylwpIoPoCphJOAEJjqz6PJMt6xYBExIEtz
 nGCIJW5SHwlWaHYKNDIq2exxmRrx0q4=
X-Proofpoint-ORIG-GUID: IUvzi4oWT3DBub32f-Ts0AWo-LDDZeDG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1OCBTYWx0ZWRfX6ZJbLSCP5Hx3
 82KOf33XIameIPLvGAXOSL+i/uy6DK4gMlYx4J4CMpUm6EWhVgDYfxVfC+FT5yXwo1NyvRd/jND
 d2BaP9JBmcJrPI5jo8rKi2nxwUMjsgubGZ8So2x47yBE2KKittNxnhtt4Tt9rT8sz0ZNt2HBoRd
 acgzez3i8WvB8iqBplGJq9AFW4sgbVNNHHZwff3oHRo7n/mAiedSUy7/a2uh/ytg+dFhGmaspHL
 dZC9n9x4WXBCBVbas6gGIZtvnruVE3L0ftWOMdPB9EmTrH/N3s82LCvvoryCKbS87jA21up7nph
 fC7H5gqbkYanlppQmiBk14RTnAYB0qWlfwMfoj3m8N54wtaX7xXP81hXnnTCpJrJApVuFW/IzMt
 Z5gLozCjcKltn+2wbABimmgqsUF0mI8zsXMCpNtcPDamyY05D1o1Kt9Sm59PoMBKOZ5IM/X908O
 iodYPWqkkxrsq5Zvn/g==
X-Authority-Analysis: v=2.4 cv=CYmdd7rl c=1 sm=1 tr=0 ts=6ae35fb3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ufGlPyg97rzgKyQT:21 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=hCK_lH1sK9i1C6WOWb8A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: IUvzi4oWT3DBub32f-Ts0AWo-LDDZeDG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290058

On Thu, Oct 29, 2026 at 1:31=E2=80=AFPM Qianhui Xu <xiaqinghuan@mail.ustc.e=
du.cn> wrote:
>
> When one subdevice fails to start, the ones already started further up th=
e
> pipeline were left streaming, and the next start would try to start them
> again.  Factor the teardown loop out of video_stop_streaming() into
> video_stop_subdevices() and run it from the error path, stopping at the
> subdevice that failed.
>
> While at it, keep stopping the remaining subdevices when one of them fail=
s
> to stop instead of returning early: the pipeline is being torn down, so a
> failure there must not leave the rest running.
>
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> ---
>  .../media/platform/qcom/camss/camss-video.c   | 60 +++++++++----------
>  1 file changed, 30 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/me=
dia/platform/qcom/camss/camss-video.c
> index 027cf024f9..ee9ffd0432 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -265,11 +265,37 @@ static int video_prepare_streaming(struct vb2_queue=
 *q)
>         return ret;
>  }
>
> +/* Stop the started subdevices, excluding the one that failed to start. =
*/
> +static void video_stop_subdevices(struct camss_video *video,
> +                                 struct media_entity *stop)
> +{
> +       struct media_entity *entity =3D &video->vdev.entity;
> +       struct v4l2_subdev *subdev;
> +       struct media_pad *pad;
> +       int ret;
> +
> +       while (entity !=3D stop) {
> +               pad =3D &entity->pads[0];
> +               if (!(pad->flags & MEDIA_PAD_FL_SINK))
> +                       break;
> +               pad =3D media_pad_remote_pad_first(pad);
> +               if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
> +                       break;
> +               entity =3D pad->entity;
> +               if (entity =3D=3D stop)
> +                       break;
> +               subdev =3D media_entity_to_v4l2_subdev(entity);
> +               ret =3D v4l2_subdev_call(subdev, video, s_stream, 0);
> +               if (ret && ret !=3D -ENOIOCTLCMD)
> +                       dev_err(video->camss->dev, "Video pipeline stop f=
ailed: %d\n", ret);
> +       }
> +}
> +

Now you're here, It might also make sense to introduce a generic CAMSS
helper to walk the media graph upstream and start/stop all subdevices
in the pipeline, something along the lines of
camss_video_subdevs_set_stream(.. bool enable).
While doing so, you could leverage more modern framework helpers, such as:
- v4l2_subdev_enable_streams() and v4l2_subdev_disable_streams()
instead of legacy s_stream()
- media_entity_remote_source_pad_unique() to locate the upstream
entity rather than relying on pads[0]

Regards,
Loic

>  static int video_start_streaming(struct vb2_queue *q, unsigned int count=
)
>  {
>         struct camss_video *video =3D vb2_get_drv_priv(q);
>         struct video_device *vdev =3D &video->vdev;
> -       struct media_entity *entity;
> +       struct media_entity *entity =3D &vdev->entity;
>         struct media_pad *pad;
>         struct v4l2_subdev *subdev;
>         int ret;
> @@ -284,7 +310,6 @@ static int video_start_streaming(struct vb2_queue *q,=
 unsigned int count)
>         if (ret < 0)
>                 goto error;
>
> -       entity =3D &vdev->entity;
>         while (1) {
>                 pad =3D &entity->pads[0];
>                 if (!(pad->flags & MEDIA_PAD_FL_SINK))
> @@ -305,6 +330,7 @@ static int video_start_streaming(struct vb2_queue *q,=
 unsigned int count)
>         return 0;
>
>  error:
> +       video_stop_subdevices(video, entity);
>         video_device_pipeline_stop(vdev);
>
>  flush_buffers:
> @@ -316,35 +342,9 @@ static int video_start_streaming(struct vb2_queue *q=
, unsigned int count)
>  static void video_stop_streaming(struct vb2_queue *q)
>  {
>         struct camss_video *video =3D vb2_get_drv_priv(q);
> -       struct video_device *vdev =3D &video->vdev;
> -       struct media_entity *entity;
> -       struct media_pad *pad;
> -       struct v4l2_subdev *subdev;
> -       int ret;
> -
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
> -
> -       video_device_pipeline_stop(vdev);
>
> +       video_stop_subdevices(video, NULL);
> +       video_device_pipeline_stop(&video->vdev);
>         video->ops->flush_buffers(video, VB2_BUF_STATE_ERROR);
>  }
>
>
