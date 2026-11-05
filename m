Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793911990;
	b=ifxLYQzDC1ILUrYbODaSozYgLsCqgE3i/8eoq8JsuY/bIYiQLsxURmi6p6YADXD136gW
	 TwFD4ou4G8oxro3k9FUqNNGhDV5XveH8dcQw1R0G9CB7DJ7RU2463kbl9i3hlohzL+Ip2
	 NMJRmORqqdB7iHpONwpIDt/DgW/hqDZUuvaWNownZ0i9Ph8Mu9Qb6GIcd0tJwm6owzl78
	 Wex/5u/G7iMSXETSUAolq/2Fjea39SkBxEhF57TGLm88kha5t/2yhIZ8QyRlO4UbZgH5z
	 kKqMzBQHU2RBFi1bi7+Qzz0ttXMV+0tfk0pSE53DlrcWAYd4IHaG3kR0FB8ObKhiESA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911990;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sX8j+rhapnFRAdikVp9Pz/gF+oALejP+4Db90hXaOAI=;
	b=paMeepn62zlE4JodfbPygeZeFptlkIBNeivM3JkWa+DX3IQXmhlEemI0DmMce/E2OV+8
	 ncCnA1dGGkxP3LHGKUAEfLShkv+fQ2LLiTt5ww+iCZocVQvdHac7x9w/AT5RYsJsUKbSp
	 JGxHbKLEjipEUIo6TcZFKu1dMlC0zqCWEzaTage64MQWP+Y6DP+desjLpcG4gxYHyXmSQ
	 SxsuFB6j4I3hz9sCSkze/ffLUWzcZg6ctXVJTHgVpEATkOy0/NMR7qk/yPzn7Ipn3tfHv
	 w3KX+cbTG3063O6xRDq0RNMYrOTMMbRW8QhwkgM1XoPr+9EBJwWIU4yxV6G7YaGL/VA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OqO43WIr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DrtOl5XG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A4D606A326
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 20:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5A4D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OqO43WIr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DrtOl5XG
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HeQWh4075331
	for <linux-media@vger.kernel.org>; Thu, 5 Nov 2026 20:53:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=sX8j+rhapnFRAdikVp9Pz/gF+oALejP+4Db90hXaOAI=; b=Oq
	O43WIr6igflvAIkd9ASejt2pm7/Vf9caX5Pk315Bc5ggbNfK9F2LpMRsevBqIwb4
	hPhmzZAYplsNr3OTmx0bYsmVnISLeK+458SAt6/W1bu4Jz3ROc2RmVBt8UUjiXCQ
	nZZBOgkiByaNQmV690shz+jF+TDJzxDb27WHOrSkeVYU20FfOPbqFYGYbera5F/5
	NHF/t/LinRDZ/dBI1uXdtTJ8n0TqT9UcD4ZQLFKVqPGiJ7wC6qhcV8yyDPgKpGqK
	i1l8ujZZSz8UlmrG/yE3H4ZQwpendLKunNHPd3xPOjL0W9EbmYiIoRz/+OJD0mNt
	BqMwb9IrwRKk8bdcmrHw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrrkdtk64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 20:53:09 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1663fb7e005so13570c88.0
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 12:53:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793911988; cv=none;
        d=google.com; s=arc-20260327;
        b=HRq7g7ZDXgQ7TZQbhF6vPATXugCD6ONYgKTzzlFch5GYswYsMR2ZBx67oglOpG9tD8
         qCVzZknLiwM0EHraxGsn0j4AXcyZcBi5n7rWVIiALLMLGcQ1mTgX+CEcLNWK4N7FC7XT
         sQkCtZjPfvVKtkLsuEjuUetMrOxGAhxuxGzAofBDcMNllv5f7NbHWkyI3CCYWjl+ruzJ
         CkHfsjC1GIBv6Vxpfrc4WMzKP3G2Y322gv2LNerUPlt6moNXkyzO8wsXhwhcTed6K7k1
         +82FSUTW1Q0t6GlaEEK2jQ3o1Ixgx3WJGiRBIg/DoyPe1IPB2MDb/BT15v/8zicMrizW
         N3/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=sX8j+rhapnFRAdikVp9Pz/gF+oALejP+4Db90hXaOAI=;
        fh=h3L/W2I72jrtbiBC/ixWhWowJ5cnnZhWT7mZnK6Qp/Q=;
        b=UBR37v6SVbiGLX0eAxuTDKrMpplAcTu+jKh7l7GniWOCpUsHi7G1wYP1+ri9CAiwuy
         4bwgzfkydzP2jiRrptafOf1W5HGYjhWm1wSquHMu68MnF019C7MZDAoARyDdtVFIo0Ch
         dFY3cyl/ig73MN+wkdpKVOLD0NLpAPbYh58q8MXY4ZZtHi3GpzrWNKLUAcCBBwns8QYD
         gy9kds5axGNcORn/ba1T0RWkYc4Ge+Y9P91gbXz5xg06/VHx2ygYIYpAbUGri9DBB7VS
         w033hOPshQovLRZgSfzGWgQT1dClY5Cyx5ZLkbNzeCvlTO7g5o5kfmug72vsoybT58/p
         WoiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793911988; x=1794516788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sX8j+rhapnFRAdikVp9Pz/gF+oALejP+4Db90hXaOAI=;
        b=DrtOl5XGOehsOtEvqUC+fj9wHpwuD3InlEwY9TKuYw8BDNviAKmZPoXtRiVuocej5e
         6oVhKEbGgNHQERcwya/YPvM2pNiDbAuxMHxgDkmBgnbH+7lgPiCvJyYc+rqUhMFeoPJx
         IJHQEs1nFruweXwP98DK6sGIeArUOO8oMnBaAQkndKR79kJ80HCzBfp35OrkMy457BhI
         cMoXx40X0p83GP6CZXzRyExOepXkwecFleQNH5n9pWb056k1CI0QLgQSgJju+ZiATEOV
         ZV7K9c7sZiZZXyYIZNdVP/jLNVuAlXP1m53ni0+JmjSSWzUEVOGtpv4H6M92CtMNoqq8
         vmDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911988; x=1794516788;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sX8j+rhapnFRAdikVp9Pz/gF+oALejP+4Db90hXaOAI=;
        b=OdaARXQJ6hGCedA68fYL6qRCBXJVCu5Wlcl2ecy8rDj/uQAxhTteG2jWCoV+4AW8ER
         aOYmTggO2T35WiIhQNE0kOiWGfEK0tdpaFlsE5qh6wJsCpxEP1muUHmSUT06Cm8xFQAz
         xPocDxhbJfmkeRROGnZ2dhn4+mRs4njzyq6jo0w/iM2bZvd+z87rdfL/IuNKoihGh4+n
         ssrE6oEqTPaGkpTZqnzAO0cC63ttGqYoXXmHKQZVOZ/3t7v/L/yZ47QTD5FCNW966uDA
         vbRaU1TCjyvI6cvb9f+WuGtn347RjaQttbqHW9D4Y/yULnhR9yFPYyItsIc3UXwRr0In
         CBtw==
