Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792591167;
	b=ah+WGDHoY++fJdTujkmsgdbnc3EDhBqPLGsGO60VLwIhE9f41o6CRs2wIdJoNAyYmSCx
	 uNLlifEEdLeYC3sTnL1iePb/Rd4+IsPikXA7oTXKEFTzx9zzejLXre9OI9pfol1o3XC2Z
	 AMaNwhZcx+qy0kIkjzyLcEmmQg466f104ePYYTdp96xJVYCZyiE+qM+ia/VMyiR781tiL
	 sFq0yMUf++Zev4rD0V8vSk2Uz6cuBGyqv/5m2Afi5TZgRKQIho6fxPGlXsWcrZL5ecxU+
	 nSQ3V8pz4HhK0LEquzJxUZTBli5LunMJjBQrbwam6ae+z1AtPd9YgOPwOED21uXt4VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792591167;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=v7pESOuNoQ7+2mmCjub8hEr79x+EvIKeMwX6F60/Bkk=;
	b=Kk1tPCvvVZICSrSPgB/YkcmSFeujcoEdO+fCpe7wEch5pb6i7oiygpoM8KfM6t/pQBvO
	 aGVHYwczbgLOPkezjvFX9txfa9TJLKbJjGzWyDmbg4dnBV+Kdu56HjN1wGKUsijgrPS9S
	 u08+OFPqJmaXzHxBBIqq2gu21V6UV/qel9uhnL4Z8poJBEaZ7jF6kPUpdpHikFcwpSHjG
	 WIc76GyWuvDlb+Ku83IcvrDoYVpILRm48T13cUJ4fzJKFNK80sSLqefJIZFOWMl/AiPY5
	 ywTfCuKWATJrzlc+Ha3QxQCfkpe33WzpC58jxOSxhybP4JPxIwCn99KJiLw1C2FTR0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HipwKjsa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xc92wjmO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EC5606A31E
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 13:59:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43EC5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HipwKjsa;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xc92wjmO
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBgMrK4168155
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 13:59:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v7pESOuNoQ7+2mmCjub8hEr79x+EvIKeMwX6F60/Bkk=; b=HipwKjsaFTPLlEni
	mKbIfwZBmmxxgZFkWfSwqs72ZheXRop+st7cnpzo6zrP0M6LO70KS2wXXNSzwjsE
	+2y0/aS5l/5pRd0G9R9v6ja9BUidUh1PG7noWIdn4acWUvvnjhKduhbpTawAd5G/
	b+lXPGThKktduR3WAEtE3aSrmOYAnO6sys/xP93f9yeFMpqSkjm+oa8Gm23Q5n1M
	GnNZ552BhxARmlbtitdGmNrSrQWm3DjXS4PPg/jkQRiCDaxSNx4ZNSStPwNz/Ua1
	dOa/597Hgf/xoQGwiGJF8iQ3fA9T08Vhd7E4/Pp5R+4xKyihA/JfmJDU4b5jcRss
	8kzCVA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0m8cj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 13:59:26 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91bf35c4c78so1884516d6.0
        for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 06:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792591165; x=1793195965; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v7pESOuNoQ7+2mmCjub8hEr79x+EvIKeMwX6F60/Bkk=;
        b=Xc92wjmOZgrL7qjpfUAbZYvpffg8xd3EcpDEbYLHP/pubfyFVFPftTb4r6kiKaC4cI
         CKVSSc12VwbGdfq+s5q++25WcDyWdpfjw9L1u5qS7AlaxBBHRozHm9bEdIsMP15ho3NM
         MOYUldAvdGKfPilzvEzU/CW5qZUEuyNitnd6AJC6woOYaJaUvLyIwNeS7gza0cTEaunD
         qOeVby20lC5ZeprHICPlSYIyygt9slLilxl0oplp61+yGgXLV+33G1sAhj/QjePUYISF
         HG7MOP7+dzcWlScMxr/zi5NmJD0lXYYna9Y/wtjWqRsuImcjNyDLfOoAeGGuaGclnRd0
         XwFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792591165; x=1793195965;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v7pESOuNoQ7+2mmCjub8hEr79x+EvIKeMwX6F60/Bkk=;
        b=dY1qrnT7//1dU87zYfLwPi1nmGSZWNv1hL+IUaZ257GzbbMctE89j12Q4ttmMct0UH
         ePX6eGE9XQFdGsUxD3tM/zUIgjvo/QxW3WPnvchMwuuqRmbhTP6rXpzc3yCENky0zQ7L
         hbXd6j+bueaLpQ0rx+63NXGcdLHLA0iYZz9YfmV5TqG/IHXibiV0BclqZdNlC+9yGHhL
         2O+Xm1SEFPvHL+KVEIsoccBEZX+8krNu/1gSvg/eZkxo0T6/9noijUS/l1OxcijUIogc
         4EGhNh5LlH6DkdXWkv8ts3ZyF5NvRXZJny5X9i/sXmXdgw+/M4P1wRAFtzuA8m8mpV9R
         6Wjg==
