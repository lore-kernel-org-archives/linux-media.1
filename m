Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FB62750E6
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 00:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784680579; cv=none; b=LmGBGapXlBc4oBzBmtBCvhRitnZ57XcphqsBVOmK6EvSvpwOzD5x+ULDQNf3mTbbJ2+2V+epMEF6LP2KVLmpaByYiBEEY85vR/37zjT1FVK6hXkgPpAH9zpqS0sWNXjlXObvH363WqYWbJiV0Njy3Idp2NsuYPEQc+e3FrSbYqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784680579; c=relaxed/simple;
	bh=/KHk1NS/0j3U1q8hqYXp736oLZRg6FpFENhlXX0EnGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SLNufZ/QMw+AL49B1VAGMacWaw6WXexhZVjIQYJ/ONWQWjn0zDBNHWuYT4NcVQpNf1oEsow+cna5GSDi6Wf/YcPPPQMVXz62U/wCqdkOl72A4wF1P0wK11MTIvXe0yZyf7gHw0tld9r99Wg0q3Wwq3Gr2doYTPpPQFjxy7RKc1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o9vZbl5J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BI7GeMSS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o9vZbl5J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BI7GeMSS"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LMZ9ej3185318
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 00:36:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BJqQU7V8wmOOD/5srz/ytU3wA9lx3lhIkGFMiLfAAXo=; b=o9vZbl5JWZ1pCfZ/
	0zsJvaupaCykQk2PWs9bQ3TYwyQ7G1p4Kf/F1oat/NdY1K96Pw5Onlw5Ig70/K8P
	kDa6zuBs26lDR5+taP2XPW3Lk/4zDCJE9uqsU7kSPhJRhi9ob1ri0+SYEKLq3zOh
	Uvtns1RNeQX3MOErz7z8rUrmrfOAcehwBHSIp/alq7bJfG3LknV8CvQW/E6XpC/d
	cmKLssAw5YhHsY9z5L/FL85GXZqMz9xMaPAxjD40kED6zHYgXvviOkZAtczfMu68
	sJqZWWLjvgHh+5x1qPULPD1QfGko1j9UrxhO8aiQ663wYyV8pxx7W1tI+SCYDvP8
	q+QSpw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6d9fws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 00:36:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0408254aso123583601cf.0
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 17:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784680576; x=1785285376; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BJqQU7V8wmOOD/5srz/ytU3wA9lx3lhIkGFMiLfAAXo=;
        b=BI7GeMSSAX3P/EAolHp1VvDNsAfgO6m9YYPZhAbGFo+tsEqUuOYkCtlQtIXFCTSaYm
         DKZdK0ocfh/v4c88e/XeQ6DAfs7+y2qNG+MaqaoJGJNQp0To93lTJGxX4ciyyAQfBOe0
         otqdN/BFfZqo0h5nA5ww0v+YnYLtKZFFTyVrhjBi1tkYLpHTpHw8Md6MPG8P0H7nJGdb
         s20PUKB+zWiAY8Qnh50gmnure36SdBpJqDrObEv2a4bqgkMbYUmMY21C9QJl4Pzl614G
         RxoxhPfO4jvFQsa/Ca26y72MbSIjYz3Vjy9gnf8wTgSrvILivJ/oNN+LNmlKsLoAFKE2
         tw6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784680576; x=1785285376;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BJqQU7V8wmOOD/5srz/ytU3wA9lx3lhIkGFMiLfAAXo=;
        b=UYb4PihHEP2n04KeS5MPF3hIa043QhDn3VN4xYUZyZb3ii5WMIMWDOZdaWwTdJ36LS
         1Ye+6GM2dHDvB8aitxdRsFsUXKL44OLCo0gvD+EvUJr51FGj3Jp0FOmLvOST4fpQe1fe
         rWsSx0tpe8mJMoII0dNRe6ddjLRif+ZZTFPwEdEx5vuvOjKBaCa/timE1vU9y/VjrVSy
         VmiIdjr5lRNuWzcVt3g04v/b24h10ljDLXICaqTlPzsqsCs1U9z0wiFxIM4VhKLi/+Do
         70WzqJaC7A/Zq5a2zRCnSRPjHhPBPFI6E0NLiQtIAKKwrhg3mV8iX9bdxJcI0bFunQy5
         TlnQ==
X-Forwarded-Encrypted: i=1; AHgh+RpMlVIeKyTCfhq1aaXD9yyHog4W5akvNCngNetTHCXq/Snwor9E16IZb44I8ni3kc5lgi8tN3XFOrWEEg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/ehAekY2ij5A5DEXsOGIsMzR5SaNbqD2lrSNjwfWwStBSjJXQ
	b22/ZJEF8Nhzi4QVwru6r3nzkzd1B0cuHoG9rPAUoH9WT7CRNhDeR3A8b8FL0cBgmx5xW2y7sf4
	CfFfREeCKDGP0ccvOEguV+eKSb8qRk44W4MjXHGg2CGET1hZA1RktH2YhjIl4vf/LdA==
