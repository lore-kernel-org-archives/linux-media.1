Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793883690;
	b=OOhWqIwswIGWmWeDztm3bg1v6q5nhExRbfisxebmQIAm/f+nNt3ZVO11T51RXY4gX0BM
	 BB+UcMcZJwnP/lZT7/FpD05OP3aO3L5d4BBw8HG6oKJegc4yCgyPaJaIGoKmanG6Ac+dd
	 +H8ODzLbvCEPog0VAlUMWn/R0eatkkdWd6JQ+7Kba3fFYavG8Z1klsxP53FeQugS1Hlah
	 FVOoRXoRNQwhOc7mmUTtPylnT4j9X/AyNjnyYByF7GwBhwo/wAMPhw2XBofMHRBxYgN6T
	 ++rNGvm05xENz2FUHGIgcq7zgqMlATf6Xqc65iSA0WyEOB7qfeVtRwbCOzzvf2CGRHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883690;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XeRy0oEaa43dns1qWHShRBlWSY0H2JNTqzR6NqinL24=;
	b=e8CCRziCYk1W3MroW7cKYV/eY8duV3gjcUgKGQjsqxXA62SnvBMZvAROFVQcpy8qGrdn
	 rI1oKHKeaD9+PpW6WElP1+bCQqT4yhTJa76Quuo83VNslZpYkg605oOInnnv/jFG40qzT
	 Sg8tr3JTJleNTItrNuT6F0OZqF/kpF14fc8GbybPmnwgI8Ltd+RaHBqwibtp6Gb+CA8o8
	 AhbzGSVL51F+YCuYFxB0ZX47rwaGdCtu6sjPRrMZreff7uExVS30yMaCsz4keyORgDyKb
	 D0XKW3+wOKa6OgeM8bV9yRSKYkTYEtCOJSIQB+FNIxHlYYIRmBF+QmzNjd+dPS3Fo5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lUEEKPSi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SZdpASoD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E2D606A326
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 13:01:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36E2D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lUEEKPSi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SZdpASoD
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tLnq1053165
	for <linux-media@vger.kernel.org>; Thu, 5 Nov 2026 13:01:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=XeRy0oEaa43dns1qWHShRBlWSY0H2JNTqzR6NqinL24=; b=lU
	EEKPSiWqKZWaHU/bW6jGHmPPlsvYPXsSAcneaDK76rvOeY+PHGa8Z5KfZUmwpBtL
	YYUYCZkFrsNTLoOGVPUmKPaWVxtpx9Wcu0RjKppbD2+d6h0hYObfulFBV7ZCoy2k
	OOgmDjWawtHGm9q6nwvWP61zt2x4eymRTYHT32+LtcpsoYSnaqES8nxZ8ql3wpZf
	lxGOHfCte1z60PzfhnWkDnsiP+xjWRnyO9fNibEcJRFRIjs4zokoPcREZ8QLPgnP
	LHhbgBUFYWU21f9CTO94zD736VPYycRCRxqyZIcNWp8CfCugngx1gj/AhZXZL/Sh
	16nThmAjhxP9NTB1XtYg==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrq9f8t0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 13:01:28 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-46617932071so1473293fac.0
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 05:01:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793883688; cv=none;
        d=google.com; s=arc-20260327;
        b=HO1udBPRdSzrS+orCEmmaW9+VRVFpdD8cVK8USa60viQhW/9jm1GhxzwMUKR5RKXku
         jz0iFZ5d704rLk/GOJB1MHplR5mPkreoKCq1w5UQreSNY/jqiTkSics56ZUnoL7qNiU8
         mfBwYgXZgFKu+g7sX+kEWTI8VdqlG28kwKqERfYNzHWZ+slENX4vCYF8TINQkHLgSvuC
         7wAcSqX7dfHQ872Gy/z26bX7BLZx5drT6zCkGt35dhhBdcR5U3l2OEngWK5nhQ+iGvnS
         Ff/zOnWyM4BhOHyKLpUpB+BKhQwJ3sYCwkU16UH0T21E+5XKLxWsr+hySCgEog3zSU6G
         hoHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=XeRy0oEaa43dns1qWHShRBlWSY0H2JNTqzR6NqinL24=;
        fh=VJ4NAKyBQW1ddpsJkrfcYV+aTIEqogpuvs6lT0J8Ww4=;
        b=LjbNbpVjMnMxGZ0nSesPEkDeD9Ibb5hgEPJUxBrcPrNIantUAhTYiPZHpVS8yebHI3
         gvA30p0g+1WqXA2x2Ogl47GtthFDIxz87YnPEK+/REXZpi7I/aPvY95ib0IhCRUrKNJc
         MvyZqa6XvLTPstdPCYm3+z8pp5xShp3cQEz/BEFBgKb1DoBlJnC7gUul2kjK6emymWut
         mHg3AYUShCZmjwxDLKwTmqmSr3eOduL5s2X5fk1QUTfUWh3Ivr96Hl5e8rXnFF+JjzM0
         PECwCzENNFk+g8vwfAS5Jjz3VsKrDbSMOzEoGTAVR2DySEILwSA2pTGT8vGPtMqaW6iI
         ssxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793883688; x=1794488488; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XeRy0oEaa43dns1qWHShRBlWSY0H2JNTqzR6NqinL24=;
        b=SZdpASoDYPjFl8mzwEREAPiaKFPp4r3like5o6o0kXfqCUAQmYcoO8y5QTNCwZVQII
         1syTqQap7LLcnBdqZ3V86q0oPaII0MJ46xTFsMRmndtTEfEJEcubpp4H0aWCCWj95y9N
         IPSERczfC1u/JALr4O5NvrMbywY3sckQTEgHBJL+RYoklrZnLEdYT8EAw9tV2gRDc2/f
         zkhutOGx60lD1DLhkRG4wx9rlxe+j3Yh/tSHjDam0aIRUJoI7DZwoAN0GO/FvUSsxr8q
         MXRYT29a2XiWAtWs6FsvmDptdp5fqyzJeiWLg9hvqOBY/Nvqki4Qa/dqFYDP37mWR73E
         LvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793883688; x=1794488488;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XeRy0oEaa43dns1qWHShRBlWSY0H2JNTqzR6NqinL24=;
        b=fGuyiF0zr9d/jIJ6DFAUq8tv/px0xppKTlDuDlKaMFL4D7tebmZCIeBTzqiZcX5dJB
         cqM7l0T04uj31ianfgjeQIXqkPof158gnxizFTOZF+Oe+aSB/doNs/etvtG9Ze1Ud7A6
         vwDuU+wLu8WDKvnwSZUFigPZaYFyJlR9pRrqMLrsBZB+8D8wzJC2bwHnMaoNkZJxpu7/
         MeAH4GrtXSIzg0uXbxxIcUviCr61hnAxCNY1IqvECUZgVxmXzCpiL1rZ0xL5EVkN4qSf
         aolLHSXznRpppJeuToQezNkXVMiyfdl4tVCwMSUsutlFm8Maa19/V1IEQm3lDyLr5VPM
         xukw==