X-Forwarded-Encrypted: i=1; AKwUvBxdHzJzH3Hyx835ii3T0TuFD1XOxkKoSsFkknLV4JjavSqEg5ztUUR7ENMHmipDTUvys8nS6r+nFqNnkQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLveFxSv1Um7fHjN4Rbnfm37BYezlvgvbb+xtX6QIDnSbBPNNMA
	MCWP6Pp3dkqlIfmgejqUv830swHCNkL40ODkCUWH4jtKy5XpyvfuwgMslYd6DdyQMH8+aeatS7a
	HayDL0aAyDzPwl1XjNpPuAKlJr+16OzdUftPyy1DvOA22B5rvrg1KArVt/SVt4e+JeQ==
X-Gm-Gg: AYBFou1dxdVOupDhEG+qlnw70len37UHl5/+7+YvFVmCV0iOzMcMyB6vqyWPKaVaiLT
	SWkk2AW/2i9f9WiIIdBszZeGkqE/LPaxcouGqA8NkZNKCZOfaLfD2IbtFEbQyHjUe1WLRXfQ33O
	8IhzuYvuAhfu6sAKbnLdCFBN4MxKuQf8tghMxnTt6bMVaon27029EFgzQeLH5WA+Y5xEDp7snJk
	lrHpLDW2B3wa/3AXVR1adfrUngQtd2Ubh5K44PcU9XDlHNmymG5IH251wpZ2vrJEfTaD85nHrfC
	3QvTzc1rDot9A5cMsbZCoSW3K+HgJwPLrMjnLazCt2zc4cY9sL+mhvOXwSKn9/UPVkH/eRH3Dy4
	OK6tBw6vDW8t27p0+vPAndg==
X-Received: by 2002:a05:620a:172b:b0:939:8bc:8826 with SMTP id af79cd13be357-93f57e897a9mr481259885a.2.1792591164914;
        Wed, 21 Oct 2026 06:59:24 -0700 (PDT)
X-Received: by 2002:a05:620a:172b:b0:939:8bc:8826 with SMTP id af79cd13be357-93f57e897a9mr481255885a.2.1792591164457;
        Wed, 21 Oct 2026 06:59:24 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b403167e3fsm904154a12.34.2026.10.21.06.59.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 06:59:23 -0700 (PDT)
Message-ID: <f275d9de-a51b-400b-83ad-298d0fc9eda8@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 15:59:20 +0200
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
Subject: Re: [PATCH v21 11/14] arm64: dts: qcom: kaanapali: Add CAMSS and
 CSIPHY block definitions
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
 <20261011-kaanapali-camss-v21-11-04fd28d815c6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261011-kaanapali-camss-v21-11-04fd28d815c6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfX15J0IpeGENd3
 TTwVVnbXCxP4dES6F6+NBoIvVW/N+1OaQa1eETODTSASvmxZ8TLGYI1wHWOxVhkeY6K/o6O2Chf
 qcPR/GTDEUQ7snEkji/KpoQQEuOczZijLWeOuyxF51vJ4nI73YuNAiQ2hd9nSVSU/Ua0jCUYgzj
 TvLdQec/xExhXcCTTiGZQ359Yy021tpAl02Jc30GU1sx7Eu+ugJmRIIgUQvRPChjUBwcPMRdZLk
 Ck6UL9vDgoshmyshAd1QDaCjl67NxGZbHg51myuhEo8djuAib/CbUQWtVLsZz4sqhyXfjlD13SR
 CIQfakLRLnoYvZZHAtybokRAV3Va8wFGyBBtO2JAdPbr6Ec9OkoSI3wCj86F1fI8DnkMLh+fHBo
 B0Ai5dVFbbI21JmRAf6WCVYtgzfAHlM3MnZT4XBxfgVzhNUIuny07X66ktCqDS7AHgLCP5YAf3u
 nA8+W35yMCrkiolBtRA==
X-Proofpoint-ORIG-GUID: ICU4SLOFEnWmsNAvmgFZkKTeoN54-hO_
X-Proofpoint-GUID: ICU4SLOFEnWmsNAvmgFZkKTeoN54-hO_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfX9ROVwoC0hpB1
 8NoJzc8PLiKTlGDL21nfakCgE7/wX6Z+hbZoVj0VL77RtTtaxiTIQIfu7admVbZMG7JGsQT47K6
 JWl2xSCmOMaywUiZGd4mgHk7veuviRU=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad8c53e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=wTWGZ2-w8gThuRR8FIoA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210055

On 10/12/26 8:45 AM, Hangxiang Ma wrote:
> Describe the CAMSS and CSIPHY blocks on Kaanapali so that camera pipelines
> can be enabled by board device trees.

[...]

> +			      <0x0 0x09191000 0x0 0x20000>,
> +			      <0x0 0x092dc000 0x0 0x1300>,
> +			      <0x0 0x092f0000 0x0 0x1300>;
> +
> +			reg-names = "csid0",

Please remove the stray \ns between each pair of xxx and
xxx-names

otherwise

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
