Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792770611;
	b=jEPfTH9OBlyG9SNof8yFtTzhVDneSqkEZimdZQMR1d7r9HYLhGKk9d2VTsogATSpWnFb
	 Bv2NvWjknSNY+MIdm37wVugw2vdQW3vO2Ai9C/Nh4huFgnwGPY8dOUzT4xg0IVpNMCuSx
	 /hUAiJ3EBNo3bXPUQ1vmWvsO0PuZLcnGmR/xYUP55j1CnGu4shTxtfnMYgwEGnOCKgHQo
	 DnJsFtCVs+55PcJTlk9yr2Qglpacm5fm2ej9qaZOMlnp7Isnes8uw3Af7tF58tui+w4YO
	 oqLfw1T+MxQ58gb0YWB6wrJHnbxxsc9LU3naRsYq16RkScgOFDLRQvbBkvNsXTFSO8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792770611;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wEib0Y+2kLPgm132I+m147pUgMUJUup0SEsYYd+28aE=;
	b=i5OzlRw4ACFsDBrcx903v1wsJf0Wnuz2Fn88r8EMtSmH2+9/20LfUYLjKa7BtlfFpFn4
	 1k4hLFf7OR08XLagMBY1HNgEUC8/UUmlprtEX1u/fmJfyZqUgk3OKFSPp9YbKRLgHSMoU
	 I5qkbczPc32NV0AARLBdmdr3MWz6ywpRwuct+fvBUCtH/sXxzFW1TaHufwZJeNj8Rf9mY
	 H5Q4xlac1W48qCBUmKDwbkuWIH621hbEWvk2I2UdfKFkxewe8+uUpNv1xe/1pe7Ets1qy
	 O5vDKRDEjDyAf5vlq3kHYLKVZCpm5L2vhCKtMpESSO2i554iSW809jMaPQUz30xbq1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Axl4eJlq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q07VQv0c;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC435606A31F
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC435606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Axl4eJlq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q07VQv0c
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6CHJ2462550
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wEib0Y+2kLPgm132I+m147pUgMUJUup0SEsYYd+28aE=; b=Axl4eJlq4JmSV5Nh
	CWrFPLRELRd6FKrOU8CB0vBf//x0NAAfqKdY7UOe5IsU05hpJoe5OUPfa+ElbHhN
	NX2roGFzbJW69/EXKrcC1ziyGe2HjwnuC7lC6Nda6Zdxl0ByFBQ9O2Abbdorly63
	x5tla0+7ch+rdPiHbOAiR1kBBUZDTxcV6hzXid3+mi3xkGd1IFdy6lxKsBO33WTH
	qrRrb82WHpfiLq/VBib2W0GMikNBFeLASYu5h3INpkDxXcUsdgnjIK7vGb9K62Ch
	SgfPaUBEIDPq3XsSOPW+pNUeSTzw5B/3u64yWHKf6B+A/hGCrfCnaR75qdMi2Mb+
	QKa51w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmtve19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:50:10 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91b529a8610so23049986d6.0
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 08:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792770609; x=1793375409; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wEib0Y+2kLPgm132I+m147pUgMUJUup0SEsYYd+28aE=;
        b=Q07VQv0cTapG/dgACF9PdvjifXu6+9F7StzPY27pgXMNkAV69hjYu0j30ppeYXcpIC
         Xpo1anvxntZgPVdfGhukC4727fxD2cLq5V7qf9JrQ8GkbnUrFmexHu9SPcGMf6vR0H1j
         EFrAuW+C5NndseWcvO70Xpw5sbcl/Ihv+HldksV0ha7Juw9hpryWdNmKImtZRA/IrJLy
         BzmXMkq9Iyl+/47Y6EBvxPCrbIOxj1QXCijzR2BOiR6HzbCtDUQPIOQjxynZvHBVMHHp
         PWCmGyclU+yqXgTWtcwXXCuG3nI943pUR9XHC9sBrIG3iiVwUnb6QhNFtr/TqlVspt+R
         +ESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792770609; x=1793375409;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wEib0Y+2kLPgm132I+m147pUgMUJUup0SEsYYd+28aE=;
        b=2SRSkLLBthNcz0dA1jinFNcbrF81jJ6fKtMadc/EnDQ5xKR1ihBYTwi3jzAid1b93L
         fScL9IK5NiEnd5z3HedihoMkYDy4nOm2G5KMARSaKO1/qABhRHQDtgj/BYBA48f9QpsL
         zRGSQwy/0lQFfRDunLwAZyuNbYVYjbpug5GwsktAHBumT3JqbVKka6uVeNLZvs0M+8My
         YqDwHHhAilGI1GurN+O9IYsQ/JAqznEl99lqo0rlR8RjPrBTkQsLzHAyDVPT4amCEM+D
         iHvg8gAdOmEFuP9hslBuHq4J0dCNuB60ksdTaG+qqMi8mQGT6RRoEY4LGhJ/f5Lvvvwg
         xHOg==
