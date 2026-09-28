Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B7840926C
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 10:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591696; cv=pass; b=YqoiGxyqRM5idS1Gwq7AcL20l3Sv3XmNGUvdirWarIH8uU+HwqcGQP1T62m9X2yg6EQswIH15xdMDKWFTMvX/xYR9/ZEIjgGe1vdByJecDI/80RNJQ7DnEkaVpaOYx9Ei4O6AMNq4JX/nFeF9Xae9o+T8bQxt3iGZZa/iVJvdIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591696; c=relaxed/simple;
	bh=pgPadREzHeds6b0yrt1+dmOVplusfqdmvFM+ILtLRG8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ngzhkkAbIufl1b2C40mTV6vwdY9+LobzrgfOyX4n95OTnCzt2FLz6SMi0IjFcEKnbjdP4xF9xsNwpTAWJhLZ7NrRpc7PppG2UYgaGdtFILlNuLll/nhTCsmeeh0tos6+BrSZw/uYzARVLK+sXeIMFxPaLgp3WgA/wWuWmT+MoLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jc39LnO+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hUr/Eu9r; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jc39LnO+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hUr/Eu9r"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S9MBnc322674
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 10:34:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WvqItyTB9pDtC0uP+z/dG1pHDRf2ePVLxtVA4iSn4mQ=; b=jc39LnO+BmbtessP
	I0t+9NSbOz+VPWVsIJyz6OhOz2s7x/dMOqCMN/fWwit7TdpPuWqks32G9Ex9Efu6
	uV9CNiVAZK6PvdCZG8UoySmoL3+0KsOu0kDnmn81zPAPGQxA7xCXUUWpcEAzLsGC
	3r4PnvVAtMeEXXCiS7AYtje0jOQPevMw6fSmIqtD8rHma+Ep/Y92AonrLPLRYoUM
	8yCzxgxWAwUMvE1rAI5c5/H98tD5I0QGyn26mozXi6Aa6QF9htpoLXm8DX4zOGlS
	ryYroIhqojH2s3qh1F/tY0G4SOQ79WqaUdiLpwuoEhPAO3B2/CpnZJ1qsv1eW3zZ
	MNCmeQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyebq1qq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 10:34:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936aa34873bso563318385a.3
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 03:34:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790591693; cv=none;
        d=google.com; s=arc-20260327;
        b=fTItnrOoNJpwjm9+q/qdN9dbO+9qT6eImfa7jtc5EzXvi0CCW9Qs/YXC0pE02lEtpU
         hPa+QNcCmhAsMLLFBMIITFzOd5TLd2bhjzIzzPijklRQVV24H6h7W7KCDVO2NAnpIa4R
         Xp4T+UGK1CVDqX8DPgfh8ZI4svIS/J9HqiIJNZ/oVJdiwoCyWzkkzc5cS/+3tRhQYBJr
         6JlUOwW8qbthNVPhcbBEqJi9tjQmDaeiL1uIy4NYrD6/19NXZuzviLPxxFDvxYYRYuMY
         cLK6f8VZbNJ2EpcXn6glmWEqO0t9Jsl2Jj1w4aJxMGuALOZ5p94+y1rbwMEjaIWwvepD
         FyPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WvqItyTB9pDtC0uP+z/dG1pHDRf2ePVLxtVA4iSn4mQ=;
        fh=tdUDemX6FQnR6Wxcy8Grnsi00dw5T2f23Wd5o9HPPuA=;
        b=kX5zsC7RYW/PTn5yCxhLieWDZIajxXq/6Htg279zYTBD4GPsgUI4e+r8STgPhD492T
         nM1cYkPrECoQ9yEUCLNfZ1JUilFKtHEPW/NUCUssriptWNdtrZn+tQcf0bhWp+aDEak8
         lfgf2GopqXKRUM7X1asJI/7FXF96ThnzML+SCEZdP4MlgJ7RLv/4hn6hCQ5sg6alahl1
         KyuVMNjO1L24NXTXWKBBHZqUI6LB226zpWcy6mOkFYZ1P3vxuOXE8Fg/+InaoXZY9miy
         9NAUVI9FUwrqOipRhAa2/+gXFrRBKEAPvSkyfozrOLlOfsU1WjfXxNJWYHm5TiDg4aPh
         Jx9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790591693; x=1791196493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WvqItyTB9pDtC0uP+z/dG1pHDRf2ePVLxtVA4iSn4mQ=;
        b=hUr/Eu9rlx8IAEdlRe3QLL27O1Jm2VJ4fiT5kZ5XRe+HBuK+0kNhBR479R7FacZdIP
         tHu2td3sQOy2k2hrdXQNkDBnsHMwupYQdbGQApwhXmdag+ItpMUZE40zx7gI16uYQL3+
         F2LPP/tnPSuWG4Z+/QGCvehVkWbWoFp5lSdnIm33XubHOJe+Y4guZrXWBx4f3opeP8ZX
         U9mAagWjjsNls7h2pMr3uyubg5fY+EcTpi79bNVKHwFoyGF8eDUNdgWadssDRsAL1eT6
         2EV6Ha5W3Wqoj1H6blm3LzzmS9GDMa3v+SbL6kC9Wt/VmwKeTgby2QdbJ2Hu0gh7Cdck
         GqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790591693; x=1791196493;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WvqItyTB9pDtC0uP+z/dG1pHDRf2ePVLxtVA4iSn4mQ=;
        b=q0kLUL8x/1FFFvGdfkeHPduxX91Iw2XGF4f9HYSP2oZeEAYmfuEbpLMlT1eNkzrA96
         O97AcwspN/bSs9fOYMpwFmJKpduxdKkeidqv8lCFmQpBMQ1KhAGB/kUqHfJIX4MVMz6P
         gGkIw97MDfw2fm4UU8ooDuiHCnaL5y8UC69Av2gCvTTpmrsdbAKg3VXaxOo8OnviiUvC
         NVlM+nJGUP5pyKGhDd3OruRl/unWzR2tyLGuUhZqWaakoOAPoTERN0oO3fDDoiuhvALR
         lwjreQmu11i5iZALYrrLJjSmt2UpV7kx0AxTg8GxwkjQtYWVOK+Jhiz05M8NsiewicQf
         a6bA==
