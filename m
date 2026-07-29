Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8E747A86E
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 12:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785328057; cv=none; b=t4bgNm/IgTfjkVnqVJWe+U1WzA7SaSlJ8f6uok9B9SAx+HFwawojWlzmpBSxveCFp9V7fyKKwgafM6WyTf3tUvhfq9gBCpMObspFRI7YnZEriSIZYIcwU1cnge33A6jMzES906cG6KWBAWqslvQevFfiILPHFh0TeFmu9hnlh0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785328057; c=relaxed/simple;
	bh=11U0eh099CIjz5u00EVDCiljAQ+xRrN0Sycpjzjt+iI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aYkPNO/Sur3dUiyxGYsMvhBNcdQZq5FJ5yhrZl5DJ57j9qQRnQUkT9iVcs5X5twLs5fUPXGCoBdmCNfcTGFADpxwM7tlz0xMuCiGFJENh38wXuvrH4tUNJLfC4TiV54MKFH+WHJsN8et2IE28Lsf0Gt66yyO6H4a1nmABxIN1d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HhC0ftXt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O8zcBIRv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HhC0ftXt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O8zcBIRv"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TCO8bM1814510
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 12:27:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	11U0eh099CIjz5u00EVDCiljAQ+xRrN0Sycpjzjt+iI=; b=HhC0ftXt/2sFAJoh
	f16z6IgOsVoqgQlu9qYFj3//Dr56OhMSfnUAmtw0ipVum/cOFEX9t9bcYPsggQfM
	IdLo3RykRhvB/VZxzNSlJ9cCXe/jwWejmibfIa0klZZdUCf/oUWnvSImZlc8bKTR
	8FLb/p18FmC2UgWPyHZ+gQY7H51qHOjR+9qiluclOv1pksEzztr8ExjL7tdxtF5J
	FYK5Orlel0kF8seh34DvhEFbfboR9kaOqvPj/5VVBhFIpdr54YW67jVUGAILsvSV
	e4hEvEK+T2MepdJOBkjltSZ6LIQ52AcJiseXqAlIHLM3wV4+sQ0Tg1+wr/nA2JOU
	VOISyQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqhg8r0cb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 12:27:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52845bd815bso1601971cf.0
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 05:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785328055; x=1785932855; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=11U0eh099CIjz5u00EVDCiljAQ+xRrN0Sycpjzjt+iI=;
        b=O8zcBIRvjQcvQUBC0OxG5B01z1D8pTTI5wRpTSG17TBFrlVEy+SpDoFRQgfY42fsJo
         6KPJiASgwCa8HmYSIBSxlbIthWWgvmDxVJX54mGX942Xzk+/X49D2lVnEI46gT7J7hMz
         NPp9YQD4rQebUDibjQMQRLvK602jlCy/DW4ktF58bvKaCzQzqEvntDHuXi9d2EFQhKqG
         MFQPG253fs+MIefndCdeeh6WzW2rH40GTaFuetwD97b2gayBwcLAmTeWqSJng/EfhBpE
         xxNk17IHsFmZdtnKwgCqXojqvdorMl7GJSXkZItHsbccG3vemG9EkgsLTYVDVRuBnq+a
         wYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785328055; x=1785932855;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=11U0eh099CIjz5u00EVDCiljAQ+xRrN0Sycpjzjt+iI=;
        b=OgHOx0cfkNE010WOUEXSVAPQEjB8AYvnCXUBx3CgviIw1IMpjyDjNU7aobJRfiMYdt
         LGemUWY5jzhAmnTVCWnJ3kwQPN3GhSoPiTXSOxuxIDV8nFGHqMGxCALjy9qeiH3oIlz8
         4u2tw0Ae9tCK4liySqNNAmPRbyoStA8VpFZLhsRy0nE8DLk9brdFMV1nOG7dyc/hEGK7
         yEG0EwP7fMVmT0z/3DtgTYaQYAtZlTlUDMr/26z7V/UnZqlnEbMuYrpAg3QhU0qqbZ0B
         +7AXDEtskriG485HBeR8Odb+wP3xkbZUM7X3WLU7aXlLmPat8qsp5L1EOj/IIC1K9Okn
         oW4g==
X-Forwarded-Encrypted: i=1; AHgh+RpMuXeOIc44bQEruq783pVj5+oFLTkNQruLLE+bp9QxerJ3Nv6mIiIds8+C5W6//TEi6mZY9HMrul+FMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzuagHJlHwapApYl9HXu/jQnGJj2NzJNSa3+LT3FvDdroqCEeR
	2MbZ2CpGcXLjgTqP2v8f4O/P58eexVL0LZ+7wroLQkout2UR40qYZcM+6toR68M1FEjXsROi/ti
	iSSg+uDMmLmLXanEG5JujGUFLHK0DCp86atfp6iInIQZVgvYaZBCM2aMpTu6k0QYSCc7YP9RVMA
	==
