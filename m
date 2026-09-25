Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C9248A8C7
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 09:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790330255; cv=none; b=pdax3642MMYTEGApWhqR5imOtFIBmWTi3qKfiFmc6ip9a1rSqmuy6Qx0C9eWD0sVj5HnVViw+z34qMrRH7Q3Gj/i1pqvyQzdpMolHnTtagm1+x90ZnhBMb+bAPYNqAQhUB3pXyvpeuC9NEgOJ9lbOvC3T7/CvvDtw7aLgWt0ESA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790330255; c=relaxed/simple;
	bh=CPMAN8rLvPNAB9hxiHU+WCbw2Y33iCG6KeThPLTYFM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O7bxCiVaFR1rxkcoT3OBqmAWImpuZs4NbXDTyVUDJLnsUpW9n5eYPtZ0a0FBpS8bmwZueVWOa+mdDnbVjMjlBFx9+mGUuDJWCXD7NUAtkFgcNLAOOnjprtgUMKEDwC7eSiUMQpNF2IbaVHs43ka8UK8k4lGnwxZHckStbNZPnko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HJQD/4QR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E3JLvEE2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HJQD/4QR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E3JLvEE2"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4Z6aT040638
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 09:57:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Us7OV6hGUevVELE81ITsqhco5kYotxbVZybbw/9clMA=; b=HJQD/4QRz7prCBkz
	CtOQEHS8DXsT+z613mTaH/ADpPVmnHoNEA+QlmqZSziTjJeMKjGJDfKQ/R0+ilhc
	2GObozO4ZD+WKNH5c5B9kH6XrKUX6Cjup4V2qsb0i4xZPJxuKrPxZ8dQkSyEOCG/
	AkghD/tWEH5gMAMRwzbVhsJXODbDenxSXDEGQEQjLjzW2kVhM5ALWBkzdUM23ePa
	Xi6S0mVZPK1BsLVsxprOEsg6W+g8UuyAWsVP7W2C6+WyDDOZIBgmk3lAWNt+iGei
	QwyQ7M1r4F52WFSsdnxPiFflvBl5y+8WlGH/DmtA2s74220v474McscKdo743yCV
	+5lCjQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw465462j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 09:57:32 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-342217d8d53so537942eec.0
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 02:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790330251; x=1790935051; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Us7OV6hGUevVELE81ITsqhco5kYotxbVZybbw/9clMA=;
        b=E3JLvEE2LIqnvSOm8I+Eo8uJZaZa9T+mNV648VuObDVdKg3gKrD8Xk4jqf3n10GnjL
         I9TCiDxqO0JTatndOoBZUzDfq81OHQblcf43W2BrrPSMWohPwioOb0DuILK0e7NzjXHU
         Aq9/hpQPzgbEZ8v8G8ebfTPBQl9EjPYStSMV+KM3VF3sZqrmYIAoYfSmd3334VBY7umh
         BbqRSy7TTNrDCpc7xQeg0jsvLwqips6zfzUX/OPV6PcN+wSGZLAzxMq+Dx1BW0Hve3lk
         DpiyfxpS/hA7fjNHHFCleVaBOdmbnkiaHFvSIuELnHlPPF2I4YViqIu8cDwxMqzWoEi3
         rDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790330251; x=1790935051;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Us7OV6hGUevVELE81ITsqhco5kYotxbVZybbw/9clMA=;
        b=Y4zK4owjPoJcITlG54lMmctV7pJ6IxUsQgmfEIik7zJ/65VpJggSvT+voK+VonxM3u
         RzDoaq1r4R6L2V2ihUf60ipexQEeO888XT++Gj2ZHwor42/+CT55xnH1Lbiouul5c/vT
         PVdoBZtikmJ6a2gl/ywywMfKfuLKA4t89hD8TqkFhajZlMnxMkNTLQPqHQiTsl8D90SZ
         /LUgStFXwkHIcnH8QX/kHQi/fYk2ZBlLXZOQ7Azzp4dBVBzkSMbeDgwT4v+k6dWh79rU
         pGO4hUtA4OQeAd+mQMqaTtkUZHlx3668el292orr9s3UKJFdFDHX9NDbvBzsaO8Qjm4z
         tZEA==
X-Gm-Message-State: AFuF++nfwz7X9QL9cMc2P2sHT04nirO53Qh8OeauBLKByNB/yZKy2r46
	nezNdl/kRbvAF4hmPGmGMPzqMVAS9fdrVMYdQEk9ILGr6aZxR5GEAgtNEjhxiIAFay3CYYsjYqN
	EL/9UuVmbevi2hN8cdDzFov8MeAYaMMGXzY4PLpALkTMWjclE17hdtcd3TOjHynqBbw==
