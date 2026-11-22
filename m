Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795377786;
	b=fXDEtZaCzRuOAEjoxaExRqapmkk0d9/S+0nwgXQhhV5v7RoLSRhQGXRWz7rZ2LVZMoFm
	 eSm3vz7pgBvxtd/rBax5pnuQlrTGK7rtFuCyuxVdWQsk9svsbckd+dSpnji+S2cP19r9x
	 ehOByqr882k8AAKKkZvVqmYqbyixrx+LdW5uLe2uhdp4pOUod7WYpDIZcLhn+4QcHw09d
	 5/NWi8ymi2n2csf/TCwIBqfovV3E9wIpVMUSJb/kkMSsEgv9Q4VidMJuMvCap9Jg17zK2
	 w2kUR/1qTC4lQRfMnX/e4sbAZtp/lCSdElPOeStHI49wUCjBsIF11J0MS61VyN7Jezw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795377786;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=iFjqKUZ7zWF8JAFKDN9Yujd11KjYBQPFC25je33nKyE=;
	b=V/QjhAKwZ0eVINBghlSLnw9owkSRx5mGxVs9rgnOLj7V4gvCJ3Aj4smQaew3Zg1y/V86
	 ulOqb+RiKvXKx4fU1ivpB4fujB1foLezfycAigJ3uHko3V7UCxFBslq5mx7eS6pK1z6/c
	 3FEg5+k4kF//1Y4XTwMZth/WzaUgd/EhL0Gajf5KakpjVDW/9GRqM8/A27LUxXfmEZQX5
	 SAxmG6f4PG7op6z+xAyMCBqHyo7ABkTC71CiPyeemANmtToM60J/eHc9uX/EhbuNBUL6a
	 PXkd8Dzk6eL2SvdyPd7WBG6h/0V5rAalt8HJsoRL1avj3ZWYNMfwfShQInw78Mx36DQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P0ayWLu5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UvFr2LGy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760E8606A690
	for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 20:03:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 760E8606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P0ayWLu5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UvFr2LGy
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGUwoJ3476767
	for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 20:03:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iFjqKUZ7zWF8JAFKDN9Yujd11KjYBQPFC25je33nKyE=; b=P0ayWLu5HnEkBhci
	hqj0rSLBOSLGEHUsFbgNsTAVcxYL92RqjUDAhCorsGhVJSYe84ozL+qTAwQliWT5
	n9HKMwnEzq3CBsuibwubzPVKdYgQc/PIcdVm2D0v9YMQ/xk4J3CNTHHqib8lCMto
	P6M8w+1ucoG11tsYx6XVOYw3hXYV1YQMODVoREPALC2ROQBgrQfraFqOdNS9wDeC
	vH71v1eVs4EkvA6putFC77UKumA2AgsCMyFGfSd9nCmhpp9NLPT1CdpZGrXjqlOZ
	iSffFFL55Z3vutME+TXwtmd+HkuffKQFPT0wbtp5Wp1lScgAG2j/xrsXr6Z5iYFh
	K7BWmg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j342gm1r0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 20:03:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9493e89d4f9so391979885a.2
        for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 12:03:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795377784; cv=none;
        d=google.com; s=arc-20260327;
        b=C+i/3G62dwLVgCZ78RxNQq6mbMlfD8UcXO1dsf5Iw1iz9L1AMCtiWXGJPil1bmU+6R
         7rw9Jlylfg/jQF1zszE6TkzVfwDZ9JgIUCiAoYilkjlDYJL4PPFUY4tZ1Turihx4pQ+h
         j2s1vwECzFnQB0tvI+tILZ5NbTr7oOtnOgUro4CCsHNbBDsl7pl22WPnfpkFXfwNvYRE
         SYoyvcAPRSVMbHojIXrKciAj88b0it+5doKYTkrQm31l4URqgSwOhW0Tl5RieiUSLoHl
         rpRmqBhjRp40dqCi0m4VsQ7GVF36UgNoMip43rd22TYn5ry2mXOa6Qry9FxxzQYCgiT4
         K+sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iFjqKUZ7zWF8JAFKDN9Yujd11KjYBQPFC25je33nKyE=;
        fh=AfzUHlpmKNUORBMjcDbyCHu5K5DGQOz6kpMaV1tYQWE=;
        b=BNsD9/Q/qRAsVQTy/iQpZIV54ql8Ptaf6D0dMsUVYToBw1ZvYxzIW32Pp9znwmOcFU
         5tiec2NqEsdVTkdQCZLn3njN8JI+a6IS+Q5fKyD8hR0a5ED1NqN3dU4FAPyCy90yoclm
         EINaC23MnbRO/pWy9AT7LJ/aVtE++AJjxBMpRtc6K4DLTEx/648s5kEJXf6Ur2X6zll/
         5MphGnLak2WtbicGROZyvuHy+VH0Lf87wkWOJSg6qTsiDneg4q8xOKTTkCmuhSZRp8AW
         QLbWoe21u5Be6gLqEx0OcvZBxJ1lUzOs0ZowxJcIR2ra3Dbdwk8G0VRem34iG9Eqn6OY
         4rgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795377784; x=1795982584; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iFjqKUZ7zWF8JAFKDN9Yujd11KjYBQPFC25je33nKyE=;
        b=UvFr2LGy+v7afv3pmi3Lkl/6532eeVrvNyXkJITHKW8t33FDEwfCcVcO8QeNXJRg6A
         362q1zSB0rd1nmAIjaUWmOF5tFo6R2HJfW/8MHwQ6LxvdAl2SPB5MfOVx6uvR4df38zE
         ebqDhbJgw3t0OZdMJR02GwItJtSsv/fJQJ66L72PcHHSbmLG1613zJFHRusffyXZoUPI
         vn9aJlb/dWYYSY1xKQe36ShY2O9jgcuxpVPzlVXypgeQljKav5tkszwfqT6aupWODyjV
         J6NvBbL+60ipd1GZrSiU7FjFnajsE+cxyAHTAnJV32T+mUrcnwHRB2FdI5OX1+Pc1Zou
         Dvpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795377784; x=1795982584;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iFjqKUZ7zWF8JAFKDN9Yujd11KjYBQPFC25je33nKyE=;
        b=RahMU90mGcDlwV5VotHwFjI+elPAfVL1wkKvXg+OiSTZJwHkyo74N40QyUoPj+32UA
         as6gIm0qD3ggmCqUxCdzZMQxfmiLUGw/bsjtHXz1aLUGYbfIswuFBmN8Sdv7lbHum4pT
         0Rf/zqWwxb9ET77sqG25eT6LIDbXQbM4sf4dVLC9UkwdZFs3MiC+sv8+P0d3c18UT3Kq
         zqB/IaoXaaexWSgLmBHWS0zhikrKbGCFLR7y8GeH59aHCcGnSrNRK7Ph0AUya8hppRwG
         6AuknyqzpjHKeC49oIGEmSAh+YvQcagRH3Mha4mwKcrQYAWG90yJko/WeL51ufmiwGb5
         wfqw==
