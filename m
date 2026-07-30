Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183B03E0C53
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 12:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785414873; cv=pass; b=AR2bpCv0V+xcmvaxDZWiID9BFtFUi5nKvrscGElcHlYhUy1SyAtav8l6TnvuDNXcqqicXJCIMmVDeOgPafqqy/PsqQGJiXCIFCcFWWF4OYVu7Z+uCQdhUTsqFcMU9CU4QfD4xV3AWh5Mm1e7gQO2KaxQ7L6fdcTCJcJSrXTnN+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785414873; c=relaxed/simple;
	bh=NxWEunGjGB86A7F89AhMOE8cJDXgKJh1EGHFuiKVhl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=toYsUxdXEQxRQo9+NGf8pbAkazmBRh8FQ0qeVpDaYEQf+bwX9kjdgsEz1m0BvpwGcBJbnTKIUv4p8WXnJtxyUT7oYomgTTpM1sRcUVRKmqUfOcfNyec21FtOtGFwG/JSPzFBhyole+C1GnnDhzdZ1U159MyFYaRrikYShXRiiT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X2NXF71a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HSJNlEKj; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X2NXF71a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HSJNlEKj"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UCPbf91986201
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 12:34:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v0BeCVwbfS2EedV2zVMsiVjAyyRHPtS6bc9+ZZ4vpvA=; b=X2NXF71aPsY6oyRK
	kpXT1OTMuzTzpetDZa/SgPtRNGCr2anNPQiBNRyyHucvvNxO+rrCpfqg63C8e3AV
	jkj7Ah1nEElTgWEMDyOAfYuYPptOvFs0Ha1HuQR6HQP92ChR7LsYDCg0cOLkcrjt
	DoFWV2PWfx2oW5CWlKU40WKSssB+SXacd92oJ411MlhXz4mxoPHmXhipcpuPdAI1
	n3s00XzCIP10ZCT83954Sb4CbOyUAX570SatOTUvHaJNWQ7L9IyHL19FGGWW/PMP
	83w0l/7ypMeaHdJ1A7ckAjYrhwEoh94C038E33wvqcFRDP7qTya5YV37s3q93Iyi
	jDh7TQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr6ky814e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 12:34:31 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-904c1d588bbso9195066d6.0
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 05:34:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785414870; cv=none;
        d=google.com; s=arc-20260327;
        b=SB2OOlZCNL2NlulWeM5u6vDcqmitmx8lYrGtTqSGsopdfRI2mZHVCd+3l3J7BMW8q5
         YDcb2Qhs8GEBpsO7zSfg/h2Ah3ROy3Z4zcjKuz6PZhYsDvJxxN8l6NsWCqgqCvheXDFZ
         /iLW3j3AB50lo3kLL3PeA3ooWGYBQOYOZIOR4rsRiAljah4wZshsJ15EY6MB7s+HF3bg
         22j/LOeFGe5aaNEj5NYEkx6GXGqj92a1tqtBCwWV8CtbDdnw1KsgRNWpUT/g933QL628
         Ymn4aDqs74UKgGrvo67rT3rZkQXCBouwe3/qA0EIAfs9ROXTQF8ofR2tECMbhWIrPKZv
         Z/8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v0BeCVwbfS2EedV2zVMsiVjAyyRHPtS6bc9+ZZ4vpvA=;
        fh=EUqaHuRicZYkEhQlNPTfW38Gpjjz6+V+xBrPK+QU2kI=;
        b=DoiQrHxzEFEhHnibixagwUOXrTdjQ4zYDR3kf8MfxPqgHPSmxbKb+Es4xe/IFUO9kn
         CUVg5PynD72mAZAer4lUIw03vatqtbm9t17xLhMeqaMvo74fn7ZQu9gVQNymC66o/57/
         z1RJwC2PoehSaON1ico+kEuOGfKvA+MfgMzSzKrRJBAQzdptYBKbEDRVa30mLt402fbl
         t6aVdJJAKzXoUHZkbbQgbEe0gKeZZdDJRZT58hfCwj3F91mYJ11BRw0kh2TzTlGlP+y5
         rbABSOwbjUjMzuhe7ygwWY+OP7kyz47bS5uxtpbo8H78E++m64WkdtIclU3qmNfR1S70
         /lJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785414870; x=1786019670; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v0BeCVwbfS2EedV2zVMsiVjAyyRHPtS6bc9+ZZ4vpvA=;
        b=HSJNlEKjmlayVed3YFWXi2+ZYH+3hwYUoQf1HuMXvNv1dd8Ti02RCaOKfIbnMT07rB
         gNDcKfkrFWwUNPaZOYQBka72qkqS6tyLJcVi2hJpunRuCMQVNaXUkeraAZYeYammq21Z
         owUdjihl7A4fhfsECCzy4dm5GSYs8j3J4FWzvEYS2XXvXzGcrvlR7ZXpwDF/BMyaI4vK
         UQP2yUERYAYhxqzuEsO2DgnEHgyF4JdCL4wTk7QKvAy5+n6QvCydfvYWHRgH9GBFrAs0
         21OzR4qqFwBtmZ+Si/+karTGQKqD37sdAzqmNGKKyEM0Zpvq1FViGnvmiPxgiDNTkM+s
         qeWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785414870; x=1786019670;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v0BeCVwbfS2EedV2zVMsiVjAyyRHPtS6bc9+ZZ4vpvA=;
        b=c8DgDCUe+cbLzTDlWTeeqIrSNL8cj6GMK7T791V6BWa59pFAD74v52uKh+I5ie7fle
         BftjC255M8qh2yQBiSYwVvbnxtyPwgkvRh+j5nVkMzp0LdhM5gSRvEsaQji0+uulNdR0
         MaLbqZHXzUEwgdc36kFiU2dGG5MJgksOq5CNvloi8llrfxLa11CgfhsJlVyq2Fon+s3u
         m4lFM4KwoBBzuPHFqYfKcliNldY/Fkux+9fEFpQoONJqwDur5ujiuUqCHwRgCbSB6+9g
         uT6QYc9UGP0xJoXnP+aZONfOXiXPswHQXRfaJCoQtJvg+A7Zxx4XzzPftE0eJ8vw4ieC
         kDYA==
