Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2756E44AB9B
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 12:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387895; cv=none; b=emS2bGY6XV3w5k4crgBI8lLjvi4jeRbkg5kuBjdUgf6lSuTRSxpb9dnhBDWjxQrlrVxrago1oe6mJhG8mrzQIkRY0WjJod26TPcXH+g0/M6/kJjOvpZPPGSgWgcqk9yvfxPlzObGkDH33qS9hGze0w4ttOS5jrazcem0kzNHavg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387895; c=relaxed/simple;
	bh=/qXZQiWSYZP3Hk5lWB8Zy7NUdHgncjUSfqqrWQCH8HQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BOa3hScDyQE18W0sum+aSFjiRfRbae2qZMkEVV+vfLrOeQ1SXTK4a9IIYvlcpup2TUJVltrxn6E/ErtGZwKKUnxXjX3DIECOZ9ZxsUDsgkxsmZSFUQfGRvNbEf3AxMAtE6oxB4Ra7W5rawuFvcfGg0TdX2Xl+0ptS/PuiUySpBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZLu1+IBf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZgeMSbhP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZLu1+IBf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZgeMSbhP"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmLSZ4032469
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 12:11:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TGOsUT3dlL6kI53BlDSeWVAg
	IydWNJ7b2kgtqLeWv58=; b=ZLu1+IBf/RnwYRTYq8ExeBOIkuZOTXWWJ7HUZ9wS
	+j8xhBhd6B9ut/wdfdl8wx+7TbHY2X8sHPjkYICYOw+6+ot21wH4ehpHO3s6zd9I
	54D8Fl7jJ1SAzDGfvnkcZog2ozCLnRUX24p+G6InWJ7rbJLFliRyDdh5i9HouZM0
	BqPNUL+/WkGISuGfWwB1F7TMTSx9h7OhWyAgHZS4NaYpWRr0/AHRCaJ/0m2ZocUy
	6kv2ZFNuxEPYd/xD7XAi9QI+4mVbfd0O1p5FpkAx1wVNk3LkBkfqjyvr7zLjVGlK
	xS2u3yc1PRe/MHS4txbHJzut4h37bCv1W3eYRxeM4ohBwQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeuq8frf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 12:11:33 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c6725e7891so1395709e0c.0
        for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 05:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789387892; x=1789992692; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TGOsUT3dlL6kI53BlDSeWVAgIydWNJ7b2kgtqLeWv58=;
        b=ZgeMSbhP6OUUbgcCZy7tMlo2h9Eg0Shyf8GCAWYWuKA0V70zFjORA0DA7O0tOLOlvy
         JbvndHOQFjMZwqVA1ZOzx1DHKXwBhmtsLrkWgu977038UipfCXaj2NYp/Jj2E72KL0SZ
         wlkLzzUKD2FYR5WS8ox+BdrzC4gNn0Z7YYqDzXD96JMZZ7AhSCRBEkigewUUW663WDE6
         Dp047rw9umeYqh9IydUgKrOzvrZ/+jCoXCUj9DTrQ4jzs46fTfWL1i/pcz/m77wIUCkE
         haFHhdr5EUiOWqAZSQfs/xIeiW5dh2zZejQNWYbHAvOANrB+TYyhv3D90+5zZcLVagqG
         2JKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789387892; x=1789992692;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TGOsUT3dlL6kI53BlDSeWVAgIydWNJ7b2kgtqLeWv58=;
        b=O8z3OdT/Z0sn+kh1nirM/1yUpUU6hvLNOBWxJGWXTMPQdk8qteSurr9N5cXVpfY5aC
         earLbYGFqBI/UbQJjzaUFLBWEAkBAwQuWcOQdG8bJFz5g3H3rPlGrUp8pJ6l0mfQOZ6k
         V90EcDrgz9E/lOK6mM25C7c28w9hgk1mXtb7/xofh3RCC4LtUHC1hFhgRiUcNAzUoul8
         YblvukKiBdZPeBHO+Y+DpByaSSAl1njACJ4GM5gf7c0eFelr4IOppgMGUBgWOA8ZW5wt
         7NshyZixFH1+1Sxiu5KFIeqquIlGzPI9NfESV3WX6UQXHAdo+pYlHi4QvRxRcU8S1Vpu
         Wg6w==
X-Forwarded-Encrypted: i=1; AKwUvBxQwh7sBlq8lf6dN3i3sjGh8y6s1TPN5DlZN82zZ7ar2YRW5UQz9+12VQc3zWxihkR+2m3HDhDOVXT2Tw==@vger.kernel.org
X-Gm-Message-State: AFuF++klBmJGynzhtnRkNBxn7//Kv2gRJJy9u73+++L/HloTS2bMt0DD
	MtRfF9/4pbYF+88Xhc78+49a6l5HeLvRLmdJX0kGN4CP3De3wb+FjiN1301kPFHhsAUpLOiFmKj
	fNbzLQWCrCnidlfY3vWrHZ6dvSneQNH/0xFrQteIpB7345aiQJxEIfL5MRHNayDj26A==
