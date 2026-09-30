Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0938F2D8378
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 11:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790766594; cv=none; b=ES5FEhrRpEarhfVF8YlnJWpr1A6eL2T9lcj8KXlpGZ9VaEDbiXNbhnEJzFfszsaRUbwC+D9Uvxy6t/PojqDl6gd6q9o/mRAl8ZkRAPQ8EuhM9x42nsfhvqT0veQ0rgjJ8c+N5YktjvpLRGQUVaegzGnN3b3083RTO0Ny3XR5U/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790766594; c=relaxed/simple;
	bh=00A4izmS3+qqC6S9DjNshzjIp420gqhDfuHUMZL3ozo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lcYvp4t5+lzOvY8jXi8vHB2NVERP8hrZZkaGbDeiDZJnEfzjV9bWes27qk1nIFezZRaUhdqEqGtQZ6dFYaMczVoVAfwO5T0XH1KyIR7jbvjf1tdaXoKkFwBmnA02Cj8JPH4Bck2Y12XxZ3y89v3u6A9mSi5CHH2GczHPJQzHSHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ORr9shmd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iRmwdeDV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ORr9shmd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iRmwdeDV"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7acT3547268
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 11:09:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jdREyfHkaKXyyA2KgfRqNuEH6FRhqqn1hFmmztPRCyw=; b=ORr9shmd1lZq625v
	bVNgw2g+TMvKu5RGuUJhe+EUi6QxX3PaJ5IQtJcWedfQ8VVsYzDz4NW9SdaOzLtM
	tzci/c/Rbv5B1yWmSN7I4u9e0ULaUhqtIaEj9Q6BkXpCrcu1pHLQFKnIHq+Ev7Zz
	kehui+ueLSIOv8laPZZWiwQQlo0P2UV7ZnF8dEdtYNcFA1+JFm8GBv4KJQh1/DUu
	bYC6umuFudGzmcINMPDswVDneEvX2EFWlugQAowC1Bf1RPVCGTE78tReVz6MTCQp
	QIcKUA2KUD5xyznngLrXwfMplGR7hJN6+OPzIQrISr5dqO+QC2GYzie5sjLpg3Ux
	k1xKlQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0w141873-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 11:09:52 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9179ef12a03so1292686d6.1
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 04:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790766591; x=1791371391; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jdREyfHkaKXyyA2KgfRqNuEH6FRhqqn1hFmmztPRCyw=;
        b=iRmwdeDVHr8SrWRqlqBhTBENS6BbtLFs0RZjX5r5MIzUyipNYqpbwfBwmG9hev6HrY
         Mh3jO+usyZ9ivAFYxESW397Y1qdZJStvSz4k8iSdWhcAJoHM6mdoPzzr7MksGtAXYzvR
         LDMoRTikhQqf2F9nSYVrtrECCznbtM88gWdbijBKJ4SWsw3y1BJOHByjF1JKwEmv8OQW
         lkNkCds6iURbfQrMK6jM/7MVrmGwiKV5Tog1lF9p0SAnFI1SgSc+oqUwGXtDuwAYF/F4
         eH8wH2V+hnNjxaTik8SCvT6usmDecrZS9+Vq/sVXaVU6RU06e+fjuDfwhWZjoUeNG9am
         evtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790766591; x=1791371391;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jdREyfHkaKXyyA2KgfRqNuEH6FRhqqn1hFmmztPRCyw=;
        b=n4L7dd/iV8nNXXc0p6O7aUT3udjZDFh7R75NNOh9ahSA5JuEpzuUCqlYk0u4ZX/zU6
         5IoQ0E7HWe8ukMpQjaUaZXYwudTZg4pf/T/79nTvT907Lv6JVRp4cIXXvwAGdMf6g+5f
         QL+h2SxWhlUyYKJvuvQ2p25UfZXSfwWLLHOLrz9Rmq6UnMKjUEhvGFHXyUkL8hneDqBX
         ehRsJcQbYC3PEl6jQj7fx72r/Wmj5eiB6X6DuqchImxAnYkg43xkHUmQk4oVXh9iqIlu
         GqjIClqmHR8aKU641SsTnnuLSVeZ1eeWCTlPZFQrdJ3qzto9ozVhKAoUc3hKQbO4QTmI
         x4Lw==
X-Forwarded-Encrypted: i=1; AKwUvBwgEY9H1hCEFJB7LUSBWKpJCL2owQmS0qYODZQ64jLWoMNfyXZpSYxcc4woivbrruVfyfPtysSF2ZUdNw==@vger.kernel.org
X-Gm-Message-State: AFuF++mjxvA/ne0WwWwRB6L0z7H4va2SbpLEikXDHmCPq3RudrlgRslA
	I27E8mcGO03111dwa3HGZh+b3W6sYg+x1tisHMk0y7sOfAyaC0OISZ1u0GpduELANIw/CSoKhTL
	hQL9XJ5uDTY0nSD7SqaxVJlYvOitZpieaFLWpItPax0JaElYRZdHj+buFlR2uuw0ykg==
