Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794228985;
	b=Ir0Ef7Kpg0Il4P2XGXYT5La2Y0p1VhrEq+e0euZy56DeanXPg952nKNhR9agukYK8hnm
	 N5uQjgeAhiynEzYRq8+nVFvT2LfGQF3pI39BG3UsIFzmXurEH8cCzh4JbZd9L2Bt/BKps
	 ICNRSqb2UHDdYA3S9pb96Ik7oYGagfV5bKnmGKi79fLHL4mCqV/w+L1REo9CgyI6Cx8Zp
	 25sNhvB3pzR2DZzIyUcB47i/Hm3en5/Ih/DsYc7cAoBP3TU1+ZbYWT55JpehCy+b/L8js
	 fJsg/Z1Sq/ofn++qe6YmZ2kE6lU5TkOz1xlo5qSE3shupZxFtjQ45MPOrl3DzWWxadw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794228985;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Rbfxx4j9U/TwmiB1OprsBSpdtAuk64NPf793dOIa+DU=;
	b=YIOdMWl9QBUgjjrOGqzyKQIQ7fzR/N4UBc0BkLmZxGd60EvPg7RnFfbEMpu7yzqKp0cf
	 iFxNMXVYQfxlp2Bco09AfR3iKCcZkYPqQv0XluPLWS1II2dKTR83qDEOPJInUqJTzkpsZ
	 urxULyA3pV5G+icawPbMtJ1DM8QsITA+0dwEfmhJ5OHxpPrAechvzHBGEEmcQZjaDG0wj
	 rGeUStaEknO1LB3AUONipXqXy4ZJVfoS9i79UeqWuNVG6fCR3NU0+YNQFisGnC2Bb8Psd
	 Zv8zgFmwOhesWZb90QsRcwlko3L8e9xJnd3XHYnSSndWi91WgCq+CN6M2m3YzLOshuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GZHRCDNR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gLJyUKIt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DAB606A31C
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 12:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5DAB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GZHRCDNR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gLJyUKIt
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9AuoPh034439
	for <linux-media@vger.kernel.org>; Mon, 9 Nov 2026 12:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rbfxx4j9U/TwmiB1OprsBSpdtAuk64NPf793dOIa+DU=; b=GZHRCDNRmwLs1HaR
	aEnt0Bt8GmyRP8tfkk2pxl/tz4eT4kiq0Ew+hnyd5cc5VwdjVIaShGiZy2qdKLK9
	94AcZUZT5jnIfCmFkVFD93w4YorUstdbreUI5BtjWbcnmJ9N0sMrwHyurjstSGVM
	zEVOzP+otwFJa/kZ79JHZa3u8Epgd/bHTzXuGFjk8iOZ9sTLGxkXQnLCIzQCOpWV
	sULZf2JSYAjQKlEej9AI+e5VZnuZn8WfPdPO+Kp/ROl66OHdLPcLoLw7IlYGYPvG
	jd7EQKWSPNt9zNGgDv+J3W4lXQLIfySev3wzR1o2zQkfNxxqSH34WFhd2tsIC88m
	hfkV6g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucr5rcv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 12:56:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-944138ed63fso140644185a.3
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 04:56:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794228983; cv=none;
        d=google.com; s=arc-20260327;
        b=Zljq70z4PLF+r2Ix0RET0o/Rq1TD0BJg5oS5Kvq+gwxu8rOtpcP3ossEOBbTfmaYSK
         V3CqjSpHYxvJliFwnZXI7zLPoCeBa6Y6KJRhECuUmLdAeK094T1mjSaqGS48Tr4lgnxC
         EAgjyvcLePi+v4QQKU6p/H1x7wRzbHGbwLuYuEwofhi9vaPb0j9vlPkUpTzrGm+ZFWml
         IFulXA1RPc98NtEtxMNbBERbBq55A4j+oQYwWIC/rTZxNvEEqh6iUPeEJwyQIfeBlk59
         RhzFWT+Qytc3F1oq9+bh1t1QcyV04SNTfJtqZ4uu1JYs7T6hbXhnsl5GZbkt7XC0F4DA
         KM/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rbfxx4j9U/TwmiB1OprsBSpdtAuk64NPf793dOIa+DU=;
        fh=IIYKaNcD5hRl+Tp7ygo3tY18HLAIkynhOj7/dXAT6ew=;
        b=bKmnX6N8Phr6Nyx2tnFdYSzdsZ2YYYeBrqjRxIl4h4CqgTarUmP0Hk+Kct+LXzqBsb
         XEN8n090cxkE1kJgONDf+AVACQUR8mcHo2sJFwnvHyE762OLjMvmZzHBGfAqDBetb5NS
         sDYeLfTpg6rFldeGqv3oU/iJqwN4LKmR85+XKTeO6aSdPToNnwJKQAV+Ad5HGIoZmWRm
         ZInr0xQxCP4YMbRr964VLr+srqsR4I+/Ss0OROJfEt3GN2FX13e4gV4lGMXuMEuyRnIc
         PfdyP/WxB6jbKtdGNbc9EEahyq0nhjXnkNiZijS9iT7MFpRX++Axf5Id49rQZbvESrwU
         q6Sw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794228983; x=1794833783; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rbfxx4j9U/TwmiB1OprsBSpdtAuk64NPf793dOIa+DU=;
        b=gLJyUKItZurL5R19QpsemoNX0HxU7Y+G4TOHmG7l3282u4W5bxkhcRsm1Ww1LrUKFR
         8/cA97lGZn0PA30XaDfPUv+w5BDAs39ZLQOATo4prG9JN1uwSw3gukCCj9vMhrYqSaan
         0hi19UIDZitR4tkDnru4zfHZU4KizutmTrGm0AFBeyYCFiEqFLNCsXf8fxQZ+efYeUxU
         /ZV+5aYkUB465w9sPny2drfrAcR4irCfzdFJA2qaEAT16tuZ2uEU89xNGYW0qZ6qDbVL
         CQ3PHiDTAYsBhNTtJI8tDJSQLdLlpUPqxrDEfvA2zaAOtxO8GtE+eDvc9Gw5U167eNTH
         dDzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794228983; x=1794833783;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rbfxx4j9U/TwmiB1OprsBSpdtAuk64NPf793dOIa+DU=;
        b=jc0lilUZKrSYcsKDGBW04DwQ/hZFSlpci5J7Mqr9gtxjwy38r074EgCyZbelFXzZRC
         9DkMvwxpnbozWXtzyFtxTvH/Dd2XoyT6a0iolaB3NZCk8VsyMX8w7zS1ldI4PIFgsk6/
         emyNfw1nrT1+BjDeUye/n7lqvafNtuH84HLaPl36tqDj/SMZ84IOHn/umFclciTTVUPk
         8xp9V5T+KY6Sl0nqhtdh3B1yT950RJ5eK+ducIuDzcmHa3yXYPBMJ9UevkM7TNUMPciq
         Ee9/uV+17AzLAPmXMf6XNimky8vWF/jU301mWLeg6CyijfaE7Sy7b0HADKhhfhK1bnN0
         B/LA==