X-Forwarded-Encrypted: i=1; AHgh+RpAe/y+xVuyU4aAKM2NQIgHA14/D1H4MNxNwWU5mHwc5RAy6ZlDkL/dmA7OAjyOncYHTy6dver7biCzRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YybJe4oLODzp1uIKaLqz7KI2C1UUSqblVvYc2hFEb8QvxGGy9/v
	WLryU5XIkz2QPYIw/3bjA4/Y18AJjpFeWP4q6ifnriWcTaUcTbhQECMkfJzjv8kzZ9/yhc9WTRs
	6GJzRJgQPHmqDG+fEd8UCZYXHXIah+oYRWM2LAkhODzkHhoz21MwPpOlZ+BtMt13CIkQE1qOvO1
	h8e44QnpcqRplhu65R3DaZQ4UNx4R3SLemyqw08V/jMpEtpTBStco=
X-Gm-Gg: AR+sD13X0ePsewTlchtQStV7eJq/Z+78ensroHRwWg+lhsFOQxgfFc+B7AYoJGkLxQ8
	wr/fCYs/LPAF1Vfc9cYQXtSGCwfJ0KNUShXV1ESDP8U3RcvGuw3ojv8duPu3E0VqCP6IqGayquf
	ky/LFP69ABxO3dN776BECjKjD9EyAVbEESRABanLNRlFM5dfk78dsCTpd20GPqrjr6ivCMiFZhY
	JgZtkDLJCLygGpb4vPyY3QE/GGI369DLQzt4br4y2UdkjyOMKdPujb9lW11nU1g0j7E1PuaGFU=
X-Received: by 2002:a05:6214:2388:b0:8f1:ed00:7fd8 with SMTP id 6a1803df08f44-9083a3ed266mr2312206d6.3.1785414870222;
        Thu, 30 Jul 2026 05:34:30 -0700 (PDT)
X-Received: by 2002:a05:6214:2388:b0:8f1:ed00:7fd8 with SMTP id
 6a1803df08f44-9083a3ed266mr2311916d6.3.1785414869813; Thu, 30 Jul 2026
 05:34:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724-camss-isp-ope-v5-0-e70ad4fa39ce@oss.qualcomm.com>
 <20260724-camss-isp-ope-v5-1-e70ad4fa39ce@oss.qualcomm.com>
 <e50e3859-0343-4795-a564-757ac58f6cbe@oss.qualcomm.com> <CAFEp6-157JZogPG6vHLUjYiAJ-fwWcVX_xSMTUY=1R6+kat25w@mail.gmail.com>
 <31a77684-221e-452e-85a5-873b0cbbc118@kernel.org>
In-Reply-To: <31a77684-221e-452e-85a5-873b0cbbc118@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 14:34:18 +0200
X-Gm-Features: AUfX_mwG_XLqff8We1-VjUFCpEv_zMOLloZt58qLvXWmamPVEeHzeVGoLatBSdc
Message-ID: <CAFEp6-1jt_q2YZv17mxWTwKbxipNoh3F0RPqhLwhdH-ffcCcvg@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] media: qcom: camss: Add V4L2 meta format for CAMSS
 ISP parameters
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hardening@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA5MyBTYWx0ZWRfXxC+HA7HezzJi
 sZ81XcNfpyjv6SXHvqPOszwnb6wtRvxY/JCZfsRXVgIOhezR2xBDrKOfx6VWfyH67TlBKgH4n4n
 fkP8wVw/VBoef2MbICVzhtVSEr9B/U5DVBvubQsQ5wpJUTmOsvfB8GktAbAo7tVxlVjH7/Y3EEv
 kdahMsnyw8lB9UzEhaORYkV38OKmYSucJ/Hn4U9JuIYv3RH4IF2lQtSDppptJPWGVmjuDdPaZZm
 bESBEZ+970fErKv8EfK/fXShR+159NOgwJe24KV0Pr1lmUVfviIrlbu7RWF5S4tnXO/D9jgfL/a
 +NyV2hwCRuwaD/06o87kjHJox2gd+OF4O57y8ST5AiclNiLmphf8ELCTqM9q9MMv75qBq4ks+r7
 +8hVrPJcxXYk1I3h8i+LUxLe5a8wCDmEVfYft28/NUGvpR/QKHpNJZcOd270npZmdQksmgcbAGv
 NZwfBeFDYqOGaMpkiHg==