X-Gm-Gg: AYBFou350RUP+1P7BQGrNdBra38hp1HN8QKsh6IY0SoPKC89W3Cyr6Qg/jKBgE8yZDl
	yTWDWQsbVFHCwQraWeXJGrWv+Me7N0ZyUvl9/BtfQPKlXlaiQYw0RrNT4eAMlg8d5XCVPieErY3
	//4sd/01EuD62E1xCMHhEtLWqNc+jc7gyMLpafyrM5+oBnVyAdzEOaoocjds7Td1SZAfnebQNnV
	OuziwLym1ya2ZPE04QODDPXjy0jQ3lcXJrgm/VeX6sW6UieVqwbsdR10jca6jdAkf+navDJZWu4
	i4fdTSaEdqU70qj+Inqx0eedNYRuA88UlBObhmMw32zjwvAR4HiXby1ibe73gVl0gU0xnTSmns1
	ImxNFp7gsCuD32G0RLWKzFCUna/6eEHZviDO0ZJVoXsyUcM2500XcJZYaBRKQ2RRUGzv9FJVIjO
	2T7gOHJjFX3zRo
X-Received: by 2002:a05:6122:547:b0:5c8:2ad8:1484 with SMTP id 71dfb90a1353d-5c981ad6d23mr1305471e0c.1.1789387892349;
        Mon, 14 Sep 2026 05:11:32 -0700 (PDT)
X-Received: by 2002:a05:6122:547:b0:5c8:2ad8:1484 with SMTP id 71dfb90a1353d-5c981ad6d23mr1305402e0c.1.1789387891867;
        Mon, 14 Sep 2026 05:11:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a046499bsm2338562e87.44.2026.09.14.05.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:11:30 -0700 (PDT)
Date: Mon, 14 Sep 2026 15:11:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: iris: Add SC8280XP platform data
Message-ID: <cwljkshgt7q7dbmujest6u2igpnwcgyx7xmxct2ns4g7ph6avo@zngraegxzmue>
References: <20260910-sc8280xp-hfi-gen2-v1-1-ea51d0386fdf@radxa.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-sc8280xp-hfi-gen2-v1-1-ea51d0386fdf@radxa.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3MyBTYWx0ZWRfX+lQ/xMJqE/TG
 ygt1TVpuCA8EUJbF1iLwBm1m15DxmzlMmcpTySW2+G3uumQm53CN2jul/A4lEMEjRY4x26xRJnI
 RYLpSp5nKNP2t0oxBCEqoK9uOxt299F06JfSe1MbMK8Ytialzz0Z5U362xjv6clJ8NuK+H/1W37
 HorZmP1rrtvRGGv/qWgGLN7PrD91zfkhKeE9hx2X8PxjcQ4sH5krHzmvRzqe5LlxgF5QJFmWpwz
 gzsvVAr6UQkzjrYPSg3yrWPfQ1Lzyyb/yGM0TNJqVwiA+6FKsEZMXVI1dkf0Nq3rGJjEIdQ9soZ
 aEczr/LiO2jXpLjiu6qx+aJXt+ERiHBgtA/eTH2HMfVsgF9mxhJS4hAFHQHBKDELDk3xblsqDgm
 SzEe+ojH4gp0Gxbc0mdG5RQJ5YLdr1mNV9M1QZn/S2xhzSkQCBcKhpDZxmQSHXT5KHe69wGlXgg
 X3DtOus7wtYKh4RnZRQ==
X-Authority-Analysis: v=2.4 cv=TrFzFzXh c=1 sm=1 tr=0 ts=6aa7e475 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=ksxQWNrZAAAA:8
 a=-APiHbVL8haAwMLVaR8A:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: uQooZtnbGTUAMAImYV000pM9Jab3T_ZN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3MyBTYWx0ZWRfX8PjrZaOwjeKn
 4cLHiHMPqZoLPtsBEfl5lua7I9x4q09JZ+MOeepx7086uVlBkUhc5byteQPbu3QamShq30cJ5VD
 BPpWbtZ7WZIVYVyCowjaMod1xgDsNj8=
X-Proofpoint-GUID: uQooZtnbGTUAMAImYV000pM9Jab3T_ZN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140173

On Thu, Sep 10, 2026 at 11:34:24AM +0800, Xilin Wu wrote:
> Add platform data for the Iris VPU on SC8280XP and hook up the
> qcom,sc8280xp-iris compatible.
> 
> SC8280XP uses the VPU2 programming model, but can run the newer HFI Gen2
> firmware.  Describe both the legacy Gen1 firmware and the Gen2 firmware
> so the driver can select the available firmware at runtime.

Please extend the existing sm8250 entry instead of adding a new one. It
would allow any VPU2 / 4pipe platform to use either HFI Gen1 or HFI Gen2
firmware.

> 
> Set up the SC8280XP clocks, resets, power domains, bandwidth tables,
> format list, capabilities and DMA address limit needed by the Iris driver.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  .../platform/qcom/iris/iris_platform_common.h      |  1 +
>  .../media/platform/qcom/iris/iris_platform_vpu2.c  | 36 ++++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_probe.c      |  4 +++
>  3 files changed, 41 insertions(+)
> 

-- 
With best wishes
Dmitry