X-Forwarded-Encrypted: i=1; AL+hErHHEQNoSJ4A/Bo2c8ycVK4v1D/YRHsE4SeRja8o7Xx1YmLq1+l5zx25KPSBUo5MR92TdX2vn+sILpIyEg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/aFAaLmx78HcszhCo6Wpjb+slNz2Ttt9DXjsEwlx3vOB8cOZYQ
	lRgOp10hSKWf1tzvJwOLl9FcJe5zkeHepceF4y3K8SMP7zfdQmP4TdCZAW03hw4zMXAkdJiUJVd
	HidFf47HD7AlOGf9szpPx7CwoIXkwqNIYjcneAZAp4sEEPP2J0cbHhX6ZIPAQkjXG3J7NW3fIM3
	0wJm6yTR+6xJRC1Xa4TGdaQwbDWplltzBM+t1bQLv230lJ3bmNb2Y=
X-Gm-Gg: AZFdTZcrXi7AlYOYvx9PULLdzIhA3uXQTwddvbAQL2o06N7Yi0QbAGM/mAvs3THkW1Y
	MSO9e6PATmIAb9cRsL2iSXDAoxfmlosfqaM1+Og0amPu+sibq1BGew70svDrL+b9m68Xsl4mblS
	ECa1yAKiyzvmxp5LPXqrKszwXfF/qrhZPIaAEy37Jw209OZM6upvL8hJNrZW5YU+vjucCAR/AR/
	ueZ+j9Q+Ivzp4YIOKpUxFbNh5faX+uyTYvM+iOGkeWfFo4Bd6LfWpuwZUNbn305JuUjadxu4EWd
X-Received: by 2002:a05:620a:8394:b0:949:75de:b22b with SMTP id af79cd13be357-949ba81a715mr1583868485a.2.1795377784468;
        Sun, 22 Nov 2026 12:03:04 -0800 (PST)
X-Received: by 2002:a05:620a:8394:b0:949:75de:b22b with SMTP id
 af79cd13be357-949ba81a715mr1583863385a.2.1795377784020; Sun, 22 Nov 2026
 12:03:04 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org> <20261122-camss-routing-fixes-v1-2-0deeeaca2622@kernel.org>
In-Reply-To: <20261122-camss-routing-fixes-v1-2-0deeeaca2622@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 21:02:52 +0100
X-Gm-Features: Aa3M54qmPp4TGqe-hJJ37DMHGOwtKCGfgNTUpZn8HGSt-w7F-HPYonR_mEW5WQw
Message-ID: <CAFEp6-3XFf83bT_uuYEvu4KVin2ZmS4N=B8EsJoJ9HP7ZDkCmg@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: qcom: camss: Fix CSID to VFE routing for non
 ISPIF platforms
