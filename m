Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795428041;
	b=nrUGQOFMf15Wci+ZaAS+y//xg/vuZg1svfefN4CGMkyJn05f0PrHCZvxyzs4VkB/oJDi
	 icBQ7leCQfJ/0jVD5uXLAh1njo/NBqT+0lvA1JZMdvpgxvR7WgmanGkWTrdlfcMg2WkoD
	 b6AkeaPsUiQvcqS8LHgp4lOqI1cnh2Zz3QfspH/sdsrNzhA6xAREpgkgc0a84+BoaEV6U
	 BJuaGqKs09YnVKDSS5iP2XMNoj4DbrZaQlyqxwdKyPMy426QkR2dM/oQ7v1kNYofPWZYY
	 Fv2A9/J4c/zW1NN7T5AmWz7mJt7bH22QV+DmcGzqKUPxldyWcPOcQPNHZcQ0uksHTGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428041;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jr8A//rozd10PocUjHV0Ir84Uu2K16rDwphNfby+snU=;
	b=lofwneLNr73627W1SwwGiZ/UFfvK6J8OXXBa4Q2H64YfPVGhhPQVm0iim3KsJLAyk6Mp
	 3FGb63lGHz29f252A9bLojtfrIsUOx2hz02f0z3wPf7/W/ZaJtSesjQf0CGZz+NBP24U1
	 78qpIInks4qRLEv273IR3MNwXvBJkEjNMu4pYpEjWGQ0nhFypT1wOl0tSrASIwrxArcig
	 RbVgSILrBy8YWgrRVo4EhsoLQTlBqndtxRzIaCZ8bwBXxjXC29FjoI9YjVyrKeR5GVI1h
	 51In/wBqFLnTmEox1WLE+tVvKo1+PUPd5MSiBFjY39NrnwAI7T8RTEjkbQ9dkjAyV4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="kv5McAV/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O0WkWz+Y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC11E606A32A
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 10:00:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC11E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kv5McAV/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O0WkWz+Y
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9FqF7917029
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 10:00:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jr8A//rozd10PocUjHV0Ir84Uu2K16rDwphNfby+snU=; b=kv5McAV/tcgk8vns
	ujIF6Ey3OYnlyEhO6ujDThMVEJ216Fr7tAHU0K6ebx7fYyDEtZYsOB61ucuO2FoT
	QrfYN9ffPDqZ0ptp0HZhfuI+Tn7poJnRzHT/uNbpUm5CXGn0/R+IKK/ISPkLHiSp
	4/vTmrHOd0qIAGJz0OpepIzE/gtjwaH7hskdbHHNM8xhI5IjD6+kNMtU1N+xLb/T
	rYlHgGkG1aTBgBh1qcqmGrVzB7HZvxFA1Sbb1uFtGEh7Q2MnVbYMphiemyZ/Wg8H
	e0hkIQh8unYOgfr1y00vmrm11cAublKQ/sILiEvjxasUaPiKPQ4GxGN7Py+8EEx8
	1mxvIQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a0s2s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 10:00:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94961511b61so531387185a.3
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 02:00:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795428039; cv=none;
        d=google.com; s=arc-20260327;
        b=nJ0SrKUf6av6LPB3E+UOjs1Q5Uv3Bde/oetAcJTS+73HA97UX5qmPaq5Z3b1LE8EZT
         vmaCWvevQ7Xg8FtZAkzhtjvRRV7L3xByAxWBhb0hihoVJQYIlMLh06Tp/W9Y9F43Y8rW
         kL8TJ1YZP4pCM7tYxqUMUvhWNtoaqk88dK6FYTK95IsEWry4ZZfQ5oWt3lv5S8P+2f94
         kR5kZMUca/spDz754smyFLhWelL/QNAsGOZO1Bln3yuGoV4GXWcmKVhFNnfr3uM6FVgK
         LkpHGKdowgGgrEQCs+0lzDP6veMZ4UjJ/x82gMcOZUUHD6FBTNyQpvvSCPJ+YnMPf2cZ
         h/kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jr8A//rozd10PocUjHV0Ir84Uu2K16rDwphNfby+snU=;
        fh=vNSKskskrUyGV074f4T0+TW8i5ZiOtFJDVZWIJeJaZI=;
        b=GS3bnwWdkimVpB15wxWjMoruCEadrtqyELYVNr5VX1ZrvkbFShza7Q3ZOej4BCcjmd
         W575CY810pA80lJxbCMLIQvq7B1Hl+5w/GwNkhdwel6LviekU11uZDdjnjDLPFtMBflz
         IP1gIAcccV+GSXLmjmH2P+nbB1O6yIxP7GIQbarHYHXwZIJdU1Frcf9/9H2aC+Qb/64p
         jdwbRW18BuOrXCvd/ZS/LFovqPuEO7bNl/WmjFsZ9vgZSVyPPtmWACuxjsBCZtKbfcG4
         um3qzSGbPcJEQ9/s/1l0akGZEqe5roOXmlav12vB5Qp3d9Cz5z2WN8fvRIZs9ZXG3C+j
         ghzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795428039; x=1796032839; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jr8A//rozd10PocUjHV0Ir84Uu2K16rDwphNfby+snU=;
        b=O0WkWz+Yks1VDze9p8B8XEPeS9mdQLqigGOaS7FBq4tfUFm96H8gAX+PuhHpt1YZOQ
         z/hmavpl80xCIrCwaihWfPMIr9ExohdAqhHvY94gkRqAQbNXv4vIQ3KMfiWDxKfHq0/I
         2eLyECgp5lLqlXaWlvJRzdOI5o6UXdjMGan24lUFn3ku+0tMHquhD5C2zJfwTxgXurab
         4rLuKSTSoT7Ezl2rH6aeQ5LMhz8kx/bRM691EKvlqRpLmxCzc+mij/jVG8qhq+nkiLiT
         MgtqURwBDHB7rV/ZwYFLQO9tw0jXW9eN792QJ2p3rO+InE4qh2VaEs2GelNpcgD5xxYQ
         YT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795428039; x=1796032839;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jr8A//rozd10PocUjHV0Ir84Uu2K16rDwphNfby+snU=;
        b=dqXIqV6eR2ChY8mHZ+Pto9z4XTto0QT1hYLCv1Lko1BQBAXaoeW40ZQht7e39HEuUe
         sU9GOihlc2WS3AvJX/U94MK6T5s6MpB2I5xFyCHIYW1ZYcX9L8sQvzrYB5GN+2tyIMfd
         Shzzb3xO301D8Q8ZtNGPa/J4KDyYlk2yezRfgTEYFaLmZkstdsF5CQOAA1g9NPsY+0/w
         ILBpWI5ekdtJXoAP+lU+Is5IflswRqc8le9UzG7merRVhc7bg0lp5QWmlqHMQrYNkcuK
         U4NpHSKNinuOGn8+xcoMfkRpRwiVNCPljLbEyKdBUHcmqLDc8bLFqCKvTH6h+MsUmHg9
         nE8Q==
