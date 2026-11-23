Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795428308;
	b=EmEACirRBnXoMO+OQzk7dbn+XOFPWeT+oeIiqr7RXZ+SxyKPXRzpA1SCm2gpgzm/SVT5
	 Nc1DOZQ8GQxT1Lpx6inS1E7MWLyaNUQ2bnMkG2vtFu66MGY3LsREW3zWg+yAy84HWG0CC
	 kYvqjIv77+QVLz2yUISZrFMzMOb/jC3IeMWfI0TtzLeBSOjSiloOmXgIsoDWK78kDeb9N
	 IdpF1YN2IcZqqSs9S8Uh06h8XbhHFkc9mNat46DWmJNPdDY4pbsUKGgJS5No/hjraBq5t
	 +WerauCiU/KKdvD95g1yzYXJby1JlfdmzJku7zcM/5IjuE0g5SnCUlJbtlSixAsoRpw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428308;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kWiJR4pBZBXTbej9EtlDLugM1ciJ8WwcZGMDzpqWUiA=;
	b=GHDxnyKuhw1CPGvz9QSyRrIvzetRjzo/X94AcHzCOywoau/jZv3N9cSfQW/qYf4IGtx8
	 66hCUW0rh4GdRWEngnL/edCgp3oiQJvVJhNv1Vul6oCcjFvVs6wYHqEY9sO2QKKkLZfEz
	 LkCnvRGQCZuPpZ08VK72jbGSi+FhoyJnR9Pzj0XZIQ2L66ELaLOsqMvwucfPUaEvysARJ
	 x5bXhWJc9lYHLe4VgDdFI7UWvpkH7rm9sPdMPmOxrdKp2zcOlwz43q96uugrQPjEIcrxM
	 MEj+FasAyn/93KJObXKOOXSJGyhisGL+PA9vt4Z0n5rw/fz5K95TClbMgou+IPOtCZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pH98vKFH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AGnWdkMH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD0F606A31F
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 10:05:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBD0F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pH98vKFH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AGnWdkMH
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9G5591428874
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 10:05:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kWiJR4pBZBXTbej9EtlDLugM1ciJ8WwcZGMDzpqWUiA=; b=pH98vKFHVs+7bIMn
	wTFuEJrt3xNrSlWJc5ufbvTEsB6nhu3QWQ03fgL/LCbpbcLE69qbFKAhOjjpTB5I
	BDtcmnCmPmFP3Ke2rgEB7NUln8hhtGP29BaZht3rtBAN9dbctbLjr10MYdXRipa0
	cBKIBu9z/qVWY/hO7fCnKQBlJIo4a5wUYpKFWr9eRUQejO+77AYioI+FOk7mgSMj
	7pbvn/wWxhY0/Jvf7g1LcQX4s1pwj5NoQ9FlMdXQ72lqAa1jD17U2YSuWPEv9Fk7
	JgbpKqRGJkLffAE5h5maUP/PURvQdEV0+U+2irkKgQoXOlrD9J1bPQKoPw2agXc3
	VkcQzQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyh0uva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 10:05:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-948d83322f6so504716885a.1
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 02:05:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795428305; cv=none;
        d=google.com; s=arc-20260327;
        b=XWYIZFSey885ei2Ka0BP+vjk02q9o1mHdzzxkLpPxIw9QNGmI7vmQUcje/c0Nox5Li
         Y2CdHRUx46ni/2jbG7aukOoI/XwbehGlXJvcWXYnwTfQki8oNeBfKy8rMZtYee5DmczZ
         y5wfrlagKipo4rDMgk5y6+4k5EuABJ32wY2bhWiW5+GzC9YpuHsDFYr5cO+DBKpnZrGW
         iLzPeHYbvbN2RApx9pHGtL/pQQUFLrhx9zPqu7XdUDTph3vLfBVOIzLLDi8Yndqd/VKj
         kFxs51DD/phiixuYS2h9eetPZSvbxffbc+UyjtALw59LR9I7hRMQs6oBgcpv9VYp2NVK
         jLgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kWiJR4pBZBXTbej9EtlDLugM1ciJ8WwcZGMDzpqWUiA=;
        fh=dHzIvqr9Lfnc16MEU3HnpmKcz3oQzfiDaF5DSvSs14I=;
        b=Ldc8rEpJBuF6McnESnBxUjIoHw1PDaXdjOF73C4un8xhdwFDKHmiNHgQNY3N/2CaBg
         1h9CKhUpeMsQkE3/ahFa6wjwR9I7M+ETq0Cd5zLMy7ADJIyNlsgSgpnRs+BimgNTgIQZ
         5KbPPKCxumQhbHpTqZUpgl8xByE/RocUqVVZeoi9ki0cuabWh21GyXnR1daqsmroJ/ap
         RxJ3+tYMPtoXnw3N6+OtPuPLTChD/SwOHhbEZkDEO3SRTMV2e3ELHI1XwK1GhmIVzYH3
         /CeS6ZrR5zcM++8Qg5eO9faFqOhlaN3iUgnb/qKrQcfoCU/aku97A1+edWmwzwHPLNbt
         9CZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795428305; x=1796033105; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kWiJR4pBZBXTbej9EtlDLugM1ciJ8WwcZGMDzpqWUiA=;
        b=AGnWdkMH21N8On/EIdZBkpluKf4MDgPTS/4PWdBc5dIJjqj9dtqyMBuz8QvIrAkTfs
         sn7Gl9a1o1oVEOk34QMGfRKsJpwigQ2O0vI2fY1IQ1u2kCYVVctGm0yoOBQq7Pfgd/+P
         SG7p52RrexkxxrDLyfNbD+7+0G7f+3VxA73Ya8AGtH0ke6myKShllObyCnXutKXI81mq
         j0EtC6CYqw8fO9oRe6SdALMRlAZHzvpwpgiWTtkH1betI4eU2kkSakVaHFp5xPnplQcz
         8y01bUJ14kXzJr0ahBYzYZj67yD6qMQpmp0J5YKi48KFqSS8hV5JedpvqyCxXZUQJs34
         8Jww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795428305; x=1796033105;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kWiJR4pBZBXTbej9EtlDLugM1ciJ8WwcZGMDzpqWUiA=;
        b=VhmSPAbypwi0jhqfzuZh9T5OcNML+momMlgTYnM87b+3ZY/VzYznVQAdJ4mLuFCcUz
         jVCBAhEKR5dzk564f5vsa0qLVrACZzVthaEI4AUzOYm6v2Fz5QYuIR+vhnfPxQhU7feN
         GAVpWSH5GSUg5iyQIGGqiF1zWvFAjW4x/Cv9X+Gwa1ayhurkALwBd7DcKy4wVVpsDytR
         PNsdgqx//Gmbq4B1YzdYZYzMCb4VVOBgG7VHrRqZsb5akdBniwYdB3BCxxdEI0AtX5Fb
         aL359yePE1UjcQU1060SH+VB3Mg9eDU2j2NTZtujYjzo8I6vOblJAsl0yEuSowRcfzaM
         G87Q==