X-Gm-Gg: AYBFou15fcMPR29EblZaFdZLKimtj/t07L8IxtrJIPDKMx8YW6QZXBsf7T8i4n+YdWM
	5Oev8gVxFglRWToUBFm7IJpg/8lU4qJwAUGG+gkIOfaA4d11GXRQerbjIq6eg1tE2xJWu6IQona
	Nq1ZzUxoxgfxJ1xvzkQFsO23pxI80xECxuRTx/M91p432sJjnqAowx1BLHTJ58VdieinNzFT80u
	Ra+XL24wtrYtUkvVkXiTVu8+ZAowBrir7++90D+lGWJs4EGKaLzP/Pc5mVvFW95by3H0gONI+Su
	7LDt3a81kwbXZUBvzMUciSVAvLPd9Jpw9jCOSVoFhLu0koxwvo+wTAnjiQ0db5/N8Gj+BwKbK6U
	HPvl2wrS4zjXnnhs=
X-Received: by 2002:a05:7022:3a8b:b0:13b:1bd2:38a2 with SMTP id a92af1059eb24-14503fc30camr5160038c88.18.1790330250142;
        Fri, 25 Sep 2026 02:57:30 -0700 (PDT)
X-Received: by 2002:a05:7022:3a8b:b0:13b:1bd2:38a2 with SMTP id a92af1059eb24-14503fc30camr5159934c88.18.1790330247829;
        Fri, 25 Sep 2026 02:57:27 -0700 (PDT)
Received: from [10.204.65.250] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145adbcd1bcsm6475668c88.14.2026.09.25.02.57.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 02:57:27 -0700 (PDT)
Message-ID: <69d69906-eb85-4fdc-ab53-1828984dbf07@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 15:27:21 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: nord-rrd: Enable iris video codec
 node
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
 <20260919-nord-iris-v1-4-94428761ec06@oss.qualcomm.com>
Content-Language: en-US
From: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
In-Reply-To: <20260919-nord-iris-v1-4-94428761ec06@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Wrq+otfv c=1 sm=1 tr=0 ts=6ab6458c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=yR8J6TAb7IqefvQR2IsA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: W_P6pi3i3NGItNDT4BtV2em8xgJsIVuQ
X-Proofpoint-GUID: W_P6pi3i3NGItNDT4BtV2em8xgJsIVuQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzOSBTYWx0ZWRfX42NnMOMVtoFk
 OKS0Uf6uciMLFXyLTt4eY+5jc2c7CwLBsrHnwOnIEkSNq756d8x2RrZVZQnGOUSEoRginTAiBVf
 noOWQg4Zhm7cz1VTvrk2+msqqFB45AN9rJaIazSInbHwcMQiJ/oV4cc4Bbag8r0ArWBK5Ic63l2
 PGblganWloDobcE+AuRQa6pQPB/v8qmLObDPn4SPBVA2M7kzJD8MOCE5HkU/efPdAWeNLi+F8SK
 zjibCRj7AgQXGca1ihULyg+rqX12l4tF7Tf1V8cE3fsf6dgHE4z5HG8dfhplEMqAZmZTA1xAUzE
 rqR+byaqnyHPwd8fO/zvaQ1IjYZDVe6/dPLqbusCpO9MYCCad6fozQiFXka1+FD40tguNQrd9zT
 92J0C0F2+xo6G9UNVBvGQIKA3kVVGVyx1M7MiRoHJiLKHhvpGJEIAuTrrw4sBtbXqrJZl7NTsJu
 IHE8EX0B4wI+t66Haow==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzOSBTYWx0ZWRfX+C+TTLgij8bu
 oF1ZGLTdyTv40IkTiPY+bjSqJkar8Ab0u42y/sZoFf4YdCS/+G7TFwytorXzHsmxAllQbFB7NnS
 UybEToTKfYiGyeMOspwT32Rk4QafS8o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250039



On 9/19/2026 10:14 AM, Vishnu Reddy wrote:
> The iris hardware block is described in the nord SoC DTSI, and enabling
> it here allows the media iris driver to probe and use the video codec
> functionality.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-rrd.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
> index 802987da3cfd..6e0b7a54523f 100644
> --- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
> +++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
> @@ -415,6 +415,12 @@ rtc@32 {
>  	};
>  };
>  
> +&iris {
> +	firmware-name = "qcom/vpu/vpu36_p4_s7.mbn";
> +
> +	status = "okay";
> +};
> +
>  &mdss {
>  	status = "okay";
>  };
> 

Reviewed-by: Gourav Kumar <gourav.kumar@oss.qualcomm.com>

