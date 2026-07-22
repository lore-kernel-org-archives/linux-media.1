Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516A51E7C12
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 12:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784723567; cv=none; b=Hp2aINwpeINC3K76PI/3meNiSxtwNwFW7+owHduFkySFZK9RHZyUnVyrvjwWeLuDniACeLJseYbQ4PdF/2eaQGX7L2zgTfgYH9an9H/qYpsq7hbo7L8b2DzYzKgAZNt+B2J97wacGfAvRrypzcON7sZf7mLa2tiqLZsiJ0SNxks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784723567; c=relaxed/simple;
	bh=o1ohGmEWWIKSBoZvafV1zOkNVXuoo+eI9ipfbv7otmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eR6sZQlqpKafeqNjgakYijjPghbUWMWio2dZTH9k0TG1wzBfyHuNV7isQyQW1KROlxd58+YV/RZyhZwFFBZqqgF+ROe3xxMmgQKuPkYgEZnrgTy6YKEqfYfGW9ig2+5IFLrJi2y+oHYXYUDu8Trskd9BblPSpiuH4yZIjDjkehY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c41JeAFA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AtuzoWEI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c41JeAFA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AtuzoWEI"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xK4N237633
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 12:32:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SV3anUXbS60DooWtn+9ZT4xK
	AKZbYJpCJxu2SMsK88E=; b=c41JeAFAmVaFTTr77McAwY9dTJRQMj9R68MCHkKV
	myyiVXIqu8UdAUw/V5l8uEtB87FTb6f4nGmfDz/p2M2JzUcwdwuugC62JQFOap/v
	Xzg6YnyJM2hsmPkdaBoSGn2GM7hoBp7VlIV3R8ocK6ZPFKcMHNgDNrJnqsiuJ8rH
	CIx7MneBWquPdnFy1SlboUeybjAtRm5lNUP9R4FRutiVzZyiotudCfLTqeO9iiUY
	YBXaf51FLwHKS0pMUy7Z/EIvekHIA9IeY+OUrzVUv+UIOm4o/URdfoSS2RdSIkXp
	+LFCmVOqVnc+lv5aONj4XyP8NBHfGpf9fOHu7aS9DkZpBA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjntn24wv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 12:32:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bec738909so151953531cf.1
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 05:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784723563; x=1785328363; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SV3anUXbS60DooWtn+9ZT4xKAKZbYJpCJxu2SMsK88E=;
        b=AtuzoWEImtfLUb/PP436HFMcnkfwCb4p8GWfgUUtwvkHVGfm8Ko2wdeq5OySvMoM9F
         zoyZACdaXWkVQS5+pXY60FhWKfS3HcwYQZbzgPHO26uHcDU/OoQyJv8ONH32JKCvZ8rJ
         i1d2tzYlLiLDkHSpeLAY0udrnx5/bp7OOjlfxM3M+8eEWXuihZjEL+OjGqaTq0/XOMMq
         ihDHKyhnsx5+Ht0PU/EKZjTDv2LYOwHOvqVXsH4L/clC3eVJC7y0v0RZFzgKOVsDdJuN
         h+kKiVQd2gvzbqK/jh4JHwH5GrfZEVEmEgiO8raSgOEbgT+XZGEtw8dHa/t7Kpy03gH+
         SyLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784723563; x=1785328363;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SV3anUXbS60DooWtn+9ZT4xKAKZbYJpCJxu2SMsK88E=;
        b=n4k85y4l6CroFCLm9gr9layxWlf0hLA2g7+4rEhPnLBoG8MNK5xsYSp63QXa57KgBm
         REhjEfcFsNYxh1Msts4rZzY++ITkx3pTgNavfZlw59LoM4f0gKOP66ocRq8X8ezodTW9
         rejPxrB0+v2jLto1KSKVKSuIdHbhsMWZDpPYUCvMFYVORGQDhsGS/MintXmSDjcCt/us
         zbh+23OJ7uOarQGsu2mbKNwGoftksZsAxSU0+vPzl9Gt82dmngv0K8Q6fxdGGsy8+Awd
         hJlGlTafbLSKk9nxBlIhNokO2nrbqmXM+kUEnP2Inwq26s4HgLsPNEqS88kg3d05gRFD
         esaA==
X-Forwarded-Encrypted: i=1; AHgh+Rr8uByZ1/L//RKqfawqH3UXeoc10yEglBSewx5EBA+DQLqFJlQfwoJnkoh6fBcjU4lDy4ke4MQ0hZJ/kw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyH5e7z+mvwe2gnDbHWj7RO8Ynjrfdarry5BJP1dbDJ18Qnaapt
	TTVtSs9J5N6dZ5wxdyA8LT44TKfyKZXm0BS1fWjmiFvYL+tQboEwooAq6k9ev0tzBH/efCxTTha
	vPcycNcC3nzLrlv8n6mtAlUSyshUsCutBE9qIO2skVZqwvJnmlcvgSxRIVHQi14Tn8A==
