Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794217791;
	b=fHU7J0Wu4gUpe8/5f3ayPWyZrWfWLXDAPJmw+C4RWqQwOOIbjd0gWH9rvO6o4m25R4EV
	 QpBePkZ/aTb3GtYtzYS7vdE+Wi23GlxGw7OOh77PlHzRFIVdTEsi0WC2pJDOxmC/MI5hm
	 0f+CCz46yrrcx1TTFb201NVf12n9lgUqcmKodM7odV4Q4oNufI1koM2y3E48OgheXDLyy
	 EKoJL2rwvmGUhfNZgTRChuHXPYUUr5Gw5/BbD0MHNdtcOo4HEQWelqRPbWLMkryMWf+Xf
	 2DPho/UJjyg6Y58DUy9uBQDSoAKuTuZlSA2pgvvGFJw7ZQLaJLNiL5b4alpTheGXWrg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217791;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=A43LRLlfY1VoB7l3hvfT1w2+7RbYPuRRkaKzPxORuaA=;
	b=CiwVr+aBQER5Q0ahaDvbj3ybjn6yGk+ibaNQZVXtmvPMYazhpr+PDyvLhOp8LPIEhTle
	 9VwERXdpxabyiQgai4W2/Qyo1lW8Dth00iVg0tbVPgsN5IZunGJ50TPCMXa9JmZPnhjA8
	 k68XcV9J48qiyzLDw7k66UJ6P4mvWivJFXfajrDYK9/g8KXWkwy78u2F8IPfMSvF5ed9+
	 edvF+dQDz21KJ/oJep2nzpXyR7SJxHlaAQKpcSIXuOPlussW+qcUwdNI92cKzDSvaGjnP
	 uNXWybu/fHewuxXtKdac6iY/o5C9Q09wEUEk/fNQsgnsxcX1MVB6Iy7freIZTLpa4Dg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QbKCSmbc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="F9QP+O/y";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACEB606A323
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 09:49:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DACEB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QbKCSmbc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F9QP+O/y
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96AVW83582281
	for <linux-media@vger.kernel.org>; Mon, 9 Nov 2026 09:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A43LRLlfY1VoB7l3hvfT1w2+7RbYPuRRkaKzPxORuaA=; b=QbKCSmbcHpe5rKjR
	rn3Xi+QvzRzQ2oF/FbmooC6A8nmvPTqEG7BQu7XTYi+KHxes482WuUVJMcyNkcb4
	eCARzrZYFPpXt04RhyY7s1FsCO8YVJ4h2pAtnWumCUhtjBdZ6kz5pVC13MAM9wTo
	K9u2Aqm9BXloz1Syerp2dztmAOr/Ts/awudO/PA6st/r0/ebvYAAS8xCkF+BK5Wc
	0NqWlM0622MT27w9vsypZDFSu/YQRXgR9F2rcHxOpw1BoNP0zGcJO01cUizPwGuQ
	ZPX/JvdTVW7H9qlkRFOkDENoE89Dxs9MgoiOeAUkopN9jB/rrfRzshT7nFXwBaal
	1n+yLQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsv735p8p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 09:49:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f20addba1so123584885a.1
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 01:49:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794217789; cv=none;
        d=google.com; s=arc-20260327;
        b=mOPPO8K0JCxHqBs94CBcGNNA87tAULAAl3Jq19ffO4zoJHjI33ZO5S6krkdkC1NkN2
         KYl/sUJYBx4bEn0c9m/Cm21VaixZ/wiyyfVeaqEmL4wd3IQhWaESzwYOpmxZVA81uNWU
         3LdcvWl5u7RCTByPmDVjHGeYj71Q2qtw3ChDI3xgKC6/1sKu8nN+nWN8Kuc64R70YwpH
         og+jiS+hZObPfv+WYwqXov6/1OUtuFG+S23NqSEZvL+/OykqNAwlQuqh3dWDLJ00tfgb
         fZiYxJ/DmhGtNJnR5HV6Ko1XY6KYbDAYR5S83SUPBrE6LcZkI11Uf8oi0U7djYfPwBut
         aDkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A43LRLlfY1VoB7l3hvfT1w2+7RbYPuRRkaKzPxORuaA=;
        fh=e4m04zHAO1j+J4aKWYdlmzNyqwoLYay23ol8w3IFJpY=;
        b=rB6dk0TldH74SLxQ6sr+k55j7ebNlGdGiUCDrNhKLqUboyHr7NLKE17A36oacW2FrY
         VTDv4aEHCUNgw9jsFlGWOtz5aVlNqogsq/IqQd41vGKz3XOZKBaO7ZxY2Dh7WFUeTqWN
         Peotm0uzYoUg8njFMVJUwU3NeXP4D1BvjmeNhxjtYKoS6la5sfxTnuY+8sYJVLOQXghF
         wtZl5CsH+bwGZRpVgYwb3ocn/UEnlqY69G3BXaIwTKKwUXdWYEJbLQvfk9l0ye9SQX8N
         b3sbyuWygyLVIkS4CT3IR/8b0R+rK+5HGLwXChhojpVakAC8lrugwf9mWUMyMt/UtTG2
         mL/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794217789; x=1794822589; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A43LRLlfY1VoB7l3hvfT1w2+7RbYPuRRkaKzPxORuaA=;
        b=F9QP+O/yS9iVqZevv379hLgKHHKukW7Dpl2CZ0z6vCwnZV8C4tB2gZfhuXjvIgVO+6
         Lki271XuK+VVv/3gWDrIh29puxB/AiJitkgVjDq0qDPQB7xRI0QhlTG0nTQBYVY/VsUB
         JaheFo8XIgSeapbDZ6u2JfDKvrh6fFEdG25+egX6TJg1kRwTCZa4O1PDGdyl3r6aYLtr
         ddqA/hN9BS6fmeUnmBihSUhIgjt972iSxV4Dl03AIjW3jZ5OUmuDvGor3lpIK9L1k2Vi
         WhAvl+yZsDTIOtIC4AOYp2NHPpDjACdQVw1IQdvexI4xvddnzhwG6rcJeK60Yp0pEmhw
         ylGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794217789; x=1794822589;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A43LRLlfY1VoB7l3hvfT1w2+7RbYPuRRkaKzPxORuaA=;
        b=yCL4hmK1jt9c7NGMImrofhkEu6xLRikFGckI3zNyl0724RLBdp8mV/AsrJLLNFOITJ
         YYBefom50UUO88KaNCEdd9h5q4TwWMBAfY/fcMVO/usfZNJ2UizaAwD/s3HUF6kjgnN5
         BqkXIYnEBSZYZKD+QgVn7nD7sWQbgTGJ2ranyEXHhZn6U3vQ5WmB9q/zwF315PkefJb7
         h2QuM4QQBKkpsibX8EvKfjZHJwGl85Ho8xC2RWCyne2pxgXE94o7QzfkmaouBZK4Wkmx
         au43k6XvfaSFDlMYN9eoNoqXGhSMqgzexiqIWabwcLE5ldRPyEPg6rz7pwU+fKvNGy/a
         Vmbw==
