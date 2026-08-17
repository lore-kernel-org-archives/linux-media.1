Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429C73D566D
	for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 11:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786965612; cv=none; b=pibA4gu8K4owMiYyq/WPzcAViIRqz4n86xq07fB6+FEOSnsgE9F6SQIILc17C4x2a5ONMU5Ho/dUmyAsX3n8z9HDBe1R1vOpY6tvGCgH+/oEMX+0kprkjRlQou0xRS0dF6tCjIRqntXJM0D1VS09Nj+7umHpnz5M3a+H3rhrGKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786965612; c=relaxed/simple;
	bh=osvzgBpz8nZCp3XOFawKsT/v4+qU7q5DC/cLetwjTdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e+YRpKb6P2iZS+rcFYL93djv/uyeECHISlA77KuPecoY5eCj8vXXJ9RjTGdSAS1RzCnP/KUopNr9yyS2SJkidt8Uod9gS+Tlfd/86shIfjcZxV9LxAg8RV6QFoZaKrtZNWa1wuCrZKUJ7gMA1VbfNKvXo14mcQrCd4QkNNovT+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AfFUcCSM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GpVGRkB5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AfFUcCSM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GpVGRkB5"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H9dj37727988
	for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 11:20:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PXEgfb+ycUmKnB3Ohf7t8gp0XPQqN7ee9k+HPlfSajU=; b=AfFUcCSM6621VzT2
	QfQHIxlKZvh7rWeJ2j70iw4ATxZDgl3OVYopFw1PtSS8SrhVnVJ6r5SNtxj7BurQ
	cPWYyZG+XWxlhI/duPnoAZ+IXrQL8EQd6OKnowgLRHxUDHxXX0VpkbHqlTULPryu
	VAO3kc4o3j5g8C/M+8s/njcGZA61bnf9rGxtsWuRhIN7fgilxRx28LqwuwE4Njw8
	dJbyQJt193/EGpNL6kRabdoKjCRaKHB7slJbsgOIDtN2S3TbfgCIx6UvWYm6+hF6
	/6+oxEpaGtIFzvOxGThLZ20cznylaJ9h+Mfp5RNs1ZYATr2iHD7ZTHq7Mp5iLOHq
	bLLtNw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wke0yxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 11:20:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfa45b280so8325361cf.3
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 04:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786965609; x=1787570409; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PXEgfb+ycUmKnB3Ohf7t8gp0XPQqN7ee9k+HPlfSajU=;
        b=GpVGRkB5+i5LNH2IYIWyqGTA/wPvpuKm7lQG0DfpRYLpO1y4W6/NeJiQqAzM7KoUpG
         BPC0nC7JsjHMZ/kJc+R/nkOTsHBNZLuG2mOHiRB+9ULwsL7ikiXqCQHHDO8utxpBpS5c
         YF7MDQ5QJd4bH2AhQ+ymwC1IcgWKtMZMVzepAqOGkuSI7rivSxHNVYjmjga9DisiIabQ
         d7ay8ucdM8zs7w/U/kcBD4h0jViL71IJxn+EK0BHmowULUdjqWLiIsKv76GQmH587XL5
         Jo/zsGhIDi5nhQ/dTXO430iL3FYmzHZsUV/05iajTp8ZrsTT9NkHib8xcAoi9hWTtatM
         Hejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786965609; x=1787570409;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PXEgfb+ycUmKnB3Ohf7t8gp0XPQqN7ee9k+HPlfSajU=;
        b=JIHR3hRSogXZAEA9tEv4IVesAxTP8mDkVcscHtcEN75udzJUqROa6Ua3Kvlo24XVyJ
         lCiTGBO0n0mNkQjI1WTLE4l1TT9ifSTw/AHCdTe/NLb8GRWKKq+Nfh3FS28HXeXGyurh
         Y7JAFEzMad9Wj16S62bXkQT9+iAJr4+Qo+DbCyN2qY/7FC04jQVYg7yjZzNTsqXlWMiM
         naYSCMibAfmIZo+XbzWHJNF8Ttv9SNk2YABwFJD5Qlf1zvxLgBqRMt4o2kCV/DSLiEok
         6XrUPmok98V195jTee9sfxo33BZW7dbCD5CerECfCHy9kCFn4sZsFSxYBTcNAGmagv4X
         a1OA==