X-Gm-Message-State: AFuF++kn/Gks2me0ej/PQ49/ybBlcoHwDzOLTC9H2UkrEiyROuY7gU3k
	VRzAOak176XwAfbdtjeK64exszezPzam+bH21Au6JTvFv48xw07SUJ3Y48NqnvBFBxalzi7sawu
	fHmW1SC2JW4Kb01IbrVgD9O32vgSOIAF5QK/LxFsLJNAaaPvjspd9RKd0tW9hb7fk9v+R/QKM3t
	NCuiWzutUQqsPNENAf/CuuRD1hVeBjfjpHJC3Nn0nz
X-Gm-Gg: AYBFou0Em3o5WORzRDmcZ8Xevq925+UgBxLf1TBcXKWlrk/JDIqPibPsNwAXbucd2IB
	4PE5dO554XukKQbsb+wSB2iz6vx1gFR+8h/5OUgbTqq3iKa9MmO8O0/Tcm4tVfaQ2el0VEW8cjj
	9TDjGG/uLW/JeACVGpxrCAkyqiRNN8kzVc1gL+A+Gs3wNBRLQdqwYNO3SwzyHmZMKJoJQl9S3Ql
	LmweeQyRHCvGCiqIdujIM7nZQsboGtixXEL1O2UTBzQdtoHn9rE5a8UDJ5CDEL9hGNlxa9K8TY=
X-Received: by 2002:a05:620a:1787:b0:93c:6dc5:6817 with SMTP id af79cd13be357-93c6dc5794bmr739617585a.66.1790591692456;
        Mon, 28 Sep 2026 03:34:52 -0700 (PDT)
X-Received: by 2002:a05:620a:1787:b0:93c:6dc5:6817 with SMTP id
 af79cd13be357-93c6dc5794bmr739612585a.66.1790591691910; Mon, 28 Sep 2026
 03:34:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928102237.533341-1-hitesh@ebytelogic.com> <20260928102237.533341-5-hitesh@ebytelogic.com>
In-Reply-To: <20260928102237.533341-5-hitesh@ebytelogic.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 12:34:40 +0200
X-Gm-Features: AclHuK_Qw-FieO1q69F4kXiY0Bw39Ett9sMbEG0ccIDoFPXW2XZOLfM9p5kOzz4
Message-ID: <CAFEp6-0Y6yT6u86E2372mPWmu6Rwkt3bLewZ2hNbcnzt3zWW=w@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] media: qcom: camss: Take the link frequency from
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
X-Proofpoint-ORIG-GUID: ko52haTv25MHjWm8Loc3M3wjsPB7FcfM
X-Proofpoint-GUID: ko52haTv25MHjWm8Loc3M3wjsPB7FcfM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0MiBTYWx0ZWRfXwweuZMCgFwLj
 PMVXPcJGHw0DiO0k0jMKVrAvendGBR7RY0j2+nCrbAoPy6E8McMLO3kbg0WysNLvRvv09KHr8yc
 0Hl8IK06NLz1GvIzEGgP0+bDACB0SO4=
