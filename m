Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792743178;
	b=lLkvdy3NZHFEr9OLvALBdxBL3wPjLJJvuoLJlOycrl3QaCzqzcqrmPzixebpbqk15JdX
	 rOLRlZVhtQO/eplTTHte4WvMuu0MVlByDmf64tjX6n5AKJpCEY0R2PD+/7m/HzJvdRNG9
	 vV12ymKd3IBxyvLvRynjJRrD1lyKq/9R1tZnt/2EiQUZ05ah1hYmfURDKwGNzRVLuIoQ3
	 vVruql7yn/83Cj+4TlPj1IZRZnUnEbAhRyqNfJc9oUD7sDFndWppdYYJvx3MwWfr5bV4Q
	 PovAP3CTSzzy9ZT0gbvXYNDsl2N4TU3QG8TYGnFZvlfG61OLFe4wUu6dVlLdKWkm7gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792743178;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 X-Google-Original-From:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1jRulH/EkPuyO1q9aYJ1vrfBy26MO1RC6he862OqI9U=;
	b=bgVo8AvNpKrcfmdocOmFHcKluuttrchoecu4UeVmCOUJbHP7phtZjCKPBr6oqV7rw6ZL
	 CyoUV3MNv5JPJIkONpEyzyX5rWH5NBNUesLf8M+VAtEdti+kZGP8KnonF+lUIG/lJoV+A
	 ToKQ+U0NjXX7OJ0M18P1ZzFHZr7qRetg191zhYPTuQOOEkLRiZka4CgDu/eUHvd0kpe/8
	 SCl+2F1mXn+xHJcdpi+aCk/RXjSEAgfyarJnTsJwx4KoHHlo4rIusyS+LvBfk9PndKPrg
	 hYduvJshS7NA/A1uTfm2u1Tqo94veMVlYTpr7rDJBzQU2wX2E78Yo2W/y/vsa8OGaUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eyvWj+ot;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OgMXftD8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3145606A321
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 08:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3145606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eyvWj+ot;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OgMXftD8
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FTM72650364
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 08:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1jRulH/EkPuyO1q9aYJ1vrfBy26MO1RC6he862OqI9U=; b=eyvWj+otLQ0BXr1c
	5P4DKyOze42qntnvS0GIzRTMcrX2YMQcsvWL4X9TisOmvnlnSgnL/jGkiGrhZGB/
	JM4nCAMccp3ipJsz0sPhTehZi1lstygdrYT0d9g0Z5B/gi+EmIN6ynR9rYIdJQvj
	lKgAuES/X0d+AeS1N4UDPko66iKbUghw1jHtZ9EFSdNSfBsFk2A4Qo+qMDgWuklb
	ltwcxdfe1hf8V0ImNLcu44VH2Iffni5PZ8YCf3QzPrGJ5Hn6PLtYNkOw5RzzeWTi
	M8sZTKvIQXiE6IGIzWyymKcwpKKR0gTp0gZEfqk21r0KQt2qKZ5WNx0DtmkMiZLH
	+ZMINw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmjapy9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 08:12:56 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-89f9fdbabe1so982736b3a.1
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 01:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792743176; x=1793347976; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1jRulH/EkPuyO1q9aYJ1vrfBy26MO1RC6he862OqI9U=;
        b=OgMXftD8ncNr/PKE5TlrhjqpIQ2POdj7PXSzYwe8VHo29y9I1S3ejcZHgBzyrShfIA
         CyVU6W/koEJ0LY85CDXSFQFhUAyyUXXwAGtP9waFPgPfQ5ZgjmDNUSpwwBlcMuqkucJz
         1K3Of8gLQZcTSHU7S7sAS3tBE7xjJxrtpdJIHpxk09YlYjYKFuJjrqu2z0lP4VgmbegC
         KhsvYIrD+XQ0Tvn2Tt/VuGVk3bJ4LGC37WrkB59ymGVkTq3O3+MiXtZZ3nYBME46Fjxw
         x9ArITPn6y+3SPyJraj23UqQ5zz/HQ5qyVnZBwjrhMenfnuuOAj5qbgPui7WSLvjWrNU
         I5+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792743176; x=1793347976;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1jRulH/EkPuyO1q9aYJ1vrfBy26MO1RC6he862OqI9U=;
        b=D1Wc0IlViayz0CEe3iitV3abqX2WboL8+2zDFSJ7YtQ/02BUYxdEPVTmRRTgR4mRDy
         flSsgS2mCGzLM76/0PxAXlrn64CqBGymeEM8bKbnE3jCmWhyGmMqgHWA9IgoG9O5MGdz
         vJRYLVFlMkYU0DN1p+TjBxMXiAxHzZdBvtcC2UNTiqxvPDZNmdZlJtlVeFWjZkYBGgtB
         uQNlCOovjiiy699wOJcrzjWa2IdBAG1S/56KiqZtRG+S01O61xcie7UfK2D6ZzPbJ1uj
         tyyYsuezD/NdYNP01z9cXrZaO0cgYgsjt+7iIt9GDjxsxWYn19CtG3kFvNK+GeIUOdeG
         PNGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzmScSlVoUj8Kh1RryxaJHlsgrxYn8zEqRqAEloOdFQkqEbglsh6LT7YjLw9StWr/xdj7Crf7xfxm+AA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIsr+jpm6BECXTvPd9iaNUTDDFTqBtO8w/SEBg+iKXW3Q3CDkkl
	O9nFrWuUe+7hA9mav5Fqt4UDF2N6KhQpscMo8KPhgaTIB/xXbzsQmETFrWRQysLIDzPIv/yehBw
	kW6D7CH3+XOjKgmgExomZ91aFfwosidpBo2+QWbpvLFENTGz317CVqT/U+RUZR+leXg==
X-Gm-Gg: AYBFou2Yo6i92ccJ9UDfJNwA8OYDLEQ5LXiI78P+9hHsnZPr8XTmcqKZHy1tyf6m9+k
	NweSAosIsUb8f1ukypqZEWEkLn1gcmlHbJcvnq5Dx7p2fUFbgxHlL4ojPKJnhEiDroCI0CyxlaN
	OyQb7+LiOFurM2vfBKFV76bFtilRqTbO1IjKca95KFcNRRtR3Z4Xm1eQAMxbU6JaYaCOcIpt5xP
	iV+nXr79qJYGe7V2NBr8iPr6Im4YamImk3IL/40sSKcSs2xEPBMJaHyE3+yIFat/LuZhJK4xYJC
	sMEKyoKmAJYnRa5KZQIvWf71TbB64UCWgh4g0B25tbLhP6BW7W0SR6q3YmzP8/A79jx9iptGIpw
	WaCAz0YkdiQy/hBwBxuUeLha3HTgmR6YOcQ==
X-Received: by 2002:a05:6a00:2d91:b0:8a0:21b2:7c7d with SMTP id d2e1a72fcca58-8a2c472056fmr1404003b3a.0.1792743175991;
        Fri, 23 Oct 2026 01:12:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d91:b0:8a0:21b2:7c7d with SMTP id d2e1a72fcca58-8a2c472056fmr1403965b3a.0.1792743175484;
        Fri, 23 Oct 2026 01:12:55 -0700 (PDT)
Received: from [10.204.79.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c797b685sm455376b3a.1.2026.10.23.01.12.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 01:12:55 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Google-Original-From: Jayant Shekhar <jshekhar.shekhar@oss.qualcomm.com>
Message-ID: <c7bdcdf2-1fa4-42a5-a89f-689e688af5ae@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 13:42:43 +0530
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
Subject: Re: [PATCH 09/13] drm/msm/dcp: Register DCP display pipeline
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev
References: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
 <20261015-jshekhar-drm-msm-dcp-v1-v1-9-48aad0fe4f72@oss.qualcomm.com>
 <64603812-672f-43ba-9c5b-783d666d0ac0@kernel.org>
Content-Language: en-US
In-Reply-To: <64603812-672f-43ba-9c5b-783d666d0ac0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: guR0et2VtFG_wnQ9dG2X1Ht09SdGByow
X-Authority-Analysis: v=2.4 cv=cPR1IVeN c=1 sm=1 tr=0 ts=6adb1708 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=eWRtYoRFSfl0Epy3KhoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX46ktqxcLvP1C
 PDSeHVvKFrxJPpZWtCFSPw9Q9u0/ppC8D/DamwgHETBRdHAPwrj9u8Sv1ymOMnNO+qvgZLRIIH2
 wvqTJRMHknq4E/7U2JvYhS3WD55un+g=
X-Proofpoint-ORIG-GUID: guR0et2VtFG_wnQ9dG2X1Ht09SdGByow
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX7is5UEhvzkRi
 9dgl+x9J510Zx5VL562hyNb6g9F7u3LD8+TEFZu4e2t2+RJ5Kw4KOWCFpC23QVHqk19bKnPoAlB
 CiGnKvZbgyPn9HVLjTZJ2w+OQSiYLyc7XJLEhk5Jjl2q0T1RMrGGN0GWfHL8J71FgR1gAftfJ78
 AbD2H3JPzW0O4U8vtXhPo0sGLbBivXJceU7SL4E+/w4aQZVL+yN71XERbBiqAoxKpzBlLckF+bU
 UhxuY8X2sR2iApQK7DjSafSpeB23AD+HiUL9VifTXhq+ASNfiNmvTqoDIkLri1HggYvmiIPaxrN
 DmioPVXSh1t5nhaA/sdMwHYvcb8sp8jePdTYZE8j8LjxMkoBjmWlzc1KUYAZrE50pgxcBZ/fvf7
 wxFavjIeyiW2RT/7AhcQIPB3jbOLZf5ICtJcdhkRxOcqB9Y+eR4E/uhJ/K9wj4IWxBWByRWYc2f
 Q35v3/L2Cd9wHWtcsIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230032


On 21-10-2026 17:35, Krzysztof Kozlowski wrote:
> On 15/10/2026 09:38, Jayant Shekhar wrote:
>> The DCP firmware exposes display resources through capabilities rather than
>> through host-visible display registers. The MSM DRM backend therefore needs
>> to build its KMS objects from the firmware capabilities and device-tree
>> display graph.
>>
>> Complete DCP KMS registration, including power and IOMMU integration,
>> capability handling, display-graph parsing, and creation of DRM planes,
>> CRTCs, encoders, bridges, and connectors.
>>
>> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
>> Assisted-by: LLM
>
> Your tag is the last one.

Sure, but I notice there are checkpatch errors, should we keep this or 
remove?

   ● env: :3: WARNING: Non-standard signature: Assisted-by:
   ● env: :3: ERROR: Unrecognized email address: 'LLM'

> Best regards,
> Krzysztof