X-Forwarded-Encrypted: i=1; AL+hErFRRlqDdD4eCrBtwjMxDKiL8A0Yh9j29STZUh6qVrGoIodOfQ3QpXv3j3m6XaBsX3ZZUYY//3YrhU+OYg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/EtEkCn+2mGOktmGRS7hyC6AryKXatdJ/vkYxN2FONILSH3iST
	ZRH1+2/9pmAA0j7fJZpRJ0uzkXkgoYzo+nHvTmz8GHC/uSGlhcul7CsC6xxGXwVfwJtILSmTKrs
	Ze0tB6VZjcVH6vrVGKYFw5bwMI1xYzOACA/HZJbw14OcXO7xF8Pl9gMOF8kQpTu9KkZv8cRM+4i
	DW62Mbxm7Fy+ed6ajGC0LpKVdnqaBsCYqFwY1JsDiQ
X-Gm-Gg: AZFdTZcZysP2f7b4ZpBGj8eTAaCaislT4O5Zw57MJDVW7yUfyUt2DdKesjivqPIxJRx
	xDI8VUQFO9rFQCxmYazUHiVSy9zscPEPpPQMcRi0Zzqp/tWGyvsLUPooIDKA6roxpNfcZ88/QhA
	gdH9cxAZAY6TkJSL3XccM0M7oajGrOfE7BDTBzA+36zjX+ZZvVUIFCYKVXLtiydqiJWJBX8gFrp
	DXaU6rBq8f6gSnhDuTfcuoazqOHOckU0gagObEf3AkkWz5EhG4QaEIgKj2SPgNrDWNhnjOKz0GT
X-Received: by 2002:a05:620a:4606:b0:93f:22af:cce7 with SMTP id af79cd13be357-949ba7cbc42mr1886236385a.12.1795428038977;
        Mon, 23 Nov 2026 02:00:38 -0800 (PST)
