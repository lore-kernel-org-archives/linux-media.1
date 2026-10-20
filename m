Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479366;
	b=Cj2NqZNY31KeLo1ZKXfwJFmEkID3dtKVoQlCuTP2pFoRr2SQX76y8hXQjTvFaXOHcb0o
	 uNWO9G51h3bAgoA1IyQq/4HAy9Ke5qscsL6HJJBY8SBjf1yIU8awX1SAmiR9dY92iibVW
	 2RC6vxYO8VQm3Ef86u+K9QGkvbtrcdFTqAdRKWQAGQeLGrm5jg8r11eaNuTZDd8zw+EFz
	 /E4F/rEF+a76SQg5IjABaLgtAo02/5er5kxiQETLPQyybK7Tvv6eSEJ5XVKZBMou6Q4JF
	 0jXt8X5j6lQGMODHfByJK8sATNSrAXxN5A8VKp7ZNLS7TnBP9Y4RHr53+Bl2B/9bKkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479366;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/PKRwCOfxjZMSxgjGLWE+hxoZkaAa2a8erHRAipSTCQ=;
	b=G0DSo1WOg4AQVlyI9hJMk8FCPyeG7U7TzfDhrtg9yNbOauQrzEw5a6TkJR5iINUDYbR3
	 /x0As0vDWw6hfnMaMrKY+KtU17U1gXXKwRwsttH9oS1Zq7Ne5/EpN8OXQlhtNO7gwpUlq
	 aYQu0gUasxFu8JSkBMQ0nE9u5mYvmGylUYQSw59WFhepkGu5hoK3GEfqqE/6FQUlQrzbt
	 6z4MtEKpV4jl5j2AsWEenH0b03sSHz7zlolUh6NmSmRnvdLI/sTYWWPdQo2HsLx8s4pA/
	 gMU0A+CjEHY+JESVLOSBCAtjPDC7rK/JIpk0kSNHRoaMQD5rrzZzFNTELRHiVHEjI8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LJqv1MbG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OCkAyclT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC6C606A31E
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 06:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAC6C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LJqv1MbG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OCkAyclT
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tIQG4031741
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 06:56:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/PKRwCOfxjZMSxgjGLWE+hxoZkaAa2a8erHRAipSTCQ=; b=LJqv1MbGFeFQx84y
	Zqz6oUMNyzFnRgq3tErABOkJutRq6QiG7S1B96fBnQbvKSYwkFSsNmq0xHBAic4/
	24NuWOg+E5S8SXFNqGl82RkeqAdgBRsErkHtfMKScdvg+xUtojufSzxRjak9bvS6
	YIyH9Z9gtg2qgzYpA8nif12JKlvgWRCBowca1GTXkdBWLxFULNbrRh0bYWcGDcH+
	BDm4BvITu4Zwja+2tZWginft2Yh4I+ppxfff+IJRdxJZbYZbQjB+OZ2hHendatC3
	aIAauvR6vd76HhDex17SrBakF+DDlfWSZjKgxm8dId5F0L6KhTvGrzEjOZdQr+J8
	0Y1joA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5q97kp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 06:56:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93df7a9466bso43671585a.2
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 23:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792479364; x=1793084164; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/PKRwCOfxjZMSxgjGLWE+hxoZkaAa2a8erHRAipSTCQ=;
        b=OCkAyclT39dKe8WemJMWfwadm7h+/S4s/bqHNztCjcxHtsO2XssNlMymmq9oNB0i2j
         2jXeEG8mQWFius+7z4o/izPe6iwG9qE5PneEGwkFCwbVmQEBlqpurPO4gakTBe41pEg/
         aSx6PKaUBUqu1piXwUuYvaK4GPJu79w/PYefmdgohisspjEntddyIPrDozL6RU7gvyzm
         3/RAHJdv3/Gf0Az7t0ZrNvsciQB0FgMYxEwoXZueAmGlb1kAiDOjVAVz1B1t6Yuuw23g
         BbQK/a/n8nTWZYqJ7OUCC8zrU4AI16jc3cf91E2CkVKAbs+eJL2kE6jeO/zQvvF+cBby
         /JCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792479364; x=1793084164;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/PKRwCOfxjZMSxgjGLWE+hxoZkaAa2a8erHRAipSTCQ=;
        b=wUkDeoLUQ8z4SzM2OU/qEnZ90X+Zf4Aic9M12WqwbaKVAMw/Ln5Ferwzt7W+l/Ul2d
         negL8ZNYYnP2/aTcLEujWCRAxHFtUdICk0vNgWy+XSV4mib5nxwCx1GMGE+pIQGP+Z/K
         z0strcV/Hfs+Xc7/zBnfIVqGCQkBFYO2r7qa+UAtjM3/CJEq6NAosijeHCACxYUb0R48
         qSD3vwbZlim74OjwoCDRD8LwJD8foVbV8n1U7uMORTPQ/qfZXhokwMxv9cGwdBjUKXEg
         oI0mWIP9u7NovA1/HlqQzW226lRNx1sjlPPRfgfq0mOIUrA972DSItCoDvmQUigSv/yX
         Ni8w==
