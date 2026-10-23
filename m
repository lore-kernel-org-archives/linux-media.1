Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792750724;
	b=Mw9hoq7UJDh/FetqCxlaujkq9BGmc3NTe7AgLyQFj0zW99BQhJ+5FtJwP/3MZXAzZlFD
	 5D6XBANAnOG9thq3Akpv+HuFHNQk6aV7UT6H0QnfZ85p/tizclUTTyXAulaRMdtOptkvh
	 ADpnuxQTmq66oAUrzthV4yTWqorsEf5NHOmNSli3DtpdI+dOGs1DuyZCiudibcV8stTb5
	 zv/uCmXm2gkpHZ3++t6xHP1b0pm9kjfdaHzCeGF0KW+ISMNaD7mrEysXYYAOOGw6C8Nid
	 N1vHXD0WKXPO9YTrXGI4GeRN4q2+GNjyubakNIYZbpbHUncZxgwfqNtrEEZPKVh7MVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750724;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=YjAarnCifburoEXGvsqsh/sxDLJBq4lP12OGzhjxpF8=;
	b=Iz0r3jmjQPYPIUP77XRgMBTMpYd5jG+P113N0EsuCibkkOtwd5pGto9cfRIEs7MqNcUs
	 YPihDxAjmi5eom0TqkzdBeq4TzS3qyDoIWHVrpf9Tbh8/HuzgSex9ogJ2+wUirsJ7WLP+
	 pCeCqFenx+PbMAEZRaQYPqJwgoZIi78BipQd29/Kmpjg8K+eb+ZnqmZBWNa1XtwI8s9g/
	 gJkdSdVhISbSX+5k34o17VzzFIWa48mYcI/RYJ62tDDZLgVfL7SdD2R4m4tB4bgQ8oPbG
	 btHLKBPggXQtxKaT22G81qPRKgJv4M3kx52vF0vkIHkmbpmOIAUMMZpsM9MyA0YC8Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BcgynjsH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YE8GQJzl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1D8606A325
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 10:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D1D8606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BcgynjsH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YE8GQJzl
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAARjB3550447
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 10:18:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YjAarnCifburoEXGvsqsh/sxDLJBq4lP12OGzhjxpF8=; b=BcgynjsHOsEyW0p7
	JmBaDsQ6nFQLkANcOVu+eCxU9MThVEiziIsFIThVRj72ESReWsq/2Fjlue6EMw7f
	QG7t3qTn0WrzVdngMbQxjibzLT4HeKhh3qX6VnfwOLHzcXvE5ilS23eCh0gfEZ3V
	gJdN1CF7iZTXsVzV/Da4x6OyFDP+nAvYJbtvKk8g4DpMYruI3A4MmZNNGmIgHFuh
	HQLr5vagq7d9LX6Hl5Z7FUUkE8k6BcGB7QJFrW6hfi9MgYUijr0hAVom3M6rkMS2
	cyyjxy/uNB3eb+d6uEcH7zV8JdmH2kJx/yvZVhQwRVX0UqIOddcFZnJf/IIQ9HG7
	+vI2uA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmrb67g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 10:18:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so134087185a.3
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 03:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792750722; x=1793355522; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YjAarnCifburoEXGvsqsh/sxDLJBq4lP12OGzhjxpF8=;
        b=YE8GQJzlyuIDwIzkXS6EO/0vsC7REihvins5pqREw2lJ5PJjl1pPc8vGO91lstg23V
         PYFf3ZDLCAVT11iD1QaK3DfSR4+OWhlhT0cIcoIOFLJukihXDfo0fILomrH6bUoMS8RE
         E1Ddl3AXgAy8Vzy2uop749Lg6Ute4hBPt+Bokfg8TsE8m28iuuKSPWfavtZLlvSgAzup
         Ieau/oLgkKsQ6ZI4QRyQo4tvjQnnw8751/HAgYhq8TCWA9UWiYLa+Bfs+8uOthHI52EY
         6YM/LEVxpgDZ+lPAIPJjg1gfdHmMnka2eeKNXISkFWrr7ydGRE+jjBNYWyxlHx6jZgj/
         sZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792750722; x=1793355522;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YjAarnCifburoEXGvsqsh/sxDLJBq4lP12OGzhjxpF8=;
        b=Z9Czj3KPAiI47vrFTIo3BYThG3UhJU20YekYrF64vkz84ykF22WuiqwZjlcrdeKSsH
         HH3L6OLKH8mc3NUyAPXfVoP8EBaoJyTpbp9mY7GgLK1luIoUv4nDgFcE5JhlvAwpYz3l
         krDjdPCNlsRM2BU/4BYCozqERwrseVHABKlwCvS2jA17sfcU44q1HwSUBQRxrqdcxk3Q
         ikcnwGvQWdv66k5dFKHpt9JYzyasQ3u32KRq+V4yrVgQy233VUwNDch1/ecpBP/aC6vT
         mX6kl5tZEvO2io4M+nImYhEMyaxqUjlaqwjE3QaiDHqNNcr37TBcidrBCnpgs877VIts
         uZUA==
X-Forwarded-Encrypted: i=1; AKwUvBycSzIATj054ofzOmBGR5x0/OYBdloKhUU7b3utPhBrFbiCyG02dkzIKnCnnL3U4amFpeKYP6FXXsHX5A==@vger.kernel.org
X-Gm-Message-State: AFq9FYIj8XYkfTD07RUMxIJG4UM1IAs3nyyfUV+EPDhLK5fMNBa2jsXn
	P4i7dwlop91+6FDNG/0mAZuWH8lbc0kTzbMgqlMy8PGuFZpiDoLQ+UqAHKph2nQGF1Ma4BRkGNb
	mJ1bR55smpKmo97HqpEbvbJ34ONNrrzFIcBbUitY3BGXVBEZgHskpaMkohKZQfpKlgw==