X-Authority-Analysis: v=2.4 cv=EqRHPicA c=1 sm=1 tr=0 ts=6aba42cd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZovgdgjKAAAA:8
 a=-lptdhyi6AU5iwHxuhwA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=VOxKbm1zgHvARWIDjr3b:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0MiBTYWx0ZWRfX3A67p24aSk+i
 eCALkZVGhHpBgf6oZrJmrZxX8A02cuiHt3IhY+CwKKiKp4dNcfWSDmWXHkmQAOeFNTo/Sblj07u
 V2NdftT8cowx8CR4htDFiD5c7MH5RgZ1yBxPJuU/SDiHvb4doGfOORgxLia3R5a4DSb2RxZ7tN7
 3cK6Qe3D0Scl78gXhRR46Fo+TNvBYhexKZhOIVhlLcLTLi0IUSi9aSpnA1oCX5+tIO5TzMPvvGq
 0X87xON/VZLBte9jQOLJZ/Xt5UbMRDzZEKDmwXRQJ4rqUR2NLhB65wNSmsi3TTuBGWBoK2h+Ri1
 eNqZU5Xz5pGsl9rziYIDT9bPAalURo5i8wvAleavFfo+RgCoAB6Dwy+oGAWI2HqBeFpWTZ5i1nP
 ZyQX1Esvs1HrpOJ8fDKgTh+fAomrqyZhBhWWsw/99J20IFk7wzn5z5vJhPZcFpHBUVgCzZ0PDBw
 aiBdgRVEYmu8YIKnXyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280042

Hi Hitesh,

