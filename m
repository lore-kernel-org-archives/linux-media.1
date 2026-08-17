Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5AD40097A
	for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 11:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786965486; cv=none; b=cCkRfUzbWmkxH/LhvlfhGQbeLrUOSct94Oeg0F4gCivbYqQaLrP+sEcwi7IUK8vjo514+gI0Lz0UYMdm34vQMQYK1XmgIsXOBW4/uMIj4Fs0Ar4ZAdEo6dbm2FIzgdx2yfTbY1xJ1T5SahUqCCEr2v5LBpRsZuyq2ka1dyEkUbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786965486; c=relaxed/simple;
	bh=5uxucTk7eTZd+La7Trd1J835ZURAIjcpXzBwe/UNS98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H9KkDmXoajTlsZYU9Vf28UcMqO/DyfGeD3VwrdIUPyPho5GfHL+shmWlZ1CIvgHlx2tGM46S6M+8yc7qSuWBbaBFKZ/ZYTMn+kbSSv9xJJslOW4ZTOdfoshdJvnDw+gfqj2CQ5KYejJlQgXOKekECdFLwe4SYBLq4JGQ1Xr11KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DrzK7fd8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cjAwP4xo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DrzK7fd8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cjAwP4xo"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H9df2p1771362
	for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 11:18:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	48xuEHCyTIp2FrB+fbWbrU4cB8gD2ymVui85i5t3Ics=; b=DrzK7fd8FK2r6l7Y
	YIUFXFI0UTtoDQETbLJX3osYM+Guq9344kBgmrBGq7pkDT0dmaNutLpBDGZkV0Z9
	bnZcMBCW9ErPQ8aq2ihlmfipJ1GtOWqDkqg9AWaIJ/nG94881mEtfGrpyVhGUgj9
	eYrwEW8IVXV18B/86QQZBJnOnfujNRnwOKu8k5pxJq2FBImAe846yDFeFtRc4z78
	Yi7A5KlGa8taCRPtbN+fOYwJjxLXwGTShW2PbPCrfgi1Y6H6WK0pRTD5PsFPPdTp
	bs5S3kzqJ83ue+fYEgOt0KjyDYqvt0iNdBmGpE7qiWIQpXlA65a6UYc2/6F1sFlt
	dV4iWw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xyk8m0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 11:18:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52b4e315000so12375941cf.1
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 04:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786965482; x=1787570282; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=48xuEHCyTIp2FrB+fbWbrU4cB8gD2ymVui85i5t3Ics=;
        b=cjAwP4xo7cVoE+A7zcwwQIXVTIKKGeuDr4H2uW5f0QKHYsqAT22r1facbCMqdCYoAZ
         1RztBB4qhw63Ur3bgUdR5Zitai8yJhqNvqukrmRKJocBgUu/0l3TK2CB5iHWzFtkwfRP
         aD040yjmcrLDdDJ6qnbw07BP1mOsqgGu4y5XZ+NVzkFg8RLMOu0kHGHGJYpayeZVXoqw
         xlrJQzaGAN5Vn294VNN2X0Va0hbbqUUPJXhZt8RKsEv141BtFXrfSeTAaddyh4Ahp4gF
         ses6s6uMx4eKjWzC5snBkWMnfZ+6if8jwjm8Nkwb3OIqiQpUfxqElWVy/BhV/3VcLV7c
         c7OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786965482; x=1787570282;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=48xuEHCyTIp2FrB+fbWbrU4cB8gD2ymVui85i5t3Ics=;
        b=IwS+hBSXOrSAmUtfIAmRRDxhLcffzlA7ATLSbSpR9/aVpua47j0OyKxV4K9VLOdN1M
         PUUe1WwV8ePdKMGxNO3OLtzZztdX8DSeBDgu1COtAo/XDyCzlh9Hg3mluqSBysrF6C88
         x8BDlxdhmquaZVar2eZMnwHMdTWiw1xwmSwrA0yJiNWl/dJZ5rQjtrJkU5rILZ0vox+j
         5tQKXdrcfw8eiWRpHxu5LmTk0jAod/S6vRu5j0JQeiPtzPjYP2kNGw1v5OYsCKWeVCnq
         P2ng5lk/GgARXvsXygh4KZHPwLIdpryYp31yjV6pnaTptA5V1YLpGPA+ZW7sVCHcX+Yo
         dGxA==
X-Gm-Message-State: AOJu0YxVi2Klie9nyCoOP9upVghzKHe/gKcEfGYu1i4C7uMN5J9X333H
	iIpqECCklTH6Gvk48IWExrYCYo06JjlxK44/VbODhktD5o9+rMz0MTJ+bQpuGtnUtV/HyjvxMZx
	hNn/3mBp0ItRZPaY4hN+eZOR/OSdQpJJ0uvXtX4CUeRsWp1MDPHXhrpxVnnPBrhC0GQ==
X-Gm-Gg: AR+sD10WKvV/0APMpiOxCVlN7dax43iDCrTcHlaJqxFmUfpF+26AxujAp972eEnMu+W
	Xse0+oetjMWq8fTZPjCqfCQSJtvq/E3K/Nq78fVSS8wfvCB/mxW4bV5D9e+LTIqm3nosP88AcPi
	UzEfI+mvgu1sztY2kARynJqRs+PVpScoWOrxl23LipKFnVw0YVj9xDw5+9d/JZHAJZhI2XCnXqj
	Wv4ojc9qvc1YLdcSIbOyEhjqvewVMEm6++GvkGA6Rn3OKmmIvzwnU3/WZoEYKebOlPHZFfBgdOB
	0nVv2OCNyyM3UN1rlksTEUiYs0BBnjSPMRSci8ZqAQydZ1NdwlHIQ718iWGxwYTr53BGRrPiz53
	c1CIG/JI+8ozrfi4TT+028RLf