X-Gm-Gg: AR+sD10SQCKZR2G3gHO/DTyaF5B3c85uGlNheO+h8MaRHuxOMkizMY9mD7tyVsv/+Sb
	TA0LhPsnmvCciB9mtUPDSfQRaqT52mwWCQ2bb/6TRtlSek9z2J+r9ojXdT2vYMA/KKGhuC6awEE
	LatW9ByBMa9dZXv8KHNMwvIgtjrI08vJ+WnXz3v4gsYVyTYsKqu1owMfucb2ICeHg0MdVGZvyLS
	7167mTlJU9GqNOb2vgbVoAMZz49Ioy0VT9kgUNAYJLNl/c//H01Icd+xq6rIbvH14lxq2aATZcb
	srIRwrQSq3Mnkv1DFcrUwRu0OCNxQ/gsVwJ/DvMlSNCWflJKOvMHNi0bmbTSPrtusg1e6QjwkHN
	fx4jq9CIs2guxmVNh3Ab+Ru7f
X-Received: by 2002:a05:622a:1aa5:b0:51c:2101:f0 with SMTP id d75a77b69052e-529d6f89194mr58332831cf.2.1785328054595;
        Wed, 29 Jul 2026 05:27:34 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa5:b0:51c:2101:f0 with SMTP id d75a77b69052e-529d6f89194mr58332371cf.2.1785328054027;
        Wed, 29 Jul 2026 05:27:34 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f83fe70d0sm104914666b.53.2026.07.29.05.27.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 05:27:33 -0700 (PDT)
Message-ID: <a787149c-bcbc-4cd9-8365-2010b135ce80@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 14:27:31 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/2] media: iris: add support for purwa platform
To: David Sheffield <producer456@gmail.com>, wangao.wang@oss.qualcomm.com
Cc: bryan.odonoghue@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <CAOAE-oNM-AS35-k=ntkLX8H35UF6_6AhMTP_10C=RroA2_AvsQ@mail.gmail.com>
 <be2fb404-061d-4e69-b430-9cecea21f60f@oss.qualcomm.com>
 <CAOAE-oPAqmyjwow_Dethrmy8NsbG4Hi6CqXLzM6=Tjajc9eqaQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAOAE-oPAqmyjwow_Dethrmy8NsbG4Hi6CqXLzM6=Tjajc9eqaQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEwMiBTYWx0ZWRfX3UWLm7b1qThE
 zRaMfDqocu10ehV67Kr7GeJuxY8RuP77Z+q+YU4nkRohnykIiYlMmr9/yhzG77/5lMpp4/GVMhV
 M2ZxO07zrjWIjP+NLatSztLiGW1DgiI=
X-Proofpoint-GUID: x9wz6koYf_vPbMm0maDNbj7wkAcZWl29
X-Authority-Analysis: v=2.4 cv=LOdWhpW9 c=1 sm=1 tr=0 ts=6a69f1b7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Mhdb-L9lliOisUUO3ZwA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: x9wz6koYf_vPbMm0maDNbj7wkAcZWl29
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEwMiBTYWx0ZWRfXwXn9DD7y3H+R
 EVxykXLuanf6EgPAu4d6kr6JjzS6Ib27X0FFA81jSNyvtk3faDlJwp8z139YBRQUwL3wNqSAVjP
 gY+tv2gmGhOntMPfxKUtPSXecfiEECKPx0YbARjBRkIOIhx7cwioJ5JPEpklQqGOtevNau6d9nk
 sxEBi5GUrvmTYBgIybuMgPqg3EQMyekZfifgjFJ7pC2V4+cD2k2eY5IrbjA7uoNqou5TDuNHyLt
 LeMFT9vSW2aLiL59dyIwvVXQfcJIOyVNAQJ+ZHwF70pspD1bZAyQbbOYkCe6GL06a4EskVW6I8P
 2lwT/LEW552lxRukaGM6sMjSUDqeJaEv+cO2opHuucIcJPkFyhCCkOSHcrEdrg3Z1ggTeyyCOE4
 39aX9a6Dp098vLAlUoEwjrd9yddUyjbruKsscG2hMW2vr7vuPllQSHdhEUTPOk7UMFHUvgJAoU0
 zLGcBNGi7lyP01R8mfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290102

On 7/27/26 11:52 PM, David Sheffield wrote:
> On 7/27/26, Konrad Dybcio wrote:

[...]

> Given Windows runs video decode on this same device with these same
> images, the metadata is evidently one this TZ can accept, which seems to
> leave a purwa-specific policy difference on the Linux boot path. That
> loops back to my original question: has this series been run on
> production-fused purwa hardware, or only on CRD/development devices? I'm
> happy to test patches or add instrumentation on this machine.

FWIW I have no insight into that effort, but to reiterate, if the secure
side rejects the image, that's not related to what's using it (i.e. if
there's anything wrong with the driver support, that's totally a separate
issue that you may only hit after the fw loader is made happy).

There have been recent changes to the fw loading scaffolding (introducing
an alternative backend to scm), so I'm not ruling out something went wrong
there. But that would break loading on *all* devices, not just production
ones. Unless there's some memory corruption somewhere that makes the
checksums not right..

FWIW I'm running linux-next/master + a couple of unrelated-to-fw-loading
patches on another production machine (glymur-based) and the various
firmwares (incl. for Iris) load just fine

Konrad