X-Forwarded-Encrypted: i=1; AL+hErH3mJkY/29LN0DhSPEAG+JiJhP3QL87X75WcH+9wrFaZSzW8zddZ/FmzJtWd6u58V0C7XqYWx3T8ZE0vQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+O1/LoE6KlLYjB6CJoUQJqWAEMysHxBqCEtEjm1tgnzzJSATcP
	HWE/R617Pa/kxTPQVQxad0ufW8/a6koE3PdS5CTZQVmHJ2xRqDZqT9m+T78yIwrsMdCcrUrjqu4
	7w7q4vbsyvTcLDhY1K3h1FP2tfuf3SkzcQnBqwP8UmINjzNgSXJvtid8E3t7FX0J9e4bkVILXbX
	DIFqoTwzs7vwjh9pZdqfVultak+CRTo9sbbg4NhUHa
X-Gm-Gg: AYBFou0HunGPWS0QTc0smPOGOeNgD+069w2FdbeauEfP8fA3sRYhxBolsJJmzOEG0at
	opEmYpIIR/ge463ImBSrN+haz02r+2OwoCyZM2SYSMHqibZ1fuU2jFvDgTZpHH+d697JWujMfKr
	k6uA/WT1xWYjgwY13y5BS+k5+d9yOYQ37ODWGCtx3ayRUD/s55pfEIT9yasPn7+G9J15Q3NbmM9
	7lbO3hL0bBzK620J7iNO2bSPiMvO9UrdwMKpMlMDR/8iw4leJKF6ZTyWWZApC1NQZF+CorkQ+0=