X-Received: by 2002:a05:622a:190a:b0:51c:2324:666 with SMTP id d75a77b69052e-52d85425e6fmr196694601cf.3.1786965482387;
        Mon, 17 Aug 2026 04:18:02 -0700 (PDT)
X-Received: by 2002:a05:622a:190a:b0:51c:2324:666 with SMTP id d75a77b69052e-52d85425e6fmr196694061cf.3.1786965481790;
        Mon, 17 Aug 2026 04:18:01 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b73540sm8266366b.29.2026.08.17.04.17.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 04:18:01 -0700 (PDT)
Message-ID: <e274d368-6ee8-4110-9a54-659c58e6883c@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 13:17:58 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: venus: hfi_parser: account for all
 capabilities when skipping a property
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, Tomasz Figa <tfiga@chromium.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
References: <20260812-venus-8996-v1-0-6615f82a63b8@oss.qualcomm.com>
 <20260812-venus-8996-v1-1-6615f82a63b8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260812-venus-8996-v1-1-6615f82a63b8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: m4pwgyEgh5GmYypimdwSKmuUhzjpj0Ld
X-Proofpoint-ORIG-GUID: m4pwgyEgh5GmYypimdwSKmuUhzjpj0Ld
X-Authority-Analysis: v=2.4 cv=dLaWXuZb c=1 sm=1 tr=0 ts=6a82edeb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=cd13ssJBEhYVSCvIf6YA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA4NSBTYWx0ZWRfXw4s/ESeRt8QA
 a8s05V//cd3E6jtf1d4m6MvGAJrNaYNmp7GbluW98Q7alecPZgzQp9x7Og9skpLyobACdsT+qkd
 1EejgG0nkx8lK9z6AoxAPqTlNjdgdiZjVH3Bav+Auz5d58qVKI31NaIVjVI/XAnCKvh+0yDV2Yz
 MC5q5GP4tfgTkQIoorbhKeEQ3riPqQVrgRHUlBOd2s2BfngSUEwEUayl4QWp6aKBSbL4fhoZNvR
 8rCeI/hU69ugcAoRTXLq36b+komj5GuCtm+s6WRac/6fXE2+HsRQ1TPs/MraGjOU+5p37FiXJ1L
 +2eT4BEmtEO6QoMmX5bwgz9iZQ9nZELc+vZKshU5NFJWVYpKOmh8aN7XKL8cbq10Yz/5krQ7807
 dpSQ4g8ROso4olR7iYYWa1GV2Z0txJAtsGn/BrUJ/0teTjxSY68+SeiJP543sPt1WzVOaoApMns
 eeHxQdm6qSO/YjqA4xA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA4NSBTYWx0ZWRfX5e8ZcE03ycrF
 6Bi+F9GuGsmEVDkVx9KATNmXbi0e48zaAU4gvYzVoBbKpi8RtgxLLNGvWB/muXMJ7Q2WjRPIJe+
 0rAxcUxTLGSVKN+r7bxBIQmwqiNr64A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170085

On 8/12/26 10:01 PM, Dmitry Baryshkov wrote:
> hfi_parser() walks the property list of the message it is given by
> advancing over each property by the length its handler returns.
> parse_caps() returns a fixed sizeof(*caps), which only covers the
> num_capabilities field and, at the time the code was written, the single
> struct hfi_capability that struct hfi_capabilities then declared.  A
> property carrying N capabilities is therefore under-skipped by N-1 entries,
> and struct hfi_capabilities has since become a flexible array member, so
> today the whole capability array is left behind.
> 
> The parser recovers from this because unrecognized words are skipped one at
> a time and capability types, limits and step sizes do not collide with the
> HFI property identifiers, but nothing guarantees that: any capability value
> that happens to equal a property ID is parsed as a property, at an offset
> that is not a property boundary.
> 
> Return the length the payload actually has.  Like the other handlers this
> leaves the property identifier itself unaccounted for, so the walk resumes
> on the last word of the payload rather than on the next property, and
> relies on that word being skipped as unrecognized on the following
> iteration.
> 
> Fixes: 09c2845e8fe4 ("[media] media: venus: hfi: add Host Firmware Interface (HFI)")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/venus/hfi_parser.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
> index b1657443f23f..3413b91b0b7e 100644
> --- a/drivers/media/platform/qcom/venus/hfi_parser.c
> +++ b/drivers/media/platform/qcom/venus/hfi_parser.c
> @@ -146,7 +146,7 @@ parse_caps(struct venus_core *core, u32 codecs, u32 domain, void *data)
>  	for_each_codec(core->caps, ARRAY_SIZE(core->caps), codecs, domain,
>  		       fill_caps, caps_arr, num_caps);
>  
> -	return sizeof(*caps);
> +	return struct_size(caps, data, num_caps);

This is already solved in:

a51cea23e409 ("media: venus: fix payload size returned by parse_caps() and parse_alloc_mode()")

using struct_size instead of the open-coded version would still
be welcome though

Konrad