X-Forwarded-Encrypted: i=1; AL+hErHeduQOn1S8zqELiYswNLQatGzikbGmlAgqfr/8UXOYTs+71g6EyUlmlEJaUoojHl8O75t4F/CKVAAAmw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZmOcTefrDlSAIzxaxbsFY6cmVuhueghCFEhkBiQvxKqGG6IBe
	kPmpg/n54SeZxGRFPfRweS7hy/s1MWP76LsOGUAr8JogtfJGgFLnWiQtwJafG5EJ4sB5pk8lmin
	e0EKevlWzSnAfWuxsZ7m0Xp7NWJG+favbd35wzoh2Yy7EifhS+UpoeTnEtyv+yXD1XnDGTuNQfo
	FgNXZD1eu3BawNDA85/Iogtriomk0Yoj3NSmFpJt/vTlGupZi8DGJ+lw==
X-Gm-Gg: AZFdTZf8YA1QnHfNqB//DD0kuqKO2j87ASJ1+Qo/KNaM5cs27aTgHalwKm86bZegjA0
	2E+d9+vdGgjE8eUFjwNT0exVFErioscjop4yr4Ws535fVV9D9K9E/TUBEw05uLdOb9+p7eiz/dP
	xdyCiGo8mQBgd3r3jLk8g1fcCSGtQHL6lYRNBXOwXc8KlkzMex2LqrEu1qUx5KuNpTiIoyy+nNn
	CEENr4TiD1n9nyTYSjnebbqeZaYqztplPQ5Yu5fZ/9lm6kVkYF9Nbyiu1HRmWn3oR3tWSeBX4Uz
X-Received: by 2002:a05:620a:170d:b0:949:67ff:56c9 with SMTP id af79cd13be357-949bab4e414mr1844866485a.70.1795428304996;
        Mon, 23 Nov 2026 02:05:04 -0800 (PST)
X-Received: by 2002:a05:620a:170d:b0:949:67ff:56c9 with SMTP id
 af79cd13be357-949bab4e414mr1844863585a.70.1795428304496; Mon, 23 Nov 2026
 02:05:04 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-camss-fixes-v1-0-9df4deb87ea2@gmail.com> <20261122-camss-fixes-v1-5-9df4deb87ea2@gmail.com>
In-Reply-To: <20261122-camss-fixes-v1-5-9df4deb87ea2@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:04:52 +0100
X-Gm-Features: Aa3M54odtvdCdAgjn0TOtpSBIOP_UI5zPF3v3UJWEKMPAcgomYZEvssdXYfJed4
Message-ID: <CAFEp6-04oyWYxuQfXt=0WsrMe_tTa3pNpsLaEh53V7QqExOZvA@mail.gmail.com>
Subject: Re: [PATCH 5/5] media: qcom: camss: video: stop started subdevs on
 start_streaming failure
