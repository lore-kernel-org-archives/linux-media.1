Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79B9477E3B
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 15:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401480; cv=pass; b=PYVbPg583k77BLnx5yTLpqGwj4lMVqdIUA+oEhsNcs7v+o3/i1Ozzk/3up1HWic9ybrBO5uRNjS7XnD+V9a3R3lNKlxphc1NZxqF1bYNOp4TU95SC5kdZi7f9NIoqqWi+NVlFaACJWDTSR1JPG6olfQUpFD6SHSeftDRFaKxm1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401480; c=relaxed/simple;
	bh=9Ta1M8XJETIIM0prQ4GdP+3MHzBhGBuNdaGROU6B6gE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GX6z96UqWv59MAi7ARjAtpdxub6xFVDxSDAthLdcgK923dmHkamyGIaITQRZPmBFR3X5zmJqlOh3F/dwzG6rH7MONlpA/m8s5pGRMorldcbN1PKWcKbxv0MwNSjGvUFxHVETurn02rv82Ne/3EFvcRgxgmY9OzlPjdvE4SePtYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TRxHVYez; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YkqNsvZo; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TRxHVYez";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YkqNsvZo"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0J454090447
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 15:57:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gkpg2aLKwzhrtz5qzsRq2nrFbgnSGvmpPH/Iw8RllcU=; b=TRxHVYezCwqq4q9Y
	kN/buNB1dNTxgIEKMCqLjzqKrWxwtgDKQB3Tnem/QBBWs/BFqMXfDsRARBJcPo/J
	/sGEIkskxBFRxqY/rIfx6nUIgkXd9RWzSmUo208JD1HMly2JxsFUQfvvA4Uu0Qfc
	TBCG2ozceKL3gE98q8vPlDQBeThe3s4u5U6stgE1TJV+Fxnut16Bue/NS1hAT3Lg
	mcfppt+wy8P41BWph0loM75bl45JoEgbF/DPUBpROD+RdNrC4+g3NuH8Ye4r6X3g
	Xan6vcbVCZT7lQxnL+oRYM0DwgixpKtviJ3BQj0JCm5CrjMlWu76/kLQPu/HmVpN
	Wl239A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg20k1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 15:57:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939f3426a7cso591753385a.0
        for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 08:57:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789401477; cv=none;
        d=google.com; s=arc-20260327;
        b=LvlCq8Gqq94sNMRE1YXH5gYHmJXbOkqIItvkwFrO+LFUnFYoskzd6E5ZzMQf6wqNPn
         IByow+JS936cpEjK9IM0COTu9EmfSBSL0QcdT7D9fpdFR051+xmYUkhnY9l5IVTKwtb+
         au+VkEjrthM/KP72jbWSkmzSvgldIq+6v55uZKMMI4azL+IvGm5aiLhsX5asQ7Reav4X
         L6guVIgVPI+xQyGX01E+6CoIHGEnwZ6e/ikYBg41fHF5Z0IkI1OB98QgxhONKktjy5vH
         70AJFV95R09qlm4fNwLatIDZ4qCTwpNJZ7svWhwMAr+Sscn+JpHT2zUrmxb1AUz7wUSA
         KkaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gkpg2aLKwzhrtz5qzsRq2nrFbgnSGvmpPH/Iw8RllcU=;
        fh=w2b/O3v3Pi4nIjqYI1NWMxxbqvmD4oA4QUyGKmUqoww=;
        b=SefGK6KOA925TjDUpNTEmIfgVbHZYUAQmZXqRJllFNLWHYbtizv0zYVzBZlhUm3uSG
         4FnczpwBgETnp9KhSWLaNzyJjObUMGT3lME9WiT0DbyBfBO/RZ8aTRy4UyxFUIk3r7cb
         zs3L+4tdVxpOvwQWBka9nyzJ6H9jeSd24JxexiPnQieQQxv4xRFgOPKD3Qoa6SYbjLx/
         d/hr3kupILhRYxbapULBm3BMG+/ZIzotKPkjn+VME40JK4CD3oQCEVVhjPu294tgjfBK
         ljcwEf0H3yo0cRPcRAZidv8tYw5wTYQv+elPbE1JgIcJBolVb9jRI1CAkmD8s+EH3AHw
         k1Rg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789401477; x=1790006277; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gkpg2aLKwzhrtz5qzsRq2nrFbgnSGvmpPH/Iw8RllcU=;
        b=YkqNsvZosI8JGf1LVQPH6OoC9Jnn7+wJUJ81EV+mV4NYfwC809F+7gAQ+102BknV7y
         970XVif/B8pFlyecVqzn+wA2lEc10JtP+3B3gtNkgqZd5nWDadDO99FVN4AVQD4Ujsvj
         dTXfPjDuSl6aw/nugZuPZW6YoW3A80lnryTr11nnniL3iGHOw0T1UwkyvscYtCf6wnOe
         ulkDpHBdq4lDRDcS2Y5TVTq7/g7H7H49OgLYWoWpehY5VQM/T3TZs0OWOJt0Bhpg9ptP
         92uBe/JxGJ0bFwlJDooft+1HRHaAlR4TddyYAdCQhf8ehG5LIjwd72mLKqWO8YEelmhs
         /n8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789401477; x=1790006277;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gkpg2aLKwzhrtz5qzsRq2nrFbgnSGvmpPH/Iw8RllcU=;
        b=E/dIhp8IHbD82w4HxNmS4fne+cGeOF3K+Y62ej0MWdEIeZcwjSCA//xtRtFxY9UsLK
         FQHugo345mq0TqZqgTyw/33cQtvBnn2p/VzyFbNp40CFgwXbghnWPOD+zDG+cx9FLm6L
         Ud5YxjD9nO9mWpHE2SggHdWo2CNl0+zlc3iDKhPMznLChDStRnfmwGSR98C4yuad1vy9
         O0Nk5+fxW+btIwmHXYbblF1cDhxMCQExntT6YC5QbmVW9bzPR4e6Hk243TVuWBWXwZ6c
         d81N780MwkdhpFTicpyOJtkIodztp3InU8SLX5KQ0II1C2xSxaRMvFZlh+qdcKLv/MrH
         2rtQ==