X-Received: by 2002:a05:620a:46a7:b0:93f:2bca:2cd8 with SMTP id af79cd13be357-947842757dcmr470394585a.57.1794217788923;
        Mon, 09 Nov 2026 01:49:48 -0800 (PST)
X-Received: by 2002:a05:620a:46a7:b0:93f:2bca:2cd8 with SMTP id
 af79cd13be357-947842757dcmr470392785a.57.1794217788415; Mon, 09 Nov 2026
 01:49:48 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org> <20261107-v4l2-frame-sync-v3-3-e5bf7073a35d@kernel.org>
In-Reply-To: <20261107-v4l2-frame-sync-v3-3-e5bf7073a35d@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 10:49:37 +0100
X-Gm-Features: AclHuK_y07fkzKo1YjXS7RBfNxjVDAed2Q4BKv9GuNKAjF7-rmkOWA5Yh4RIhYU
Message-ID: <CAFEp6-1tMwheRKaN=sEgF9abzNZOLS79OePq1GOwtm8JGXjSug@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] media: qcom: camss: Use SOF sequence tracking
 for vb.sequence
To: bryan.odonoghue@linaro.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzOSBTYWx0ZWRfX9Sg8uWDVAigV
 072aknVZaGDJDdc+9osXwKNkYsS9+hVduWBga4xlRb2XcODWKHFiB0LtFA0DU9THJHomRaMQHGe
 AKMa7lufpiYzLVQ+97/UM98Rm6fzpy+sr1ejqHBdyyrHTOzcJZOQuOYqfzrTU+UHkgLOfEfnVB9
 6HrqHvUsjr+z2ZmFbyk3Aw1RgcNxScQrIJPFrAfyAo/mFyA45eG1Ong47dMg3/bJHYY3rcPKEHN
 m+Y1nJjBERi96DF/eYj5yq7hUAJ7OBOwxe5LuWpBVyV4yx+lZnJNp/zoczM8gpy3Edo5AEnHAJ7
 gyTT16HAfmp49MjRgyHfCTPlNHhCLHxrsEW3GMJGePkrSJNdiY62sHsiBdH9OLX/PrAs52honV2
 Ul0OjXiWKkVo6ExoeF6BgbvLsAfXO/Gh+yQ6o/AaYSSdXRyPq9Z8bwNVVE5fmUL0i8Jful8H9Ya
 /slf0NOLn4AU2Aae1+g==
X-Proofpoint-ORIG-GUID: f1EnJYeMni-h959vfkuOYxRNKUXUltnE
X-Authority-Analysis: v=2.4 cv=bcb+w+PB c=1 sm=1 tr=0 ts=6af1973e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=AFkX6LJAiSV6nzPqyhcA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzOSBTYWx0ZWRfX1E5ULdWzvbm9
 JdKgaWIMOuXzkdhtMLrpFKnKPz5Nbt2zXbn1UWrwdcEFzghdu1g0rAQJLiq6Wxl0kP6Rwkj49zX
 8al0nBHv74d6W8zQ/aAt6Uh7fU3adXY=
X-Proofpoint-GUID: f1EnJYeMni-h959vfkuOYxRNKUXUltnE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090039

Hi Bryan,

On Sat, Nov 7, 2026 at 2:02=E2=80=AFAM <bryan.odonoghue@linaro.org> wrote:
>
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> We want to correlate statistics buffers with data-buffers. To do that we
> will need to have a sequence number driven by the SOF signal.
>
> Rather than incrementing vb.sequence when data arrives, we should increme=
nt
> when SOF happens.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> ---
>  drivers/media/platform/qcom/camss/camss-csid.c    | 14 ++++++++++++++
>  drivers/media/platform/qcom/camss/camss-csid.h    |  9 +++++++++
>  drivers/media/platform/qcom/camss/camss-vfe-17x.c |  5 ++++-
>  drivers/media/platform/qcom/camss/camss-vfe.c     |  9 ++++++++-
>  drivers/media/platform/qcom/camss/camss-vfe.h     |  1 +
>  5 files changed, 36 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/med=
ia/platform/qcom/camss/camss-csid.c
> index 7f33fb81ca8cc..588122beec854 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -1356,6 +1356,20 @@ static int csid_subscribe_event(struct v4l2_subdev=
 *sd, struct v4l2_fh *fh,
>         return v4l2_event_subscribe(fh, sub, 0, &csid_frame_sync_ops);
>  }
>
> +atomic_t *csid_get_sof_seq(struct media_pad *pad)

