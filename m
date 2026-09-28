Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15ECD45D1B1
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 08:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790582805; cv=pass; b=Aj428ySZ07rZvvRC7qTbHGFEWtkIJFoGyHnPBlbINssc2bmdTb1UYqnX0fC7dm+ok1EFqqQtwSWdhoGuZvNchsbYgvlC8MbnZAN4kULvuAAxwIPb2CtFJvsNR331v1wAlLTSAbmBYwcW8KgtIs3Uo0WFOKJG/nKBw52hMF4Q1zc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790582805; c=relaxed/simple;
	bh=FKEyW8n2U9+lhPaV6HTQ4Z+XZRDk95eDypyZkwsJuw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nBIwEdEJOxjSUig6TTKYm2Bf5LdQkT+qbm9/p0qdjQ5x3L33ma+mBlLsqp1rO5X/dBl4wldRACN4NB/LRG57n/Z326kO4gus/0LnnJ6wSGZ2tdVMIKlCwqn/g+Wnqh/EUCYWTqoVa0gAnrtll31X/QxFVJBvYpzrnQEOZuBK+1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ofwyh+C+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JcJGRuhh; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ofwyh+C+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JcJGRuhh"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S7xQt5620932
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 08:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xt0oKaJn67L4g+z8bImQqIhwIKc+sBHmTKsF2G0Msd4=; b=Ofwyh+C+8B+f9sv0
	ET4ehK3OF3LjEpRt5MNHvr8J3x4MOPHly0e0qJCSrlMQLMAAlWCjkp1PRM4wAesz
	i9pTJjuJYB9C8KIBQxyVvR4jj6TnT+n6tAS+1DN3zUZoy1tOJNv2AzmH0m1CtBV+
	wwo7nUJGCP1mBPNjXQnW2gI52S8RUDMY7dofnX3PiEtpSVRs9HIoBaAXckeD35u7
	SAVoS2FiPhy5IzzzJFXQFnChRU5uQFV6DXGg8Kow51UYVz7nze53eWChg57gzG2e
	JQbXnTvEyo9BHTIvFyOJ1oGGXH0fluea60eaTZUxF/G+77Mgr82WynoZrPWPLTOy
	QaYqwA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyk5mr9q7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 08:06:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934956beec8so604389085a.0
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 01:06:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790582802; cv=none;
        d=google.com; s=arc-20260327;
        b=h2pRgTkgvLkSrzCVnZ71MgPZ1sIBnlJikqFfPk4b9V7AtPDeDEpas5FQIfXvlU7Dfv
         PdvLwj3Cv2ZVPzTGsP+rpZSLgHJ95gu/Iz/XJSQUbLyU1lPr/VGYNbQ/5OiYucVQbYRy
         uFiTGnjignbwSfzRtxBksTM7yBb48dssvDWOx+A4NQpw3SKVoqLJeJVsZLRWszEuZVx0
         KOZwdLI/lUye0GxmWW2QHiWfU9eSH39vKYZNQ/fvQdQqkIq38IwzCyebRMGhx6HKdHIy
         XIixtl+AH4xI+f07A5Pwtqqi9jHSgN4ex78fIWcw3+Vgr5lNlydTyz9tH6BvJZ4QpzJe
         74gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xt0oKaJn67L4g+z8bImQqIhwIKc+sBHmTKsF2G0Msd4=;
        fh=tdUDemX6FQnR6Wxcy8Grnsi00dw5T2f23Wd5o9HPPuA=;
        b=B2f4CvqEWBJr3WdlWDTYTtqM4NYN+6L0clckPLqVfWyiaNOg9BQz33XM6CgBrm1tCO
         2Y8ZiVRhhxiXzwivQdxFs+1KZ6g+XPzGgb3WP0JR/gaAZDsK5LXoEHwZ7Q5IRD05ckYv
         QvAJH9WxDwy+YhTlDHcexB8B+NWWjwbpePh/J0sNiW49hHy4OZTRPvLN0w9h2CUIikMl
         9jMPm1pcYopGILjP+0hAV7Bl0M3W+n2kmmoPcyaAQk9qN9YCA37BBPxXjwTwlKPKdFvk
         el9pz88AO3HTo4O7bcaPOn3LPfR28uO1kQ5TBTaeBrdBojpKnZeXxcvVroBhvDpjNsem
         T7Pw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790582802; x=1791187602; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xt0oKaJn67L4g+z8bImQqIhwIKc+sBHmTKsF2G0Msd4=;
        b=JcJGRuhhpQ8dEqXTJpu23TYg9KkGbmiDz5OW7q4OqJ4QH8JpdDonKGQ4MX79lmO6Ea
         FRqIu1kHku6S5yDtKgj+vnxZ4fg2z2Rs4WZwHmK5WxbLMBL8zSsCV+P5mEY7cdNmalzL
         RqnxnQChOXBZRYKqqWBjYnhL1hEhYQDnVvdo2xWa+LUnGwd061CuozhcVz73itebnsMe
         zuyRtqHsbWM4rXj1TIKCq9iEsnc0k1ZnCsA73Alf/ZBm/azJyXEcbiT5JCTDUqxHh1v0
         vz4bKKkJ0ZmTuciZ3e39kQl1v4dK4wdPpAbsZkEG0aWoxqpX9HOVsdRdW0fcwIAa18wg
         WEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790582802; x=1791187602;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xt0oKaJn67L4g+z8bImQqIhwIKc+sBHmTKsF2G0Msd4=;
        b=1smSPnkta/DfDn6ZMjwwh4EKai3VcrTVWrrrdVKnvM2xbAOui0MOGZlKniOuTsWqbP
         RooDAK0pnkxxpXZSJTMAJCoZW6LjaUTkJtwpoDOG1GtnZ+uLxw8XfWXQ0hhmc3CVLGoS
         FTxTJhzgejeqW/4Mad1lmVOkyp1z1lH4ZjlqH5vJ5AHAOqVaHSYLohQNF+D8e2XY4+xo
         tNhasNPHWWLkMYWn2LCWvZvI1mzW/Qc1lkJtT5Fxk2G5FVaoQhyke0L224ChXmfMA2iS
         4g6Y5gdncOKXYjmqNKJc1MYFZW9ZksWAsjRf+mjFimrcdiCwBIdK2lN4DX4XqbUDq+mE
         vnVw==