X-Received: by 2002:a05:620a:4606:b0:93f:22af:cce7 with SMTP id
 af79cd13be357-949ba7cbc42mr1886232285a.12.1795428038540; Mon, 23 Nov 2026
 02:00:38 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-camss-fixes-v1-0-9df4deb87ea2@gmail.com> <20261122-camss-fixes-v1-4-9df4deb87ea2@gmail.com>
In-Reply-To: <20261122-camss-fixes-v1-4-9df4deb87ea2@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:00:27 +0100
X-Gm-Features: Aa3M54rclSH4qaC8LgLmCmft5IbT2-6SZQ8jqP_AAqtP32lwf4u3PIYObJ-foec
Message-ID: <CAFEp6-2e1nU_wC-s+3O8Wu8G3x=oda=EhFOX8zVAYwmCeHSkzA@mail.gmail.com>
Subject: Re: [PATCH 4/5] media: qcom: camss: vfe: destroy mutexes after
 unregistering entities
To: robertijtsma@gmail.com
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAzOSBTYWx0ZWRfX3sc2enEC/H/e
 zJijdXQQV4ketYAi2pPvofA8behS8mGcXP9Y5jFOeX24pfQgGKFT1IIsaOuUmTGUC+foRDzk0lA
 6OsAe6NMffa4SCXqIvXyccYoFUD1tV4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAzOSBTYWx0ZWRfX1ZP5rQqn0SH6
 O8M4bBmlhtOJHD5+oHyj6RLD6YSg31gCzfC1ed7HQDFb3IuZ3L0fo6ERk5F3VYUBZoj4+VVHgfn
 8r0y+dIQHySvP8+JyUcoFKzcDbrFMPacYdr9buTDKtIo64YsJMnLeXb5QxmhoaGzR51OEdn+PRf
 kU4WNiY9+QQXFygAvrpGxlyYsTT5jN4O6pCutF9IpgbHjha1GlYEUScEHGnqtX7fnCBnxY3NOEP
 QP8jBzQe4a5Nwrhlo3ak1jOC2u8zYgybmtYswtykkHZ63yBWmaK6edjJUSQB6qYkXNkB8DNn915
 A0SesPqhBwCw+eK+2aQp25FEjCwswIBMvV20pUMuLJUQwoFS8fOEy+GUUYDLbNX5IiEcszm7CQ+
 cSbq4PVaTredET1Grw5qW6LCpV5DG8uMXD/xo9aUHlG9LT6J/oBycTDJsCWnobYcHDXOCnc93OS
 qmCN9sCJ3IulNJfJGJA==
X-Proofpoint-ORIG-GUID: lPCx9HwlWDGMYpjSpJZ466aNnTPCYOhs
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b040ec8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=tC7aEmQbD_rfEHlaJSEA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: lPCx9HwlWDGMYpjSpJZ466aNnTPCYOhs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230039

On Sun, Nov 22, 2026 at 2:36=E2=80=AFPM Robert Ijtsma via B4 Relay
<devnull+robertijtsma.gmail.com@kernel.org> wrote:
>
> From: Robert Ijtsma <robertijtsma@gmail.com>
>
> msm_vfe_unregister_entities() destroys vfe->power_lock and
> vfe->stream_lock before unregistering the VFE video devices and V4L2
> subdevices. Active userspace handles or concurrent teardown callbacks
> can still acquire these mutexes until the entities are unregistered.
>
> Destroy power_lock and stream_lock after all VFE entities have been
> unregistered and cleaned up.
>
> Fixes: 4c98a5f57f90 ("media: camss: Add VFE files")
> Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss-vfe.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index ad09593..fe6b7ef 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -2168,9 +2168,6 @@ void msm_vfe_unregister_entities(struct vfe_device =
*vfe)
>  {
>         int i;
>
> -       mutex_destroy(&vfe->power_lock);
> -       mutex_destroy(&vfe->stream_lock);
> -
>         for (i =3D 0; i < vfe->res->line_num; i++) {
>                 struct v4l2_subdev *sd =3D &vfe->line[i].subdev;
>                 struct camss_video *video_out =3D &vfe->line[i].video_out=
;
> @@ -2179,6 +2176,9 @@ void msm_vfe_unregister_entities(struct vfe_device =
*vfe)
>                 v4l2_device_unregister_subdev(sd);
>                 media_entity_cleanup(&sd->entity);
>         }
> +
> +       mutex_destroy(&vfe->power_lock);
> +       mutex_destroy(&vfe->stream_lock);
>  }
>
>  bool vfe_is_lite(struct vfe_device *vfe)
>
> --
> 2.56.0
>
>
