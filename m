Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8AD45D184
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 16:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784822835; cv=none; b=bhIijDnPHfU1MrJZVOEgzgH6gLBtZ54aou+n2lMHSHYSZIA0GoSyRsGA5RHg9bwVhjssZwSkEpfpVVNFu+eULWZnC5VTxEwUo+rYFlqmfIUz3A0/+qyDnI84Cy88JBD1lEdpCvfRENgmo3qFHM5d7+sC6cro60tyYDPEBzcSTiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784822835; c=relaxed/simple;
	bh=ZXtMHVAz4HYSnsOa+kZYTp9PTgUV1FfFoj3cbqVBzQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=agQwu36iuvLOJVoRXEgydtmmu7/61q5gOc5oKHKLt/sXzQKQ1eqW1SDM0sUR1S/Kq/zRDn78HznNe2/hECB8RW3OMfUoJv6EjpoJoqGKSri1Vdsq8I1xfXzzY8GJxlLCoP06D4PUY2TRMGNUOyscVp8w315XR8OLmJEUwFkTl98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GDgvCcHX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cg3/CXjd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GDgvCcHX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cg3/CXjd"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NF9B7g161818
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 16:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kMVUSKeqQk/HVpPVZ69ldyBYUnlOk9XEnsC6LpCZDvQ=; b=GDgvCcHXSENcWL+0
	Y4f2WqjBDcOrvudKeQno/mcVJ+3KXGk3IDT6iY5lY421zgqE0PCk1wz6aaeBarZk
	AgjJ07AkYjLGOwHwJduJU6qHk6c4fqEGpqpRFqk8JjArK8s9+TO66gqJKmH40XX8
	Koh6QLcSsw5EzPAdxy2SMAzKl/l84M9cKWsquhb2R1qJA367sr/ZFqUqZRBGmUtf
	0IF8NVbvB1RPjR+JhIOwa3lFzOxjf/1gPuL9LxGfPNmLlqCEced/53+1436ELdHc
	ROG4DzaCrjliJrDuvojh76A+iC3is2u5oudVyJ9iSrAcoXAH4dmuJxfoxxHbd6dB
	HNORqw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fknbmgcpb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 16:07:12 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca7c1e22995so1544211a12.3
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 09:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784822831; x=1785427631; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kMVUSKeqQk/HVpPVZ69ldyBYUnlOk9XEnsC6LpCZDvQ=;
        b=cg3/CXjdzUqNrEbzkQ49bfSOTozLrNAyoCnkE8V5C/HOPpG5I33wfZ0rIFde2BhPIk
         OeURwi14PBQ0z4s6OlGtKg8wj3XvUKyuSAmB6H42ERti6vHyxXNl3l+t1fAmpbo39QCJ
         b4g/7MTnGe5e+hxzehcbzs4A06fH7y7n/jgQgUJwJKIiMwkJ3D1E/Gx4GLsbuiuZ8C50
         p9vSOMYxbQS+qWp0g08rrKoiwFAijzE01fMQ+uuZPn1U3SdtSt/4z88FzuBBiUApuyIQ
         vd9N4fNTcSSD4DZJjlX1hHeNV45Kox6Vl/KDNOUTd1FEZ8Hr/shVKh9L+qeiboaa+w68
         Jsdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784822831; x=1785427631;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kMVUSKeqQk/HVpPVZ69ldyBYUnlOk9XEnsC6LpCZDvQ=;
        b=pycSDZkGmmOVbOeJA5+gyKTckWuDza5OXilqHRx+LAYZB3GzKInZBNUX01N72FRhoI
         2cXuchK6N2Kp58qqdOJxUmX0XyG7cwfa8lfW+HjVeCvlka+S6PAoP4MwS1g/YkPqvMEw
         OcXcAVdqmKMahFzqVGk6C0CaQ4e2hXuTHFUqdMVUuMoqYfg617Z6KpBn+ri/IkFjq30m
         13mQAN37H1NydvxmCMovID6LmIR28LQqGKqdPggspomE/IPZ1XP8uYY32QsyHtDZ68Fw
         cr0BM6HFP5REuYsTL0DgPcvGj28nLYSAdAazCxVP43f51Iu1HCbZomoVhkOTTjgH8deA
         DXIw==
X-Gm-Message-State: AOJu0YzX2CwqxtHkj8lGq02IZbMvXz5qJCnZQg73mYTpQNnU9uI2I+sN
	GTqVRXkdMAXL8bTCrHI+zClzNnL7GpuMgMO3owdV1iw1tvRptLNenc9P0Z0ZlGX+PoEgJamXWjQ
	TUBU2JxKVDawFFExIZzRQ2qEtAsOJ5EfNoiznildj7/bbEqjgiP+vJkRqjwr/MCDrag==