X-Forwarded-Encrypted: i=1; AKwUvBytDKFYOLDQT3XwurzPjpOGsgcPUxx1e3J0XkBqQs6VTkg8UYDMMtx9Sf/JyrNHn1HCED4VS3PaBS0fuA==@vger.kernel.org
X-Gm-Message-State: APuU4Z92UvQkckPoW2BDIYGIQ3OtvzpoTzNV7cGiaPYhsAQzsmtwBdZY
	rUsw5lIZN4mAGm75aJrp7iyiqvmbnItoPC6SOmlHNPHE1fTsc6S29GgFeMhmixsDeYK2Bicg4nL
	ZcG6H9dG/KrNqQ4TwhmMI7gnhLNNhAZc9X6XteDkBDSr+DS9jqNBkWNi2Y6l/lVy1zoGpzJcBLY
	FPx52wHCybsAAhTpKbM5/CKEzGhtgmvL/SqXtB2gME
X-Gm-Gg: AYBFou19WjgYTbcyhYHdfW7+OYCP37YYPV9NzkmMDLyhwnhVHqfKVQO8f1jKcOr8KU7
	qNnZLup+EiBC1YQLUDFj4r3fvWHoXdHTMRr9XTWjhu1eBF0Jky4BoswmgM2eVCa14NA13B6Ifxt
	/9Z9FnHwshAf8tta8sKVRxmjMBS7U0JROLVYacgJh7wWeCRhppYNz/GBXq5sTcg6abk+ZxIC3dj
	DiMKdEJ/cC3qpvt+6WfnQ==