X-Forwarded-Encrypted: i=1; AKwUvBzFG8IZP+4RIjA3Ia/lsDtNZqZve3Byt6B60iW/X8wBukPQ4lBemCJlZhBUg7LmO939J4ZBfuvQywQAtQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/SG61sBZRVO/EmDEndTEQbW/52IyGhuzS6YEByspiTnhoxqZmY
	ysX8D/+eGz+sjXvS4Ibtv8bTKD3eHfJ4MX+e2Mr5xcl4XwPgfonoepxfpJ8+6tW495qGRMg3MMo
	beNVW1J8rFLJx/uysM8fe1Vr86vkDa3B3vLG9BfaJ/N9MUgrMiz31D1KfhkdGMqA55+jsqrVpc1
	O4YkH8QRgIaRYPZH6Jx4o0gXDZAqtnXkVuE9ECSkdt
X-Gm-Gg: AYBFou0P1srfgZd9uGQ8LEY2bTuO+e3/SQ5QHg7RUY10jEeR2RRWEcxnFsfVug3fcej
	w4Iny5VIzpU6QZIz/dOhFof4TiziNPTzT9iLNOi4RBVtsrdQubzVo/OrJBf059i2ECT32j/Cc+Y
	YhAGpUmo6EDepzJbsgKKJZ+OW8f+q1aR2nATgNPIzozmAzJIUa+uh21T/1bpMs/s0pG9BBpQbgg
	XuXywMvlrpHkQ1N3vjx3w==
