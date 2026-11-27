Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795783025;
	b=36SEZP/SHId35fdA2GxcrfBpGK/ZeNvNuvSF6Ifak+a7uzWvuK8k4MoTE4bCQe3eCFa+
	 qouQ9a1OyHnPR5GE0dtzxO6GyQXYDBQnGE5QEpOT8FKGQI1ArCZAujmMg6if1Z16ub8M1
	 5rMrG4wX9qv54qFSgX8mdruFA+UUyKsRkzbnOoM687Z/HCJM08wCURe4hbAYzZ9Br1A4+
	 ykMaxel4eKQ7z9FRQpqp5a/0GUu8s8G6pnfKrGKODSCpnGbWa9UDGBqKbcvJzWI0CH8Wz
	 O3S54Wtc96MzodfjfHXuoE4BYAkCKv6VIS6A4sMN+ckeAk/0CW/UpUj+uZWCibH5eSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795783025;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Hh8c48r9GrudpQXzXEgvdFAldCpWfhxNFka640a82Bc=;
	b=2hMcg6WPoUwHFsIkEi8MSP03w1GRC9Ia7kwFGGWeMm+kWdzgQFHuMSfej9ettaN7ubjt
	 oSWcjD9PmcMWNXoeZ0da3UQnUOXuLZ9sKX5M+umHN5FB8xDimhxbsIJ6gOBNP8Mum7FDS
	 Y0NIzCLjLFrB3vNbBji9dTTnKT9RZD8B3dADqBo0PtqwiScm0ALe+s/ILFPYYElC7QreZ
	 t7y2E9QGMDP5Whi8U0G7hRN9e8o0nr+LhpE4K8/dJCMow5CSUr2rTmf/e7moglfa3CKZ1
	 SxQFz1SbPATBCUE/WSxKleTosQaLl1F8pihLMdY/3z4i7Lp1F/G4N3vMdHZQteQRKrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="j1M/IWo+";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AVWT93Cq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345E1606A31E
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 12:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 345E1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j1M/IWo+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AVWT93Cq
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApBXN2677189
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 12:37:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hh8c48r9GrudpQXzXEgvdFAldCpWfhxNFka640a82Bc=; b=j1M/IWo+FcBGsw4+
	K9HC2uueshvm5urAsoG24grMwN3cYSVizBuz1Ya5f/51SqolpAmiPif3k+QyAGKi
	Tlkzjua7JsClhrlKnl9jM8PH/StObrmcOiA4h6nOGXdhN+BsCD03urAiWSqX1cBa
	d8PNKBF+89kgtIOeS6Ge/XkfEQba7gsLk4Yg0aHHf8Ytwdvr3XYe4AChV0OBUpzL
	wpxMB6Xmz9AP0BHsJAo8u0BbqyRASeiOol1II/HKVznBG1N+hZ1UHOzkPXSb1ZjD
	WtJhI4qpyTCUU8Kvxt6Vnva9IMWGHGh8Y8ESpOWJEcYGJPkoA+dCttM3pAszqYRw
	Lc/m0A==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gh9dh6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 12:37:04 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b55f4f3bb8so4818227c88.0
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 04:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795783023; x=1796387823; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hh8c48r9GrudpQXzXEgvdFAldCpWfhxNFka640a82Bc=;
        b=AVWT93CqGnjbYU+lgghuuQQ8G38o4CfXjYy2BwUSG183gqUEoBVqAIcQfuo6WCrMLG
         TZgHY8/wL1viI7l3QFfmg45MRaaxSk0dsLEdVIiHp6no1/ItEADeaQlJZFTkjvBL3H2S
         Xsjw7bgXQvUep4URxW1kJuG2jVU0iXI3O9dUEeGOpq2anlZEBPh5bXHVvay+tREc8Vol
         If2dp6KSwKNJUPvC0Y1u+WiCsOmjJ2IKZvJFWw0ZCr/twGlM1LMiip1lpRd16eUIGRMX
         vs/auD9CqFvM/8Jfd4CJwxmGUgaATauPSxy+nJKMKK/m7jWIvcN2R06FrMCnjti79qrs
         88QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795783023; x=1796387823;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hh8c48r9GrudpQXzXEgvdFAldCpWfhxNFka640a82Bc=;
        b=SqOsb6k/d6n0S9S4r9wx7fAdEGFT2Nuvdk084/PvsWH2AX0Cg00xcriOjOaiji26YU
         rdtvUJNh0GQm7ecDLrhqlmYejkIATvjYsWnqJK/t4X4AnvQPwgwPSGTp5zjthffgu0/z
         KG8Uv57vbdain/fqc1/7Qc6oNaFSTFdH8wAVoGbHvLiRaWglOt3bPHobN2Ar/TFdjfRf
         brX2dnXJWHo5LBNeKHB11Mn499JaQKWBk+4kQZS4boZQkaMxdl50YvkUr+I75fnEsSje
         /bx48kSL5VYHcY963LbP6RUm3PShiBJRTdqJOkzuvHz+pYqMX5TQY0tKK0hha0DuAWDS
         swXQ==
