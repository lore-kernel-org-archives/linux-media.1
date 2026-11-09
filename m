Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794216958;
	b=u6RdndhoLsXDl9ImfnQjxU+h53k08oHG26/WKrzHOnzwrbwxWLkiqaJgw34ePVTxreC3
	 FSgBIn3BTo5C3gZJ0mEGoxN67Dg2+50+OfFvKciPEEKqfXbd9FkXwALiLVyQ7UZkRbCfx
	 dKYn/pzmAZYi9DUeqNnuVJdZxx7gMEWNAcr3NXdG1WNPHIgo29QWqrZFbmuIw3FEcHUAH
	 o3sH7FNXlvaUbLnbfmbGfCptLd3i+dUcjdqwvOH9vN2Jk1jVJR86LOUC6Equk65y4sCF1
	 0G4m1GEzWUc+9iZ8SsoExd1NgTw3NuDsDbWzf8l9ix1nxYcNy2O1TZQ4wEFr1HSkxnw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216958;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xbeM8g8zqHzgMBSkaZOk8eKUdUcdQmlNvh1nMX8yoaE=;
	b=yTmzSZJh1j+RWd3MInWkL6f3/U98o1/6xEg0SmTAgZr2oGy+SqUHiox8NxMCP85uPD5L
	 Pv9IOhkk6bEyr1qmvBMa4vGIPlKsN3aipvwDTmucjy7r/eNIUxmloPCxDTI46asIX1odp
	 4n+XuQmSeReWSRwNkqrR1diJI2BM8pGBJ8e230aK4xyihCUnNyoxlf6VjdyCC71fJKpgI
	 +v0D0e+SoCHSoYXeJTAlBQmhn1ZS5jQo851dGWAKtFsNgKisDageUF6RcZBwmVZMco9xG
	 hS7T62zWhwxdIdrXzNIa/X4PX8r9Kgg4dZClnYAWX3znTUbghWOiULH4WVY7yC48D1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k59Rh23j;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dkgMrfzk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119E0606A31C
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 09:35:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 119E0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k59Rh23j;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dkgMrfzk
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96AihX2008411
	for <linux-media@vger.kernel.org>; Mon, 9 Nov 2026 09:35:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xbeM8g8zqHzgMBSkaZOk8eKUdUcdQmlNvh1nMX8yoaE=; b=k59Rh23j1+/mJ9Iz
	Q/lSh/AFKzplHqzHWeTReZ/CAiPKqq0uTUQKjsY9kcQja5Np1X0FwurOR/v9SGHn
	NlhtUAAJsrhBc3RgyJ+KY9aEIes4/h4vW5hUB44tt5Ak1VvPT1DAWYS4E7td+hnL
	mXQAbNn1qufc5SuHtVT5vXxzm00jz3l1S9trDw7ix/lndzSb7XN0ne8BxYstlJSo
	eiEvS/EMRYadWnRFTBKtZvKZm/ICNzaEekUdxeQwfd9YKTs7Yf23CuFF8sPDVeZc
	CUYqrDznXhnubQ/kFmucDz+gjFYspnQvAUlWMsTn99jfZ6xOB5pkh2jGhlXhUAmH
	7wU/Rg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsw5k5gjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 09:35:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb93c874bso160867385a.0
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 01:35:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794216956; cv=none;
        d=google.com; s=arc-20260327;
        b=TzYoswxVoqC2g01Rn2tD0QdXWrRTjN6cVG8HV/azAgGm8rXRtnOziRoFBxhxYwZM5o
         uE9Nwdgv5bN0FltT62kM73d/99vMUCj4LdtyRIbVTj2kUxy5MRv15thUOBnzV8zAfOf1
         B/cdJonw2CjTXZnAXPpa2VIrrOgp38P6CZ8jbvPlPBauImPAHLGq+Ia6+bkmqYPfMuvi
         /L5eeP4mctSbXUTbpvTNv//dwABhpz7+F3mRGhbnC+RD0vQO7fP8ZeB1EGjuCbbOuAcs
         doYqsPH4Ew9YWSTaWV1yLpdyuSoOSt2nRcATdscrC5/MHont+FtSix7Om1w4NJEYhwG3
         4x0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xbeM8g8zqHzgMBSkaZOk8eKUdUcdQmlNvh1nMX8yoaE=;
        fh=SaLGpr4UUEVrWbpnu/TrbJ9MKOQ84ODy09D8UeqZXDs=;
        b=eTZJbCDyGtt1mPrhpV5f5lAMj88gt6ba2uikl4ygPliEifNrtkp/wSEM+BlWJOvwUP
         KEsGekijH0XGi20I3fbTp4IverRcjXTFXa4AwDQxJ3zOxc4ZXfvp338Z7imLVE9di6ZA
         r/NNn8ZHkQDAG4GkrFcbUcCgVUBCGUgEOeqKYA8UrcfkGe8SpoERHE71X/m60jvQ0OwG
         4DZvNeyI4/OzQI7dkDtyMSxVqjzZ934LajV/ShqdgWUwDZNI4PddSZBqLhaLhHSzDffQ
         mGPt/6pge9GVuKEnZRjZmAxMsTB8e/sT8Z3J/QiteqWUN4l6No79k017yEGuBxaiZBA7
         88bQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794216956; x=1794821756; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xbeM8g8zqHzgMBSkaZOk8eKUdUcdQmlNvh1nMX8yoaE=;
        b=dkgMrfzk/OeSKfPGyF0nkbZlsCBZY/4M+o2Rq5l/N1k5FcWldWJpDaOE9GhCMldOJO
         Qoosjgag6Ivm/1WuSs+zo2Bk9beQsfiv0tS1kcHVtLiM3DjBZyx2OaUDaBONRBAYCmBk
         aMe1DcyQ8IsCOl2o8HdLfZpBHaAPeroqiyuIH3jyADxcjfgk5ec8eKB0mYUCGUGixDYC
         VdH7OGHIQJADJUBt0TfHZ6Ju3HgktXMQICNyVyxOhRHhOsrhUTf782zw6yHV6xLwT4/L
         u5q8A4ELCR/Xnr//HA4ZZSdxyJOGNmWmlxBtOTB7YUpdFLJsjkhcF6rdzuB40GgvhwL8
         a68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794216956; x=1794821756;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xbeM8g8zqHzgMBSkaZOk8eKUdUcdQmlNvh1nMX8yoaE=;
        b=tL9synGV1GcV8dSVi+1IoRRZI4b4awm5xB7hf0ow1mwdjYu1/qyJyziAmDtXYvqMZT
         HPplBXZ+AV7otM8STs5VZt3PYO6Rcu0xZsMYeRUX0rhwwyfx44hKoFKpcsrwa3oCd0dy
         2NDrF69M3QKr7Ip5/SvYOQOrOTbibyLhfzhLrcoY19UZV+R4pbpKJr3WdqlZSWAha0Dn
         9m1Gwn0ZIIUmRJSMfveDoT+WRVvjjV1AJNNTeCSezON3fpYDk7NzLc90Z4XvRhO8sNck
         CF08dqHsRuFR5qMvl9SUz22VLCNTNPHnCWvwlJe3fnZU/P/S2ciLAvZh0yjFWLIzIXKl
         +IVg==