X-Gm-Message-State: AFuF++mDcln3/OfPgoHabaOZbnQKtR7233XQXnCHT6vuvEdASQbx3Xq2
	OHXPED9Q6KJqfXxhIXe8WMe62c7FFXjg/ZxbJ3ePa3MmLbVKDRMNDHIxu5sZK07jWrAAyiM5ozc
	WXbVH1HCxSKSB7R5ai/bNrm+PDd05DOFLQd/ck7KC33TCG91oWUBglMAf0d00bJIppaQ/H/+Yzm
	Fn+bpP1y1TsjBmyO25YYTDs/m+3BGpMBpWpfCSLRhS
X-Gm-Gg: AYBFou3GOogt/u6LwoWQPsTHcSnAXvMo1NkZoFhXFqurWnUJ1nuc0A7HT6cDI/At6J4
	OSH3rBZntSAUAaed+ArQntlqOcLXCxt0WPThNYmcdFZu6uA76YtELvjvg6vGcCWsflchkp/qTmw
	qbR2sibGFVOwOS5MlH5pSqchBKnPLx3OJpr2Fen6aiFB+961IroN7+xpGX8fophlGYVgXwsCB85
	tXdBaHaGooDxTTsDRnrMQHNUGdvjlZm4wLFj6b0il1sN0xl26juEEiaHoSEhW44u3efd7MrE3I=
X-Received: by 2002:a05:620a:a0c6:10b0:93c:8544:6adc with SMTP id af79cd13be357-93c85446be8mr36309685a.18.1790582802138;
        Mon, 28 Sep 2026 01:06:42 -0700 (PDT)
X-Received: by 2002:a05:620a:a0c6:10b0:93c:8544:6adc with SMTP id
 af79cd13be357-93c85446be8mr36307185a.18.1790582801653; Mon, 28 Sep 2026
 01:06:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928064336.272659-1-hitesh@ebytelogic.com> <20260928064336.272659-5-hitesh@ebytelogic.com>