X-Received: by 2002:a05:687c:8c7:10b0:4ad:76eb:60dc with SMTP id 586e51a60fabf-4ad76ebcb9fmr862215fac.27.1793883688106;
        Thu, 05 Nov 2026 05:01:28 -0800 (PST)
X-Received: by 2002:a05:687c:8c7:10b0:4ad:76eb:60dc with SMTP id
 586e51a60fabf-4ad76ebcb9fmr862182fac.27.1793883687555; Thu, 05 Nov 2026
 05:01:27 -0800 (PST)
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
 <7b4d3a85-6aea-4b96-a4d0-c2f16e488ad9@collabora.com>
In-Reply-To: <7b4d3a85-6aea-4b96-a4d0-c2f16e488ad9@collabora.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 05:01:16 -0800
X-Gm-Features: AclHuK_FTfX1bhtgOB5smy8jkMhXcHjbMGJa7VVWz-rbBqyySfj6RR5zIBt9uVM
Message-ID: <CACSVV01ZhTxeJV6qUGXvM0cu9tkriu_cnDJ1zn83WjXQb6ABbA@mail.gmail.com>
Subject: Re: [PATCH 7/7] media: qcom: iris: describe QC10C as TP10
To: Robert Mader <robert.mader@collabora.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
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
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX43L6NidAXiuF
 lsNF9+B0Wq/2fx8N7ccDFonFOiyzNNxnS6vYrh6r1t94TMWwBfAwKgO/bNzriUI4dL1uowpPWPK
 /ckXvNDTchv7ozOOJVjFIq/vbWtu/FqRy/mXebS4JATbEFYQfiDAPMkUyWFB7AyJZkCcXamzRAm
 lIL+M4UgUIJyoWLyh02fXjhtPSHj3ysGi4RIsacACfNjfU/XDKbhuyn4Sn9EswYEN+1awr/MyLl
 NAJ2VawkwHz0Rp9/NcFcisyoAZfqhO9fsGd+PO4aX92yCAtVUJ/izKcJmtpCJjT0/+0MDQbsgIX
 UuPLqdUd4N/IH0oKt7lufC/ogdD0/D7vmFtobcWFUA1J7ZwBIv/8C6ZVQS2hmvP+ndUtWMaclQ5
 nc7d6PZGPyQxsAdDKSKiqLRPySGXO2l0ktzPKYyi6mN1BTqpAaWGJJ82D7f+gm+ZwO3Zju1EXjM
 u9+c7/76mXao79wGlLQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX8rAoHgtyqhSR
 FysG+sB4bkGir/Cx/PkddIyn5VQaOJZeLtXKZz7oeRTuDlsKAA/uG/yN+bbiPkmRy11ZABLjAOj
 5iRLoH3HUFkGtwxc2npSqW2nc9aDZMo=
X-Authority-Analysis: v=2.4 cv=Vdhir1p9 c=1 sm=1 tr=0 ts=6aec7e29 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=e5mUnYsNAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=xAgDbal6OUhFU9-prukA:9 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: oRsrou9N6O0eggTjoapRdiYP7HSEHZM2
X-Proofpoint-GUID: oRsrou9N6O0eggTjoapRdiYP7HSEHZM2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 clxscore=1011 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050051