X-Received: by 2002:a05:7023:a86:b0:156:6676:d0e2 with SMTP id a92af1059eb24-1b25d2fe849mr303332c88.10.1793911988322;
        Thu, 05 Nov 2026 12:53:08 -0800 (PST)
X-Received: by 2002:a05:7023:a86:b0:156:6676:d0e2 with SMTP id
 a92af1059eb24-1b25d2fe849mr303269c88.10.1793911987586; Thu, 05 Nov 2026
 12:53:07 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-ubwc-format-docs-v1-0-389044012b4e@oss.qualcomm.com>
 <20261104-ubwc-format-docs-v1-7-389044012b4e@oss.qualcomm.com>
 <86b801ce-a56c-4ff8-8915-9be369fc0ce8@collabora.com> <CACSVV02t9=tm2qyG531f8Ne90ADAb1_ZDDGEg7PwDmoEvGxPrQ@mail.gmail.com>
 <7b4d3a85-6aea-4b96-a4d0-c2f16e488ad9@collabora.com> <7e8a6645f181c9e8d663eb97bb1f32e3e4fd8c67.camel@collabora.com>
In-Reply-To: <7e8a6645f181c9e8d663eb97bb1f32e3e4fd8c67.camel@collabora.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 12:52:56 -0800
X-Gm-Features: AclHuK_2VHyuNEs4DZc22sx9QJcK0ltaGhWBXQlToG9hpn9RflPMYR8eoL4qhGs
Message-ID: <CACSVV03Nz=das+fneMqx9UE1Vzps55=_An-DtmufRTxdhv2idw@mail.gmail.com>
Subject: Re: [PATCH 7/7] media: qcom: iris: describe QC10C as TP10
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Robert Mader <robert.mader@collabora.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>, linux-media@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Xd4cX455 c=1 sm=1 tr=0 ts=6aececb5 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=e5mUnYsNAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=vmm0ZkxeQxYXhTVWvzMA:9 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: EWywGGpjMcOHLclxP0EOEnnpynxLdOaZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MyBTYWx0ZWRfXzm5c6YWk4qXN
 Zvx9w64SEt+M9Y8iw+3v4igxjkvgUwNfaXkWP8JyFtba9K4RX94A5N3nT/GFzzp2BK144tLsANq
 KuN4dl9SgPf7pmf/jkUOywytxJQo21E=
X-Proofpoint-GUID: EWywGGpjMcOHLclxP0EOEnnpynxLdOaZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MyBTYWx0ZWRfX2VuvcBTQmNMv
 UWky8VcdO6g6JwjhmAHbxSmdOrGLHMeuQ8Q9QdNMbLOPilyE4PLOlEBJsTopU/UBFf+OY91D6O3
 ldAZFMG3IFx0CdrRHOr+41MdiWb/uZzLofpD3mt851IdInSGa+EkXYYUQ1o3XMr3jmzfR391HSc
 kaUWP8LVud3lhYrKeOjEED3pBV8CtRdkSvEeKW3clrumT55lakEqcFDYLAem/TUXlWRXnoWJWRs
 HMnvNXC/ANdZWoTIUxOc90FciAxdxyUP4XGCePaSgQsB2WOH4IQF6Q1doJS5Nx4/N/EsRfiNg9T
 dqrmHAqYsrvojO4myWFiOpsVT2CszLo7Fo8tyvgawUdgY322FgRlWYYnf1NPOeXHb347Hw+wUhM
 TY7d4C+xngp8bGS1WCwmNkGsQYpD2UYG6BvH+ieY2L8OihafumdVzSrL/61Rv6aYtCWWNwHds8o
 43fWhWT/70LlCxCpkDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050083