To: bryan.odonoghue@linaro.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=H+5OUOYi c=1 sm=1 tr=0 ts=6b034a79 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=WXF1KB85Zuouuk2w01YA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: TOxjPiRh0-eNeokzNvcNVdE46xObUqsi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3OSBTYWx0ZWRfX9tEyv9LaJCP0
 i4isrRzRsIZ+B+3jQulClcP20yF2wWk0Obd2+hcxACJ1narmIVddm5NZe9PJLWiYnvl6cVLSDDE
 3WsxwMiP3JyTUQwIudLIVmqcQuJGHkY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3OSBTYWx0ZWRfX8zEMxD1poQm1
 DqZ2rsESbbybp5bWG/mAzeHwdXOxoUbsmdfDLN5zrM3xBPCOU2sKDl2P6AuISlDMnVsa3y7qVl7
 otjJDwqcSM9bOmfdCkwNl7YaWpydaMh3YdB3KwyLWu169DiwSjtoxi6Vbi8+UzY7vV2kbX02/hU
 yEUxL1eCxLIdbO7e9rRk1c5DrAlHT7HS52gTja49yKTQRF79z8oGWAIELBuQMeeXbmjo8t2lhpX
 iWRQoU/7FliYzfjwniKYd7EDg0prf2NW+6dlbnBSAo8jeKmRsKQAiozLsOkE/pdZH6s51+ygf08
 x757otCOgfwoyomzzPytwCOV3NvOricij8lVobDtYLeoECSuftZMjrHmELbW0eulZS/gGEwQpkW
 /jnxzr6UBnHafyRMun8YjbgpFwU0wNyaSbjte7P5cwtIhwsn4K+bO/blxT+L9/NMDA1WOqfHxlK
 sNwbF9M30t/z6yGrj0w==
X-Proofpoint-GUID: TOxjPiRh0-eNeokzNvcNVdE46xObUqsi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220079

On Sun, Nov 22, 2026 at 3:10=E2=80=AFAM <bryan.odonoghue@linaro.org> wrote:
>
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> This patch fixes a basic routing error that has been present in CAMSS sin=
ce
> the addition of non ISPIF platforms.
>
> The ISPIF platforms can route any CSID to any VFE however this is not the
> case on the non ISPIF platforms.
>
> The current requirement is a 1:1 mapping CSID0->VFE0 CSID1->VFE1 etc.
> Demote the spurious poly-mapping down to its 1:1 real form.
>
> Fixes: 9229b53f9758 ("Revert "media: qcom: camss: Restructure camss_link_=
entities"")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss.c | 38 ++++++++++++++++++-------=
------
>  1 file changed, 22 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index aa6d01d8fcb2a..060879a55e483 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -5257,24 +5257,30 @@ static int camss_link_entities(struct camss *cams=
s)
>                                         }
>                                 }
>         } else {
> -               for (i =3D 0; i < camss->res->csid_num; i++)
> -                       for (k =3D 0; k < camss->res->vfe_num; k++)
> -                               for (j =3D 0; j < camss->vfe[k].res->line=
_num; j++) {
> -                                       struct v4l2_subdev *csid =3D &cam=
ss->csid[i].subdev;
> -                                       struct v4l2_subdev *vfe =3D &cams=
s->vfe[k].line[j].subdev;
>
> -                                       ret =3D media_create_pad_link(&cs=
id->entity,
> -                                                                   MSM_C=
SID_PAD_FIRST_SRC + j,
> -                                                                   &vfe-=
>entity,
> -                                                                   MSM_V=
FE_PAD_SINK,
> -                                                                   0);
> -                                       if (ret < 0) {
> -                                               camss_link_err(camss, csi=
d->entity.name,
> -                                                              vfe->entit=
y.name,
> -                                                              ret);
> -                                               return ret;
> -                                       }
> +               if (camss->res->csid_num !=3D camss->res->vfe_num) {
> +                       return dev_err_probe(camss->dev, -EINVAL,
> +                                            "csid_num %u !=3D vfe_num %u=
\n",
> +                                            camss->res->csid_num, camss-=
>res->vfe_num);
> +               }
> +
> +               for (i =3D 0; i < camss->res->csid_num; i++)
> +                       for (j =3D 0; j < camss->vfe[i].res->line_num; j+=
+) {
> +                               struct v4l2_subdev *csid =3D &camss->csid=
[i].subdev;
> +                               struct v4l2_subdev *vfe =3D &camss->vfe[i=
].line[j].subdev;
> +
> +                               ret =3D media_create_pad_link(&csid->enti=
ty,
> +                                                           MSM_CSID_PAD_=
FIRST_SRC + j,
> +                                                           &vfe->entity,
> +                                                           MSM_VFE_PAD_S=
INK,
> +                                                           0);
> +                               if (ret < 0) {
> +                                       camss_link_err(camss, csid->entit=
y.name,
> +                                                      vfe->entity.name,
> +                                                      ret);
> +                                       return ret;
>                                 }
> +                       }
>         }
>
>         return 0;
>
> --
> 2.56.0
>