X-Gm-Gg: AYBFou3t3g2f7rHJeU4aURVE7YUBIVmigiPncaNJtPjYS09zunPSs1AwLr26q4XTB9t
	q6VmROQdM8ul8aH9Fdu16uVSWDQlnBT+H3GZ+0yskY8xMcmGOh8/xhAJURV+QN5IReOTR7FtAdG
	N5F9whKVdjW/63Zy/HbVV2cFo/Fgf8bHhUCNJWAf0KntC2d529ZgA9RaveotGPpfCMLbaKXrIeL
	jQAC6cThN+IUSg879e2+cdasMN7mhFgo/y+z4p75e4hOtTS1wLYHobSewV/6jQeGW6UCs2bEvyK
	UmID+vFGBa0ECLU7jjSXK9hZFfHqunKsudzQpT6/1WpCCdj9ut9RJf7EISiqNMSs4YId1tJCSRn
	BQ0zv3TY6BZm5XiWe68qZSA==
X-Received: by 2002:a05:620a:261c:b0:939:b8da:1242 with SMTP id af79cd13be357-93ca93311ecmr149388385a.0.1790766591393;
        Wed, 30 Sep 2026 04:09:51 -0700 (PDT)
X-Received: by 2002:a05:620a:261c:b0:939:b8da:1242 with SMTP id af79cd13be357-93ca93311ecmr149384385a.0.1790766590966;
        Wed, 30 Sep 2026 04:09:50 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae15c73bcbsm644653a12.37.2026.09.30.04.09.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 04:09:50 -0700 (PDT)
Message-ID: <5e1b9e97-d4b8-402e-9c72-782c0a73e4d9@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 13:09:47 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 12/15] arm64: dts: qcom: maili: Add CAMSS and CSIPHY
 nodes for Maili
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
 <20260923-hawi-maili-camss-v1-12-cbbb42e534ef@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-maili-camss-v1-12-cbbb42e534ef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0NCBTYWx0ZWRfXzEZD7Y10+gnh
 NR7Zq6ZvCn+JdU6JvWD2C8j1x87BmmYFg11GJG7l8RTDQ81yuN93z/9w0mAakGfrvsTJ+P/mI82
 TctbtW3lTQb3NksctTGFn/d2hiWpQ68=
X-Proofpoint-GUID: QgO2GW8etUnytWKDFy9h002Ck2y2wgFq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0NCBTYWx0ZWRfX3UTBB0D/LFyE
 1kbEsnD91p4jy+eYKQX3BjlUelE+5WNCQyiyEoUpibHQXzEUwLa5yma1eE0Da+yIYQ1Nv+ECD+d
 v0qoetx8AyinE0TYY9WjdtlJDEZTNUQ/gz/KIy1NKjj4csy0O27KDqfSDN/pXaI/oAPeBEDxNbS
 UkXpNx3Ym3cAM/HXPt6PvGG3n/OwbNmwTDsFQUva9jvxfJ5OhJvFq4maEJUx2S0472kiAa35Y+b
 YH31mNYe/7i1EMnr7HNcTWnIiagMaDRcWZVr/O+dz7onveAGecsfhZXGOxmoeFOtVAA3Rxutv0A
 G/mmrKD0CVJMfi/8ydj3z765yFLv1wamZwPe8aYHvlSTuki8rXZRI9dp5rkLCy4+fxNBmexpwPb
 UJBQc2wFsDciMWdXNtPWJR0UBQGZaNJ+VKF02Jy1OB3b2pRhqV7zXSdgBbqPIhXC31taTdu4QHN
 8OuS+kCXZcvGGZnHmrQ==
X-Authority-Analysis: v=2.4 cv=J8Q/fwnS c=1 sm=1 tr=0 ts=6abcee00 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=PJER3EP_5_adeMidZ8cA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: QgO2GW8etUnytWKDFy9h002Ck2y2wgFq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300044

On 9/23/26 1:02 PM, Nihal Kumar Gupta wrote:
> Maili uses the same CAMSS IP as Hawi with five CSIPHY instances
> instead of six. Add CAMSS and CSIPHY nodes reusing the Hawi-compatible
> driver.
> 
> 5 x CSIPHY
> 3 x TPG
> 3 x CSID
> 2 x CSID Lite
> 3 x IFE
> 2 x IFE Lite
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
