Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793630855;
	b=b2oC/p6RJHJHVPb7d2fYVRTPSpp2k5QM0MrPTYfD4t9rqzmxR1R7/waffp72QMsnCurh
	 k0+4It3KD/jE1VqBibwnnJvjaHf04KTg5SIKLlgfN2r1CukJ8sIV6COPUqNB3lWWQJLGA
	 1BJNtdqSm+0m0z5DPcpot5r6dxERQ5jRdSwtz9ZS04oVFHHdUCUiJyggOLskfXGdQaEoV
	 LnSo5scUBUtCOGb675a0A0QgjarGm39tiT8rrbRd6xOugbHZCUCZ2t3LIksd/SeGpJKs+
	 mRFkLdf2SMWGAmYG8AwLLBBa7xwCEbCs729AI0VJECJ+Dz0hNk8yeCrX1lJnOxyNzIw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630855;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MsSc9Jz+Linl7zHpjKlL+13hzqG01ybLAs8kBZvt4Pk=;
	b=Ug86slzkn7CgV+1VYhmegd4oYM6h/Gl1pREzTu7uUMohugi5tsh8A0anN5dXzSm3guyo
	 esojCGeOPkMHlQd9qu4JSTVQjN9MXaMqweRqAzBVIlZHYmsQQS2JztfwklzcqVZ+EtnaW
	 ZX/juBUSKckh3apaR/JqawuZEjKAyBxTHW6/30fas28EF9FsO5YcbtDqgOkAGNNpNomqh
	 a14zU/jRSo2dvriwV+HXVlyiE0oETVzrufOVsidIruikNiPSDJ8Etlktjkp15Npl40UPG
	 soAasSlPbjaqM7B+2C/CfBrwZ4iJDbMyRxdh7JDKajq8wdL33nmPzmOTQN2JDuqnH4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gAzdOtsZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G4s86SlG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4344E6085577
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 14:47:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4344E6085577
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gAzdOtsZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G4s86SlG
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpBZ54033926
	for <linux-media@vger.kernel.org>; Mon, 2 Nov 2026 14:47:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MsSc9Jz+Linl7zHpjKlL+13hzqG01ybLAs8kBZvt4Pk=; b=gAzdOtsZTxgNy94h
	ZPBgktST8H9qh/HqbR7qsGEwDXgGnW/s4aJoREacb32Hcv0lUYn6IGFaLj9n00qP
	eo5nDZUHtUw3HHnqdFUXRSrxOP+0YxsjiddZ+IilytcBFLsDneMN3tTG6+msTlS5
	s3rA6gNVWchexYjtkyW0QfY3nj17B8CXWrGMaVtQZHh3AnZqrfDOEfeMt0qjTpLf
	AdLndZzmCZnvF3+BpcCVoGeVQendqaL9tkDM3tUZG0KQ68riU0W69M2nswepn+1w
	LMai++QfbuLlBzXZ27MgMMbU/z9vxkR0Hl2zbe11dhq7O2zm6Bvqk8eQdg9GIz25
	c4A16A==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfe9mnn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 14:47:34 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-5641cd2cc13so3210256b6e.0
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 06:47:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793630853; cv=none;
        d=google.com; s=arc-20260327;
        b=BByc+zdPCDSk7JrutgVK5fKWaXQPqi0601R4GySaM8l1nmjyd3FiGVQ1KTzPNq/0pL
         Tr0KNw0GNLCvlz1xx7OmcQfY17+V1st57tG0sn8TYBfvVxBkHIeQrDUBxew7x9mEYvv9
         CSoYtF+djXaTebyti97xsbIKd4Ksjlaw4PAheQ5AeyJENBT04DzfmJAAnPekePZFK3RG
         Ud1xSPX2SoEv5ueoSVhd4P21qdh4JpJV1+IvZn6Eg2qFn8FFLba0/pcsvV2seCcHRvlS
         5msX3siTRJxIfgJE4PJMbeYjS+ArVMQI+Zn3jioKTFzigfnlp0+9huZ/ZZa/NGtOGqLK
         RSqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MsSc9Jz+Linl7zHpjKlL+13hzqG01ybLAs8kBZvt4Pk=;
        fh=V80MoHOr14erxerncc54SgYHMHawVqc3aIRus19gl4U=;
        b=cxUMfipdidvJPklJsO2cXHD41h7eGOHN6RIvJyyQXM2uNnMuV+GM8Pny/Q+4N9vqps
         +j42YT3YGnS5PXnbIHmCriTluxG3nwqPZJsnbyr7xa1RfQnmxAaVSBjNXnrKiUMYRfmN
         3NW8/MT8nqLpv2OYNII+o7vTcVLEq57VrjK425AuYIQuVFDjB1WLMnPAiFYszxLa7mTK
         QQP83wr6IPkOkArvJOL4ETjmZDrBEFymVtdSPTojC+xWx34m72J7KpC81dspa+i7/O4b
         R94I1p64RWtOx2UKhq+EusDD0mA1NFwr8ZhdkDl24XRC9R55U+s2YnfmRcPKhdG1IoXn
         nE4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793630853; x=1794235653; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MsSc9Jz+Linl7zHpjKlL+13hzqG01ybLAs8kBZvt4Pk=;
        b=G4s86SlG1mh6vfGLj+6kpzbMZsy7KTERL8W9q0XIEazSRYLKo2laW3PLxnELTjMBD1
         2BtOxo/08ezako1wwgv7MqDOid5FZuakWoZnHh+1VaRbJeKlytF1fvE08c5gUpapOSHj
         MsR5ll9mAJ5vKNNhmn5Y5uXL9K3IbZU/yOqRQ4FCG/ZSpetpJjDYae1frGP6LqvHjQDn
         dGQbIV469uCBpmTfIMePae339DVqiIl38KHMnbHD1Ic3q4hwZPD1JsE6YoSee3nHSXG1
         2IFdapWA5tqj6nen6mJ/krTN9BPMboggifiK/DaeLhN6K3lEegzrVER+9UyepzFZtjdS
         9MsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793630853; x=1794235653;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MsSc9Jz+Linl7zHpjKlL+13hzqG01ybLAs8kBZvt4Pk=;
        b=tk4chB0iGTV7UKd/nJilavQKIhL/1NICXi0JNXyGI2ZgeK62V1d9QTRUVQaRd5L4Ec
         PyKUSplB4AylGGMazTg3R3pzMrB06E4gML/+/X1xNqUj9AagVjU7ss0Qh7gDjH2ITO8J
         bTXvM3Bmosbnek1iZwp4ixbg90MELo2IE+N+vEPuRAlovFPxrkb0fk23cwcH6V/J7w5g
         eqhgp5+DQovL/+mIpm6q7263sZG6xfd8pjksLuvuB/9Gszva+eo6mfSIwqVu28mHtwm3
         yVHo/yslvuWwehiRpJ+FlpPmSTqjKADfXdkLfd/1nk90a8djw36/YOiCA9r4lGn4kAuS
         yQlQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJBmMLBaiZtIsLVIc0BfFrwydQ+A8JIXXGKoT4CncbklFLhaheO8DEBu9/AAf8uKnVLaT7p2DIjuJtwg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJOmXGd+LDR3GVOJu2dTkldvbfa/TM/vTycnnyiMaEHY+lxlnoO
	kXERFvXKnkKFt1NBS70jkCUkd6j9E4BSKTaAzUc8M8fF6PqN7QkqZuVLxHdNhWokjuN0mwff96R
	XiEi0/O6ice7K/V3lbIYWjlHWZLvDgzLvwteqknwFOY+05/heyr/WO7r2dSYYNmWvGzZF9ZmQFv
	LuSGE0y5LB8kVCGGnScCeP8sajEPw5Sq3OoQtksHqh