X-Forwarded-Encrypted: i=1; AL+hErGGKFSPghKJ3qhFTBa0kbb7WN5V86gig0u1CNga7Eo1xAmyamCRUH93L8+enz2REYvpwz40VF6yT2e7RQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/hrwhHzkL9B4mYLFKIvK8Yplqp9bsdBHVcWuXjOMgKDz6zWKUm
	ZnRna+/h/aX99pwIuSgbAQipyeUwxuGdQ2FbGxEozztiXMx0pkvNIeGAOs29DJlK/AQNrJq3xG0
	fzw/VNePVLg12YPfG0lo3u0HJxbgzW7GwireWh3BZWHAsUF6M98led+DKU/k+8NFEOwpU6RZrk1
	3v8WQPe9B/25upUE0MdcsqlA5Xpz1k7aZOXkxRqdpVSGcQrBjq/Go=
X-Gm-Gg: AYBFou0U6IRQr+WDnqMERnyBpJP/oe0F5ctRPGCIgvIrJV6L1gkrY7ZT5+51viAXPV9
	j5nI+U42ARqDsSZdDbgMFotFWbrHf/WFTzqHjaXl2hZ2QIqemSLFT6R3YYjDYt5f3IZxycV4sgZ
	slm5knFhknd6Zbqo/1zEzpVtixxJ+NjCtfTCDJEio0u3KMcFLD1fYnju5YqdJ+v4AyGX0Kf7Y9n
	KXlUUdpBkFbflp/csfFXwoKXiZZtXoKeSdPw1YFkHvsyqYRGI4cYKpIhNXm8+HI3e1uSHUewtU=