X-Gm-Message-State: AFuF++nn6vUucyH9QeW9XNvb6oWMYVKscrx+2yGUpKBKhC4Th2D07nQf
	d74VPxVSUudmJABg+jLnQKMRKYVp0pffuam3sqyXQsK2Ppc8wuo+5dY5714w97T80DV0NvhO8f3
	cklxYKQvslVSGMyA5tFZP1qz0PWQTnpqkE98DQ96iNAq2ToVbca5MBxSti0zLEDG4eB89uRWklp
	B4lUHePLxwMRIYP6avemt+twj82AVJIP9jt5o2oD92
X-Gm-Gg: AYBFou1JwAhr3W5+qxQtGLbXf7wsbNNrrDn56lzbUSqRFtFZrDPTZxzbflV4Lfrtf9B
	ycf5xLZ8Q14Yk3FjHNdtLxxm8ForwmoRBAaeukq0feLI5wovL52+l3IV0zwNLMvDe5+4HVX6TuY
	uKDrVJKGVUPZB+6Zuqi9PsJzR1NXNXt891cg3xnDoMVjcNuoFkJmsVCQ6eZXsK1x+0N3XwmDJJs
	/ofX+9vAFHLtLNJ+SZTZMTBi8eG0wnFB38OLO2DvJ5D5/FpkqVpDRdr/dSynFiCykTKMQERI8w=
X-Received: by 2002:a05:620a:470e:b0:939:b43f:341e with SMTP id af79cd13be357-93a2987f902mr442694785a.22.1789401476749;
        Mon, 14 Sep 2026 08:57:56 -0700 (PDT)