X-Forwarded-Encrypted: i=1; AL+hErE2UVtSNjZqjTuYvAH/WFlGAzDq6d9xYC7Yc5DCyqZ9cJJ0AVtkx/weqWaInCyEda29Xhtqf0SUJn+c0g==@vger.kernel.org
X-Gm-Message-State: APuU4Z8rPgaixpmLrd9mvVBWcC4u0L+M8rH1O1T86TEO4uM62pRVNWI3
	IIRmrz2eeQk0U9Ndc04TNNRZ6/ivJFNplXZwrYYTyLZcPlVe6stpkRPn4yyA0/64R1DRz4A5SQZ
	iHl/st3udE5MvGlLbPYiFRMWSLHqw0ypmn5939LnD1TAfADUezt9yvszP6N8rsRPQCvNAz2oC8F
	/k06vA+CfkjCrCSts2z0S+1TAJkKgobU7YFyyiQzL7
X-Gm-Gg: AYBFou3JCiW7AexcQNim5UPnJZPg8JaaQ10GIduN1p/zmlKIw8BJYtYwrzpzEmpmXVV
	uc31ap2IlTIb2ltvR+Tauk1vHCqz4S2u4waRUsb3E4/PB9btJcajsD4nw2tMQ+Xx7Gy+yGC+H46
	d+R9fy9noMMqP4EYyHz54LO78RAMoR3eLl91QL44kcHIKtQLRRxXn6RlrB8CMs2ZA5/3lgHZZct
	GoIdlHe6nrkoN7SA60bXpxTJfqPd8r044Y9+aV1MksUhaR5kK5576lsIDKsC9HQ684dcTbdbLA=
X-Received: by 2002:a05:620a:838d:b0:93a:2150:ec06 with SMTP id af79cd13be357-9478422fc8cmr547411085a.31.1794228983079;
        Mon, 09 Nov 2026 04:56:23 -0800 (PST)
X-Received: by 2002:a05:620a:838d:b0:93a:2150:ec06 with SMTP id
 af79cd13be357-9478422fc8cmr547406585a.31.1794228982628; Mon, 09 Nov 2026
 04:56:22 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109112611.94010-1-allan@fatecpompeia.edu.br> <20261109112611.94010-4-allan@fatecpompeia.edu.br>
