Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793252187;
	b=bJyULdKSFZ3i+aTFumrJ34QCDXjo0Sp5SHvA7fwAxoMq4d7S/us54ylgdUD4ELksujLX
	 ARdkCDCLlc8inUaaUDlvULrADaymPJD8HEIb69Vg9GhwzT8AvBWUR2/p9qSkiIkyQDf0J
	 u0t15luV3N+lZco6Gam9SRCZ0ZHH95ka8e/LY+5TPTSvF1LOHCitv2ca83h+wcUEL6vTM
	 OzAxtyeZ9PLcsrbZ+XRSxdkvPLck7xO5VPoFfN/ZQfm0kmhVlWDonZr/RvenWC9+CP6bX
	 7iCyZWPn+76Jid7ynG8nN0BlEN04Tb88j2oS/+wvAxshY+qDKNg+nlhm17ABxh5IFxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793252187;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9rrk0DoqOXK6wTcBk254IiD4um5GCM7sPdSiLC3uULQ=;
	b=FLpUWCCD5MLo2WY9N3+5K/+Bm1WrrS0yLgYL0wKNhtyaTe8D13sanckLaP4v031CLczP
	 nCaMHWWPzo1EIkENmpLBfadPfulM6NX7SDtRi+S2HZ721R57krZkwqVT+6ktlQS6VcCLh
	 cJeS1ccQE+TcXao+1Ht1UlXVyQ2QULTSCw8JOollacCHxV7LttbDEURVEoPuBZO73Vthv
	 eModUI4aV254b9k/CpqYkTnnFxq+kkznXCVBjyA1ibxx9CfkzpEmNCPhJ/xsl1aIQTJnd
	 aIg7qgafuBZzUHCxSLD8bnXdZDArJQR4DLwkZ55RVrpxXifkmdbYeTgby6WgFXWyGtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TLVwEfMa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="MA/TZZpq";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1823606A31C
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 05:36:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1823606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TLVwEfMa;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MA/TZZpq
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5H7Ha3829254
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 05:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9rrk0DoqOXK6wTcBk254IiD4um5GCM7sPdSiLC3uULQ=; b=TLVwEfMakAs6PB4Q
	p9p3OujGCJ2pTjhJYLMjThVakBXfVBcBUHHCy1THoDddEqOJesE7CN69fBoFkeIa
	utLbGQEOhzG8uZ18aQ5WuHjbypBgkh7lXRrHJaaZmDLdn77jgBRLjgLerz2JLRlI
	BnzmvcYd3dqFJRetHukHfuFeI7HvFWnwxKJ51DquEo4e4/oQEX77A0JDHnMvCmyP
	67ax6qNdZ0JQ9tZDSJnabSUsWjMgFgudUjvr41SrhSb95Jhj5tKytWUAJTEgZRRR
	46RTKsEfwE8pRGfqUCJKkiKts9vtglLOHFc6ALYxOqNeXL9nFYNwlZtg3IuCxgOa
	6ulRog==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hktmp936m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 05:36:24 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e8ba4757baso14841905ad.0
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 22:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793252184; x=1793856984; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9rrk0DoqOXK6wTcBk254IiD4um5GCM7sPdSiLC3uULQ=;
        b=MA/TZZpqTudMbtbdd74dbNcHJ3IUJh1o/PXKrfM9TFxKGOA/iqq1M4eOR/4Ozmh4nS
         2RleXoaWFFz2Z8lHt/Gcp7PgtsRRhV20BWrERgduQTuTdKE8b49C0QzDR+JySJXPWvUq
         HlXgmoxSleYGrBq24NM7EAlUL4r/f46sY4MyE2hv/hW6T+ETFYxWnOYnkvU3WPsxToRt
         2KwKTiI4LuJF3CaZwASBxYtaptdI+2srKoccAtCH8vG6oWlXr8BCzVURocTPYFVVmmkp
         2r9B/ZNcDbIaefCW/5Di445Qdz10ii0V2yN5QYG7oaGYrTqcdmg5fHMJXQHTMtClU1Hh
         yunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793252184; x=1793856984;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9rrk0DoqOXK6wTcBk254IiD4um5GCM7sPdSiLC3uULQ=;
        b=yklCxU5Pt26r7kZh63a4Zs1bu4v6L6MLQwWIGNfobkuRS5g8vC3yU40UB9PK4MDCsM
         AanDFKZgObNPvi/kmXD3s7V7kyBcRa6qukeRH6MUHazjOFsq0q2QDkUzhYaghTSmagps
         VuoXMivnJSvhzLlqq3ThfM0ovMaFdUpAAfIN6Cl8r7+jFXQgOr9LUmQBvClVkAWum2VB
         Ccmu9ZYTfZS8aBYeCk+/r25fAJUROyf7ke4XAi3B+RAC3lacBJmO9JdoIh+oGB+fNKPs
         q2+1KmQu7nbE7YJ1wZ1n9spMhGgLkLjt8+2EcbO5hpvt1BLalVa7MivYaKVwe1hcosb5
         bwSA==
X-Forwarded-Encrypted: i=1; AKwUvBw+Gn3KGNPfT/nPBVlRyLPBCDEOgX9h8/U+QDRnVDrxf4/k2qUbbB0JPiOr55u5z9Ps+y3lIsdLpqD69w==@vger.kernel.org
X-Gm-Message-State: AFq9FYKJMg6YfXTN+qDL8z45Dk8scv2K1p4h/Z/1cGNkvCEfERY/fsYR
	yYaICPzQJ70o4sO6PybVaoI8fgtMXcuKHCLT56I1AFRUgvIeji7Ndghe5EJWSj5Zx8Zw+I9zc2a
	gq2OfdfIzmmm6en3vA56qy5wgO8DlocA3JgegLwDMWDSPDb5RJ6lP56CKOAqIhvL55A==
X-Gm-Gg: AYBFou2IAW8gq7a4TusjzufaH2frqvyutlrjIkc/DoJpUr/mvGfKFGBk5zyxM9dxsYY
	mJgpwa1C+VI2EuT0v7uNFAxEKvunL6qRTNZ+UCuDAZNq55ef20dtjYV1KIcc0FhoOwsvgYMnNSO
	ZEbvWeTQWAaPeJYFb0f1WICPb4cDsXFWsi10cIrVvLIXj2NOpk9zzF1U31kLo2v1zsWMo3jdhif
	XBqQcBBNBy//xZQHzf5/eiQAotuN1ueO+Vec5JR1W6Bv7g6uiT+ld77PjK34NoJ/j5orbNkNbe9
	dl4C/TT3L463Sc7F/AfsNn0+82zeBiAbvwWgWPHfim1J5CHuS0mCNvg5EA6y474ZG1Pt1n+T5Q0
	F2nvriyQOvltrCWmhYPNf/S1fMDvogJ++Dy6Jo24RwaIc/gthrKX2RpNn15SMJ5dBXGd3Q0quYK
	LDqXoPhQ==
X-Received: by 2002:a17:903:380b:b0:2e9:9c65:1aff with SMTP id d9443c01a7336-2eb0041ee21mr40133685ad.45.1793252183692;
        Wed, 28 Oct 2026 22:36:23 -0700 (PDT)
X-Received: by 2002:a17:903:380b:b0:2e9:9c65:1aff with SMTP id d9443c01a7336-2eb0041ee21mr40133445ad.45.1793252183141;
        Wed, 28 Oct 2026 22:36:23 -0700 (PDT)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c3d17csm29267465ad.53.2026.10.28.22.36.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 22:36:22 -0700 (PDT)
Message-ID: <84e53a4b-5ea1-430c-90ce-09d98948c8de@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 11:06:17 +0530
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: qcom-geni: fix double free of the DMA bounce buffer
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Akash Asthana
 <akashast@codeaurora.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        Wolfram Sang <wsa@kernel.org>,
        "open list:QUALCOMM I2C QCOM GENI DRIVER" <linux-i2c@vger.kernel.org>,
        "open list:QUALCOMM I2C QCOM GENI DRIVER" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linux-media@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linaro-mm-sig@lists.linaro.org>
References: <20261028153353.69651-2-fourier.thomas@gmail.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261028153353.69651-2-fourier.thomas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAyMSBTYWx0ZWRfXxI4U27YNqzPK
 FWVW2ul/k4wrd0DD4uY4eAZlutAh1w1/TGqfNF2VftE1DkWeTwuzOK+PZXQj6jnw+6WlpDERez5
 xdP48JLkZPzX+BmNpmjBmBjD96k9Ohh9Jfv5EXgjjkGazKpIPetRrQSzJIuyfUtxeYwx08ILhfB
 TuEzE02WoTIT62XEpOlPRCBhhilRjCV2KqS6JaFbOCEiwKymRMMPL55hCYQdREswQV1Mnc6fgkb
 2Ap4xty613zAL6yEJKcEP6/Xq6xjssdjJM0wF49PJEGFAFsO2EgnQ18srVzO0LGwcQvyNZz9Wzc
 YYiJg1Q6KwUqlSwD8AjiDW7+B2deFrnc9ysEZPFYxaNeFAHy1UCLP3PvkawCAPkmhvpt1ULU/1R
 Oe0oMFP9J7VjdCcW7XKcIIv+H5B+gYEaRjYe7Iy2i6gK8iaZODQiP341CLdw/StFGEj2EYmNWdv
 QkWb+yr5M1bzdK+ypGg==
X-Authority-Analysis: v=2.4 cv=crYOAF4i c=1 sm=1 tr=0 ts=6ae2db58 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=5U0EVFohHyNS2EaXvY4A:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAyMSBTYWx0ZWRfX736Lyxir4zBg
 g9/KvtQGN3SMfyfuf6xB7PeW1YIkmQ2MzQ9xNtBKLKHH+cq9bz9jIlnTz1EtIBl2eIH5q8kObEN
 o5Mvi17KWeQ7J4rpgGxaAg3ejb1fmzM=
X-Proofpoint-GUID: YB43ojcWLqhLs4TbUE2J4GIfcUzhIDiZ
X-Proofpoint-ORIG-GUID: YB43ojcWLqhLs4TbUE2J4GIfcUzhIDiZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1011
 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290021



On 10/28/2026 9:03 PM, Thomas Fourier wrote:
> geni_i2c_{rx,tx}_msg_cleanup() release gi2c->dma_buf through
> i2c_put_dma_safe_msg_buf(), which kfree()s the bounce buffer when the
> message buffer is not DMA safe, but leave the pointer set. gi2c->dma_buf
> is only updated when the DMA setup in geni_i2c_{rx,tx}_one_msg()
> succeeds. If the setup fails for a later message, the function clears
> only its local copy, so the cleanup helper sees the stale pointer from
> the previous transfer, unmaps it again and frees it a second time.
> 
> Clear gi2c->dma_buf once it has been released.
> 
> This bug was found statically and compile-tested only.
> 
> Fixes: 357ee8841d0b ("i2c: qcom-geni: Store DMA mapping data in geni_i2c_dev struct")
> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