X-Proofpoint-GUID: HJY-gANad3rU5VL6MwrkMjy9-V7pMeqa
X-Authority-Analysis: v=2.4 cv=ctOrVV4i c=1 sm=1 tr=0 ts=6a6b44d7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=wb1n7jFByJHGHbbB-X0A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: HJY-gANad3rU5VL6MwrkMjy9-V7pMeqa
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA5MyBTYWx0ZWRfX3taDOL3DAxdU
 YJLiFYMu+VCC1zF3gQ2vEe9e2GQagyoTeG3EI4XssRBYqjbcjW+ku2lVlp4SdIFYZCNKdDF22OB
 TW4uhG/vu0GhR337OEfuN0Jr1b3lEZ0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300093

On Thu, Jul 30, 2026 at 1:57=E2=80=AFPM Bryan O'Donoghue <bod@kernel.org> w=
rote:
>
> On 30/07/2026 12:44, Loic Poulain wrote:
> > On Wed, Jul 29, 2026 at 8:28=E2=80=AFPM Gjorgji Rosikopulos (Consultant=
)
> > <gjorgji.rosikopulos@oss.qualcomm.com> wrote:
> >>
> >> Hi Loic,
> >>
> >> On 7/24/2026 3:42 PM, Loic Poulain wrote:
> >>> Add a V4L2 meta format code (V4L2_META_FMT_QCOM_ISP_PARAMS) for the
> >>> Qualcomm CAMSS ISP parameter buffer. This format is used by the param=
s
> >>> video node exposed by CAMSS offline ISP drivers (e.g. OPE) to carry
> >>> ISP tuning data such as white balance, color correction and chroma
> >>> enhancement settings.
> >>>
> >>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >>> ---
> >>>   drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
> >>>   include/uapi/linux/videodev2.h       | 3 +++
> >>>   2 files changed, 4 insertions(+)
> >>>
> >>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l=
2-core/v4l2-ioctl.c
> >>> index 98512ea4cc5b9d725e1851af2ed38df85bb4fa8c..7b6e9a9a514f037190d55=
d59409dd6cc97522943 100644
> >>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> >>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> >>> @@ -1471,6 +1471,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdes=
c *fmt)
> >>>        case V4L2_META_FMT_C3ISP_STATS:         descr =3D "Amlogic C3 =
ISP Statistics"; break;
> >>>        case V4L2_META_FMT_MALI_C55_PARAMS:     descr =3D "ARM Mali-C5=
5 ISP Parameters"; break;
> >>>        case V4L2_META_FMT_MALI_C55_STATS:      descr =3D "ARM Mali-C5=
5 ISP 3A Statistics"; break;
> >>> +     case V4L2_META_FMT_QCOM_ISP_PARAMS:     descr =3D "Qualcomm CAM=
SS ISP Parameters"; break;
> >>>        case V4L2_PIX_FMT_NV12_8L128:   descr =3D "NV12 (8x128 Linear)=
"; break;
> >>>        case V4L2_PIX_FMT_NV12M_8L128:  descr =3D "NV12M (8x128 Linear=
)"; break;
> >>>        case V4L2_PIX_FMT_NV12_10BE_8L128:      descr =3D "10-bit NV12=
 (8x128 Linear, BE)"; break;
> >>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/vide=
odev2.h
> >>> index add08188f06890182a5c399a223c1ab0a546cae1..011026194a20cde22a374=
e6fb2570cbc6bced230 100644
> >>> --- a/include/uapi/linux/videodev2.h
> >>> +++ b/include/uapi/linux/videodev2.h
> >>> @@ -888,6 +888,9 @@ struct v4l2_pix_format {
> >>>   #define V4L2_META_FMT_MALI_C55_PARAMS        v4l2_fourcc('C', '5', =
'5', 'P') /* ARM Mali-C55 Parameters */
> >>>   #define V4L2_META_FMT_MALI_C55_STATS v4l2_fourcc('C', '5', '5', 'S'=
) /* ARM Mali-C55 3A Statistics */
> >>>
> >>> +/* Vendor specific - used for Qualcomm CAMSS offline ISP */
> >>
> >> It seems that this is generic format for ISP parameters, can we update=
 the comment and remove offline. The proposal:
> >> /* Vendor specific - used for Qualcomm CAMSS ISP */
> >
> > Sure.
> > Loic
>
> Since these are not the full list and as I understand them not the full
> structures for OPE - qcom restricting the full formats ? - I'd request
> to move these to an OPE specific header.

Yes, I think the params struct can be OPE-specific and defined in an
OPE-specific header. However, could we keep the enum in a generic
header so that we only have a single enum definition? We could then
extend it later with OPE-specific or non-OPE-specific parameters as
needed.

Regards,
Loic