In-Reply-To: <20261109112611.94010-4-allan@fatecpompeia.edu.br>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 13:56:11 +0100
X-Gm-Features: AclHuK_pX5cjcq1dpBPF5s54jQuJQpNTlm-1RA8DMjxVMXKjxJaJCgy01Kzjzr0
Message-ID: <CAFEp6-1Ok1S=t+yuBu6XB8_WZkJ7h1TYr=S+RvpuDzLimoByeg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] media: qcom: camss: always stop the pipeline in stop_streaming
To: Allan Siriani <allan@fatecpompeia.edu.br>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Todor Tomov <todor.too@gmail.com>, Hans Verkuil <hverkuil@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MSBTYWx0ZWRfXxds4kL+yE3Vj
 T4MEPaYSZFX6xPoNlZ75CdCGdpOujEj4mdF90j22w9MiqB8gG28ELA+V5ZXvTKllaYmxXLgYv9n
 zhYVbEw6ql/3PzdCnvKPSnaLS1pFYtg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MSBTYWx0ZWRfX8SraHnSdzaj3
 pqTVwloGvI4BHLptdXt7+uorAxU3ONQclcEZInvOInxLqaZ5yaE5BBKdJLP0r3GqsEhGtlv6QrZ
 PWsm2RospBrfioV3i0/oYQdeSMy4+YHEjFzlMxHqD3xfhIyUxZ1MmdNlTgtmjlanI5SEC9+24M9
 BvpJKbrYeuT9CRI/9iLJGccHAiwajnnE04PkcsxsVMrIkOGHozbqKbDxZXqTFXNLK6Yk77OscAD
 wpQ3NXIJsLbqktnPPhakQocCMd+xRV/qHRmQXtLkZU1vwMwRvj9UN49N6CNPOrUZZnFaegbCsDH
 l3Lavwk9rigQGeYIfiVlZH2spBrh7e4mZD8hApiCjN0+f6rtgX0S/kiaUPJVumUbruIn7skN8E5
 jRND95dj7AxGKQO/ahCJYfKAw/Q7RHdrNEp7NM8Vq4RYxl+eKkF5oRGKaMQ4bSLWHGk8Le/ZVl6
 jJvusT8CRiMe9znGY7Q==
X-Authority-Analysis: v=2.4 cv=ErlHPicA c=1 sm=1 tr=0 ts=6af1c2f8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=17UmKnwEPstP-2NXI4oA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: GW7SWEmNm7n4B52JteHUJB8PVf0GP-CH
X-Proofpoint-GUID: GW7SWEmNm7n4B52JteHUJB8PVf0GP-CH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090051

On Mon, Nov 9, 2026 at 12:26=E2=80=AFPM Allan Siriani <allan@fatecpompeia.e=
du.br> wrote:
>
> video_stop_streaming() walks the pipeline upstream and calls
> .s_stream(0) on every subdev. It gives up on the first non-zero return,
> without stopping the media pipeline and without returning the queued
> buffers to vb2.
>
> A subdev without .s_stream() returns -ENOIOCTLCMD. video_start_streaming(=
)
> already ignores that, but video_stop_streaming() does not, so with such a
> subdev in the pipeline, e.g. the pixel array entity of the MT9M114 sensor
> driver, every stream off:
>
> - triggers the vb2 WARN about buffers still owned by the driver,
> - leaves the pipeline started, so the next VIDIOC_STREAMON and
>   "media-ctl -r" fail with -EBUSY.
>
> Treat -ENOIOCTLCMD as success, as at stream on, and only log real
> errors, then always stop the pipeline and flush the buffers: a
> .stop_streaming() callback cannot fail and must give back all buffers.
>
> Fixes: 89013969e232 ("media: camss: sm8250: Pipeline starting and stoppin=
g for multiple virtual channels")
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Allan Siriani <allan@fatecpompeia.edu.br>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss-video.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/me=
dia/platform/qcom/camss/camss-video.c
> index 5de6ff5ec..8341666f9 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -313,12 +313,16 @@ static void video_stop_streaming(struct vb2_queue *=
q)
>                 entity =3D pad->entity;
>                 subdev =3D media_entity_to_v4l2_subdev(entity);
>
> +               /*
> +                * Subdevs without .s_stream(), such as a sensor pixel ar=
ray
> +                * entity, return -ENOIOCTLCMD, as at stream on. On a rea=
l error
> +                * keep going: the pipeline must be stopped and the buffe=
rs
> +                * returned to vb2 in any case.
> +                */
>                 ret =3D v4l2_subdev_call(subdev, video, s_stream, 0);
> -
> -               if (ret) {
> -                       dev_err(video->camss->dev, "Video pipeline stop f=
ailed: %d\n", ret);
> -                       return;
> -               }
> +               if (ret && ret !=3D -ENOIOCTLCMD)
> +                       dev_err(video->camss->dev,
> +                               "Failed to stop %s: %d\n", entity->name, =
ret);
>         }
>
>         video_device_pipeline_stop(vdev);
> --
> 2.43.0
>
