Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083C15540B7
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 15:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790177364; cv=none; b=B9q8q+4lfrDUc6cn83WujHhok5JkCU28j18JCV8Tv4Ac8Cr4c8e1kWHg5xpRc1eRfGEzyJ5Rm5jPv5SHxvbiohNX+u0owwEq1pP1+2QeomZzL+ckfW67NMOp2x3wqTLYTGxJz+enumWqJ8CV171RY1TixEzSX8CBDbrqICYLPLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790177364; c=relaxed/simple;
	bh=xwIrSpMpqnE4sXBZLI64tefo04qoVdNuzlR8QWT9f8A=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=sN57/UPau/UDr/dv/vFomyXqbY8+zUfwQhwkZCBK0BVTOwxnEgPqnGywGJLp9j7fVfo1I2rkTon40YlyJ6wOtN5o5Fp1ITX4+S4xKNjLNlNitAG9wIH4bYqRxm7QznFRjwUEnMgDZaLx1HmNgxpzqOOdo4pIe/M5svrXMKQfjHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cadgs1u/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XZhnviFu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cadgs1u/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XZhnviFu"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NDPGYB2698196
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 15:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2/Owadw7ccYTdPEnLhZWL6twWIM88cikDBIvI1aCn4E=; b=cadgs1u/q8JKwO28
	pxh6uTdG0BAQapZ53gAk1Fw587eo2j/BCF89Zxss+6v8uFIDjTHItEKjGX0FAIah
	5+KCKWzauohzqKUOOUVnfYZbHxjjhmR/ZEFPNXszxXR+YJgkomtqXCSRGUvnVmgz
	RmLZffriclomyKu9r4dtlBh+sm2gZOwkAwqviatUZ2RJhG27q/n3OLWsJeoTUYwK
	fky3fj1/uKEtAUhU6RuXnw77ryddzV+oZvQ85G1JM/FapAF5+lbO+b2ceObZCrJ2
	/2ztHqgw+rWQcMGkvke9RjCmQ8cjTxbG4GLnXeqL1Dm+HtLx6o09PJRcSfLVwi8F
	9dusIw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfmwgjdm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 15:29:13 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9806535f8ffso1939565241.1
        for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 08:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790177353; x=1790782153; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2/Owadw7ccYTdPEnLhZWL6twWIM88cikDBIvI1aCn4E=;
        b=XZhnviFuL1BHkKwc1a97Q0sw3uwtOyDZr6lLtx7oCaSWj+2QG8y8u7iYSVHZhVw/MF
         vt9kxvQx8kVJwB2m8ijeGH+VPO8jo5fHGGxqOCwVJkZRt2Lyr3KPyXC82ILH1bEBSKXa
         L6LNskVDZrHjPbiSAMHx3zm2Oh/Etyfg+UbmDX6082bC6VE+/UmOQqWBUp5y5+3Zbgi+
         J1nZA/37ktI2kcQNZdqpeegqIwv8BTDhnbnQ2aisYQ0BegP5gUXkldNoK0sRJWuG1V13
         pTiVLjHR6GoA4wfDtGBmF63oJP7IU1lSXVbHSneN+OjsQu2KR7gbkkIZfa1ok+WzCuDo
         AH+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790177353; x=1790782153;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2/Owadw7ccYTdPEnLhZWL6twWIM88cikDBIvI1aCn4E=;
        b=rdhzuD7WyMlWviaCWgIrMQCDD3v86R4Vs74FoOG9SdYqV3HyWs9MbUIqC0GvfZGeCd
         RgYZQ5J7d1jmad1p415/I1L1oSC6Rbzh7gYSccxTdHYl1+SQu+n92ZGUPp0fKZnLtZmQ
         Txr6ptCOLTbMvyPsFJGrehcDj4Hy3GnTp6YPk49LMy19uKJ1ZIewBIkJkCnRT/zete31
         NPLlsOEZMIF0EtmdvnoeCVej85TS/wc2wcUwAzE+nUAKnJ5QWFVEqkSLUrbOH2djzwAW
         3RXezliEXCRu9WDE0CVH45AOX62VceLEm6cajigLUFJS2ZuXOnVe10lihRSjVa4Ey2E0
         C8CA==
X-Forwarded-Encrypted: i=1; AKwUvBxQIzGuzBkmUqs91JVsRIBOG3+D1g1hNZnqdMn1MeZn745NBUk324/gZecTZC7auPyZXEtFeA9BxwA4Wg==@vger.kernel.org
X-Gm-Message-State: AFuF++mQb5dNFJVeVmUmDJgq0X7LjVy71Sesd3ZBW0fVj2Pdp/KR+DZ5
	Cc7lblE74pa24taVYFe2ax/3c/qlnl24jHORH2pG1oodutTiyepRrJWoKC1gfleroEdrZBenWEA
	seaOOIxGXGdG+cnhOPkKQlz0yZyRSjbqY/BSR7+UzJZOK7bt8a8kkuj73lrhodFN8kQ==
X-Gm-Gg: AYBFou1tE0lVInylXlxlCjUB15bAWjQuKAnPOpDAfOw46mEd6bBtpw7CVey8cI8oOML
	ZE2NA26CBiod3nh/Jbo3oPujZXSyWRINNjRBtifhMprJ+Rr4CyyjcQjb+k//pXiAt64LUHNPEgK
	mWDyX3qPm2rpEZ6Z9Lsnk42Qp+pNWq6hxAzzszm0Srl2gmHIfmvI5zOlrEFiBJ60CrJrlSZN51/
	fT8anYQ9LUmiNLD720Wl7x1xC1mvCgXrXYm7Z6ZClxnP+LCdzfqEHwsXJI3VuoNeGKvt/XGi5e+
	xLU8caS27TPrw/yJrUhqzjJKrOGxbEUWugeY/x4DKptvYoJCynnn2V8rf1Er1LMfNce+29a1nUG
	XSiluVZBMhqYs11jwTB2ni8AR03OevpKP355FmjufEZrJm/LmefYN945baprxdIjNr6XNTD5UXd
	h7Ko512yjg9WGOJnhNQda2A1M23b3HacZhwnbtNPeqj6go6ZFFaiIDbrQS0HD85qhX2g==
X-Received: by 2002:a05:6102:3b11:b0:7ab:e522:de49 with SMTP id ada2fe7eead31-7abe522e53fmr2779565137.31.1790177352949;
        Wed, 23 Sep 2026 08:29:12 -0700 (PDT)
X-Received: by 2002:a05:6102:3b11:b0:7ab:e522:de49 with SMTP id ada2fe7eead31-7abe522e53fmr2779528137.31.1790177352225;
        Wed, 23 Sep 2026 08:29:12 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ab3ffbc6dsm113760966b.30.2026.09.23.08.29.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 08:29:11 -0700 (PDT)
Message-ID: <9d6cf632-0c6a-4f93-8c63-2abb7cacdeac@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 17:29:10 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [RFC PATCH] media: usb: gspca: remove driver for old webcams
To: Hans Verkuil <hverkuil+cisco@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ethan Nelson-Moore <enelsonmoore@gmail.com>,
        Frank Zago <frank@zago.net>, Olivier Lorin <o.lorin@laposte.net>,
        Erik Andren <erik.andren@gmail.com>, Brian Johnson <brijohn@gmail.com>,
        Leandro Costantino <lcostantino@gmail.com>