In-Reply-To: <20260928064336.272659-5-hitesh@ebytelogic.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 10:06:30 +0200
X-Gm-Features: AclHuK82SWDZ4KKfAyhBngt9t9lHZQRpPUH9qSpCVj0bK_fMYfXekUG5njetwpQ
Message-ID: <CAFEp6-2Ra-JjoZgR0_RPU5mRgZefaWqb1F_HMLxubcSeHbdjzA@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] media: qcom: camss: Take the link frequency from
 the CSI-2 transmitter
To: Hitesh Patel <hitesh@ebytelogic.com>
Cc: linux-media@vger.kernel.org,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        ravi@ebytelogic.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: CZ7lV40sH-rCi7-RtWVAm5n9qXBZasSt
X-Proofpoint-GUID: CZ7lV40sH-rCi7-RtWVAm5n9qXBZasSt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzMiBTYWx0ZWRfX/NPH6BHxlNtp
 iAGicymoWkIT/mDSm4+Q/Do1fMCUHOrvB2Pe5m9TGQflyTMUnb8oTvnjCztd5duIIQnF/M9ZNs6
 gmOXsA4nLKC171UjBtE/G3aEi8DWbyjUufCrqzgWcQjrraVh1whcgt9cXe6zQXkEHKgGlrjIiSP
 hdgBNv6QPBTgHyG/7yCEE/eJBbZEnWzAZ3N/4bLZcOeQVINy/0z5/E1YJ+DUr/LGg4lTn9/rNMg
 KgB5KTq2im/p8sDHWgo4ANGvjBDsTotHzjS/yVmDBvxbxLGyBBMhq82kdqKPCz8w/RU4inbyjty
 RTM6JFs447Dm9DGbsir5ai9hXd2+iW+9L53eAtdMIBf8q+3vQ1CZlnMnQ1M/pzsOdp2UZnS3grN
 cR5AyBnzrEu/Ne9jFQ31bM8DbRSLT9tg5V7iuxkDWO9aS+B4coHsGX9z3iogAd9MMYCo3cdBKPG
 2SqBGQRxCaWKvQrg2Mw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzMiBTYWx0ZWRfX+D6CGQ/ogOkn
 WDm43cK3AekoMEFNCP1Vk3uxncsbWtGQcVCn5h2O5mTAuzYTECJf7yO6s0hgWwvBYqU3c6eZxLj
 WbYhno3i9HhzObFiJFRVDMleN0AoxKA=
X-Authority-Analysis: v=2.4 cv=asYnmiZV c=1 sm=1 tr=0 ts=6aba2012 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=ZovgdgjKAAAA:8 a=kD2hMPwKAu5PM3DgiqcA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=VOxKbm1zgHvARWIDjr3b:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280032