X-Gm-Message-State: AOJu0YzRkIGWCFqueSwR3SR207X9NIK3NZ6BunR4fz2eDqq5QvIPBCWM
	rI5xJnUW1sbveUddAFXW4igNdlYyRaCGDeb8d/DunOnbrYGmam6z+WH4PBKpdanE/DgoOQDASOJ
	f1ER2wvg2ijEq9v0v6C1wGUlFrCIr5ObS6sJa+ll06jfejsvFa1vMDZHdaK4YVe409w==
X-Gm-Gg: AR+sD10RAc38DJcRPRJx7l0tTKQG82VYsG85J6MBuvrtwIbdRpZd7fD/iq6eWjbrynR
	fWehS000Indr0U6fbU258Ma2whajNZKDfpdV6Ps/tO3ERnshd1DUndovvZfegKTEZA2egaaAqej
	x95T6F0u7uTHy6dCSflZH0Jm6dORXtyHgjuFThfFOJjUorGXBFDjMMKdQKiglK12XfTN8ySy3yl
	zSqNvcEsd9OpjQexQYVB2+DhHNSshw1DTT3Z4ktFfxNRhTa5xXsN3WmbGP3oxE4aSa2GXFYCqYM
	AtrxdV9QMpQVTey7/p/BWcR+0FlbZk+Qzmly6oTu/k9EIYCh8e6Im2ZHCpuws4Lo0pjroYbhde7
	3oulCbullPT6R4L1YmuKlSQOE
X-Received: by 2002:ac8:58d3:0:b0:517:5d21:9899 with SMTP id d75a77b69052e-52d854c89bdmr195887261cf.5.1786965609277;
        Mon, 17 Aug 2026 04:20:09 -0700 (PDT)
X-Received: by 2002:ac8:58d3:0:b0:517:5d21:9899 with SMTP id d75a77b69052e-52d854c89bdmr195886821cf.5.1786965608835;
        Mon, 17 Aug 2026 04:20:08 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b977a3sm8480566b.45.2026.08.17.04.20.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 04:20:08 -0700 (PDT)
Message-ID: <02cc6973-3e69-4c53-99b1-7aed7cf953e2@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 13:20:05 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: venus: hfi_parser: size a raw format property
 by its own entries
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
 <20260812-venus-8996-v1-2-6615f82a63b8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260812-venus-8996-v1-2-6615f82a63b8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA4NCBTYWx0ZWRfX9vlDArof5l/l
 A1ObEPq7s+EpKm+YFVdxF3nx440L6mDqVHfEViq1fF1hDof/l1thkZ86R3KNq/fB+Ehv85ErQOe
 ZeUWssBrNxLfQNfNtXPBT3SzOj0wP/PUv497HtjNsx8K6fOQ606Cl4wGNKkBwdLLzfqyrFWo2BQ
 cl+rnGD/3U8lGe4kUNqoxHOZKEd7gfcfk2qDuMw4aqsno1XnBNJc8hrDhU8WNivYRDhpi7PGSmI
 lSHlwDD2OPjP1EFlv9Y9s3/eqK7myA5hJmJryn3ii5eIFik46blHBZcvubL4ddG0S2QHLgGANqT
 fPoJl1XTaZ+/O3QfoTnyDfvVanJE/Hh47suYkDZqHFRGA7msW/2xa5gyXGV1mAeRLuAwSQpsCFQ
 YAI4T8M2TqYMSexXe/WpfI8NucavbCKhXT8tJcMoeG19yokfey8AR3RPoKM15RuS9B93sQ6fEGW
 71zDCUNvZ8TVNpcwzVA==