X-Forwarded-Encrypted: i=1; AKwUvByq0eA2QKtZ/P/XQXFUQIRMEIps6fnIxDHb7BiM3gvqRZ7LgCdoCQQvkyRSJRAVR+oqRkW9KeRCLzm+Kw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJzr2S9dTcwMVUQyRcjNlY5cQMBhbW/AR3KOPU20oH1FXMZvk3f
	ngCSbqekLnF6x8wTJCSZhVAm5RtKLwppVWgmwWV1MkQ3z0TVesqRdLKhXDw3/wa1I94XI5eFpmZ
	RHkdRY+busjh/fe5mARoK2tAz12OIKb91/OW5RjXOavNebDuQzu7zJtfih08CKXhTkQ==
X-Gm-Gg: AYBFou1mfoy3o5kzSkmvHgB/v3pXrte+D7oqyjX9a369biqMJc782t7uChCSh97aM0T
	cjO50v/7s3T/ITKgSzate+syLPlu/uMzMUtjrg4ZI+L9qTtIeUF29C2/H8hyrm/SMv9tAr9vQ+6
	KMeUKVjYWfwHtEpWrT+WaLzGnUWpoXPd2UC2Cif8Gyb9VnCXFA3MNJYK0MbYDq80hAVwiaanHN4
	jveGFF0Xs0zweKQdGE89UFWVOmIkaFuGp+oEBL/algCdHdYw8NLadNkdwVPciJm24RCPQHS88/9
	siZkHsIpyEn9mmfB6M7dRwDQxw2sbfcrrMHoZifRf2eKkVdQCwEAiRe4gDGH1LjN/s94jXkp8Sv
	fbsn53OpUtLaiiHT3fbZ+Zw==
X-Received: by 2002:a05:620a:3711:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f29c95919mr1922702585a.3.1792479364063;
        Mon, 19 Oct 2026 23:56:04 -0700 (PDT)
X-Received: by 2002:a05:620a:3711:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f29c95919mr1922698285a.3.1792479363583;
        Mon, 19 Oct 2026 23:56:03 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b3dd83d3fasm1305197a12.5.2026.10.19.23.55.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:56:02 -0700 (PDT)
Message-ID: <e043f9d7-fc32-4631-9012-f0dee835fff0@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 08:55:57 +0200
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
Subject: Re: [PATCH 09/10] clk: qcom: cpu-8996: program the MSM8996 Pro droop
 code register
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
 <20261019-msm8998-fix-clocks-v1-9-370949e4d8a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-9-370949e4d8a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cxU51do29PcAhOsJ1D_hXDAebJmRVd83
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNyBTYWx0ZWRfX8DEgM6bJBqvu
 T7F/OTpI2Gt/0f945+P6wvDS3X/L+xSnx+eUzQg/h2BxGPfwD48tN30TntUAcez86HQxaOfg8qk
 10W3Q2PLp+CDQl4IWrbg0OvjXXrs9dCpxjXLQusibPXW0E8qxXDWWMy+k0VliKK0239YIfRu+1g
 7fVeUayiZnRafh1KUtvwIAH4pNbtAoyANkhn6Shxluro9FA/PsvtnHovYmpwE6RexqEd3G33VMV
 iK6UEM9VmrC/DnTizdCOOQX9edfybHQ5HxY2PkwkyfZrKbp4WzV3g+MA5A1Fc9vd7FY6a6KB+Gl
 aF451dAvLM9X9xDtoAwUwRQfltNi3aRBkpEFwoVXKVStnnhZufiZTXeVs3keWOnNdbw5QRCDcW/
 m9C47LsRGeDjdQMEoTP6gOTD81Wwpg1sIRSgY/vH7br/VakAUZ2L6zkCoi/exfNC4TjHl9q9XMf
 Tu/LqqzimP821FWZgNQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNyBTYWx0ZWRfX7rfZb1DZA5rI
 VrYeVi15eUqcPhzcGDVVohSUAs/KFl7hW/auVwJk+gzQOwOJov+wz0q2t0jRT6ReFvpYJmYNW2x
 1LdoOaQwSEt8uSHtW1KCX4Wh4rMlmes=
X-Authority-Analysis: v=2.4 cv=LpcHWXdc c=1 sm=1 tr=0 ts=6ad71084 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=CHr2jc4OuQYqXGn8qmQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: cxU51do29PcAhOsJ1D_hXDAebJmRVd83
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200027

On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
> When the vendor kernel enables ACD on MSM8996 Pro, it also programs the
> MDD droop code register of both clusters, so that they switch to the
> always-on clock source when entering the D2-D5 low power states and
> gate the limits management clock while asleep. This driver enables ACD
> on MSM8996 Pro as well, but leaves the register at its reset value.
> 
> Program it on MSM8996 Pro before the clusters switch to the ACD leg.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