X-Gm-Message-State: APuU4Z9aO4vjm5QH1fj/gMVwXWkFhStHqmjC+3FTl9VV8Uv+6a6jtbly
	A393hA9cuEtXYAEpCohm9qvOlJWKvID2//ZfSzvQyWvGdspKDdTnPAbJaRWp0OHC+quy3GMU9aK
	MXUwsRo7FCbltdPRzbK+uhQ6XycnEh/q4Xa4RbyFLv4SN+LUSdGrA003l0Gi4Q6wUWA==
X-Gm-Gg: AZFdTZd3kdm2iAqsUfXPxzxkZzjYnwLalxDlGdmeGsFpEjEFfAWssStQgXvUf7ZW04o
	yEglYxgjRzYsauBVez2PhggGMUDCLXDkvmQkAlioQLnam5krsDWBdnl2BvpJIx5YAgU/es7OePy
	LCTRmEyrj/ejGDHh4DVnLhUnmEUZAcEoL3WhDZJSEJMTrpQF15siKcPidHUAoMhiWgz1A/bi1xG
	DEIqfTXgig2OTyXW30EGhsYgT3hYV5MO+cap82b/etpklH0LZXT32ooSUcfPKIdOibliEiI7tv0
	wNAiGvhOX1qhcvJamFHcff2tlXAfN7A4dcwtCqoLKjTKcIYTktFjRDylxnAbh4eXmKmPGIKuvwT
	lw1t8AMxBCyE7TVaBgmpn/TFhW5plUsf4NrPfqtYoqLgGAR+WeXvrHNDVbsbU9M5KWKy1O2zvoy
	C1oWCF
X-Received: by 2002:a05:7022:290:b0:1b5:dc3:209b with SMTP id a92af1059eb24-1b5568ac6b0mr22594254c88.22.1795783023073;
        Fri, 27 Nov 2026 04:37:03 -0800 (PST)
X-Received: by 2002:a05:7022:290:b0:1b5:dc3:209b with SMTP id a92af1059eb24-1b5568ac6b0mr22594243c88.22.1795783022646;
        Fri, 27 Nov 2026 04:37:02 -0800 (PST)
Received: from [10.206.111.23] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b59d8c0cafsm3430688c88.7.2026.11.27.04.36.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:37:02 -0800 (PST)
Message-ID: <fd5edb54-0ee9-4aaa-ad0d-9e92c15e6779@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 18:06:56 +0530
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
Subject: Re: [PATCH] media: iris: Fix encoder reference buffer size
 calculation
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261031-fix_enc_ref_buf_calc-v1-1-54dcba5977a8@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261031-fix_enc_ref_buf_calc-v1-1-54dcba5977a8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1MCBTYWx0ZWRfXxQsXlxsKbZ/G
 p0PzYvJLu1PbNq5btKQcJnRV5iVRsXL5On1XYa3HPIJlVovk92b/gn9VpElu+75aQ0ZCo7Ejwqp
 ReaInTVXkNjg8rG/VqwSYKg4SBLEN5o=
X-Proofpoint-GUID: cu2STIUM7WesKaiC0inVS8NFiLZkYgkU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1MCBTYWx0ZWRfX3rZl3/7hmTxq
 sXNe1pl4/6jWhHL7GafRXaen9ixj7blP+PRLl/NLsq9K114n9F+ZVHqFuF3vctSfaumyMFx3h+F
 UhT3mosRfe/CT6cHQNgfICkm1EZ7KUKtsNtTm5P1OIg6dDZneU3ECLIjWWCFIfcuUv1A4xTGePl
 oDhL/XQDE0X7P9B/e5xfk7y6BCMwGJGVBbEq/TjsENkyhRnVQuyO1DHOfQNYF/ZGw/drnG3hi1w
 MDvkJmy9a3Br3uRiRB02dRioSopltrp9sObugds9QrzpwgS+43x7wybqfFhawcNfrjew7SiUbMV
 JM+UeC3ijgrVYtpw42l99WQqOKi6EhoyLWygaVnsjusbIPCE22Mx2LxA34bq2q0tO7ndE/uwaJc
 KTgPRNdBPZwPuXJUoXZapE8Pukobmaqx8OfTllegkt795ce2Vbub70VYg+mHLOPZ9h1J9Z199A4
 Us9TWDlq6+QgzcUnMMw==
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b097970 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1hkGSTuj8OjxEnJCJEIA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: cu2STIUM7WesKaiC0inVS8NFiLZkYgkU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270050


On 10/31/2026 1:43 AM, Vishnu Reddy wrote:
> For frame widths that are not multiples of 128, such as 864, the
> encoder reference buffer size is underestimated. As a result, the
> firmware reports a session error when starting the encode session.
> 
> The encoder requires the reference buffer width to be aligned to 128,
> but the current calculation aligns it to only 32. Align the width to
> 128 when calculating the reference buffer size.
> 
> Fixes: 61528e86687e ("media: iris: Allocate and queue internal buffers for encoder video device")
> Cc:stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