On Mon, Sep 28, 2026 at 8:44=E2=80=AFAM Hitesh Patel <hitesh@ebytelogic.com=
> wrote:
>
> camss_get_link_freq() walks the pipeline up to an entity with the
> MEDIA_ENT_F_CAM_SENSOR function and reads the link frequency there.
> The CSIPHY settle count and the CSID clock are then derived from it.
>
> The frequency the receiver has to be programmed for is the one on the
> CSI-2 bus, which belongs to whatever drives that bus. When the sensor
> is wired straight to the CSIPHY that is the sensor, and the walk gives
> the right answer. When a CSI-2 to CSI-2 bridge sits in between, such
> as a GMSL or FPD-Link deserializer, the bridge re-times the data onto
> its own output at its own rate: it may aggregate several sensors onto
> one link, forward one sensor at a different rate, or generate a test
> pattern with no sensor at all. The sensor's rate is then not what
> arrives at the SoC, and the CSIPHY does not lock.
>
> The walk can also fail before reaching a sensor. A deserializer has
> one sink pad per serial link and the walk always follows pad 0; a
> sensor attached to any other link is never found and streaming is
> refused with "Cannot get CSI2 transmitter's link frequency".
>
> Stop the walk at the first entity that is not a CAMSS receiver, i.e.
> at the external subdev feeding the CSIPHY, and ask that pad with
> v4l2_get_link_freq(). The helper queries the transmitter through
> .get_mbus_config first and falls back to its V4L2_CID_LINK_FREQ and
> V4L2_CID_PIXEL_RATE controls, so a bridge and a bare sensor are both
> handled by the standard mechanism.
>
> For a sensor connected directly to a CSIPHY the transmitter is the
> sensor, so the pad found and the value returned do not change.
> camss_find_sensor_pad() is kept for camss_get_pixel_clock() and the
> frame skip query, which do want the sensor.
>
> Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
> ---
>  drivers/media/platform/qcom/camss/camss.c | 70 +++++++++++++++++++++--
>  1 file changed, 64 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 23f3cc30a1..327ac7b280 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4619,24 +4619,82 @@ struct media_pad *camss_find_sensor_pad(struct me=
dia_entity *entity)
>         }
>  }
>
> +/*
> + * camss_is_receiver_subdev - Test whether a subdev is a CAMSS CSI-2 rec=
eiver
> + * @camss: CAMSS device
> + * @sd: Subdevice to test
> + *
> + * Return true for a CSIPHY or CSID belonging to @camss, false for anyth=
ing
> + * else, in particular for the external subdev transmitting to them.
> + */
> +static bool camss_is_receiver_subdev(struct camss *camss,
> +                                    struct v4l2_subdev *sd)
> +{
> +       unsigned int i;
> +
> +       for (i =3D 0; i < camss->res->csiphy_num; i++)
> +               if (sd =3D=3D &camss->csiphy[i].subdev)
> +                       return true;
> +
> +       for (i =3D 0; i < camss->res->csid_num; i++)
> +               if (sd =3D=3D &camss->csid[i].subdev)
> +                       return true;
> +
> +       return false;
> +}
> +
> +/*
> + * camss_find_transmitter_pad - Find the pad of the CSI-2 transmitter
> + * @entity: Media entity in the current pipeline
> + *
> + * Walk the pipeline upstream through the CAMSS receiver subdevs and ret=
urn the
> + * source pad of the first entity that is not one of them: the CSI-2
> + * transmitter driving the SoC.
> + *
> + * Return a pointer to the transmitter media pad or NULL if not found
> + */
> +static struct media_pad *camss_find_transmitter_pad(struct media_entity =
*entity)
> +{
> +       struct camss *camss =3D container_of(entity->graph_obj.mdev,
> +                                          struct camss, media_dev);
> +       struct v4l2_subdev *sd;
> +       struct media_pad *pad;
> +
> +       while (1) {
> +               pad =3D &entity->pads[0];
> +               if (!(pad->flags & MEDIA_PAD_FL_SINK))
> +                       return NULL;
> +
> +               pad =3D media_pad_remote_pad_first(pad);
> +               if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
> +                       return NULL;
> +
> +               entity =3D pad->entity;
> +               sd =3D media_entity_to_v4l2_subdev(entity);
> +
> +               if (!camss_is_receiver_subdev(camss, sd))
> +                       return pad;
> +       }
> +}
> +
>  /**
> - * camss_get_link_freq - Get link frequency from sensor
> + * camss_get_link_freq - Get link frequency from the CSI-2 transmitter
>   * @entity: Media entity in the current pipeline
>   * @bpp: Number of bits per pixel for the current format
> - * @lanes: Number of lanes in the link to the sensor
> + * @lanes: Number of lanes in the link to the transmitter
>   *
>   * Return link frequency on success or a negative error code otherwise
>   */
>  s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
>                         unsigned int lanes)
>  {
> -       struct media_pad *sensor_pad;
> +       struct media_pad *tx_pad;
>
> -       sensor_pad =3D camss_find_sensor_pad(entity);
> -       if (!sensor_pad)
> +       tx_pad =3D camss_find_transmitter_pad(entity);
> +       if (!tx_pad)
>                 return -ENODEV;
>
> -       return v4l2_get_link_freq(sensor_pad, bpp, 2 * lanes);
> +       return v4l2_get_link_freq(tx_pad, bpp, 2 * lanes);
>  }
>
>  /*
> --

I think we could even simply replacing/refactoring
camss_find_sensor_pad() with camss_find_transmitter_pad()?