X-Authority-Analysis: v=2.4 cv=QetWeMbv c=1 sm=1 tr=0 ts=6a82ee6a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=eYyzU6XjkX6kC7LtGWoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: nCBbXH9BNOprsoFKu5Fc-yfHCRH-RaD1
X-Proofpoint-GUID: nCBbXH9BNOprsoFKu5Fc-yfHCRH-RaD1
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA4NCBTYWx0ZWRfX11HWpHh9vms6
 6KpDiaHMgWZvEh+og0R+uuK2ok1HSOUfBTCwXx1Gd8UI2LdctF3kkiKOPoB8Qm3DpMzlMC35Sde
 u/3T8Cr7Iwp+3nGNIpkpajg+angtdjU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170084

On 8/12/26 10:01 PM, Dmitry Baryshkov wrote:
> parse_raw_formats() walks the format entries one at a time, each of
> which is as long as its own plane count makes it, but then computes the
> length of the whole property as if every entry had as many planes as the
> last one it looked at.  The result is only correct when all the entries
> agree, and there is nothing in the interface that says they must.
> 
> On MSM8996 they do not, and the parser walks off into the middle of the
> message as a result.  The raw format property of the HEVC decoder is 120
> bytes long and the walk claims 152, so hfi_parser() resumes 28 bytes
> past the end of it, skipping the codec mask that follows and landing
> inside the property after that.  It resynchronises eventually, because
> an unrecognized word is skipped one at a time, but everything it jumped
> over is lost.
> 
> What is lost matters: the property skipped that way is the capability
> set of the codec mask 0x7002, which is to say the frame size, macroblock
> and frame rate limits of H.264, VP8, VP9 and HEVC decoding, all four of
> them described in one block.  Those decoders end up holding a bitrate
> and nothing else, so frame_width_min() and friends return zero and
> VIDIOC_ENUM_FRAMESIZES advertises a stepwise range of 0x0 to 0x0 with a
> step of 0.
> 
> Userspace cannot negotiate against that.  GStreamer builds the sink caps
> of its V4L2 decoders from the enumerated frame sizes, an empty integer
> range collapses them to EMPTY, and no pad is found to be compatible with
> the parser feeding the decoder, so a pipeline as simple as
> 
>   filesrc ! parsebin ! v4l2vp9dec ! videoconvert ! fakesink
> 
> fails to link and the stream stops with "not-linked" before a single
> buffer is queued.  Hardware decoding is unavailable on the board for
> every codec in that block.
> 
> An earlier overshoot loses a raw format property too, leaving the
> decoders with two of the five formats the firmware describes and HEVC
> with four of seven.
> 
> Accumulate the length of the entries as they are walked, the way the
> downstream driver does, rather than extrapolating from the last one.
> 
> Fixes: 1a73374a04e5 ("media: venus: hfi_parser: add common capability parser")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/venus/hfi_parser.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
> index 3413b91b0b7e..f79c368647d7 100644
> --- a/drivers/media/platform/qcom/venus/hfi_parser.c
> +++ b/drivers/media/platform/qcom/venus/hfi_parser.c
> @@ -171,7 +171,7 @@ parse_raw_formats(struct venus_core *core, u32 codecs, u32 domain, void *data)
>  	u32 entries = fmt->format_entries;
>  	unsigned int i = 0;
>  	u32 num_planes = 0;
> -	u32 size;
> +	u32 size = 2 * sizeof(u32);
>  
>  	while (entries) {
>  		num_planes = pinfo->num_planes;
> @@ -183,9 +183,10 @@ parse_raw_formats(struct venus_core *core, u32 codecs, u32 domain, void *data)
>  		if (i >= MAX_FMT_ENTRIES)
>  			return -EINVAL;
>  
> -		if (pinfo->num_planes > MAX_PLANES)
> +		if (num_planes > MAX_PLANES)

Most of this patch (minus the line above) is in next as:

bd595b745eb7 ("media: venus: fix payload size calculation in parse_raw_formats()")

Konrad