To: robertijtsma@gmail.com
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=NM1AaE6g c=1 sm=1 tr=0 ts=6b040fd1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=8Ls76JZ0y08s941VHScA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAzOSBTYWx0ZWRfX+tH9Vruptcey
 9dcNyLrX8481QDUFbewIMfW/TBSPQkF8XjQqeFc7GRqWiTMLnYzOMhHCJkxFWC/g4ItMjOPhHSG
 OfGcNAgwlV1V69s959s6gz8kLOd72Jw=
X-Proofpoint-ORIG-GUID: mbeEtCehAUX8NvQfKZ1vfXGSjqx84v3U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAzOSBTYWx0ZWRfX3/SRKpkEv80l
 AhtY18YwiZY6MrB0l+uaL3y+GHPct5KId8ozaX0QX7tYelnzHak0W6Z+mqEK5gLMHEt10Ga5RM6
 PMTU3MJ7XKWb7ML+sD2djTtOVpcVPVRS437gYAhziewqaD+f6uM4pyGctogGS1pUTo0kxEyP4FN
 lVKZfRs651K8dcUtf/97UGQfYXaIH55UnGbMVsYAUTLpX8PsJvhG4kPSFebmRprz3yTPBaHpSIx
 53aR/aoHkecJNLCsj0i447Hmvd+RGT8BGQ/381Vb/C/qvijUkWYg7souKgJFCtQkUOuX2T1OOV3
 oe7e+tWuvcRMvc/3L/ZVdHtg6iMGlB8cv1q8AHc00BckrRCXK/cPrg4iw+jAz3CGEcXPVeDE+Lj
 mFRqbtolzW+unTsMeGk0guBzWBgjQnXsSAUk1nZWSmvzvrxAFVVhqiReAtUUr1oqIxsDdJ8uRU/
 CItvQm8G1x7ppjLhrIA==
X-Proofpoint-GUID: mbeEtCehAUX8NvQfKZ1vfXGSjqx84v3U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230039

On Sun, Nov 22, 2026 at 2:36=E2=80=AFPM Robert Ijtsma via B4 Relay
<devnull+robertijtsma.gmail.com@kernel.org> wrote:
>
> From: Robert Ijtsma <robertijtsma@gmail.com>
>
> If a subdevice fails s_stream(1) partway through video_start_streaming(),
> previously started subdevices earlier in the pipeline (such as the VFE
> and CSID) are never stopped. This leaks VFE stream counts and write
> master reservations, leaving the pipeline stuck on subsequent stream
> attempts.
>
> Walk the pipeline from the video device up to the failing entity and
> call s_stream(0) on each already-started subdevice before stopping the
> media pipeline and flushing buffers.

I saw at least three similar patches recently, can you look at this one:
https://lore.kernel.org/all/20261031041154.308030-3-xiaqinghuan@mail.ustc.e=
du.cn/

What would be nice is to build on the above change and address the
reported points/issues, as I haven't seen any follow-up from Qianhui.

>
> Fixes: 0ac2586c410f ("media: camss: Add files which handle the video devi=
ce nodes")
> Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
> ---
>  drivers/media/platform/qcom/camss/camss-video.c | 27 +++++++++++++++++++=
+++---
>  1 file changed, 24 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/me=
dia/platform/qcom/camss/camss-video.c
> index 0852eb6..6f7b9f3 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -253,7 +253,7 @@ static int video_start_streaming(struct vb2_queue *q,=
 unsigned int count)
>  {
>         struct camss_video *video =3D vb2_get_drv_priv(q);
>         struct video_device *vdev =3D &video->vdev;
> -       struct media_entity *entity;
> +       struct media_entity *entity, *failed_entity;
>         struct media_pad *pad;
>         struct v4l2_subdev *subdev;
>         int ret;
> @@ -282,12 +282,33 @@ static int video_start_streaming(struct vb2_queue *=
q, unsigned int count)
>                 subdev =3D media_entity_to_v4l2_subdev(entity);
>
>                 ret =3D v4l2_subdev_call(subdev, video, s_stream, 1);
> -               if (ret < 0 && ret !=3D -ENOIOCTLCMD)
> -                       goto error;
> +               if (ret < 0 && ret !=3D -ENOIOCTLCMD) {
> +                       failed_entity =3D entity;
> +                       goto error_stop_subdevs;
> +               }
>         }
>
>         return 0;
>
> +error_stop_subdevs:
> +       entity =3D &vdev->entity;
> +       while (1) {
> +               pad =3D &entity->pads[0];
> +               if (!(pad->flags & MEDIA_PAD_FL_SINK))
> +                       break;
> +
> +               pad =3D media_pad_remote_pad_first(pad);
> +               if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
> +                       break;
> +
> +               entity =3D pad->entity;
> +               if (entity =3D=3D failed_entity)
> +                       break;
> +
> +               subdev =3D media_entity_to_v4l2_subdev(entity);
> +               v4l2_subdev_call(subdev, video, s_stream, 0);
> +       }
> +
>  error:
>         video_device_pipeline_stop(vdev);
>
>
> --
> 2.56.0
>
>