X-Gm-Gg: AYBFou19K57zsVGvVpo1YPRmh6wgmb9uf5pPvn4A6YzxfIFtn1qEdkiL7t9SirOVhU9
	ZtUJYtS6IczntrCMeHF+/lY6W9vbhgOoCva7e8hxY+wYXyWgclM9mTq7mkML2l6tVfiNraiAX12
	OFWDZ5DJs6Pb4ZCZxrofLio81Cy3wuIXzFHGcC5WHsrjzN36j6TIuUnGxLMGwTxs6xH0m0AeEyY
	CMyYuUip8aRbdpkLpxzAh5C1ObyX6omUjqQdJbXlG5kKq/wvg0BrKgDtkcTi+nuabuWnq+6ENc=
X-Received: by 2002:a05:6808:1783:b0:4fb:ac9b:b06a with SMTP id 5614622812f47-5640de0fc9emr7469405b6e.48.1793630853421;
        Mon, 02 Nov 2026 06:47:33 -0800 (PST)
X-Received: by 2002:a05:6808:1783:b0:4fb:ac9b:b06a with SMTP id
 5614622812f47-5640de0fc9emr7469389b6e.48.1793630852884; Mon, 02 Nov 2026
 06:47:32 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org> <20261102-v4l2-frame-sync-v2-2-25cbed7a772f@kernel.org>
