Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795782778;
	b=urIeL4MTQOjKwlqAFR3rG510ss9w9P2lXEpKEbfL1XcLi/P+lBJ+48tcGglu7YlQ0+nF
	 c9HCJQEbeqvNGopF7L3YNzyg8Xjqhf2Iz9HUCVxnRrovWr6s16FJBr9HKmY1F6EMWIQ+o
	 Ag5EGUcp36PXXPl7lmRHg1IaAP706VgEs0KLj/J3aWlPyoxg+vOGXSzVuEHOPNr4IGedy
	 ughUlu+huTKb+lRfWapL7YkS2JFI4L2pDJiwF2eK6RWHe3RGRURJttKOEZaZPBC96XWpD
	 eMdHVpZ3FKxoj1ox3REeJMkF7cl1X2/rreBMCArW3SzQ8/zAJThFXqYOl9AQHtv16uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795782778;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lY5U//Y1MoIFQB+NMq1uCHmr9m0HETe5o13kE0TkWj8=;
	b=tOw4q55Vp1GyRGcS/PrhPmKteTVQHtBkJvOoeHRcyVgpsttOvPYC2zRUUiB9CukCzwhg
	 6G97pakO/2QnQ4fdMj+kpuJe+nkZAs74UToyVmqfrFw63kaOUohzvE23qedixiB0RlCZZ
	 d4C6WK1cW8AKUwYsn7o36kXMYdw8bu6gMPuuWZlRm7vwLfRpit7BzWjR+FBcvlRCnrziy
	 HmQInSi4zrShC4fYWeR7o97II9lccD38XxvLjq4mmdRm2MdXqoVG/ohq6wnNzqFCaLPug
	 uQiMrMNiteHSnPEeVXh7Q33rIw+QIMmzrzch8I1jRvH7WRf7UZpIp4IK4hfRUrAgIZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=avzUtr3n;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="OeIBG/JF";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF0A606A321
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 12:32:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DF0A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=avzUtr3n;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OeIBG/JF
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApLUd273499
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 12:32:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lY5U//Y1MoIFQB+NMq1uCHmr9m0HETe5o13kE0TkWj8=; b=avzUtr3nZXCAa9A4
	fuB56zcDLfz6KUeZQLgboRX+pXGjRywxmybliYiRv1AQ1m1OaMTk1ukT6MTqP2k3
	8Cq04pcryUblS1gl/0bA0cjsRywGwNr6fVCXtdFFTizxtux1LgyM4d046TpQcXv5
	U/C9IjuAFcTkPJBPuvNzoqrst8cgOIzZUPORcgcwgZU44MgMiBZTe+aq4EO5PzEm
	0NFoBcL4SrhVxFD+PjSolfypgrZ7kRg9yA7AXdRGauPAKolxGeXNWdpGwoL9dnut
	joEqwxaLezUrTXKMCdKawSX1vSewY4glR9e6ZzrCcwp6okqlHhzs7GAIbMOXJt5R
	iQwijg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u49ayxf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 12:32:57 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386a65fca25so7154605eec.0
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 04:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795782776; x=1796387576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lY5U//Y1MoIFQB+NMq1uCHmr9m0HETe5o13kE0TkWj8=;
        b=OeIBG/JF02GMhqHdhmrrT4r/7VlBXDKPu1kCWAeiEWbceJ8g6SKLAufZ9v3Lg6BkiF
         k1eW/ltEZUu0Hv82DZPFQMz8EjPDrvwSIsjRhcqQL+T2n0xMyTJZFkF7wD2CqScMBK1j
         lba5WV4o6yBJpIPG17SVTHQvNWI4IGVEbApUP18OXFdN1AW5D030CGTI1ITJfTNAZ3C/
         2dx87z4xUNaNMWeqXm/efpfPvN+SbFPU6/t8t9bYhD1W8HEVCTUQ49lVdwFrFhY9NnAj
         EXEwZ73VjqCyP93liR0yNc9NW/cjAgCJnelKe5/Bm0amdr1WZYJy/9rMdjuPhm9FSzNv
         Uz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795782776; x=1796387576;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lY5U//Y1MoIFQB+NMq1uCHmr9m0HETe5o13kE0TkWj8=;
        b=SziQk+vX5AcDtcBpU38FywMhHyzZ4ncZRjg1ZDGRJZyjciDfB9nV9m4KjAVv18Yz4t
         ixGwBl9T9LcG3Rc7geFiQnkuFpuTpgaCUGJEiSRASBj9OJubdWaAJZhY2YOCEoyUUkjZ
         C5Pk0xyY/BtnXCo2+rRDM2HCWhypcFPt2gDzvdqfEDD3MIanzPIhYd4AQcXlEi4q+buW
         fySjbtDxdhWNOyoeCjbfl1FjZWfCuepkU8Ub4+JYp1QVnXKhv4sFw6j7/36u3wcmK3vL
         mfD3/UXOEyGiO090LDsPcv+17B60Q66GCPMBq/cmUbfs+4RVrrcl/ZIxK1SvGtET69WA
         lFOA==
X-Gm-Message-State: APuU4Z+Cq7VUK5GMKwyhQuWWkcOdZcVus1ur0EKsKvZSMqY0e7cuV9RV
	VykEeRxn7KOCw0h00MOgvAZkL0QhkLWfVub5ltJWuqMJ6ZLcXfijOqeYOZ4RDxZezV+cJbf/kcV
	+pU9uGZ0ju1s+qkfmI8iNLsnWLnzyMdvF7Epgfzu35UW9iZFlEWwn8WqxUCoR/DSFIA==