On Thu, Nov 5, 2026 at 4:35=E2=80=AFAM Robert Mader <robert.mader@collabora=
.com> wrote:
>
> On 04.11.26 23:11, Rob Clark wrote:
> > On Wed, Nov 4, 2026 at 11:00=E2=80=AFAM Robert Mader <robert.mader@coll=
abora.com> wrote:
> >> Nice, very happy to see the series!
> >>
> >> On 04.11.26 17:36, Dmitry Baryshkov wrote:
> >>> The comment describing the QC10C buffer layout calls it a compressed
> >>> P010. It is not:
> >> If I'm not mistaken the display engine / the DRM side (including Mesa)
> >> describes it as P010+QCOM_COMPRESSED as well, and so does my pending
> >> Gstreamer MR [1] . So if we can't pretend that QC10C =3D=3D
> >> P010+QCOM_COMPRESSED, then we probably need a DRM_FORMAT_TP10, wire th=
at
> >> up everywhere etc. OTOH if we want to keep the DRM side as is, then th=
e
> >> comment should reflect that, IMO.
> > IMHO we need DRM_FORMAT_TP10.. on the GPU side, we have TP10 and P010
> > as distinct formats, both with and without UBWC.  I'm not sure if the
> > same is true on video side but P010+UBWC was never exposed, or if it
> > truely only supports linear P010 and UBWC TP10.
>
> Oh, do I understand you correctly that the P010+UBWC implementation is
> not compatible with QC10C, meaning on the GPU side (Mesa and display) we
> don't yet have any support for QC10C exposed to userspace? If that's so
> then we don't have a choice but to introduce DRM_FORMAT_TP10 I guess?

Yes, TP10+UBWC is different from P010+UBWC, just like linear TP10 is
different from P010.

In all the cases including planar YUV, there is a single plane per
"logical" plane, ie NV12 with or without UBWC is 2 planes, etc.  When
UBWC is involved, the UBWC meta/flag data and pixel/color data is part
of a single plane.

In slightly more detail, in some cases we program the hw w/ a separate
UBWC address.  But in particular for planar YUV descriptors we just
have one address per plane (up to 3) which gets programmed with the
UBWC flag/meta address and the pixel/color data must be at the correct
offset from that.. at an API level it is easiest to ignore that and
just treat meta/flag + pixel/color as a single plane everywhere.

BR,
-R

> On the plus side - this would allow us to make the format single plane,
> matching what we get on the V4L2 side.
>
> >
> > BR,
> > -R
> >
> >> Best regards,
> >>
> >> Robert
> >>
> >> 1: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests=
/8195
> >>
> >>> P010 stores each sample in 16 bits, QC10C packs three
> >>> 10-bit samples in each 32-bit word, which is what the stride computed
> >>> below (width * 4 / 3) assumes. Name the format correctly.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>> ---
> >>>    drivers/media/platform/qcom/iris/iris_buffer.c | 2 +-
> >>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers=
/media/platform/qcom/iris/iris_buffer.c
> >>> index eb8de60c1177..ec2bf2a2d953 100644
> >>> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> >>> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> >>> @@ -266,7 +266,7 @@ static u32 iris_yuv_buffer_size_qc08c(struct iris=
_inst *inst)
> >>>
> >>>    /*
> >>>     * QC10C:
> >>> - * UBWC-compressed format for P010.
> >>> + * UBWC-compressed TP10, YUV 4:2:0 with three 10 bit samples packed =
in 32 bits.
> >>>     * Contains 4 planes in the following order -
> >>>     * (A) Y_Meta_Plane
> >>>     * (B) Y_UBWC_Plane
> >>>
> --
> Robert Mader
> Consultant Software Developer
>
> Collabora Ltd.
> Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
> Registered in England & Wales, no. 5513718
>