X-Received: by 2002:a05:620a:4381:b0:939:944b:2814 with SMTP id af79cd13be357-94784201bc5mr489627885a.19.1794216956248;
        Mon, 09 Nov 2026 01:35:56 -0800 (PST)
X-Received: by 2002:a05:620a:4381:b0:939:944b:2814 with SMTP id
 af79cd13be357-94784201bc5mr489626285a.19.1794216955763; Mon, 09 Nov 2026
 01:35:55 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org> <20261107-v4l2-frame-sync-v3-2-e5bf7073a35d@kernel.org>
In-Reply-To: <20261107-v4l2-frame-sync-v3-2-e5bf7073a35d@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 10:35:44 +0100
X-Gm-Features: AclHuK_kRS6_i-mtkKs6t_W1vede9PNYOgkyMo3-4PjlVizTB2VyTP2OY2wOt6E
Message-ID: <CAFEp6-2L36F=Q59zEHU_6q-atG8=aU4je4OYOF_CTSTjek0VdA@mail.gmail.com>
Subject: Re: [PATCH v3 02/11] media: qcom: camss: Introduce SOF sequence tracking
To: bryan.odonoghue@linaro.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzOCBTYWx0ZWRfX32qBDO4m30oe
 jdZ+ioq1zqNBhG1dsBR+K5WyknQmozRBg2OgCoo5P7oHt+ZxGbEv1MU5wNsN03R56fsffCrlqpZ
 OJVA1J+q3AEPvskWGAl7XdXV3vLPWJW4O8dIYaP1PUUoCBcCHeyhy12XiaHt8Aff41DUxSlS3dA
 nL24jN2EEAL5w784JM/EZVwgikC8UTNtoLpC4EYQF4D+zZ1mtiF0ujPk7TZQ6S6nbWZqopwoef1
 z+z4sb1VE4saonb5Npa2UedmyecsiUI411Rz9S/LloFc80HFyQjSx3MSLe6I/GWBldE9DYOoIf5
 l9hIP7HVezIirGw9S/jDc9jpz3TUOdKRo/cNiWFJf1RdX27w2YCcx6WTnlfcmre2hRL6Fd1jhQE
 oKKUFcNdMPSXF6UyYFVZbGTAOokjlq3hHPOgZaGMbwyuFyIcORC0rm5mN9BxmxeZXUmTmktkAjA
 VRSoahGXo+E0wF2viyQ==
X-Proofpoint-ORIG-GUID: LPSNz59x6g_yO6Ag3NbTNR5wzx5kx3cJ
X-Proofpoint-GUID: LPSNz59x6g_yO6Ag3NbTNR5wzx5kx3cJ
X-Authority-Analysis: v=2.4 cv=G/aJgNk5 c=1 sm=1 tr=0 ts=6af193fd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ySw4tsHwzHfE-Ekmi8kA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzOCBTYWx0ZWRfX1xGNaCQtZBRY
 VYBzYrgGwf+SA5gYdU/TjvwLBk4vEmaqLtgxI28+IZZt6yJZbd5ddn0ZPu1L5ZBYTlsnxpB6ovd
 3ss+Lm/s3j15+KyPB8qatwvJGOvP8RQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090038

On Sat, Nov 7, 2026 at 2:01=E2=80=AFAM <bryan.odonoghue@linaro.org> wrote:
>
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> In order to communicate to user-space CSI2 SOF events we will need to hoo=
k
> into and control v4l2_ctrl_subdev_subscribe_event. In-line with other
> implementations of FRAME_SYNC have CSI decoders which support the event
> always generate it in our case if and only if an atomic user count
> indicates it should be so.
>
> A flag in the CSID descriptor indicates if frame_sync_en is supported so
> for each SoC that supports it this flag should be true. Since bool is fal=
se
> by default no negative enumeration of existing or in-flight CSID is
> required.
>
> Subsequent patches will enable on a per-CSID basis.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss-csid.c | 54 ++++++++++++++++++++=
+++++-
>  drivers/media/platform/qcom/camss/camss-csid.h | 12 ++++++
>  2 files changed, 65 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/med=
ia/platform/qcom/camss/camss-csid.c
> index a00791b00feb7..7f33fb81ca8cc 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -760,6 +760,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int=
 on)