X-Gm-Gg: AYBFou1J793uxlamEDMExb+x9EXw1JV6dJBdQxarIm+0CebPvA/5Yu+GoguzH7iwQ6d
	wru8B2mg60RJ7A7yH9twbf2isCKVQEEjgCaS6e9l9xUiWsWojWIk6KwzTbp+8LUjg5a3uawMGOx
	EfWfXUMWK8G8VREZfRYg6vC1ZgD+MkWwSak4TqP14KPlVt0ADebaQs7jH+IBshd6vS/sTGLd/XL
	3FYQhujh8knnzH3WQ6CU9M6tIHlgIn6AyjCBHIYGR/7Y8H+GzqMYrTVYTgemng2Il0246PqHxSd
	X7oR2iz9IUvnrzKADjbgWogfx1HBZVvVU8iIfxO4OBlv5Er88761b51f+oNJ0sMVuIlBCPiU7cK
	DyDXF2poJIqRzrIo/qgPBCinhPyg=
X-Received: by 2002:a05:620a:298c:b0:93f:2ab9:729e with SMTP id af79cd13be357-93f6f79c238mr362487385a.21.1792750721679;
        Fri, 23 Oct 2026 03:18:41 -0700 (PDT)
X-Received: by 2002:a05:620a:298c:b0:93f:2ab9:729e with SMTP id af79cd13be357-93f6f79c238mr362484485a.21.1792750721242;
        Fri, 23 Oct 2026 03:18:41 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38053b8asm3894504f8f.42.2026.10.23.03.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:18:40 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bradford Love <brad@nextdimension.cc>, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-media@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell King <linux@armlinux.org.uk>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 0/7] gpiolib: kill gpio_request_one()
Date: Fri, 23 Oct 2026 12:18:38 +0200
Message-ID: <179275071555.146035.13882849400290683549.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
References: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2O2613CKrBhZVcOipMn1ARhkSNQzWdAe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfX+YpvMAGxTCUM
 98NCbljKRAN5CBjQx2iT9tCV0MOfwiBEEDsTxuR4F8+brpeSVxDUx8cAg8aXDSsEJFrNf6lq+ZF
 7VQQnd4IZ/MbhdxMwTjGKMV8aeL8qI4=
X-Authority-Analysis: v=2.4 cv=VNZIDNPX c=1 sm=1 tr=0 ts=6adb3482 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=xyndvWGceNBv60aQF6QA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfX8Jj2muPA667M
 qRvIZSXsXq+zIXdOxopci7IFPrO9uKYpEVcXbP5syu/EFeX33Dcl3rT4RvlqABCNpqrX/GMrNy9
 v5yPstP94XNhpQjoeGiFIsz3IZt7uA/KUE2RGRj7nYkrxxtAb5h6bNpxETxhGNVHwxwkoaixfZ1
 gjxv0ZI0Dnnj5YdqfhhBewzMUN6HEtpg+blQ1s7U2IUim3QHQgtP6DOVlYD6RxtfjdS42Ci3ZJO
 XN++QS7v0RqqYkvR9NV+hs8qVJFJ9NjVZ38L9sRyNYzCShJJNvP0h9TwKqY7vhh7iS2f9g1KoAT
 iXceH6OI+NXItvAZTHZ21GHdIGt72Rqdbuikb1+Pjr+ViycIz+oaAbHM38PT5QprC9hzx//IdxH
 w4f/95A0jAkzgIb31xKlqGjyc35rd5iUBcTgznYq3rbjua1jUf5yMOYxj3rvLuYpDab7CUrrqog
 Ojz7m3I92rdaixKPSSw==
X-Proofpoint-ORIG-GUID: 2O2613CKrBhZVcOipMn1ARhkSNQzWdAe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230039


On Wed, 15 Jul 2026 20:46:40 +0200, Andy Shevchenko wrote:
> This is the finilazation of the work announced in the commit 61e1fd2abca4
> ("gpiolib: legacy: Make sure we kill gpio_request_one() first"). With this
> small series we kill gpio_request_one() and leave only two legacy calls
> devm_gpio_request_one() and gpio_request(), where the managed one has only
> a few users and high chances to be killed soon as well.
> 
> The series is supposed to go via GPIO tree (due to nature of the last patch)
> with possible immutable branch for others. Please, ack.
> 
> [...]

Applied, thanks!

[1/7] ARM: pxa: spitz: Open code gpio_request_one()
      https://git.kernel.org/brgl/c/e4c5145a8c42b1ff8c36d209b265d65005fb2a8e
[2/7] media: em28xx: Split em28xx_pctv_290e_set_lna_gpio() helper
      https://git.kernel.org/brgl/c/aa6a84558231f61264bd09c8ef013c7bca63db1e
[3/7] media: em28xx: Open code gpio_request_one()
      https://git.kernel.org/brgl/c/492c8f997533acc550bc23be73b847f5e7bf3e75
[4/7] MIPS: BCM47XX: Open code gpio_request_one()
      https://git.kernel.org/brgl/c/878804621d798dc9eff6148732f74adbc45e99de
[5/7] MIPS: BCM63XX: Remove one time use ephy_reset_gpio_flags
      https://git.kernel.org/brgl/c/6eeba9dc60aa6a5e2a617c7e08a6ad4da325c1f9
[6/7] MIPS: BCM63XX: Open code gpio_request_one()
      https://git.kernel.org/brgl/c/1805476b1a49aea62787072b28d7a2d5880c53da
[7/7] gpiolib: Get rid of not used anymore gpio_request_one()
      https://git.kernel.org/brgl/c/dbc9f76c3ce301c76991574e1944a0d2a8717062

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