X-Forwarded-Encrypted: i=1; AKwUvByDbld7zKwQwcSSQjr7Mlk3msXo7Yqyu/s4EXfxd6X1MyhcmWjTC9kIEiMYacg84YARbGYqJhqNP3wpBA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJxXZ5RcUW9cx+QMLfOner6MD8V9zgkAA9pyEEAPv0jyFKAzcD4
	bhhCVp3PzUMfxUghI55tbBKFifKXez25XHxsEuMgJa2S2Zd1cR2vHLg9isalX+08dz9re/KCU7t
	RxA5Ra2p00A6tr0D+V5CfF5abPpQuxEkS/cVv8lM3EPGaS1cJQA5abCj7eheIyGV69Q==
X-Gm-Gg: AYBFou0l2KciSsiMSNoyPYjcYt/pttNneP/AueRdjBYqMZ0FuXMpfJjvn1PaobzuJuc
	ionICR6/x0A6D0wZ+4GfzHpU+UPviO1GA+dpy9Ep/JfY9HL6A3f0RSEYRts0NNjPUrLta4tXquw
	T7fxkjfBu5DeOc794GqdXaGg8Rud4OtNyrfpld9E2xc9JB0zgeG4TsC99pPm8W/hjPaBWZOs9w/
	fGmiCpMzm+FnH7cc7tM4LY8maI49kNBarQ4QexnpLq5BrA8h82w4RCpnzAV3aFHJAbCCtircL3+
	zq8SUoWMvrW+BubzAffLXiZRjrVfHu/AuQ0ql4Oy2Q3VXyG5ahSUmsbugl6IioBFKyO8x1pIjDP
	Kxg/LbYgU3eK8fpGLbtD7/bYNiQudChk=
X-Received: by 2002:a05:620a:2b87:b0:93b:d7a2:83cc with SMTP id af79cd13be357-93f6f819647mr452036785a.59.1792770608822;
        Fri, 23 Oct 2026 08:50:08 -0700 (PDT)
X-Received: by 2002:a05:620a:2b87:b0:93b:d7a2:83cc with SMTP id af79cd13be357-93f6f819647mr452031885a.59.1792770608256;
        Fri, 23 Oct 2026 08:50:08 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d417e6dsm532407f8f.44.2026.10.23.08.50.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 08:50:06 -0700 (PDT)
Message-ID: <dc87be81-0fcb-46ea-b9cc-42866cca074e@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 18:50:04 +0300
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
Subject: Re: [PATCH 1/4] media: qcom: camss: clamp VFE clock rates to the
 highest level
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com>
 <20261023152857.2859767-2-atanas.filipov@oss.qualcomm.com>
 <CAFEp6-2tC+uFJSG8xOhQdrhfCqoDuhm6q0rYc6cROoUG_r1vtQ@mail.gmail.com>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <CAFEp6-2tC+uFJSG8xOhQdrhfCqoDuhm6q0rYc6cROoUG_r1vtQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb8232 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=OtwWDPiBtiHqWltJD10A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: gDWJ3iobuFLIHxjdOeNHspbwNFfiGLux
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MiBTYWx0ZWRfX7cbtYFDrz6vl
 JGU2HmMEzPQ4+Kd3tS8aXW7ze286oesn77UdfrolUSDoKo40E6UJSQ1n5Lba3VpIFcE8vMQOIzj
 ZZFmqqh3/K4u+nWETKvd2ttu6ZUtdTr1b6VPIZAsF/SBqfTwN3FrcTDL+qDnqKll9BWVsmH47IG
 p+g2mJxsT+PdvWlqlIAV1DgvX2axuRAtcPIu06aSe7uaAJ5gMz6iPUHpiV02Ib/S0XC5PTCoQmX
 Wt5G4vPkMAYbVG4X/tpGDM0Ng6k1ztxXpxT+cGDFIuiN/CjIBUqMHX4qWWY+7Dw21ox56LO2NLd
 Bklr1CfiMDs6QyEvVjaYa2sLj+ptjIjzNQCTSI2KcHn0feSJ5Xbya7tCqBSL3/VD6xgu9wO1C41
 WKX6YXXIUEf/OxvuyZI7w8YvNLJVREDGxGH7+L39Bg2pEL/hdO2GW+ZsJCAv8QyxTMV3Yg0gtrW
 Dvo1CgKI43SAaY7L0gA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MiBTYWx0ZWRfXyk2BqxUh5gwv
 xKztDNNPviOI8cv/1v/MfiUhESAIGL3dDbrNg2nJJIbATPzKsk5qxStzs4uoFqHUIn7sUuGhndP
 4PX1WqhzunHTovvHyL/X+OzJQ1d49J0=