On Mon, Sep 28, 2026 at 12:23=E2=80=AFPM Hitesh Patel <hitesh@ebytelogic.co=
m> wrote:
>
> camss_find_sensor_pad() walks the pipeline up to an entity with the
> MEDIA_ENT_F_CAM_SENSOR function, and camss_get_link_freq() reads the
> link frequency there. The CSIPHY settle count and the CSID clock are
> then derived from it.
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
> Replace the helper with camss_find_transmitter_pad(), which stops at
> the first entity that is not a CAMSS receiver, i.e. at the external
> subdev feeding the CSIPHY, and ask that pad with v4l2_get_link_freq().
> The helper queries the transmitter through .get_mbus_config first and
> falls back to its V4L2_CID_LINK_FREQ and V4L2_CID_PIXEL_RATE controls,
> so a bridge and a bare sensor are both handled by the standard
> mechanism.
>
> For a sensor connected directly to a CSIPHY the transmitter is the
> sensor, so the pad found and the values returned do not change
> anywhere. Only a bridge setup sees a difference, and there the two
> other users of the old helper now describe the hardware better as
> well:
>
>  - camss_get_pixel_clock() reads V4L2_CID_PIXEL_RATE, which for the
>    same reason as the link frequency belongs to the device driving the
>    bus.
>  - the g_skip_frames query in vfe_enable_output_v2() and its gen1
>    counterpart is a sensor operation. A bridge does not implement it,
>    so the call fails and frame_skip stays 0, which is what already
>    happens today whenever the walk cannot reach a sensor.
>
> Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
> ---
>  .../platform/qcom/camss/camss-vfe-gen1.c      |  8 +--
>  drivers/media/platform/qcom/camss/camss-vfe.c |  8 +--
>  drivers/media/platform/qcom/camss/camss.c     | 64 ++++++++++++++-----
>  drivers/media/platform/qcom/camss/camss.h     |  2 +-
>  4 files changed, 57 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-gen1.c b/drivers=
/media/platform/qcom/camss/camss-vfe-gen1.c
> index d84a375e33..8827b51694 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-gen1.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-gen1.c
> @@ -170,7 +170,7 @@ static int vfe_enable_output(struct vfe_line *line)
>         struct vfe_device *vfe =3D to_vfe(line);
>         struct vfe_output *output =3D &line->output;
>         const struct vfe_hw_ops *ops =3D vfe->res->hw_ops;
> -       struct media_pad *sensor_pad;
> +       struct media_pad *tx_pad;
>         unsigned long flags;
>         unsigned int frame_skip =3D 0;
>         unsigned int i;
> @@ -180,10 +180,10 @@ static int vfe_enable_output(struct vfe_line *line)
>         if (!ub_size)
>                 return -EINVAL;
>
> -       sensor_pad =3D camss_find_sensor_pad(&line->subdev.entity);
> -       if (sensor_pad) {
> +       tx_pad =3D camss_find_transmitter_pad(&line->subdev.entity);
> +       if (tx_pad) {
>                 struct v4l2_subdev *subdev =3D
> -                       media_entity_to_v4l2_subdev(sensor_pad->entity);
> +                       media_entity_to_v4l2_subdev(tx_pad->entity);
>
>                 v4l2_subdev_call(subdev, sensor, g_skip_frames, &frame_sk=
ip);
>                 /* Max frame skip is 29 frames */
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index d20cd4dfb9..a2ff6ae503 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -507,15 +507,15 @@ int vfe_enable_output_v2(struct vfe_line *line)
>         struct vfe_device *vfe =3D to_vfe(line);
>         struct vfe_output *output =3D &line->output;
>         const struct vfe_hw_ops *ops =3D vfe->res->hw_ops;
> -       struct media_pad *sensor_pad;
> +       struct media_pad *tx_pad;
>         unsigned long flags;
>         unsigned int frame_skip =3D 0;
>         unsigned int i;
>
> -       sensor_pad =3D camss_find_sensor_pad(&line->subdev.entity);
> -       if (sensor_pad) {
> +       tx_pad =3D camss_find_transmitter_pad(&line->subdev.entity);
> +       if (tx_pad) {
>                 struct v4l2_subdev *subdev =3D
> -                       media_entity_to_v4l2_subdev(sensor_pad->entity);
> +                       media_entity_to_v4l2_subdev(tx_pad->entity);
>
>                 v4l2_subdev_call(subdev, sensor, g_skip_frames, &frame_sk=
ip);

I sent a patch to remove the frame_skip retrieval from this code path,
as it is currently unused:
https://lore.kernel.org/all/20260928-camss-misc-fixes-v1-1-3e0155af6df5@oss=
.qualcomm.com/

Feel free to include this change in your series ahead of that patch,
so you don't need to worry about handling it separately.

>                 /* Max frame skip is 29 frames */
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 23f3cc30a1..42d8654fd0 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4594,13 +4594,44 @@ void camss_disable_clocks(int nclocks, struct cam=
ss_clock *clock)
>  }
>
>  /*
> - * camss_find_sensor_pad - Find the media pad via which the sensor is li=
nked
> - * @entity: Media entity to start searching from
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
>   *
> - * Return a pointer to sensor media pad or NULL if not found
> + * Walk the pipeline upstream through the CAMSS receiver subdevs and ret=
urn the
> + * source pad of the first entity that is not one of them: the CSI-2
> + * transmitter driving the SoC.
> + *
> + * Return a pointer to the transmitter media pad or NULL if not found
>   */
> -struct media_pad *camss_find_sensor_pad(struct media_entity *entity)
> +struct media_pad *camss_find_transmitter_pad(struct media_entity *entity=
)
>  {
> +       struct camss *camss =3D container_of(entity->graph_obj.mdev,
> +                                          struct camss, media_dev);
> +       struct v4l2_subdev *sd;
>         struct media_pad *pad;
>
>         while (1) {
> @@ -4613,34 +4644,35 @@ struct media_pad *camss_find_sensor_pad(struct me=
dia_entity *entity)
>                         return NULL;
>
>                 entity =3D pad->entity;
> +               sd =3D media_entity_to_v4l2_subdev(entity);
>
> -               if (entity->function =3D=3D MEDIA_ENT_F_CAM_SENSOR)
> +               if (!camss_is_receiver_subdev(camss, sd))
>                         return pad;
>         }
>  }
>
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
> - * camss_get_pixel_clock - Get pixel clock rate from sensor
> + * camss_get_pixel_clock - Get pixel clock rate from the CSI-2 transmitt=
er
>   * @entity: Media entity in the current pipeline
>   * @pixel_clock: Received pixel clock value
>   *
> @@ -4648,15 +4680,15 @@ s64 camss_get_link_freq(struct media_entity *enti=
ty, unsigned int bpp,
>   */
>  int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock)
>  {
> -       struct media_pad *sensor_pad;
> +       struct media_pad *tx_pad;
>         struct v4l2_subdev *subdev;
>         struct v4l2_ctrl *ctrl;
>
> -       sensor_pad =3D camss_find_sensor_pad(entity);
> -       if (!sensor_pad)
> +       tx_pad =3D camss_find_transmitter_pad(entity);
> +       if (!tx_pad)
>                 return -ENODEV;
>
> -       subdev =3D media_entity_to_v4l2_subdev(sensor_pad->entity);
> +       subdev =3D media_entity_to_v4l2_subdev(tx_pad->entity);
>
>         ctrl =3D v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_PIXEL_RATE=
);
>
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/pl=
atform/qcom/camss/camss.h
> index 93d691c8ac..1560ad0dc5 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -167,7 +167,7 @@ void camss_add_clock_margin(u64 *rate);
>  int camss_enable_clocks(int nclocks, struct camss_clock *clock,
>                         struct device *dev);
>  void camss_disable_clocks(int nclocks, struct camss_clock *clock);
> -struct media_pad *camss_find_sensor_pad(struct media_entity *entity);
> +struct media_pad *camss_find_transmitter_pad(struct media_entity *entity=
);
>  s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
>                         unsigned int lanes);
>  int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock)=
;
> --
> 2.43.0
>