>  static int csid_set_stream(struct v4l2_subdev *sd, int enable)
>  {
>         struct csid_device *csid =3D v4l2_get_subdevdata(sd);
> +       unsigned int i;
>         int ret;
>
>         if (enable) {
> @@ -778,6 +779,10 @@ static int csid_set_stream(struct v4l2_subdev *sd, i=
nt enable)
>         }
>
>         if (csid->phy.need_vc_update) {
> +               /* Set to -1 as we want to do atomic_inc_return to read *=
/
> +               for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> +                       atomic_set(&csid->sof_seq[i], -1);
> +
>                 csid->res->hw_ops->configure_stream(csid, enable);
>                 csid->phy.need_vc_update =3D false;
>         }
> @@ -1316,9 +1321,56 @@ static int csid_link_setup(struct media_entity *en=
tity,
>         return 0;
>  }
>
> +static int csid_frame_sync_add(struct v4l2_subscribed_event *sev, unsign=
ed int elems)
> +{
> +       struct csid_device *csid =3D v4l2_get_subdevdata(vdev_to_v4l2_sub=
dev(sev->fh->vdev));
> +
> +       atomic_inc(&csid->frame_sync_users);
> +
> +       return 0;
> +}
> +
> +static void csid_frame_sync_del(struct v4l2_subscribed_event *sev)
> +{
> +       struct csid_device *csid =3D v4l2_get_subdevdata(vdev_to_v4l2_sub=
dev(sev->fh->vdev));
> +
> +       atomic_dec(&csid->frame_sync_users);
> +}
> +
> +static const struct v4l2_subscribed_event_ops csid_frame_sync_ops =3D {
> +       .add =3D csid_frame_sync_add,
> +       .del =3D csid_frame_sync_del,
> +};
> +
> +static int csid_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *=
fh,
> +                               struct v4l2_event_subscription *sub)
> +{
> +       struct csid_device *csid =3D v4l2_get_subdevdata(sd);
> +
> +       if (sub->type !=3D V4L2_EVENT_FRAME_SYNC)
> +               return v4l2_ctrl_subdev_subscribe_event(sd, fh, sub);
> +
> +       if (!csid->res->frame_sync_en)
> +               return -EINVAL;
> +
> +       return v4l2_event_subscribe(fh, sub, 0, &csid_frame_sync_ops);
> +}
> +
> +void csid_sof_event(struct csid_device *csid, unsigned int id)
> +{
> +       struct v4l2_event event =3D {
> +               .type =3D V4L2_EVENT_FRAME_SYNC,
> +               .u.frame_sync.frame_sequence =3D
> +                       atomic_inc_return(&csid->sof_seq[id]),
> +       };
> +
> +       if (atomic_read(&csid->frame_sync_users))
> +               v4l2_event_queue(csid->subdev.devnode, &event);
> +}
> +
>  static const struct v4l2_subdev_core_ops csid_core_ops =3D {
>         .s_power =3D csid_set_power,
> -       .subscribe_event =3D v4l2_ctrl_subdev_subscribe_event,
> +       .subscribe_event =3D csid_subscribe_event,
>         .unsubscribe_event =3D v4l2_event_subdev_unsubscribe,
>  };
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/med=
ia/platform/qcom/camss/camss-csid.h
> index 5296b10f6bac8..a9d88909d37fc 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> @@ -141,6 +141,7 @@ struct csid_hw_ops {
>
>  struct csid_subdev_resources {
>         bool is_lite;
> +       bool frame_sync_en;
>         const struct csid_hw_ops *hw_ops;
>         const struct parent_dev_ops *parent_dev_ops;
>         const struct csid_formats *formats;
> @@ -167,6 +168,8 @@ struct csid_device {
>         struct v4l2_ctrl_handler ctrls;
>         struct v4l2_ctrl *testgen_mode;
>         const struct csid_subdev_resources *res;
> +       atomic_t frame_sync_users;
> +       atomic_t sof_seq[MSM_CSID_MAX_SRC_STREAMS];
>  };
>
>  struct camss_subdev_resources;
> @@ -248,4 +251,13 @@ u32 csid_hw_version(struct csid_device *csid);
>  u32 csid_src_pad_code(struct csid_device *csid, u32 sink_code,
>                       unsigned int match_format_idx, u32 match_code);
>
> +/*
> + * csid_sof_event - Track SOF generate V4L2_EVENT_FRAME_SYNC
> + * @csid: CSID device
> + * @id: CSID src-stream ID
> + *
> + *  Called from the CSID interrupt handler on SOF of the path driving th=
e event.
> + */
> +void csid_sof_event(struct csid_device *csid, unsigned int id);
> +
>  #endif /* QC_MSM_CAMSS_CSID_H */
>
> --
> 2.56.0
>