X-Proofpoint-ORIG-GUID: gDWJ3iobuFLIHxjdOeNHspbwNFfiGLux
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230062

On 10/23/2026 6:45 PM, Loic Poulain wrote:
> On Fri, Oct 23, 2026 at 5:29 PM Atanas Filipov
> <atanas.filipov@oss.qualcomm.com> wrote:
>>
>> The VFE fails to power on when the pixel rate exceeds the highest rate
>> listed for any of its clocks. The rate tables of the VFE clocks are
>> independent and need not have the same number of levels, so a clock
>> with a lower top rate than the VFE core clock, such as the SC7280
>> camnoc_axi clock, makes the VFE reject pixel rates the core clock
>> still supports.
>>
>> Clamp each clock to its highest listed rate instead, and warn that the
>> pixel rate exceeds it when the clock lists more than one rate. Take the
>> clamp into account when another line powers on an already running VFE,
>> so that a clock running at its highest rate does not reject the
>> request.
> 
> IMO, this function has become a bit messy. We should split the core
> clock selection into a dedicated helper, as it is directly tied to the
> pixel rate. The AXI clock scaling/selection should be handled
> separately, potentially through the interconnect (ICC) framework (when
> available).
> 
> Regards,
> Loic
> 

I completely agree. I just don't want to mix the two issues, as 
requested by the reviewers. IMO, if we can reach an agreement on the ICC 
migration, that would be great.

Regards,
Atanas

>>
>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/camss/camss-vfe.c | 18 ++++++++++++------
>>   1 file changed, 12 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
>> index 2680a9914765..87096095b1eb 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>> @@ -982,15 +982,13 @@ static int vfe_set_clock_rates(struct vfe_device *vfe)
>>
>>                          camss_add_clock_margin(&min_rate);
>>
>> -                       for (j = 0; j < clock->nfreqs; j++)
>> +                       for (j = 0; j < clock->nfreqs - 1; j++)
>>                                  if (min_rate < clock->freq[j])
>>                                          break;
>>
>> -                       if (j == clock->nfreqs) {
>> -                               dev_err(dev,
>> -                                       "Pixel clock is too high for VFE");
>> -                               return -EINVAL;
>> -                       }
>> +                       if (clock->nfreqs > 1 && min_rate >= clock->freq[j])
>> +                               dev_warn(dev, "Pixel clock is too high for VFE clock %s\n",
>> +                                        clock->name);
>>
>>                          /* if sensor pixel clock is not available */
>>                          /* set highest possible VFE clock rate */
>> @@ -1041,6 +1039,7 @@ static int vfe_check_clock_rates(struct vfe_device *vfe)
>>                  if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_levels(clock)) {
>>                          u64 min_rate = 0;
>>                          unsigned long rate;
>> +                       long max_rate;
>>
>>                          for (j = VFE_LINE_RDI0; j < vfe->res->line_num; j++) {
>>                                  u32 tmp;
>> @@ -1063,6 +1062,13 @@ static int vfe_check_clock_rates(struct vfe_device *vfe)
>>
>>                          camss_add_clock_margin(&min_rate);
>>
>> +                       /* A clock already at its highest rate cannot go higher */
>> +                       max_rate = clk_round_rate(clock->clk, clock->freq[clock->nfreqs - 1]);
>> +                       if (max_rate < 0)
>> +                               return max_rate;
>> +
>> +                       min_rate = min_t(u64, min_rate, max_rate);
>> +
>>                          rate = clk_get_rate(clock->clk);
>>                          if (rate < min_rate)
>>                                  return -EBUSY;
>> --
>> 2.34.1
>>