X-Received: by 2002:a05:620a:470e:b0:939:b43f:341e with SMTP id
 af79cd13be357-93a2987f902mr442689485a.22.1789401476216; Mon, 14 Sep 2026
 08:57:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914133416.1030231-1-hitesh@ebytelogic.com> <20260914133416.1030231-8-hitesh@ebytelogic.com>
In-Reply-To: <20260914133416.1030231-8-hitesh@ebytelogic.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:57:45 +0200
X-Gm-Features: AcwNN1XINkaus2FnglJoOiLWFzpVQZwTJhph8aa6885b1nGo29uYeYlIMD4gkXI
Message-ID: <CAFEp6-1yTw+p6B_dOPAtidiNvuYXqAq3PxwWiEkCp-G7ZtVhdg@mail.gmail.com>
Subject: Re: [PATCH 7/8] media: qcom: camss: drive streams-aware transmitters
 through the streams API
To: Hitesh Patel <hitesh@ebytelogic.com>
Cc: linux-media@vger.kernel.org,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        ravi@ebytelogic.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa81985 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZovgdgjKAAAA:8
 a=HxDX4g0csZKSo-3CQAoA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=VOxKbm1zgHvARWIDjr3b:22
X-Proofpoint-ORIG-GUID: ACibSO-bnW0Qv6x7AF3sDmpcD1jVTR9d
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIyNyBTYWx0ZWRfXzQl0ziLIIBp3
 LZQqK/XHNRHJydJ7Pd48uFYYMy1tbpYBNWKtnNqaXN7Mdt+KZ5SrG3RnbIcK9+soXVnAjMr2Ht9
 IAyXsIJv1CWGisgMScGXrKVoxWEF2gQ=
X-Proofpoint-GUID: ACibSO-bnW0Qv6x7AF3sDmpcD1jVTR9d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIyNyBTYWx0ZWRfX5JKiHwm+9p9h
 UnXVy2Qwkwz9rvl65RJS4BYtQdsXkpUyJRwGFWG5pQzRSqUWV3BMdf2mkRj3kWBz0VDMy6kFrM4
 uzdvXJ6JXRsxVDD06cC0hbyskEqKnJH9iRlV+/cpaUjfiNIyEl2VEv6+QacmMk/Wk4WrT3/A0c4
 HBXYCs858YrZeAvtYofjbYT7wtlybAk8Zpyt0APklbz441i2Sy5gur7MdqlJDXOjVUUEf58aj+D
 cKG2WMLrxL5FxXUIYRe466K+t0V7ug0hWHPI00DmJFi42Nhl0ckYwcrAa71ogvhtPtTwS/SmptT
 SKDgOjGME6P1ay7VTSWS6hmXHoEBdlQh0X6sqKql0Mjh9A6HV0mVYHz1GSKGGSrUhX4PY+wbYZz
 73MIMcC1K9OoL6y7oFe7z8XwXXXJdxuCPBlhgXKjXQ12fU8Q7AV29MspRyzHXNWmevwaoxhKeQr
 RfFA10IDFDfDrK4KQkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140227

Hi Hitesh,

On Mon, Sep 14, 2026 at 3:34=E2=80=AFPM Hitesh Patel <hitesh@ebytelogic.com=
> wrote:
>
> video_start_streaming() and video_stop_streaming() drive every subdev
> of the pipeline through video.s_stream. That op is per subdev, and
> the core allows one transition per subdev, so a transmitter that is
> shared by two independent pipelines can only be started once and is
> stopped by the first pipeline that stops.
>
> A GMSL deserializer with two CSI-2 output ports, one camera routed to
> each, is exactly that case: the same subdev sits at the head of two
> pipelines that otherwise share nothing (each has its own CSIPHY, CSID
> and VFE). The second camera never starts, and stopping either one
> kills the other.
>
> Such transmitters implement the V4L2 streams API and advertise it
> with V4L2_SUBDEV_FL_STREAMS. For those, enable or disable only the
> streams routed to the source pad the pipeline arrived through, using
> v4l2_subdev_enable_streams()/v4l2_subdev_disable_streams(). The core
> refcounts enabled streams per pad, so the two pipelines no longer
> interfere. Enabling streams on a source pad propagates upstream to
> the sensor by itself, so the walk ends there rather than starting
> the rest of the chain a second time through s_stream.
>
> Subdevs without the flag keep using video.s_stream exactly as
> before.
>
> Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>