X-Gm-Gg: AR+sD10VUUXyaDmYePX1VYYY2uMH8DwbMWKBmUfbNrZNXOlMmXEuwvGvwrRbc368ZYQ
	Y9KvvNYL63iaXVOeL73PjdAL+WK5jMTY9kx3+22VRuZO8GkevhA0xVNeulHBOWwU9nqfKllWQEc
	bBq+wg8N0ieWx9LcIZUhszt7DyDaGSCwclkCYfIe2zW/P2OrEVVD647GQID3CbqOka3DnDSxO3N
	6li8gKT3Cfuq/R/Tm9HkpSTfa3NOm6v+OqFKipD/PaD0eot12M7kWIqOIQEdIKTe5rvctWLQ7zV
	9Ip7xRFyu6on99ywSP8ERIKODZElA5M3yHX0VUfrZuIkUun/FSzbVUwLwGy9S3oijEqWb1h/yr6
	pYBLqRzg+XboUDW+Vt9yIYAm3k3m1Xj+p/oOOg/FY9MINXexbsBpVUO7bxzypBZR4SFXIZVJHLL
	9vSfy3rFo/0WH3xg==
X-Received: by 2002:ac8:5842:0:b0:51c:7b12:5fe0 with SMTP id d75a77b69052e-5213f06fc16mr205251591cf.76.1784723563231;
        Wed, 22 Jul 2026 05:32:43 -0700 (PDT)
X-Received: by 2002:ac8:5842:0:b0:51c:7b12:5fe0 with SMTP id d75a77b69052e-5213f06fc16mr205250891cf.76.1784723562408;
        Wed, 22 Jul 2026 05:32:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9e45fa5sm457806e87.66.2026.07.22.05.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 05:32:41 -0700 (PDT)
Date: Wed, 22 Jul 2026 15:32:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Gourav Kumar <gouravk@qti.qualcomm.com>
Subject: Re: [PATCH v2 0/3] media: iris: add LTR and hierarchical coding
 support for ar50lt
Message-ID: <5vmfrdc7skmo2e3holugnhryjkhwwhndbsrklpjp5dsxfujyvs@a64y4x6lb5mp>
References: <20260721-shikra_ltr_support-v2-0-702842f1f3c2@oss.qualcomm.com>
 <moj26vrjujn6ci74yrthdjyfdabg4tn67n7hczkeqvjhknm4ai@ilxz3c4jvcfe>
 <3c48c1fc-94a2-7180-0922-aff5a1a5ddb4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c48c1fc-94a2-7180-0922-aff5a1a5ddb4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=AJsSZ1gA c=1 sm=1 tr=0 ts=6a60b86b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=dOCu1lF06kczfvRyuycA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: EYfLXWPiiVQqdpxHG9WQwCgwByUcuooy
X-Proofpoint-ORIG-GUID: EYfLXWPiiVQqdpxHG9WQwCgwByUcuooy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEyMiBTYWx0ZWRfX273MYIzLua/P
 RyNhUH/sRi2soz2dTOmfawLEQdWrMD4tJYSnFelDCy1ECM379t1M9ohYgp6TO/3UL+EwC8qgAtQ
 KNvGUVIidgqPILDrnMx9tzw60eotkIk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEyMiBTYWx0ZWRfXx63JRcv36njz
 ZJQp1MpyqxrX0ZfX/Uv0rw1GWgBST+8KpWHaTo3HG7+OgOWtlwiodIYadoXZBPL/VxVfKcGz0Hf
 vyEOXQE5i0IvPOe3tKzDF7Foght/PXj0tGGl6lsQgrRUR+vUdafQmz0Y+JIqFmms4rFigKuKWO0
 vSfCnWUM416d8MVcHvxZetnTQCGRWGlq4ABd4BVsk7BFY3/SB4657Fa3Ah7MjDjwago44Yc2FvO
 1baHxuJHOgPxd9nwfRMmutlxgldhtwq2TN98D/4EILtXR9Iqi6GW3FJo9xl5u/6T/h0wVZn9V9/
 uBrYUPv1LNgmqqyc1x4zBw+w31VSQYbVBCrqsCCR2FCrde2qLXhVj4bb9TnYhYKXNnXPPBk+gAQ
 HGHeTjJETNPjiJ5gSO6qBYvD04Ynsu2VfC3pXNhKOiEIM1xCCd5Qhn8CwknoHnBEoR9W/WPX/z0
 XD2Zvrj8PWPf+R757BQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220122

On Wed, Jul 22, 2026 at 05:54:03PM +0530, Vishnu Reddy wrote:
> 
> On 7/22/2026 2:45 AM, Dmitry Baryshkov wrote:
> > On Tue, Jul 21, 2026 at 07:06:22AM +0530, Vishnu Reddy wrote:
> >> This series adds support for Long-Term Reference (LTR), hierarchical
> >> coding and request key frame controls for the AR50LT encoder by enabling
> >> the required firmware capabilities in the iris driver.
> >>
> >> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> >> ---
> >> Changes in v2:
> >> - Added request key frame support
> >> - Link to v1: https://patch.msgid.link/20260710-shikra_ltr_support-v1-0-458b587268ea@oss.qualcomm.com
> > This should be coming as a review feedback rather than a separate
> > series. I'll incorporate those changes into the AR50LT series (together
> > with the similar changes to Gen1 firmware).
> 
> That works for me as well.

The third patch will still need to be submitted, corresponding defines
are not yet merged.


-- 
With best wishes
Dmitry