On Thu, Nov 5, 2026 at 12:35=E2=80=AFPM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Le jeudi 05 novembre 2026 =C3=A0 13:35 +0100, Robert Mader a =C3=A9crit :
> > On 04.11.26 23:11, Rob Clark wrote:
> > > On Wed, Nov 4, 2026 at 11:00=E2=80=AFAM Robert Mader <robert.mader@co=
llabora.com> wrote:
> > > > Nice, very happy to see the series!
> > > >
> > > > On 04.11.26 17:36, Dmitry Baryshkov wrote:
> > > > > The comment describing the QC10C buffer layout calls it a compres=
sed
> > > > > P010. It is not:
> > > > If I'm not mistaken the display engine / the DRM side (including Me=
sa)
> > > > describes it as P010+QCOM_COMPRESSED as well, and so does my pendin=
g
> > > > Gstreamer MR [1] . So if we can't pretend that QC10C =3D=3D
> > > > P010+QCOM_COMPRESSED, then we probably need a DRM_FORMAT_TP10, wire=
 that
> > > > up everywhere etc. OTOH if we want to keep the DRM side as is, then=
 the
> > > > comment should reflect that, IMO.
> > > IMHO we need DRM_FORMAT_TP10.. on the GPU side, we have TP10 and P010
> > > as distinct formats, both with and without UBWC.  I'm not sure if the
> > > same is true on video side but P010+UBWC was never exposed, or if it
> > > truely only supports linear P010 and UBWC TP10.
> >
> > Oh, do I understand you correctly that the P010+UBWC implementation is
> > not compatible with QC10C, meaning on the GPU side (Mesa and display) w=
e
> > don't yet have any support for QC10C exposed to userspace? If that's so
> > then we don't have a choice but to introduce DRM_FORMAT_TP10 I guess?
> >
> > On the plus side - this would allow us to make the format single plane,
> > matching what we get on the V4L2 side.
>
> Since its single plane, we should aim for a variation of
> DRM_FORMAT_YUV420_10BIT. Similar to YUV420_10BIT, there is no obvious lin=
ear
> single plane packing for that, it would only be there to support the
> compression. Or maybe this one is abstract enough to be used anyway?

Oh, sorry, maybe I was a bit misleading/unclear.   TP10 is still a
semi-planar format with a Y and UV plane.  But each of those planes
combines UBWC metadata and pixel data.

Within each plane, the pixel part of the data combines 3 samples in
32b (compared to P010 which is a single sample per 16b.  So not quite
the same thing as DRM_FORMAT_YUV420_10BIT.

BR,
-R

> Nicolas
>
> >
> > >
> > > BR,
> > > -R
> > >
> > > > Best regards,
> > > >
> > > > Robert
> > > >
> > > > 1: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_reque=
sts/8195
> > > >
> > > > > P010 stores each sample in 16 bits, QC10C packs three
> > > > > 10-bit samples in each 32-bit word, which is what the stride comp=
uted
> > > > > below (width * 4 / 3) assumes. Name the format correctly.
> > > > >
> > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.co=
m>
> > > > > ---
> > > > >    drivers/media/platform/qcom/iris/iris_buffer.c | 2 +-
> > > > >    1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/dri=
vers/media/platform/qcom/iris/iris_buffer.c
> > > > > index eb8de60c1177..ec2bf2a2d953 100644
> > > > > --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> > > > > +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> > > > > @@ -266,7 +266,7 @@ static u32 iris_yuv_buffer_size_qc08c(struct =
iris_inst *inst)
> > > > >
> > > > >    /*
> > > > >     * QC10C:
> > > > > - * UBWC-compressed format for P010.
> > > > > + * UBWC-compressed TP10, YUV 4:2:0 with three 10 bit samples pac=
ked in 32 bits.
> > > > >     * Contains 4 planes in the following order -
> > > > >     * (A) Y_Meta_Plane
> > > > >     * (B) Y_UBWC_Plane
> > > > >