I would go with a `const atomic_t *` to preserve explicit ownership
within the CSID.
This is also what atomic_read is using, so that should work.

> +{
> +       struct csid_device *csid;
> +
> +       if (!pad || pad->index < MSM_CSID_PAD_FIRST_SRC)
> +               return NULL;
> +
> +       csid =3D v4l2_get_subdevdata(media_entity_to_v4l2_subdev(pad->ent=
ity));
> +       if (!csid->res->frame_sync_en)
> +               return NULL;
> +
> +       return &csid->sof_seq[pad->index - MSM_CSID_PAD_FIRST_SRC];
> +}
> +
>  void csid_sof_event(struct csid_device *csid, unsigned int id)
>  {
>         struct v4l2_event event =3D {
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/med=
ia/platform/qcom/camss/camss-csid.h
> index a9d88909d37fc..8edb258b0ae58 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> @@ -260,4 +260,13 @@ u32 csid_src_pad_code(struct csid_device *csid, u32 =
sink_code,
>   */
>  void csid_sof_event(struct csid_device *csid, unsigned int id);
>
> +/*
> + * csid_get_sof_seq - Get a pointer to the SOF frame sequence variable.
> + * @pad: Remote pad of a consumer's sink pad
> + *
> + * Return the counter or NULL if @pad isn't a CSID or the CSID doesn't s=
upport
> + * SOF tracking.
> + */
> +atomic_t *csid_get_sof_seq(struct media_pad *pad);
> +
>  #endif /* QC_MSM_CAMSS_CSID_H */
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/=
media/platform/qcom/camss/camss-vfe-17x.c
> index 62c2405359a06..4972d3ab65078 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> @@ -491,7 +491,10 @@ static void vfe_isr_wm_done(struct vfe_device *vfe, =
u8 wm)
>         }
>
>         ready_buf->vb.vb2_buf.timestamp =3D ts;
> -       ready_buf->vb.sequence =3D output->sequence++;
> +       if (line->sof_seq)
> +               ready_buf->vb.sequence =3D atomic_read(line->sof_seq);
> +       else
> +               ready_buf->vb.sequence =3D output->sequence++;
>
>         index =3D 0;
>         output->buf[0] =3D output->buf[1];
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 2680a9914765f..da373024c847e 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -474,7 +474,10 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
>         }
>
>         ready_buf->vb.vb2_buf.timestamp =3D ts;
> -       ready_buf->vb.sequence =3D output->sequence++;
> +       if (line->sof_seq)
> +               ready_buf->vb.sequence =3D atomic_read(line->sof_seq);
> +       else
> +               ready_buf->vb.sequence =3D output->sequence++;
>
>         index =3D 0;
>         output->buf[0] =3D output->buf[1];
> @@ -508,6 +511,7 @@ int vfe_enable_output_v2(struct vfe_line *line)
>         struct vfe_output *output =3D &line->output;
>         const struct vfe_hw_ops *ops =3D vfe->res->hw_ops;
>         struct media_pad *sensor_pad;
> +       struct media_pad *csid_pad;
>         unsigned long flags;
>         unsigned int frame_skip =3D 0;
>         unsigned int i;
> @@ -523,6 +527,9 @@ int vfe_enable_output_v2(struct vfe_line *line)
>                         frame_skip =3D VFE_FRAME_DROP_VAL - 1;
>         }
>
> +       csid_pad =3D media_pad_remote_pad_first(&line->pads[MSM_VFE_PAD_S=
INK]);
> +       line->sof_seq =3D csid_get_sof_seq(csid_pad);
> +
>         spin_lock_irqsave(&vfe->output_lock, flags);
>
>         ops->reg_update_clear(vfe, line->id);
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/medi=
a/platform/qcom/camss/camss-vfe.h
> index ae9dad353a378..0e2dfa58421ad 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> @@ -94,6 +94,7 @@ struct vfe_line {
>         struct vfe_output output;
>         const struct camss_format_info *formats;
>         unsigned int nformats;
> +       atomic_t *sof_seq;
>  };
>
>  struct vfe_device;
>
> --
> 2.56.0
>