In-Reply-To: <20261102-v4l2-frame-sync-v2-2-25cbed7a772f@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 15:47:20 +0100
X-Gm-Features: AclHuK9F-lczTho9-OOQz-6r-jj8Nij597M3yazka8tis8-xUrvn5J9xzKhwj5s
Message-ID: <CAFEp6-3LSPnYv2AV4xCc3i+NQJv13qHZ2JCX45drnx26=Z2kVg@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] media: qcom: camss: Introduce SOF sequence tracking
To: bryan.odonoghue@linaro.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae8a286 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8 a=ySw4tsHwzHfE-Ekmi8kA:9
 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1OCBTYWx0ZWRfX9QNyi+Pq6Mjz
 /sUoQhu/nhvC+PjcoLlpf7CTDrMLRp5nyNurgoJUpm80pH0G2hFXZvLOeCJ6jnxtAGW+NFsxmv2
 wn0U/ZMPZdgYVmfCCXBiWyg0Nh95/toMBoBgIvlx/eyTRt3iZBF55uRZbJJLTTtgFwAU0ZbdLcU
 5W9v7Cz06hssQIXOdAFlPDdEqDbsCHxcUHm/UMqnym/GngkJ48AKt9jQxPhY+4qGw2Zj8kZplDs
 fwrxgUK4B8dPPDYpCmaCI0oXB+xqfqi6w2JgyIUupzEyAmnNuaGUvCREtHLSNDjqhi9hgTINfuA
 9jr/Zlpe4se3iZBgjPToAJ5C6RQ3UDnIFzU7e4Y7sDtOlCD41R/KAXmkTYyCTtGqoH5gxFvjGRh
 dE+A3hVdFalTe4FCOF7Zxtzu0m4vEygsH+xA9kTnLo2BurBnY51yqt70167bltb/jUThKMKD12C
 nwkKowNIUHiroNel+PA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1OCBTYWx0ZWRfX+3o9yq+qA4Bl
 cgWBUHT1j9reGaVl7Qj/RMFa4g0/e4tQbAwq/bVJo2LIqLat2diz5zY0UVqE/e4Zy4MK4Kyq2L8
 P3yDRFo7OdqibQJX0c6Iq7bAK+Tgodk=
X-Proofpoint-ORIG-GUID: cv9xR-IKAFEhhUh2S5qrm9tCr6J_AVhw
X-Proofpoint-GUID: cv9xR-IKAFEhhUh2S5qrm9tCr6J_AVhw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020058

On Mon, Nov 2, 2026 at 2:57=E2=80=AFPM <bryan.odonoghue@linaro.org> wrote:
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
> ---
>  drivers/media/platform/qcom/camss/camss-csid.c | 54 ++++++++++++++++++++=
+++++-
>  drivers/media/platform/qcom/camss/camss-csid.h | 12 ++++++
>  2 files changed, 65 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/med=
ia/platform/qcom/camss/camss-csid.c
> index a00791b00feb7..e9b399fcb9c7a 100644
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
> @@ -778,6 +779,9 @@ static int csid_set_stream(struct v4l2_subdev *sd, in=
t enable)
>         }
>
>         if (csid->phy.need_vc_update) {
> +               for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> +                       atomic_set(&csid->sof_seq[i], -1);

Should we introduce a `csid_sof_reset()` helper and only invoke it on
the enable path?
For example, on disable we currently reset the value before stopping
the CSID, so a late IRQ could still arrive and update `seq`. In
practice this is probably harmless since the value gets reset again on
the next enable...

Also, a short comment explaining why the sequence is initialized to
`-1` would be helpful.

> +
>                 csid->res->hw_ops->configure_stream(csid, enable);
>                 csid->phy.need_vc_update =3D false;
>         }
> @@ -1316,9 +1320,57 @@ static int csid_link_setup(struct media_entity *en=
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
> +       atomic_inc(&csid->frame_sync_users[sev->id]);
> +
> +       return 0;
> +}
> +
> +static void csid_frame_sync_del(struct v4l2_subscribed_event *sev)
> +{
> +       struct csid_device *csid =3D v4l2_get_subdevdata(vdev_to_v4l2_sub=
dev(sev->fh->vdev));
> +
> +       atomic_dec(&csid->frame_sync_users[sev->id]);
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
> +       if (sub->id >=3D MSM_CSID_MAX_SRC_STREAMS || !csid->res->frame_sy=
nc_en)
> +               return -EINVAL;
> +
> +       return v4l2_event_subscribe(fh, sub, 0, &csid_frame_sync_ops);
> +}
> +
> +void csid_sof_event(struct csid_device *csid, unsigned int id)
> +{
> +       struct v4l2_event event =3D {
> +               .type =3D V4L2_EVENT_FRAME_SYNC,
> +               .id =3D id,
> +               .u.frame_sync.frame_sequence =3D
> +                       atomic_inc_return(&csid->sof_seq[id]),
> +       };
> +
> +       if (atomic_read(&csid->frame_sync_users[id]))
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
> index 5296b10f6bac8..2e48b08b93592 100644
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
> +       atomic_t frame_sync_users[MSM_CSID_MAX_SRC_STREAMS];
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