References: <6e63b180-d6c6-41e9-a2a2-78cced514f7e@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <6e63b180-d6c6-41e9-a2a2-78cced514f7e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2MSBTYWx0ZWRfXy/pSAVyLIzTQ
 r9vfJkXJl2R0J3Mc2gntTGDaErcP/n9fOb+X0DUtG8rImxbyEhi5ju9IU9DyoowH8PKQoP+ZwPr
 s1aSlavQE5wJhwi+ejZ7oFwetWxVS0IkKdt7kmypsbItyQlOo1PxoRXocImUM1ihc40Jfvw9F3Q
 5e5PABbE6kYgI1Zc7XVnbe0zNqiVB8Kdnh0K/HklpyaxGj2NZUDpWTn3euYR4upWAw4BAC9/8+g
 q7IRB+RDX0Hju7ne+z2xDUw2rpWMZZmieMT60ahS7tYQFMloH5mq762j9vpHeZ4vUAOD5Sbe1Yl
 QUrvlsQ6yYW/gz0Iy5RZ4fS0JDNFuNVJ5AlU2DCf2T1EhLWUznykFzUlInhgHasis0QDa+LyXcY
 VjoIFAGXZZJRej/d9PBOddqdZO7CJ/UWYXRw78I//x1S2sGvdwXVgulx9sscRiFjzVc9FiPDf/S
 eAFRz+usFT+kRJmIwDg==
X-Authority-Analysis: v=2.4 cv=WK/qzXsR c=1 sm=1 tr=0 ts=6ab3f04a cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=xq3W2uTSAAAA:8 a=VrxkVu50AAAA:8 a=AVbMHacnAAAA:8
 a=pGLkceISAAAA:8 a=3HDBlxybAAAA:8 a=ykoPv_dRAAAA:8 a=vi6zlYHHTpjpne_qLsYA:9
 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22 a=P5L7wpMTXyg1GfFA3Gwx:22
 a=hewzNoAmEcyW25K8zJs-:22 a=Z8w8RPyABVWp4NBWd0ke:22 a=laEoCiVfU_Unz3mSdgXN:22
 a=R_vcQ8NxifR1qX6SQtl7:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2MSBTYWx0ZWRfX+ijKXoMGXVLH
 3CYaA7QyAQRsn2PuHm0O91sh/p2scHzRzNdbLjfAod4Bl/1kNM5tHgg+Flr4v8OgeywDE/kmyO+
 v9wo2FiZQ3Ld+ojw5w5aT79vpeIOoiM=
X-Proofpoint-ORIG-GUID: zdwlJUOL96vdnxFBuMuNfL7L_z8S8c3E
X-Proofpoint-GUID: zdwlJUOL96vdnxFBuMuNfL7L_z8S8c3E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230061

Hi,

On 23-Sep-26 09:32, Hans Verkuil wrote:
> The gspca driver supports a large number of old non-UVC webcams that use
> proprietary formats.
> 
> These webcams are poorly maintained, have very poor image quality, and
> there is no use-case for them anymore since even the cheapest UVC webcam
> will be better than these.
> 
> The last time there was a 'real' change to gspca was in 2021, one in
> 2019 and one in 2018.
> 
> We see an uptick in the number of suspected AI patches in this driver,
> and I really don't want to waste time on that.
> 
> So let's remove this driver.
> 
> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>

As someone who did a lot of work on gspca I'm a bit sad to see this go,
with that said I understand why you're doing this and I think it likely
is for the best.

The only worry I have is that some of the earlier builtin laptop USB
webcams might not all have been UVC and replacing the builtin cam is
no were near as easy as replacing an external one.

Bur for that I guess we will hust have to wait and see. I guess we
may need to keep some gspca sub-drivers. sn9c20x / ov534 come to mind,
these also had pretty decent image quality. Those basically were the
last proprietary format USB camera bridge chips AFAICT.

E.g. ov534 is used in the Sony playstation "EYE" cameras.

I wonder if we maybe should keep those 2?

Anyways I expect we might get some pushback from some users on this
but a minimum that will be helpful to decide the future of the gspca
driver:

Thanks, patch looks good to me:

Acked-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans







> ---
> I CC-ed this to several maintainers of gspca webcams listed in the MAINTAINERS
> file. It would not surprise me if at least some of these emails are obsolete.
> 
> This is an RFC for now, and if we do this then it will be for kernel 7.5.
> 
> Regards,
> 
> 	Hans
> ---
>  .../admin-guide/media/gspca-cardlist.rst      |  451 --
>  .../admin-guide/media/usb-cardlist.rst        |    6 -
>  .../media/v4l/pixfmt-reserved.rst             |   32 +-
>  MAINTAINERS                                   |   49 -
>  drivers/media/usb/Kconfig                     |    1 -
>  drivers/media/usb/Makefile                    |    1 -
>  drivers/media/usb/gspca/Kconfig               |  455 --
>  drivers/media/usb/gspca/Makefile              |  100 -
>  drivers/media/usb/gspca/autogain_functions.c  |  165 -
>  drivers/media/usb/gspca/benq.c                |  274 -
>  drivers/media/usb/gspca/conex.c               |  953 ---
>  drivers/media/usb/gspca/cpia1.c               | 1898 -----
>  drivers/media/usb/gspca/dtcs033.c             |  430 -
>  drivers/media/usb/gspca/etoms.c               |  782 --
>  drivers/media/usb/gspca/finepix.c             |  293 -
>  drivers/media/usb/gspca/gl860/Kconfig         |    9 -
>  drivers/media/usb/gspca/gl860/Makefile        |   11 -
>  drivers/media/usb/gspca/gl860/gl860-mi1320.c  |  551 --
>  drivers/media/usb/gspca/gl860/gl860-mi2020.c  |  793 --
>  drivers/media/usb/gspca/gl860/gl860-ov2640.c  |  477 --
>  drivers/media/usb/gspca/gl860/gl860-ov9655.c  |  373 -
>  drivers/media/usb/gspca/gl860/gl860.c         |  730 --
>  drivers/media/usb/gspca/gl860/gl860.h         |   93 -
>  drivers/media/usb/gspca/gspca.c               | 1700 ----
>  drivers/media/usb/gspca/gspca.h               |  243 -
>  drivers/media/usb/gspca/jeilinj.c             |  537 --
>  drivers/media/usb/gspca/jl2005bcd.c           |  519 --
>  drivers/media/usb/gspca/jpeg.h                |  156 -
>  drivers/media/usb/gspca/kinect.c              |  474 --
>  drivers/media/usb/gspca/konica.c              |  478 --
>  drivers/media/usb/gspca/m5602/Kconfig         |   10 -
>  drivers/media/usb/gspca/m5602/Makefile        |   12 -
>  drivers/media/usb/gspca/m5602/m5602_bridge.h  |  161 -
>  drivers/media/usb/gspca/m5602/m5602_core.c    |  446 --
>  drivers/media/usb/gspca/m5602/m5602_mt9m111.c |  600 --
>  drivers/media/usb/gspca/m5602/m5602_mt9m111.h |  125 -
>  drivers/media/usb/gspca/m5602/m5602_ov7660.c  |  468 --
>  drivers/media/usb/gspca/m5602/m5602_ov7660.h  |  105 -
>  drivers/media/usb/gspca/m5602/m5602_ov9650.c  |  784 --
>  drivers/media/usb/gspca/m5602/m5602_ov9650.h  |  155 -
>  drivers/media/usb/gspca/m5602/m5602_po1030.c  |  623 --
>  drivers/media/usb/gspca/m5602/m5602_po1030.h  |  166 -
>  drivers/media/usb/gspca/m5602/m5602_s5k4aa.c  |  759 --
>  drivers/media/usb/gspca/m5602/m5602_s5k4aa.h  |   84 -
>  drivers/media/usb/gspca/m5602/m5602_s5k83a.c  |  576 --
>  drivers/media/usb/gspca/m5602/m5602_s5k83a.h  |   60 -
>  drivers/media/usb/gspca/m5602/m5602_sensor.h  |   69 -
>  drivers/media/usb/gspca/mars.c                |  427 -
>  drivers/media/usb/gspca/mr97310a.c            | 1077 ---
>  drivers/media/usb/gspca/nw80x.c               | 2105 -----
>  drivers/media/usb/gspca/ov519.c               | 5030 ------------
>  drivers/media/usb/gspca/ov534.c               | 1608 ----
>  drivers/media/usb/gspca/ov534_9.c             | 1821 -----
>  drivers/media/usb/gspca/pac207.c              |  475 --
>  drivers/media/usb/gspca/pac7302.c             |  951 ---
>  drivers/media/usb/gspca/pac7311.c             |  687 --
>  drivers/media/usb/gspca/pac_common.h          |  119 -
>  drivers/media/usb/gspca/se401.c               |  730 --
>  drivers/media/usb/gspca/se401.h               |   76 -
>  drivers/media/usb/gspca/sn9c2028.c            |  963 ---
>  drivers/media/usb/gspca/sn9c2028.h            |   48 -
>  drivers/media/usb/gspca/sn9c20x.c             | 2409 ------
>  drivers/media/usb/gspca/sonixb.c              | 1469 ----
>  drivers/media/usb/gspca/sonixj.c              | 2981 -------
>  drivers/media/usb/gspca/spca1528.c            |  438 -
>  drivers/media/usb/gspca/spca500.c             |  979 ---
>  drivers/media/usb/gspca/spca501.c             | 2036 -----
>  drivers/media/usb/gspca/spca505.c             |  791 --
>  drivers/media/usb/gspca/spca506.c             |  599 --
>  drivers/media/usb/gspca/spca508.c             | 1526 ----
>  drivers/media/usb/gspca/spca561.c             |  911 ---
>  drivers/media/usb/gspca/sq905.c               |  428 -
>  drivers/media/usb/gspca/sq905c.c              |  330 -
>  drivers/media/usb/gspca/sq930x.c              | 1156 ---
>  drivers/media/usb/gspca/stk014.c              |  434 -
>  drivers/media/usb/gspca/stk1135.c             |  676 --
>  drivers/media/usb/gspca/stk1135.h             |   44 -
>  drivers/media/usb/gspca/stv0680.c             |  339 -
>  drivers/media/usb/gspca/stv06xx/Kconfig       |   10 -
>  drivers/media/usb/gspca/stv06xx/Makefile      |   11 -
>  drivers/media/usb/gspca/stv06xx/stv06xx.c     |  647 --
>  drivers/media/usb/gspca/stv06xx/stv06xx.h     |  103 -
>  .../media/usb/gspca/stv06xx/stv06xx_hdcs.c    |  532 --
>  .../media/usb/gspca/stv06xx/stv06xx_hdcs.h    |  193 -
>  .../media/usb/gspca/stv06xx/stv06xx_pb0100.c  |  432 -
>  .../media/usb/gspca/stv06xx/stv06xx_pb0100.h  |  131 -
>  .../media/usb/gspca/stv06xx/stv06xx_sensor.h  |   74 -
>  .../media/usb/gspca/stv06xx/stv06xx_st6422.c  |  273 -
>  .../media/usb/gspca/stv06xx/stv06xx_st6422.h  |   38 -
>  .../media/usb/gspca/stv06xx/stv06xx_vv6410.c  |  265 -
>  .../media/usb/gspca/stv06xx/stv06xx_vv6410.h  |  242 -
>  drivers/media/usb/gspca/sunplus.c             | 1073 ---
>  drivers/media/usb/gspca/t613.c                | 1041 ---
>  drivers/media/usb/gspca/topro.c               | 4972 ------------
>  drivers/media/usb/gspca/touptek.c             |  712 --
>  drivers/media/usb/gspca/tv8532.c              |  365 -
>  drivers/media/usb/gspca/vc032x.c              | 3838 ---------
>  drivers/media/usb/gspca/vicam.c               |  353 -
>  drivers/media/usb/gspca/w996Xcf.c             |  569 --
>  drivers/media/usb/gspca/xirlink_cit.c         | 3149 --------
>  drivers/media/usb/gspca/zc3xx-reg.h           |  250 -
>  drivers/media/usb/gspca/zc3xx.c               | 7029 -----------------
>  102 files changed, 16 insertions(+), 78186 deletions(-)
>  delete mode 100644 Documentation/admin-guide/media/gspca-cardlist.rst
>  delete mode 100644 drivers/media/usb/gspca/Kconfig
>  delete mode 100644 drivers/media/usb/gspca/Makefile
>  delete mode 100644 drivers/media/usb/gspca/autogain_functions.c
>  delete mode 100644 drivers/media/usb/gspca/benq.c
>  delete mode 100644 drivers/media/usb/gspca/conex.c
>  delete mode 100644 drivers/media/usb/gspca/cpia1.c
>  delete mode 100644 drivers/media/usb/gspca/dtcs033.c
>  delete mode 100644 drivers/media/usb/gspca/etoms.c
>  delete mode 100644 drivers/media/usb/gspca/finepix.c
>  delete mode 100644 drivers/media/usb/gspca/gl860/Kconfig
>  delete mode 100644 drivers/media/usb/gspca/gl860/Makefile
>  delete mode 100644 drivers/media/usb/gspca/gl860/gl860-mi1320.c
>  delete mode 100644 drivers/media/usb/gspca/gl860/gl860-mi2020.c
>  delete mode 100644 drivers/media/usb/gspca/gl860/gl860-ov2640.c
>  delete mode 100644 drivers/media/usb/gspca/gl860/gl860-ov9655.c
>  delete mode 100644 drivers/media/usb/gspca/gl860/gl860.c
>  delete mode 100644 drivers/media/usb/gspca/gl860/gl860.h
>  delete mode 100644 drivers/media/usb/gspca/gspca.c
>  delete mode 100644 drivers/media/usb/gspca/gspca.h
>  delete mode 100644 drivers/media/usb/gspca/jeilinj.c
>  delete mode 100644 drivers/media/usb/gspca/jl2005bcd.c
>  delete mode 100644 drivers/media/usb/gspca/jpeg.h
>  delete mode 100644 drivers/media/usb/gspca/kinect.c
>  delete mode 100644 drivers/media/usb/gspca/konica.c
>  delete mode 100644 drivers/media/usb/gspca/m5602/Kconfig
>  delete mode 100644 drivers/media/usb/gspca/m5602/Makefile
>  delete mode 100644 drivers/media/usb/gspca/m5602/m5602_bridge.h
>  delete mode 100644 drivers/media/usb/gspca/m5602/m5602_core.c
>  delete mode 100644 drivers/media/usb/gspca/m5602/m5602_mt9m111.c
>  delete mode 100644 drivers/media/usb/gspca/m5602/m5602_mt9m111.h
>  delete mode 100644 drivers/media/usb/gspca/m5602/m5602_ov7660.c
>  delete mode 100644 drivers/media/usb/gspca/m5602/m5602_ov7660.h
>  delete mode 100644 drivers/media/usb/gspca/m5602/m5602_ov9650.c
>  delete mode 100644 drivers/media/usb/gspca/m5602/m5602_ov9650.h
>  delete mode 100644 drivers/media/usb/gspca/m5602/m5602_po1030.c
>  delete mode 100644 drivers/media/usb/gspca/m5602/m5602_po1030.h
>  delete mode 100644 drivers/media/usb/gspca/m5602/m5602_s5k4aa.c
>  delete mode 100644 drivers/media/usb/gspca/m5602/m5602_s5k4aa.h
>  delete mode 100644 drivers/media/usb/gspca/m5602/m5602_s5k83a.c
>  delete mode 100644 drivers/media/usb/gspca/m5602/m5602_s5k83a.h
>  delete mode 100644 drivers/media/usb/gspca/m5602/m5602_sensor.h
>  delete mode 100644 drivers/media/usb/gspca/mars.c
>  delete mode 100644 drivers/media/usb/gspca/mr97310a.c
>  delete mode 100644 drivers/media/usb/gspca/nw80x.c
>  delete mode 100644 drivers/media/usb/gspca/ov519.c
>  delete mode 100644 drivers/media/usb/gspca/ov534.c
>  delete mode 100644 drivers/media/usb/gspca/ov534_9.c
>  delete mode 100644 drivers/media/usb/gspca/pac207.c
>  delete mode 100644 drivers/media/usb/gspca/pac7302.c
>  delete mode 100644 drivers/media/usb/gspca/pac7311.c
>  delete mode 100644 drivers/media/usb/gspca/pac_common.h
>  delete mode 100644 drivers/media/usb/gspca/se401.c
>  delete mode 100644 drivers/media/usb/gspca/se401.h
>  delete mode 100644 drivers/media/usb/gspca/sn9c2028.c
>  delete mode 100644 drivers/media/usb/gspca/sn9c2028.h
>  delete mode 100644 drivers/media/usb/gspca/sn9c20x.c
>  delete mode 100644 drivers/media/usb/gspca/sonixb.c
>  delete mode 100644 drivers/media/usb/gspca/sonixj.c
>  delete mode 100644 drivers/media/usb/gspca/spca1528.c
>  delete mode 100644 drivers/media/usb/gspca/spca500.c
>  delete mode 100644 drivers/media/usb/gspca/spca501.c
>  delete mode 100644 drivers/media/usb/gspca/spca505.c
>  delete mode 100644 drivers/media/usb/gspca/spca506.c
>  delete mode 100644 drivers/media/usb/gspca/spca508.c
>  delete mode 100644 drivers/media/usb/gspca/spca561.c
>  delete mode 100644 drivers/media/usb/gspca/sq905.c
>  delete mode 100644 drivers/media/usb/gspca/sq905c.c
>  delete mode 100644 drivers/media/usb/gspca/sq930x.c
>  delete mode 100644 drivers/media/usb/gspca/stk014.c
>  delete mode 100644 drivers/media/usb/gspca/stk1135.c
>  delete mode 100644 drivers/media/usb/gspca/stk1135.h
>  delete mode 100644 drivers/media/usb/gspca/stv0680.c
>  delete mode 100644 drivers/media/usb/gspca/stv06xx/Kconfig
>  delete mode 100644 drivers/media/usb/gspca/stv06xx/Makefile
>  delete mode 100644 drivers/media/usb/gspca/stv06xx/stv06xx.c
>  delete mode 100644 drivers/media/usb/gspca/stv06xx/stv06xx.h
>  delete mode 100644 drivers/media/usb/gspca/stv06xx/stv06xx_hdcs.c
>  delete mode 100644 drivers/media/usb/gspca/stv06xx/stv06xx_hdcs.h
>  delete mode 100644 drivers/media/usb/gspca/stv06xx/stv06xx_pb0100.c
>  delete mode 100644 drivers/media/usb/gspca/stv06xx/stv06xx_pb0100.h
>  delete mode 100644 drivers/media/usb/gspca/stv06xx/stv06xx_sensor.h
>  delete mode 100644 drivers/media/usb/gspca/stv06xx/stv06xx_st6422.c
>  delete mode 100644 drivers/media/usb/gspca/stv06xx/stv06xx_st6422.h
>  delete mode 100644 drivers/media/usb/gspca/stv06xx/stv06xx_vv6410.c
>  delete mode 100644 drivers/media/usb/gspca/stv06xx/stv06xx_vv6410.h
>  delete mode 100644 drivers/media/usb/gspca/sunplus.c
>  delete mode 100644 drivers/media/usb/gspca/t613.c
>  delete mode 100644 drivers/media/usb/gspca/topro.c
>  delete mode 100644 drivers/media/usb/gspca/touptek.c
>  delete mode 100644 drivers/media/usb/gspca/tv8532.c
>  delete mode 100644 drivers/media/usb/gspca/vc032x.c
>  delete mode 100644 drivers/media/usb/gspca/vicam.c
>  delete mode 100644 drivers/media/usb/gspca/w996Xcf.c
>  delete mode 100644 drivers/media/usb/gspca/xirlink_cit.c
>  delete mode 100644 drivers/media/usb/gspca/zc3xx-reg.h
>  delete mode 100644 drivers/media/usb/gspca/zc3xx.c
> 
> diff --git a/Documentation/admin-guide/media/gspca-cardlist.rst b/Documentation/admin-guide/media/gspca-cardlist.rst
> deleted file mode 100644
> index e3404d1589da..000000000000
> diff --git a/Documentation/admin-guide/media/usb-cardlist.rst b/Documentation/admin-guide/media/usb-cardlist.rst
> index 5f5ab0723e48..d17f4f6a8883 100644
> --- a/Documentation/admin-guide/media/usb-cardlist.rst
> +++ b/Documentation/admin-guide/media/usb-cardlist.rst
> @@ -33,9 +33,6 @@ listed below\ [#]_.
>  .. [#]
> 
>     some of the drivers have sub-drivers, not shown at this table.
> -   In particular, gspca driver has lots of sub-drivers,
> -   for cameras not supported by the USB Video Class (UVC) driver,
> -   as shown at :doc:`gspca card list <gspca-cardlist>`.
> 
>  ======================  =========================================================
>  Driver                  Name
> @@ -82,7 +79,6 @@ dvb-usb-vp702x          TwinhanDTV StarBox and clones DVB-S USB2.0
>  dvb-usb-vp7045          TwinhanDTV Alpha/MagicBoxII, DNTV tinyUSB2, Beetle USB2.0
>  em28xx                  Empia EM28xx USB devices
>  go7007                  WIS GO7007 MPEG encoder
> -gspca                   Drivers for several USB Cameras
>  hackrf                  HackRF
>  hdpvr                   Hauppauge HD PVR
>  msi2500                 Mirics MSi2500
> @@ -106,8 +102,6 @@ zd1301                  ZyDAS ZD1301
>  	em28xx-cardlist
>  	siano-cardlist
> 
> -	gspca-cardlist
> -
>  	dvb-usb-dib0700-cardlist
>  	dvb-usb-dibusb-mb-cardlist
>  	dvb-usb-dibusb-mc-cardlist
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> index 1cf6c59f4bc4..66ba10d7548e 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> @@ -53,7 +53,7 @@ please make a proposal on the linux-media mailing list.
> 
>        - ``V4L2_PIX_FMT_CPIA1``
>        - 'CPIA'
> -      - YUV format used by the gspca cpia1 driver.
> +      - YUV format used by the obsolete gspca cpia1 driver.
>      * .. _V4L2-PIX-FMT-JPGL:
> 
>        - ``V4L2_PIX_FMT_JPGL``
> @@ -64,62 +64,62 @@ please make a proposal on the linux-media mailing list.
> 
>        - ``V4L2_PIX_FMT_SPCA501``
>        - 'S501'
> -      - YUYV per line used by the gspca driver.
> +      - YUYV per line used by the obsolete gspca driver.
>      * .. _V4L2-PIX-FMT-SPCA505:
> 
>        - ``V4L2_PIX_FMT_SPCA505``
>        - 'S505'
> -      - YYUV per line used by the gspca driver.
> +      - YYUV per line used by the obsolete gspca driver.
>      * .. _V4L2-PIX-FMT-SPCA508:
> 
>        - ``V4L2_PIX_FMT_SPCA508``
>        - 'S508'
> -      - YUVY per line used by the gspca driver.
> +      - YUVY per line used by the obsolete gspca driver.
>      * .. _V4L2-PIX-FMT-SPCA561:
> 
>        - ``V4L2_PIX_FMT_SPCA561``
>        - 'S561'
> -      - Compressed GBRG Bayer format used by the gspca driver.
> +      - Compressed GBRG Bayer format used by the obsolete gspca driver.
>      * .. _V4L2-PIX-FMT-PAC207:
> 
>        - ``V4L2_PIX_FMT_PAC207``
>        - 'P207'
> -      - Compressed BGGR Bayer format used by the gspca driver.
> +      - Compressed BGGR Bayer format used by the obsolete gspca driver.
>      * .. _V4L2-PIX-FMT-MR97310A:
> 
>        - ``V4L2_PIX_FMT_MR97310A``
>        - 'M310'
> -      - Compressed BGGR Bayer format used by the gspca driver.
> +      - Compressed BGGR Bayer format used by the obsolete gspca driver.
>      * .. _V4L2-PIX-FMT-JL2005BCD:
> 
>        - ``V4L2_PIX_FMT_JL2005BCD``
>        - 'JL20'
> -      - JPEG compressed RGGB Bayer format used by the gspca driver.
> +      - JPEG compressed RGGB Bayer format used by the obsolete gspca driver.
>      * .. _V4L2-PIX-FMT-OV511:
> 
>        - ``V4L2_PIX_FMT_OV511``
>        - 'O511'
> -      - OV511 JPEG format used by the gspca driver.
> +      - OV511 JPEG format used by the obsolete gspca driver.
>      * .. _V4L2-PIX-FMT-OV518:
> 
>        - ``V4L2_PIX_FMT_OV518``
>        - 'O518'
> -      - OV518 JPEG format used by the gspca driver.
> +      - OV518 JPEG format used by the obsolete gspca driver.
>      * .. _V4L2-PIX-FMT-PJPG:
> 
>        - ``V4L2_PIX_FMT_PJPG``
>        - 'PJPG'
> -      - Pixart 73xx JPEG format used by the gspca driver.
> +      - Pixart 73xx JPEG format used by the obsolete gspca driver.
>      * .. _V4L2-PIX-FMT-SE401:
> 
>        - ``V4L2_PIX_FMT_SE401``
>        - 'S401'
> -      - Compressed RGB format used by the gspca se401 driver
> +      - Compressed RGB format used by the obsolete gspca se401 driver
>      * .. _V4L2-PIX-FMT-SQ905C:
> 
>        - ``V4L2_PIX_FMT_SQ905C``
>        - '905C'
> -      - Compressed RGGB bayer format used by the gspca driver.
> +      - Compressed RGGB bayer format used by the obsolete gspca driver.
>      * .. _V4L2-PIX-FMT-MJPEG:
> 
>        - ``V4L2_PIX_FMT_MJPEG``
> @@ -144,17 +144,17 @@ please make a proposal on the linux-media mailing list.
> 
>        - ``V4L2_PIX_FMT_SN9C20X_I420``
>        - 'S920'
> -      - YUV 4:2:0 format of the gspca sn9c20x driver.
> +      - YUV 4:2:0 format of the obsolete gspca sn9c20x driver.
>      * .. _V4L2-PIX-FMT-SN9C2028:
> 
>        - ``V4L2_PIX_FMT_SN9C2028``
>        - 'SONX'
> -      - Compressed GBRG bayer format of the gspca sn9c2028 driver.
> +      - Compressed GBRG bayer format of the obsolete gspca sn9c2028 driver.
>      * .. _V4L2-PIX-FMT-STV0680:
> 
>        - ``V4L2_PIX_FMT_STV0680``
>        - 'S680'
> -      - Bayer format of the gspca stv0680 driver.
> +      - Bayer format of the obsolete gspca stv0680 driver.
>      * .. _V4L2-PIX-FMT-WNVA:
> 
>        - ``V4L2_PIX_FMT_WNVA``
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4cc4a2dc6d30..bc88af071e4c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11367,55 +11367,6 @@ S:	Maintained
>  T:	git git://linuxtv.org/media.git
>  F:	drivers/media/spi/gs1662.c
> 
> -GSPCA FINEPIX SUBDRIVER
> -M:	Frank Zago <frank@zago.net>
> -L:	linux-media@vger.kernel.org
> -S:	Maintained
> -T:	git git://linuxtv.org/media.git
> -F:	drivers/media/usb/gspca/finepix.c
> -
> -GSPCA GL860 SUBDRIVER
> -M:	Olivier Lorin <o.lorin@laposte.net>
> -L:	linux-media@vger.kernel.org
> -S:	Maintained
> -T:	git git://linuxtv.org/media.git
> -F:	drivers/media/usb/gspca/gl860/
> -
> -GSPCA M5602 SUBDRIVER
> -M:	Erik Andren <erik.andren@gmail.com>
> -L:	linux-media@vger.kernel.org
> -S:	Maintained
> -T:	git git://linuxtv.org/media.git
> -F:	drivers/media/usb/gspca/m5602/
> -
> -GSPCA PAC207 SONIXB SUBDRIVER
> -M:	Hans Verkuil <hverkuil@kernel.org>
> -L:	linux-media@vger.kernel.org
> -S:	Odd Fixes
> -T:	git git://linuxtv.org/media.git
> -F:	drivers/media/usb/gspca/pac207.c
> -
> -GSPCA SN9C20X SUBDRIVER
> -M:	Brian Johnson <brijohn@gmail.com>
> -L:	linux-media@vger.kernel.org
> -S:	Maintained
> -T:	git git://linuxtv.org/media.git
> -F:	drivers/media/usb/gspca/sn9c20x.c
> -
> -GSPCA T613 SUBDRIVER
> -M:	Leandro Costantino <lcostantino@gmail.com>
> -L:	linux-media@vger.kernel.org
> -S:	Maintained
> -T:	git git://linuxtv.org/media.git
> -F:	drivers/media/usb/gspca/t613.c
> -
> -GSPCA USB WEBCAM DRIVER
> -M:	Hans Verkuil <hverkuil@kernel.org>
> -L:	linux-media@vger.kernel.org
> -S:	Odd Fixes
> -T:	git git://linuxtv.org/media.git
> -F:	drivers/media/usb/gspca/
> -
>  GTP (GPRS Tunneling Protocol)
>  M:	Pablo Neira Ayuso <pablo@netfilter.org>
>  M:	Harald Welte <laforge@gnumonks.org>
> diff --git a/drivers/media/usb/Kconfig b/drivers/media/usb/Kconfig
> index 813171d25ac5..ba0dc7bb6cb6 100644
> --- a/drivers/media/usb/Kconfig
> +++ b/drivers/media/usb/Kconfig
> @@ -13,7 +13,6 @@ if MEDIA_USB_SUPPORT
>  if MEDIA_CAMERA_SUPPORT
>  	comment "Webcam devices"
> 
> -source "drivers/media/usb/gspca/Kconfig"
>  source "drivers/media/usb/pwc/Kconfig"
>  source "drivers/media/usb/s2255/Kconfig"
>  source "drivers/media/usb/usbtv/Kconfig"
> diff --git a/drivers/media/usb/Makefile b/drivers/media/usb/Makefile
> index 6d171beea20d..979704fd4cdb 100644
> --- a/drivers/media/usb/Makefile
> +++ b/drivers/media/usb/Makefile
> @@ -17,7 +17,6 @@ obj-y += ttusb-dec/
>  # (e. g. LC_ALL=C sort Makefile)
>  obj-$(CONFIG_DVB_AS102) += as102/
>  obj-$(CONFIG_USB_AIRSPY) += airspy/
> -obj-$(CONFIG_USB_GSPCA) += gspca/
>  obj-$(CONFIG_USB_HACKRF) += hackrf/
>  obj-$(CONFIG_USB_MSI2500) += msi2500/
>  obj-$(CONFIG_USB_PWC) += pwc/
> diff --git a/drivers/media/usb/gspca/Kconfig b/drivers/media/usb/gspca/Kconfig
> deleted file mode 100644
> index 9c1939ce6be4..000000000000
> diff --git a/drivers/media/usb/gspca/Makefile b/drivers/media/usb/gspca/Makefile
> deleted file mode 100644
> index a35c45006130..000000000000
> diff --git a/drivers/media/usb/gspca/autogain_functions.c b/drivers/media/usb/gspca/autogain_functions.c
> deleted file mode 100644
> index 7ae7c43951cd..000000000000
> diff --git a/drivers/media/usb/gspca/benq.c b/drivers/media/usb/gspca/benq.c
> deleted file mode 100644
> index 25c40fb1ba43..000000000000
> diff --git a/drivers/media/usb/gspca/conex.c b/drivers/media/usb/gspca/conex.c
> deleted file mode 100644
> index 8b2691243f8a..000000000000
> diff --git a/drivers/media/usb/gspca/cpia1.c b/drivers/media/usb/gspca/cpia1.c
> deleted file mode 100644
> index 14aaf36cde6e..000000000000
> diff --git a/drivers/media/usb/gspca/dtcs033.c b/drivers/media/usb/gspca/dtcs033.c
> deleted file mode 100644
> index 671b205c0059..000000000000
> diff --git a/drivers/media/usb/gspca/etoms.c b/drivers/media/usb/gspca/etoms.c
> deleted file mode 100644
> index c99fd9a1dd21..000000000000
> diff --git a/drivers/media/usb/gspca/finepix.c b/drivers/media/usb/gspca/finepix.c
> deleted file mode 100644
> index bc6133b525e3..000000000000
> diff --git a/drivers/media/usb/gspca/gl860/Kconfig b/drivers/media/usb/gspca/gl860/Kconfig
> deleted file mode 100644
> index e5a35ca72b60..000000000000
> diff --git a/drivers/media/usb/gspca/gl860/Makefile b/drivers/media/usb/gspca/gl860/Makefile
> deleted file mode 100644
> index 7bcfa36f12ac..000000000000
> diff --git a/drivers/media/usb/gspca/gl860/gl860-mi1320.c b/drivers/media/usb/gspca/gl860/gl860-mi1320.c
> deleted file mode 100644
> index d6a540ed378c..000000000000
> diff --git a/drivers/media/usb/gspca/gl860/gl860-mi2020.c b/drivers/media/usb/gspca/gl860/gl860-mi2020.c
> deleted file mode 100644
> index 9e7a29154d45..000000000000
> diff --git a/drivers/media/usb/gspca/gl860/gl860-ov2640.c b/drivers/media/usb/gspca/gl860/gl860-ov2640.c
> deleted file mode 100644
> index 928c1eaf9a87..000000000000
> diff --git a/drivers/media/usb/gspca/gl860/gl860-ov9655.c b/drivers/media/usb/gspca/gl860/gl860-ov9655.c
> deleted file mode 100644
> index 766677ebcb34..000000000000
> diff --git a/drivers/media/usb/gspca/gl860/gl860.c b/drivers/media/usb/gspca/gl860/gl860.c
> deleted file mode 100644
> index ce4ee8bc75c8..000000000000
> diff --git a/drivers/media/usb/gspca/gl860/gl860.h b/drivers/media/usb/gspca/gl860/gl860.h
> deleted file mode 100644
> index a8a5d6450a66..000000000000
> diff --git a/drivers/media/usb/gspca/gspca.c b/drivers/media/usb/gspca/gspca.c
> deleted file mode 100644
> index 4185c9047241..000000000000
> diff --git a/drivers/media/usb/gspca/gspca.h b/drivers/media/usb/gspca/gspca.h
> deleted file mode 100644
> index a6554d5e9e1a..000000000000
> diff --git a/drivers/media/usb/gspca/jeilinj.c b/drivers/media/usb/gspca/jeilinj.c
> deleted file mode 100644
> index 20b2468d065b..000000000000
> diff --git a/drivers/media/usb/gspca/jl2005bcd.c b/drivers/media/usb/gspca/jl2005bcd.c
> deleted file mode 100644
> index 4988fbf5005e..000000000000
> diff --git a/drivers/media/usb/gspca/jpeg.h b/drivers/media/usb/gspca/jpeg.h
> deleted file mode 100644
> index 660081dcb852..000000000000
> diff --git a/drivers/media/usb/gspca/kinect.c b/drivers/media/usb/gspca/kinect.c
> deleted file mode 100644
> index 57ea65863591..000000000000
> diff --git a/drivers/media/usb/gspca/konica.c b/drivers/media/usb/gspca/konica.c
> deleted file mode 100644
> index 53db9a2895ea..000000000000
> diff --git a/drivers/media/usb/gspca/m5602/Kconfig b/drivers/media/usb/gspca/m5602/Kconfig
> deleted file mode 100644
> index d616408b67d9..000000000000
> diff --git a/drivers/media/usb/gspca/m5602/Makefile b/drivers/media/usb/gspca/m5602/Makefile
> deleted file mode 100644
> index 95c9db6dc59c..000000000000
> diff --git a/drivers/media/usb/gspca/m5602/m5602_bridge.h b/drivers/media/usb/gspca/m5602/m5602_bridge.h
> deleted file mode 100644
> index 4d63a9d24048..000000000000
> diff --git a/drivers/media/usb/gspca/m5602/m5602_core.c b/drivers/media/usb/gspca/m5602/m5602_core.c
> deleted file mode 100644
> index 852ee6cce4b8..000000000000
> diff --git a/drivers/media/usb/gspca/m5602/m5602_mt9m111.c b/drivers/media/usb/gspca/m5602/m5602_mt9m111.c
> deleted file mode 100644
> index bf1af6ed9131..000000000000
> diff --git a/drivers/media/usb/gspca/m5602/m5602_mt9m111.h b/drivers/media/usb/gspca/m5602/m5602_mt9m111.h
> deleted file mode 100644
> index 480afd4c9fc3..000000000000
> diff --git a/drivers/media/usb/gspca/m5602/m5602_ov7660.c b/drivers/media/usb/gspca/m5602/m5602_ov7660.c
> deleted file mode 100644
> index fadad530f721..000000000000
> diff --git a/drivers/media/usb/gspca/m5602/m5602_ov7660.h b/drivers/media/usb/gspca/m5602/m5602_ov7660.h
> deleted file mode 100644
> index 6146e8ef17c0..000000000000
> diff --git a/drivers/media/usb/gspca/m5602/m5602_ov9650.c b/drivers/media/usb/gspca/m5602/m5602_ov9650.c
> deleted file mode 100644
> index 82a698052255..000000000000
> diff --git a/drivers/media/usb/gspca/m5602/m5602_ov9650.h b/drivers/media/usb/gspca/m5602/m5602_ov9650.h
> deleted file mode 100644
> index 929a7568c418..000000000000
> diff --git a/drivers/media/usb/gspca/m5602/m5602_po1030.c b/drivers/media/usb/gspca/m5602/m5602_po1030.c
> deleted file mode 100644
> index 8fd99ceee4b6..000000000000
> diff --git a/drivers/media/usb/gspca/m5602/m5602_po1030.h b/drivers/media/usb/gspca/m5602/m5602_po1030.h
> deleted file mode 100644
> index af4a7d836820..000000000000
> diff --git a/drivers/media/usb/gspca/m5602/m5602_s5k4aa.c b/drivers/media/usb/gspca/m5602/m5602_s5k4aa.c
> deleted file mode 100644
> index c022265db3aa..000000000000
> diff --git a/drivers/media/usb/gspca/m5602/m5602_s5k4aa.h b/drivers/media/usb/gspca/m5602/m5602_s5k4aa.h
> deleted file mode 100644
> index 1789cd0514c4..000000000000
> diff --git a/drivers/media/usb/gspca/m5602/m5602_s5k83a.c b/drivers/media/usb/gspca/m5602/m5602_s5k83a.c
> deleted file mode 100644
> index 8ef010a87445..000000000000
> diff --git a/drivers/media/usb/gspca/m5602/m5602_s5k83a.h b/drivers/media/usb/gspca/m5602/m5602_s5k83a.h
> deleted file mode 100644
> index 851e651561f2..000000000000
> diff --git a/drivers/media/usb/gspca/m5602/m5602_sensor.h b/drivers/media/usb/gspca/m5602/m5602_sensor.h
> deleted file mode 100644
> index 46b7297fb115..000000000000
> diff --git a/drivers/media/usb/gspca/mars.c b/drivers/media/usb/gspca/mars.c
> deleted file mode 100644
> index eb9342ee32af..000000000000
> diff --git a/drivers/media/usb/gspca/mr97310a.c b/drivers/media/usb/gspca/mr97310a.c
> deleted file mode 100644
> index 3553788e8542..000000000000
> diff --git a/drivers/media/usb/gspca/nw80x.c b/drivers/media/usb/gspca/nw80x.c
> deleted file mode 100644
> index 0f5f2464ac7a..000000000000
> diff --git a/drivers/media/usb/gspca/ov519.c b/drivers/media/usb/gspca/ov519.c
> deleted file mode 100644
> index 57219a738c73..000000000000
> diff --git a/drivers/media/usb/gspca/ov534.c b/drivers/media/usb/gspca/ov534.c
> deleted file mode 100644
> index bdff64a29a33..000000000000
> diff --git a/drivers/media/usb/gspca/ov534_9.c b/drivers/media/usb/gspca/ov534_9.c
> deleted file mode 100644
> index 91efc650cf76..000000000000
> diff --git a/drivers/media/usb/gspca/pac207.c b/drivers/media/usb/gspca/pac207.c
> deleted file mode 100644
> index 34127114c99b..000000000000
> diff --git a/drivers/media/usb/gspca/pac7302.c b/drivers/media/usb/gspca/pac7302.c
> deleted file mode 100644
> index 608be0d64f94..000000000000
> diff --git a/drivers/media/usb/gspca/pac7311.c b/drivers/media/usb/gspca/pac7311.c
> deleted file mode 100644
> index f6addb29f8f0..000000000000
> diff --git a/drivers/media/usb/gspca/pac_common.h b/drivers/media/usb/gspca/pac_common.h
> deleted file mode 100644
> index acd1be93649d..000000000000
> diff --git a/drivers/media/usb/gspca/se401.c b/drivers/media/usb/gspca/se401.c
> deleted file mode 100644
> index e087cfb5980b..000000000000
> diff --git a/drivers/media/usb/gspca/se401.h b/drivers/media/usb/gspca/se401.h
> deleted file mode 100644
> index b0271409faf6..000000000000
> diff --git a/drivers/media/usb/gspca/sn9c2028.c b/drivers/media/usb/gspca/sn9c2028.c
> deleted file mode 100644
> index dbd1d6da37f1..000000000000
> diff --git a/drivers/media/usb/gspca/sn9c2028.h b/drivers/media/usb/gspca/sn9c2028.h
> deleted file mode 100644
> index beb5d2a5de75..000000000000
> diff --git a/drivers/media/usb/gspca/sn9c20x.c b/drivers/media/usb/gspca/sn9c20x.c
> deleted file mode 100644
> index da916127a896..000000000000
> diff --git a/drivers/media/usb/gspca/sonixb.c b/drivers/media/usb/gspca/sonixb.c
> deleted file mode 100644
> index f251a886024f..000000000000
> diff --git a/drivers/media/usb/gspca/sonixj.c b/drivers/media/usb/gspca/sonixj.c
> deleted file mode 100644
> index 2e1bd2df8304..000000000000
> diff --git a/drivers/media/usb/gspca/spca1528.c b/drivers/media/usb/gspca/spca1528.c
> deleted file mode 100644
> index ccc477944ef8..000000000000
> diff --git a/drivers/media/usb/gspca/spca500.c b/drivers/media/usb/gspca/spca500.c
> deleted file mode 100644
> index b9ce5e35f52f..000000000000
> diff --git a/drivers/media/usb/gspca/spca501.c b/drivers/media/usb/gspca/spca501.c
> deleted file mode 100644
> index f7c75d7535c4..000000000000
> diff --git a/drivers/media/usb/gspca/spca505.c b/drivers/media/usb/gspca/spca505.c
> deleted file mode 100644
> index 0e8cccbb6d80..000000000000
> diff --git a/drivers/media/usb/gspca/spca506.c b/drivers/media/usb/gspca/spca506.c
> deleted file mode 100644
> index 0886587dc89c..000000000000
> diff --git a/drivers/media/usb/gspca/spca508.c b/drivers/media/usb/gspca/spca508.c
> deleted file mode 100644
> index 754ab1dbba83..000000000000
> diff --git a/drivers/media/usb/gspca/spca561.c b/drivers/media/usb/gspca/spca561.c
> deleted file mode 100644
> index 431527ed602b..000000000000
> diff --git a/drivers/media/usb/gspca/sq905.c b/drivers/media/usb/gspca/sq905.c
> deleted file mode 100644
> index 32504ebcfd4d..000000000000
> diff --git a/drivers/media/usb/gspca/sq905c.c b/drivers/media/usb/gspca/sq905c.c
> deleted file mode 100644
> index 6ca947aef298..000000000000
> diff --git a/drivers/media/usb/gspca/sq930x.c b/drivers/media/usb/gspca/sq930x.c
> deleted file mode 100644
> index c3610247a90e..000000000000
> diff --git a/drivers/media/usb/gspca/stk014.c b/drivers/media/usb/gspca/stk014.c
> deleted file mode 100644
> index aa9e921e7cef..000000000000
> diff --git a/drivers/media/usb/gspca/stk1135.c b/drivers/media/usb/gspca/stk1135.c
> deleted file mode 100644
> index 1a602af7310f..000000000000
> diff --git a/drivers/media/usb/gspca/stk1135.h b/drivers/media/usb/gspca/stk1135.h
> deleted file mode 100644
> index 9a77500cc805..000000000000
> diff --git a/drivers/media/usb/gspca/stv0680.c b/drivers/media/usb/gspca/stv0680.c
> deleted file mode 100644
> index b23988d8c7bc..000000000000
> diff --git a/drivers/media/usb/gspca/stv06xx/Kconfig b/drivers/media/usb/gspca/stv06xx/Kconfig
> deleted file mode 100644
> index 59373659ae4d..000000000000
> diff --git a/drivers/media/usb/gspca/stv06xx/Makefile b/drivers/media/usb/gspca/stv06xx/Makefile
> deleted file mode 100644
> index c4d7206e0c92..000000000000
> diff --git a/drivers/media/usb/gspca/stv06xx/stv06xx.c b/drivers/media/usb/gspca/stv06xx/stv06xx.c
> deleted file mode 100644
> index d9bc2aacc885..000000000000
> diff --git a/drivers/media/usb/gspca/stv06xx/stv06xx.h b/drivers/media/usb/gspca/stv06xx/stv06xx.h
> deleted file mode 100644
> index f6bafa982e32..000000000000
> diff --git a/drivers/media/usb/gspca/stv06xx/stv06xx_hdcs.c b/drivers/media/usb/gspca/stv06xx/stv06xx_hdcs.c
> deleted file mode 100644
> index bd0c62a926b9..000000000000
> diff --git a/drivers/media/usb/gspca/stv06xx/stv06xx_hdcs.h b/drivers/media/usb/gspca/stv06xx/stv06xx_hdcs.h
> deleted file mode 100644
> index 326a6eb68237..000000000000
> diff --git a/drivers/media/usb/gspca/stv06xx/stv06xx_pb0100.c b/drivers/media/usb/gspca/stv06xx/stv06xx_pb0100.c
> deleted file mode 100644
> index d30a76df52cf..000000000000
> diff --git a/drivers/media/usb/gspca/stv06xx/stv06xx_pb0100.h b/drivers/media/usb/gspca/stv06xx/stv06xx_pb0100.h
> deleted file mode 100644
> index c5a6614577de..000000000000
> diff --git a/drivers/media/usb/gspca/stv06xx/stv06xx_sensor.h b/drivers/media/usb/gspca/stv06xx/stv06xx_sensor.h
> deleted file mode 100644
> index 67c13c689b9c..000000000000
> diff --git a/drivers/media/usb/gspca/stv06xx/stv06xx_st6422.c b/drivers/media/usb/gspca/stv06xx/stv06xx_st6422.c
> deleted file mode 100644
> index aac19d449be2..000000000000
> diff --git a/drivers/media/usb/gspca/stv06xx/stv06xx_st6422.h b/drivers/media/usb/gspca/stv06xx/stv06xx_st6422.h
> deleted file mode 100644
> index 68ba01c5a8d4..000000000000
> diff --git a/drivers/media/usb/gspca/stv06xx/stv06xx_vv6410.c b/drivers/media/usb/gspca/stv06xx/stv06xx_vv6410.c
> deleted file mode 100644
> index dde1950bdc68..000000000000
> diff --git a/drivers/media/usb/gspca/stv06xx/stv06xx_vv6410.h b/drivers/media/usb/gspca/stv06xx/stv06xx_vv6410.h
> deleted file mode 100644
> index 343ddc30401f..000000000000
> diff --git a/drivers/media/usb/gspca/sunplus.c b/drivers/media/usb/gspca/sunplus.c
> deleted file mode 100644
> index 971dee0a56da..000000000000
> diff --git a/drivers/media/usb/gspca/t613.c b/drivers/media/usb/gspca/t613.c
> deleted file mode 100644
> index 33b37ccf1090..000000000000
> diff --git a/drivers/media/usb/gspca/topro.c b/drivers/media/usb/gspca/topro.c
> deleted file mode 100644
> index aee444042f60..000000000000
> diff --git a/drivers/media/usb/gspca/touptek.c b/drivers/media/usb/gspca/touptek.c
> deleted file mode 100644
> index 734644d928ab..000000000000
> diff --git a/drivers/media/usb/gspca/tv8532.c b/drivers/media/usb/gspca/tv8532.c
> deleted file mode 100644
> index c31baa72c02c..000000000000
> diff --git a/drivers/media/usb/gspca/vc032x.c b/drivers/media/usb/gspca/vc032x.c
> deleted file mode 100644
> index e7a534be061d..000000000000
> diff --git a/drivers/media/usb/gspca/vicam.c b/drivers/media/usb/gspca/vicam.c
> deleted file mode 100644
> index 91e177aa8136..000000000000
> diff --git a/drivers/media/usb/gspca/w996Xcf.c b/drivers/media/usb/gspca/w996Xcf.c
> deleted file mode 100644
> index 700c39fe307c..000000000000
> diff --git a/drivers/media/usb/gspca/xirlink_cit.c b/drivers/media/usb/gspca/xirlink_cit.c
> deleted file mode 100644
> index acfb9a195106..000000000000
> diff --git a/drivers/media/usb/gspca/zc3xx-reg.h b/drivers/media/usb/gspca/zc3xx-reg.h
> deleted file mode 100644
> index ab8f44a4f3d4..000000000000
> diff --git a/drivers/media/usb/gspca/zc3xx.c b/drivers/media/usb/gspca/zc3xx.c
> deleted file mode 100644
> index 5bcbf0d40147..000000000000