X-Gm-Gg: AZFdTZfvEakVHvGe83kRGoBiDsra0Y1tnbEhuFDdqbQsthqirDUWf/E8/GL1GZilyqW
	qvt9AYI3GZ69O6Cya9wNGPfdvUGcPtUF6qEkrq36BLrKVmWyHOqgxQOOAA0PTt5pRqtBmCkGDwb
	WVbThgJJC4s3Sa5pEWBF44tTwXZUPQOf5oA3tNFG9s4L/Wjc+snW9sfcOC5+6MSBUz8sxO1LWDe
	SLjDRITO/yGZjYbfcod5KHFyui8lzgfgF8u41vActpB+GsZCzx6o0bphbuzKtF1ElRgHohufHSi
	dU4LhhnmWhmYIPh79hk/3UV2wd3+YcRY2HoLUX9TMTUu1QQ5jet1YRdBabzT9TB8IrUITTcfo+h
	tDfL4eOq7nWBOaLRnuzlT2lZWW5Y8AlDfnrDAOThrDKInxjHWpQk38rc1Q2FUuOFJY/8dFKvyIV
	T3et0l
X-Received: by 2002:a05:7301:6187:10b0:386:a193:7eeb with SMTP id 5a478bee46e88-386a1938b8dmr19602461eec.30.1795782776519;
        Fri, 27 Nov 2026 04:32:56 -0800 (PST)
X-Received: by 2002:a05:7301:6187:10b0:386:a193:7eeb with SMTP id 5a478bee46e88-386a1938b8dmr19602440eec.30.1795782775925;
        Fri, 27 Nov 2026 04:32:55 -0800 (PST)
Received: from [10.206.111.23] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b1965c02sm39048211eec.27.2026.11.27.04.32.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:32:55 -0800 (PST)
Message-ID: <576033e7-e52a-4ad6-a594-d64b3fe9987f@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 18:02:49 +0530
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
Subject: Re: [PATCH v2] media: iris: Fix out-of-bounds read in timestamp
 metadata fallback
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Birk Skyum <birk.skyum@pm.me>,
        Deepa Madivalara <deepa.madivalara@oss.qualcomm.com>
References: <20261117-fix-oob-tss-v2-1-8bbf753a4ee0@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261117-fix-oob-tss-v2-1-8bbf753a4ee0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2v4ATuSdR-TkCdy7nrxSgZnblmWy4JMD
X-Proofpoint-ORIG-GUID: 2v4ATuSdR-TkCdy7nrxSgZnblmWy4JMD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0OSBTYWx0ZWRfXzuFoWtvQhRH/
 lHqbqR+UhgPyGXnY0NKuUDRZl/onYWMcrMXRUQwnD1F7RXC94b798WOK+PiR3imwinFcbkQR1vk
 tZa9bA7GBhYBKcawZnZX0tsTnBnv0vg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0OSBTYWx0ZWRfX5mLqFVg4bz1z
 FMNwD+EwYLmmQa1zQmLqMZvFJbc1kgTrFejl4IH9BEYgzW6GQMLnrz/EW3xd/LY8/9bN8adcfOL
 3X1B1zcBBdZ+NKnE1cHERGvsquM/r5/5C4JzFk845OzTn5nQ+GlKroC/Qk7KIN8Dbtd3DWyvNNF
 1VHsoXodEmZMd8AhrkT+IQJeNBa3E1OMlGo7FTnslEqg9ylH97RM5a5puqOOqwBfiK+Koawi8jc
 3ZuxLn6GZ2UY050UQhs1sZ+s+3q2JSJctZr4BzNutG7q++yH3jypNZ/49KVEiC9yXipr1AqSGZR
 ks9Yvn+ir8n+/e89ECJXeCaGlHB2W4lvQLTVcaw5pncsB3Rw/ZOIB/RI4WICKHcM3Bv92gI1WKD
 WMBv6GQQuGESfAmZiHPt5rQoQFgyXpj2wLJVt/m7MsBJu/KtUrkB67qd4wIzeT4qWZfCfpBuOq+
 sAbLRqaswxIZ6T0h9Lw==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b097879 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OTlaKp2eM8LF8brwo7IA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270049


On 11/17/2026 5:13 PM, Vishnu Reddy wrote:
> inst->tss[] has VIDEO_MAX_FRAME (32) entries, so valid indexes are 0
> through 31. iris_set_ts_metadata() writes at metadata_idx and then
> increments it, wrapping only on the next call. After the 32nd input
> buffer, metadata_idx is 32 until the next input buffer is queued.
> 
> If iris_get_ts_metadata() finds no matching timestamp in that window,
> its fallback reads inst->tss[32], one entry past the end of the array.
> UBSAN reports this as an array-index-out-of-bounds error.
> 
> Advance metadata_idx before the write instead, starting from the last
> slot so the first write still lands in slot 0. The index then always
> refers to the last written entry and is never out of range, so the
> fallback read needs no special handling.
> 
> Fixes: 17f2a485ca67 ("media: iris: implement vb2 ops for buf_queue and firmware response")
> Cc:stable@vger.kernel.org
> Tested-by: Birk Skyum<birk.skyum@pm.me> # Lenovo Yoga Slim 7x (X1E80100)
> Tested-by: Deepa Madivalara<deepa.madivalara@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
> Changes in v2:
> - Wrap metadata_idx in iris_set_ts_metadata() instead of fixing the fallback read (Bryan)
> - Link to v1:https://patch.msgid.link/20261017-fix-oob-tss-v1-1- 
> fb86f4cabf65@oss.qualcomm.com
> ---
>   drivers/media/platform/qcom/iris/iris_common.c | 4 ++--
>   drivers/media/platform/qcom/iris/iris_vidc.c   | 1 +
>   2 files changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