I would like to point out that Gjorgji has recently posted a CAMSS
stream API series [1]. Would that series address your use case, or are
there requirements that it does not cover? It would be good to
understand whether there is an opportunity for a common solution.

[1] https://lore.kernel.org/all/20260911062213.195007-1-gjorgji.rosikopulos=
@oss.qualcomm.com/


> ---
>  .../media/platform/qcom/camss/camss-video.c   | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/me=
dia/platform/qcom/camss/camss-video.c
> index 16c5f3748..90f22ce76 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -249,6 +249,32 @@ static int video_prepare_streaming(struct vb2_queue =
*q)
>         return ret;
>  }
>
> +/*
> + * video_source_pad_streams - Streams routed to a subdev source pad
> + * @sd: Streams-aware subdevice
> + * @pad: Source pad index on @sd
> + *
> + * Return the mask of streams of the active routes ending on @pad.
> + */
> +static u64 video_source_pad_streams(struct v4l2_subdev *sd, u32 pad)
> +{
> +       struct v4l2_subdev_state *state;
> +       struct v4l2_subdev_route *route;
> +       u64 mask =3D 0;
> +
> +       state =3D v4l2_subdev_lock_and_get_active_state(sd);
> +       if (!state)
> +               return 0;
> +
> +       for_each_active_route(&state->routing, route)
> +               if (route->source_pad =3D=3D pad)
> +                       mask |=3D BIT_ULL(route->source_stream);
> +
> +       v4l2_subdev_unlock_state(state);
> +
> +       return mask;
> +}
> +
>  /*
>   * video_subdev_set_stream - Start or stop a subdev of the pipeline
>   * @video: CAMSS video device
> @@ -324,6 +350,20 @@ static int video_start_streaming(struct vb2_queue *q=
, unsigned int count)
>                 entity =3D pad->entity;
>                 subdev =3D media_entity_to_v4l2_subdev(entity);
>
> +               if (subdev->flags & V4L2_SUBDEV_FL_STREAMS) {
> +                       u64 mask =3D video_source_pad_streams(subdev, pad=
->index);
> +
> +                       if (!mask)
> +                               break;
> +
> +                       ret =3D v4l2_subdev_enable_streams(subdev, pad->i=
ndex,
> +                                                        mask);
> +                       if (ret && ret !=3D -EALREADY)
> +                               goto error;
> +
> +                       break;
> +               }
> +
>                 ret =3D video_subdev_set_stream(video, subdev, true);
>                 if (ret < 0 && ret !=3D -ENOIOCTLCMD)
>                         goto error;
> @@ -362,6 +402,22 @@ static void video_stop_streaming(struct vb2_queue *q=
)
>                 entity =3D pad->entity;
>                 subdev =3D media_entity_to_v4l2_subdev(entity);
>
> +               if (subdev->flags & V4L2_SUBDEV_FL_STREAMS) {
> +                       u64 mask =3D video_source_pad_streams(subdev, pad=
->index);
> +
> +                       if (!mask)
> +                               break;
> +
> +                       ret =3D v4l2_subdev_disable_streams(subdev, pad->=
index,
> +                                                         mask);
> +                       if (ret && ret !=3D -EALREADY)
> +                               dev_err(video->camss->dev,
> +                                       "Failed to disable streams %#llx =
on %s:%u: %d\n",
> +                                       mask, subdev->name, pad->index, r=
et);
> +
> +                       break;
> +               }
> +
>                 ret =3D video_subdev_set_stream(video, subdev, false);
>                 if (ret) {
>                         dev_err(video->camss->dev, "Video pipeline stop f=
ailed: %d\n", ret);
> --
> 2.43.0
>