X-Gm-Gg: AR+sD12rKeRV7okbHx8T3r0EmvCtI/BKkM8K0P2B/NepJ+m3yIzZ33J4I5egyUN8zqz
	dp72SZuQZkwwVLNpGCWCmwwGYj5wog8ntiIQgotgQCNDlo307aQ1LuLy09KD6tgEpzerIx3jLN5
	+572HlPwyV5YPnxSbqldO1BTJIpXRQvDINDYAkPXCKsXaU/y3/n9PRkvSgC6XMb6AAvNcFtc3UU
	LHbzyt7owOyPxsav5RkQao5MJYxWIJpk5ElLOu4C9sBHi5EZeDPl7cvu749lzw8JfrLf9EzfFa3
	DFps0pHcq6r3adZDu9fnglqZfhweOtvHVgp/YKSe31a+KUyEa0S0bAcwgZWVrR0s6ubzOa7P1/v
	2Buuillj8jgTlrrfkMKbVMrVorC4P4/RIVr4=
X-Received: by 2002:a05:6a20:2d28:b0:3b4:81b4:9b79 with SMTP id adf61e73a8af0-3c44b18d9cbmr4508575637.40.1784822829064;
        Thu, 23 Jul 2026 09:07:09 -0700 (PDT)
X-Received: by 2002:a05:6a20:2d28:b0:3b4:81b4:9b79 with SMTP id adf61e73a8af0-3c44b18d9cbmr4508527637.40.1784822828486;
        Thu, 23 Jul 2026 09:07:08 -0700 (PDT)
Received: from [192.168.0.173] ([49.205.251.199])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc9d932sm20688730eec.12.2026.07.23.09.07.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 09:07:08 -0700 (PDT)
Message-ID: <66e699aa-2491-4d72-bff2-f3248e1b9504@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 21:37:01 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] media: iris: cache work mode after computing it in
 iris_set_stage
To: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260723-iris_multi_slice-v4-0-45f0a3fe7fce@oss.qualcomm.com>
 <20260723-iris_multi_slice-v4-1-45f0a3fe7fce@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260723-iris_multi_slice-v4-1-45f0a3fe7fce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=e742j6p/ c=1 sm=1 tr=0 ts=6a623c30 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Am0+rXbGVt9FyytbsJdRwA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=JqmFLhbGZVWTxik8dDAA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: mjuxE_uKsY0sP9n77Q8-q8Eb3mw0eVrT
X-Proofpoint-GUID: mjuxE_uKsY0sP9n77Q8-q8Eb3mw0eVrT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE1OSBTYWx0ZWRfX9r3JCbqP0eXc
 IWkiifoafQVF2+9CQSpvSC8ZRG5xzC/CK6c9F4zcBZys7u4RC6WYJLY1P0otzy067QhMzH3brI4
 VSNW4eHhz8B6b7Ihz6j+JnW3kXRA+WY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE1OSBTYWx0ZWRfX6L30wRvtSHz0
 lai1llJcSVtnQnupAYHLvy32mYEBGf6ncUP8ND+HVptYiMWpvBnm13sREUwJsfllCdmkH33J5Gp
 4V7+qai7MIPHvdX/pTz6M8WxIpWLO0piDb9Q5Rs6hSgTkh3sHr3DZPSJYwUxu3Cp96OxPrTadeO
 KlXSGcotfTjwYuKKe82R8EbTeVq6LVQopFGUxUI0Guy9xNz2gDuGXFzFpU7KClvayjEtjMXiYS7
 Dh6fZuoGjUu3ZMosGNJnkhIbnjBF/yUmxoVCZqvx4xH8U4I/wEvf3j7CK/RY/n9epDe3crckvRj
 QSl+bOxq4pIe+OYdL3Sr7ULAYc+2P8j5BPOJghKVf2yURpuib8+K77KCHL96cowdZHHaOVA+h82
 8phmkswCcTu324O42r3Q2ZKYPuIgXDfz3miFXc3CjLsRMLFPhL/y3KSb8apUltj99IBFDooWsuo
 iHhRIez6IG+IGcVaY1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230159


On 7/23/2026 3:51 PM, Sachin Kumar Garg wrote:
> iris_set_stage() computes work_mode and sends it to firmware but
> never updates inst->fw_caps[STAGE].value, leaving the cached STAGE
> value stale. iris_vpu_enc_bin_size() and
> iris_vpu3x_vpu4x_calculate_frequency() read this cached value, so a
> stale default causes them to miscalculate buffer size and clock
> frequency for sessions actually running in a different stage than
> the cached one.
> 
> Update inst->fw_caps[cap_id].value with the computed work_mode
> before sending it to firmware, keeping the cache consistent with
> what is actually configured.
> 
> Fixes: 3a19d7b9e08b ("media: iris: implement set properties to firmware during streamon")
> Signed-off-by: Sachin Kumar Garg<sachin.garg@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_ctrls.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