X-Gm-Gg: AR+sD121+b2h/gXy74yNJvFy5EfSiAWTJtKEQN7QjOiClKOGlo2LH6Yk8Yu/euVzIIC
	Gw9gvWlzLobQK5e1323/K+R88Hd2Jpuh48hvNRBQpPitDwy7ZILlRuaxhLpM+BwMpzSBks/n3pd
	yrxTBzQpfYweJIEiKR3jmnPA1Op+jbxEgTtlqThHcGWqeROmytvrYa7I792tqMAqy+nrK94Lcme
	pxk5+2W2IFt0CkClayuD72WnTvOy2zgmVXX5hqcG4lKUCQiAsOT7QUMVy0TfkbFvL6uyj68ykqD
	xCxN2jlyP5hvTJ/hOZtp5OJNA0uaWojD5UfXFm5366qILwI75+pvRrxX95gcxxto+voJZWVoCbF
	ecNjIdS8czBjFzCs5MzGzdTKZABrJcKiKgVW3UO9lWL/HvApjy5zO5q/r80IvjtrWAXEUeqRMeX
	YOenm+D/C9Q+Tiww==
X-Received: by 2002:a05:622a:1392:b0:51c:98f:f288 with SMTP id d75a77b69052e-527a817b718mr21525861cf.25.1784680576108;
        Tue, 21 Jul 2026 17:36:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1392:b0:51c:98f:f288 with SMTP id d75a77b69052e-527a817b718mr21525461cf.25.1784680575600;
        Tue, 21 Jul 2026 17:36:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef6d558bdsm1803721fa.32.2026.07.21.17.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 17:36:13 -0700 (PDT)
Date: Wed, 22 Jul 2026 03:36:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 1/7] media: qcom: iris: Centralize internal buffer
 table selection
Message-ID: <obfonexwxzhtofwumxz4odjsavekgal3utvum5tigeg2xdkpor@ej7mmndux7yb>
References: <20260721-iris-code-improvement-v4-0-4395bd8acfbb@oss.qualcomm.com>
 <20260721-iris-code-improvement-v4-1-4395bd8acfbb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260721-iris-code-improvement-v4-1-4395bd8acfbb@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDAwMyBTYWx0ZWRfX0Tbrh8hF3GCQ
 r6doD+ICoEw2/2/mOQ1x0yk6HSsEPjvHMIJlGF429RewLsnv5digm4XMgXOih/TNAVvjI5mC8Tu
 l8h0jS/TWkGENKgyaM+XyWONj+yLVD0=
X-Authority-Analysis: v=2.4 cv=Ipsutr/g c=1 sm=1 tr=0 ts=6a601080 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=oW0KT12sG60TQqSn0TQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDAwMyBTYWx0ZWRfX3JdPxfqJvC8C
 66CqzA9h12vbmNI1uFjxITCL/Vq6Aw3GJ36tsXt3ei+ovI2Z5pUqzOm49/6wNgNX1GMx1zUX52D
 1evH4PhA7Vy0U7AbciOD59UIZmX6GaBt5mbRuODAgknoJkAImK02BSyIEbfYbetWOHYCbd41QFa
 kBcH3HbDMqWDXz2p7j/NzmJ/aFn9K0wpQLO53L+6hQZAXTT5hD2gPNY16SaiNJyEftQMqBTBzHe
 FXSsL1Gdt5gvWLR24ygRLPX8HV4BAqGUyF9DAec8mylabktX/bzjN+u8ngJ5N0eF2Bhf6lsu+sv
 RMhdCjV/Y7sz7SXn9jKJXswUu4Zpboomc/sWMU0xClP/pCqKuoAYio4d5EWT0k6/2fQR9v1QGET
 P78BFO42mVie0TyoCbj5wazauzQ79EARePmDrD4b/4ONUXO5bU/4suwqOGwS6QEjrKc+BgPafiZ
 yZXPwnjmpqavdZxysZQ==
X-Proofpoint-GUID: BQCyYJg5TtOGf1Kh35k21Hb_nFLwR4-a
X-Proofpoint-ORIG-GUID: BQCyYJg5TtOGf1Kh35k21Hb_nFLwR4-a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220003

On Tue, Jul 21, 2026 at 07:50:34AM +0530, Vishnu Reddy wrote:
> From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> 
> Internal buffer table dispatch is duplicated across multiple Iris code
> paths, which is error‑prone and makes future changes harder to reason
> about.
> 
> Consolidate the buffer dispatch logic into a single helper so that table
> selection is defined in exactly one place and keep call sites minimal.
> No functional change intended.
> 
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_buffer.c | 107 ++++++-------------------
>  1 file changed, 26 insertions(+), 81 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry
