Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793184145;
	b=MzMbd/cbf73DA4v7L8W5r7H3ieu0wCtHEGprHpzoV0M6zSZKsCXGVlg8hDo4oxDSteR+
	 afjTuS7u7jC+qLJ/k11+qzuWWdi3WK1P9WZ60MAy5gnWeimZUdbx0+P7cQas4chwl5aDn
	 GG7z4EudJK33f2LTMC+smS6gJ3BooNn6zv7lRkHPBh8grrSPUS3C7Zmf33hLCRFx0U0KO
	 mrVR0any8o1rfoI17DghmGAwQ0TcbvAmbAlaWVnWPQPPB2QAz4Ravk2Auk9gzI28Njpfs
	 QYOvBvoBezTXo/6QVPdxqxQNznChhZsrBCCsfPx7Ln+kRYegmgBqniD8iTuP7c8ZFlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793184145;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qhXGeFfyEPBAlzjmWsqA2M1XI8IZO5q4l9rV6x/6NFc=;
	b=Qcp4qhngNpNj/up72+0HDE7uq2ZqwQc65DbPDOBEXM53yEy2Vl4ApJ5CLnV1hJwEmQK+
	 4zO16W5zKlbg0RL5hU3Vcy0NuB88NjMBeefNUGhQxpl/KdqPV59zhkzWLUYsKIgwDYbJ2
	 Xp8meMgZObiT2ia3h+QQUlEV/V3WRTorxvZljGVzw/4jrCFmqRMCwjwKsBuu73/trSuVS
	 KAIoedQSfFWOuN2bA+M11Ifv3gJqjBy2R6XKc7Ur3nUNpQKL87cvnEWgMMPWQy/c+SZtI
	 sRYTmpJNed427otGa2fo7D0nR416W4zqldOdTMlL3uGxd7EQyybv8uxNdlXyg2vW/NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mmLAmyUm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kfBdqoeI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6889B606A331
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 10:42:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6889B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mmLAmyUm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kfBdqoeI
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8K4TI557251
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 10:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qhXGeFfyEPBAlzjmWsqA2M1XI8IZO5q4l9rV6x/6NFc=; b=mmLAmyUmawismWCM
	8D1zgUydQ1Xhy0P+VxZ0PyGm0kc7/uWAHcrFCJVniY9LLW0PtJmObLbQ53/nsWr/
	CkbEEd2FsH21X2F4FW2p0R2yTU3kHIAQWN6ILFgLYGx88ZhTBJdo6Nc819UQwAmB
	XSw5K0I1fIuWgCWjKOQuT8mJpj1k+lz4AoNT8gc1rHESfTlLglKUd80vFkKqlgJ2
	rzB695UWp/wYvMzKlsu7kXFI+2C/+EuHzk8yiVlnKjYvCAFn4PgqtXtbA0XZZXSy
	1SHMQloONLSwZVaAY40+iOpWtV5f+j54p8Ck0uXszn6mtkTzk6+j/ee/SBpa5pyN
	9Zp6Ng==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk82tsnma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 10:42:24 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad3fc547bfso897378a91.2
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 03:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793184143; x=1793788943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qhXGeFfyEPBAlzjmWsqA2M1XI8IZO5q4l9rV6x/6NFc=;
        b=kfBdqoeIO0DRvKVGSd/doQ91F/4i/COtBaN2RGThuLLqL+GPRIXGi5hOIQXtXQucHh
         HmWeGhiY2r704PR6JraNEwE5rvjJOz3f+ja+1oWGQ4893jntRA/kBawued1AuQWSB6Nb
         dTiwommSdDP9oDqLzGNPhud2rzMPAN/oIbQMcjLQsELdChmdIWKlhfUJ5+bZnP5Opkqi
         6ojn5ODmaq6f1+RAVMLygCA35R3qst0LTDrq18AZVXcBhujC2UB/UwVIibNK37OHJdIW
         f4Yotz9RoWNmh9kBinPruzA/wO7y7lPN9UMTlUBhy87aOlBpcDHsJDDUaivV9FRFwlD1
         H+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793184143; x=1793788943;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qhXGeFfyEPBAlzjmWsqA2M1XI8IZO5q4l9rV6x/6NFc=;
        b=Ae/d/WK6PwD1WHgEqhKnTBmT1vt760eJhHOCUPGHRuKeR8qievvu29yLXktWPIci0e
         Z8YEJAul229LQUz8rHDAH0JEd548roGaDlbpC8704XqzWI39cfdHF7uQmKQKDhVUk3AJ
         Y9krHuzuv23+lhTSa5r43DYOMWmofk6OLDGd9qQQOLsAqBIm0mqVeTVPJmyQVpMbKTaH
         5efYkZ3fApv7O3IYiLltlU/AnWazaLDOwKbqBjGV1ThmB/5NaG3rlTr9wpYFQwl82zzQ
         WINI10A8Hr/ihcoyGdxmya84jtnqDnA2WD2Pi4sMtYnW5f4DKuNiqWD2Sh1icsPjoHQR
         VibQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbtv6VIM9/Bf2LQMwun3TLBlB9lVVg8LHmsQY1bsPB7pYPkdE6TvDx21tAh/QH89b+bFqBb0ggrsK1DA==@vger.kernel.org
X-Gm-Message-State: AFq9FYI5JxAWxSBkBY9tDmtW0tdfj8U0khLyc7mA0A7TTGEcN7Ooh78n
	khB94jm0/5vUqumBRzd6nDMvbKRJ9FfYsTGYqb9BJbDrr8OskDtVtuZebqn0S9JvZK1JRFgxtws
	JOML2+NASicxTES0J+zTQNrRfaVmelmkdtwI/0VrMk5rFNLYeHFaH9mAeTY/6xk9riQ==
X-Gm-Gg: AYBFou0GIbE5U1SmN9msr1rWu8UHqFtDQEZcsJOEp7FLGSmER3GW1OegHfcLpEBtgnR
	wLudXoW6pvdgPirrRYXbixx833QFgoQriEHnMhwGDEzkLlji5l7Sf/+/w1d2mMgvjnukEh9s+Z+
	GhdYgpRzVDvjefkB4uROJLFLzqBjJQLcU/YlYpI8/b1cIxQWZVMjfnlyPSrIDMk+K8qpZKiTVdy
	oXEh+qvf63jzWp9yz7qsvQRjotPdaSbcrhG7EL59oa65tdd4jazrzSBVK+ZZK6ZICIQ5UWMiQl2
	dFP35uy7n9bKyTZtgV+KvwlfgCUcpvR2bqHyKgnYmH3R+pURx65hbQChPvNT2U12YjBiRZbxFMF
	UtOlXqGh77/5646/fZ/lJYfD4uEZNH0Rs7H7Z2N+zE+WNBiyBVYYIFKo7W3sZovRl/2GG13zsFo
	D+hP9PjA7QUryKTPwrXImbL9fXbVUsn5v9/w==
X-Received: by 2002:a17:90b:2e48:b0:3a4:a592:4cfa with SMTP id 98e67ed59e1d1-3ae58250508mr1449751a91.45.1793184143105;
        Wed, 28 Oct 2026 03:42:23 -0700 (PDT)
X-Received: by 2002:a17:90b:2e48:b0:3a4:a592:4cfa with SMTP id 98e67ed59e1d1-3ae58250508mr1449738a91.45.1793184142665;
        Wed, 28 Oct 2026 03:42:22 -0700 (PDT)
Received: from [10.239.96.176] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a9a58d1sm2493140a91.9.2026.10.28.03.42.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 03:42:22 -0700 (PDT)
Message-ID: <218d69dc-5761-4a8c-824f-7a15307f54a6@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 18:42:17 +0800
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
Subject: Re: [PATCH v2 0/9] media: camss: add SM8750 support
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>,
        'Bryan O'Donoghue' <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261028093003.722745-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <20261028093003.722745-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iMzfGBoXbhy5n7U9gFDrd_VomjR-cAP9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfX7qX/YeIzm/kD
 /ggUqL7oaa404KhYgdfX1e+jYdVZja7BAOIKwVDboy+1WbPmlt+bj4gUbfT9w+yzJIY/DbtnYO9
 2e8gyoHI4pKOKql3aN8WNgoA+3M5PVY=
X-Authority-Analysis: v=2.4 cv=Tr1zFzXh c=1 sm=1 tr=0 ts=6ae1d190 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OGqcxO2SmPZ7BlYD9rsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: iMzfGBoXbhy5n7U9gFDrd_VomjR-cAP9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfX5NFCUv2K5G8K
 hFNrKmWlhXbYwbS/t/vAGvK1Je4KJGcAYxyY8jFKvbw+hyYNfMt3J6beavdjC6jTXmJk/MsymBB
 K7LQDiPfbhZGJpdJTW78ceweFmNB6NqwwYDizdbDVImknRr/5D4WqX4pTmBiJj3fvDVqpIq0Ofi
 Nmp0qHFyh+4oGkAqI5jBoZtYQP+bGMM9D4oEeUvZzKkkiNkHhTNDkgnRTg97jRaIRd25XkghqzT
 hTnQ4i7tnYHMJrYBTaXqL3yNumhv/wJKF2DjhtHjp+oA1IOyvfHWllvN7e9rTggeiWVHxnLm7a7
 2xSxl6QIkb4QSccU0q1PhDxh+7z26ZzVEShFc1GSTx2Z9I9QLv16tYmBli49h6Dv3Ai+IxEDEoU
 +Xa1BlcnbWr15Ndr/NtyrDw0B292w1uHcBCRlqMbgfHPwBa3g01SXIxE/ppjgXkuCQ2JLvfv3EG
 kFpK4VCeMiQbXXOdZYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280042

On 10/28/2026 5:29 PM, Qianhui Xu wrote:
> This series adds camera capture support for the Qualcomm SM8750 SoC
> (camera subsystem block with three full and two lite CSIDs, six CSIPHY,
> three full and two lite VFEs and three CSITPGs).  It was developed on a
> Lenovo TB322FC (Y700 Gen4 tablet) and both of its sensors (rear s5kjns,
> front gc08a8) capture at full resolution and 30 fps with it, through
> libcamera.
> 

Thanks for your interest in this work. It looks like this series is
based on my SM8750 series.

https://lore.kernel.org/all/20260721-add-support-for-camss-on-sm8750-v6-0-a5f841061d18@oss.qualcomm.com/

However, the original authorship and Signed-off-by appear to have been
dropped. When reusing someone else's patches, please keep the original
author and Signed-off-by, and add your own below it with a note on
what you changed (see Documentation/process/submitting-patches.rst).

Also, the follow-up work on top of the SM8750 series is already in
progress within our team, and it will be rebased on the Kaanapali
series once that is merged.

https://lore.kernel.org/all/20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com/

To avoid duplicated effort and split reviews, could you please hold
off on posting this series? If you have improvements in mind, I'd be
happy to discuss them on the original thread and include them with
proper credit. You can also split the CAMSS framework part out as a 
standalone series so that it will not influence the sm8750 CAMSS series.

---
Best Regards,
Hangxiang
