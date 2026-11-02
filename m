Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610952;
	b=Np+9LqdVlLQxSu8vlt1skj7//wjwVWb03rB4xtAMtsSja6zDz7Zvkrd52PkoTGuB8Ncs
	 iEUL7M/SvxK2GRp3h57NMjmLPcP05Z80hzKOf1aUPJ1WaA5xifT0Bfpdb3U1gDoY60+j6
	 PJsclf0vyVM4qsSL61ufQtKRwA2QIJ4O7yVJxvji6+L16OFtvG4/6uknTBpoQeCqgV872
	 xnzuz2C5ycOqYuyayirT0BABnWQNd2OtDK02lp7v00iox9OwC9ZRMx6JZr/uWA/oNYblv
	 A6J2qPVG961xiv9ivrO/39GHtC1GNO2n0AgG6RedkS3yYFTBqoIe2z1qdC8bTX4fcvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610952;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AEVL6MRXYsWUQLv2m76Ju9oh6r1L4lN+d8opj8HszTI=;
	b=TKS5tYoa83bimCWuJFLzzktsC3//xAYXLZF88mGlNzpCbCEbouAoamS6/QiMfCZKJEIn
	 /exII3CEEZ7veTMJkUKlvF8btt7hPX4Ae4KrJKh/KXUrpJ9KXJrqzYDXquktADPTh0q2q
	 wOSXev5rgLEFUbEnus9GVI/+3AFiM9X7vfNKQGNr9lRC9atm7a7wafUMMEXvrqElgBXGx
	 NhOi2dmiLT3XNUiKfZnos9w/qMGGE4pQt2uGAq5ODJCUygUKDa2seBDi1DU6HjUmqc69D
	 /t4Uyd4fB/8LNkoRiCP4BSEXs74HIhH5LyZe6mqNTpNmzDa5NudvDHSaWbZ+rOLOa8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I7uTwWoL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SUhHrq3T;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B9B606A327
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 09:15:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7B9B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I7uTwWoL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SUhHrq3T
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AB113430794
	for <linux-media@vger.kernel.org>; Mon, 2 Nov 2026 09:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AEVL6MRXYsWUQLv2m76Ju9oh6r1L4lN+d8opj8HszTI=; b=I7uTwWoLS2R3vItJ
	6mMqX4yhEjdW4vB5H8U0w1FBr7abaQK3uOWKOeEmb6bhRQtDPH7rQd6WbYWK66H9
	kjT8Lxy6XzeaMNWHqOrjfhivIr7cppkwGiyQDTjQyDUKljgAMWcllBAy/sS6Ag7h
	e23SLG5HzDs/m4Mb91jcvS73OlCIoqQFQYN65ORXIsLne4UAH4MJQT+9zrdCbWY1
	IzlGBpkIFlgI4gNAW/id0TY0cZ5B/UnkXCt2SWRLN7TZGyjv9d3wlyeDttYTUsgN
	09GPkyjxKhaRCB70V0BmrMQ0ILZix0v44oNGKYMeF9hwPLlKnUxk+kWhd7i7sNK2
	9wLBPA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpnmerhyu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 09:15:49 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a0592d4539so4046679b3a.3
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 01:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793610949; x=1794215749; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AEVL6MRXYsWUQLv2m76Ju9oh6r1L4lN+d8opj8HszTI=;
        b=SUhHrq3TTvQYhpa5BgzXfksRmCaualRkAZXOhxMfu/gwcELB/Ks5H79mCGcJWLpUtu
         S+FhsLvh/ZZe2IOCO258msbkN1nXXqvBeC5JiBI3HSgrDpxiEwWh/adlVS9RuHSjRyF+
         8kIT3vsqyH165LiSbCZzj8mDe+cO8tS+QDlx8foGIM/FddRwFzNeoZdaGfpz7kDpPvZZ
         J8n0gFtCYJo9xS+oT9582nsKxyBVMheStD+H4OxMjsm986dmxN6k0TFdslakAwUktcbF
         x6sSTVHupcPQIU7+yknp/jkptpaX5bNqV0Lt8QWOJjtujeTBkv+ymiVEKnzndrhjkQ0s
         +BcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610949; x=1794215749;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AEVL6MRXYsWUQLv2m76Ju9oh6r1L4lN+d8opj8HszTI=;
        b=yXi5S/8S3kxu7L11Ty/Yg80zR9b8k6bHpstN8fVfHp3Tpn0RI6AVcsLsu0zXbbdL7o
         vDLi5JW8fJLAFosW/IsXhciIjl7KRupzu+qwIRauuoxyjZMa3NlVzKzrVugElLShC2Be
         2WjV3OoUsb89hkHDfjOf2u8TZXby4TYiCl6+PN4h+3Ysk9+MOKBZk6Z/A8sBmPlQJrav
         ANKmSJJ1ihgs1llngq9n0sc7nIN2BhcP0GorCyQ1M1IJL/jly7jB9SQeLA1NBPlzzfTR
         K0pUziFwGPtMGA62lOSg8avlMXpoh2iPnf/+lMmKdueuTd9Rm3WvlUBfUxZkU43IlobV
         Y73w==
X-Forwarded-Encrypted: i=1; AKwUvBwsWqvpiTh+kn40Se0GQyjcQrGKPwI7lNLyWfBt2m0Mc+peiROyvW6TRb+g6HSgZG3M8NOQBDSxpPJbTQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z++L9MsomTGehi4PN/yYbbT55TmC4s6NUauyryr/rQyrR4HvsMZ
	+QlHHX6vDXvO70JkxZysvEcck8uRetorGMChkR36JboGOuEC6H6YJUxI+md7m3mlhHRwUVW1UsD
	Amcrqn1h6qYWCWkWDagDkge7mFMGaEjAeMmtoOjkJVAjkaR/VsMp+ggyUcnJwvFF25g==
X-Gm-Gg: AYBFou2kX7pkwa+4UT08nzHiEKLpIx52QV/MqXifbk6TcHnXfcheNWPbMS2Caff7N6u
	p/5EpdSyPQTpCUY2/3S4sYPHNGVPrPSNLLryHC2b/4MtSmWuIHOwEAKJf+FN5huxR44TjV7ECZz
	ks+FrRv+2a4nE+9G9XGFtGpc0+QK2g+lRJDalpK/JHwHIoTZ9IeqAKAnDDcXZ/ZXtsr57roIb9X
	h/yYR9m4s2MsI0oBM4xUAP2B/Nf/fl7QwL1cy1T6Sb5lnJjeu3kMFHhL29CoGdBp7ThJFrZqlj3
	NTlMuKlq0Rx4OsOpi/dfsN8fh1sSu135lq8BDuCclTi/siGEDPgoKMu/SzxyDoOnyCOjDIcQ45H
	mm9YYFisipdpItiYOraqcstCiLZKfojjbZRPHxDtjwZYFbpCQiA2wGJ4jmCpey0Y4q/uk9q1rOg
	iE9lGI3k5SLeZXNqXPl7MUXNOXksHRe6Ec
X-Received: by 2002:a05:6a00:2d04:b0:886:31d3:51a2 with SMTP id d2e1a72fcca58-8a9bec6107bmr7559105b3a.39.1793610948761;
        Mon, 02 Nov 2026 01:15:48 -0800 (PST)
X-Received: by 2002:a05:6a00:2d04:b0:886:31d3:51a2 with SMTP id d2e1a72fcca58-8a9bec6107bmr7559078b3a.39.1793610948253;
        Mon, 02 Nov 2026 01:15:48 -0800 (PST)
Received: from [10.239.96.176] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aada6bfdbesm1745367b3a.42.2026.11.02.01.15.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:15:47 -0800 (PST)
Message-ID: <a4370991-0d91-43ac-b91c-c1c416cfbb91@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 17:15:41 +0800
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
Subject: Re: [PATCH v23 08/15] media: qcom: camss: csiphy: Add support for
 v2.4.0 two-phase CSIPHY
To: Vladimir Zapolskiy <vz@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-8-95f250b18612@oss.qualcomm.com>
 <dea88756-39d3-4c61-83d9-939ddb9336fa@kernel.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <dea88756-39d3-4c61-83d9-939ddb9336fa@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KZ1HIgYD c=1 sm=1 tr=0 ts=6ae854c5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=xlR6tl6hVQPR--6jroAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfX8nNUEjz1tHwS
 T9HXv5anYOMvdBPDBvlGiYsRl6GW7yQsceMumtpPwZcr347Fmo0UlYikzZ7Pg8yWaM7jaUHP3mN
 0QAU73wx51HBA7d+59o9TAipqrROSjyk1ljaATo1QpxFmT8yajhfmcRwzxKGvaOvvOdfTUgfF6V
 edR40y/h3JkNFQXhaCKJOQrROYrSzRUEdnngGw7wq5uvR0zotjSKgmlVCUzlMfEl+HZtoz2vq1c
 AcC/PFvgrbWvPPdnB40eBDyKlNsdBCOd8eRei3OsJaJXcv9peNpnHWrqt6A7cAgFsr1GW7bn8z8
 C5OsVQiVb9V/cDj+CkNkToR6zossTD4yKl9LYWvUgWn4XQGb+tiJOSNsPHQnG2rIfJUHGNTdYDu
 hv/LMFEmub6toz/3JTYD14jYC7Smx/gzeEb68P5pdiC8iToO8km42Z1eqUOd8QumPy3gxs1PaBw
 Sxnnxdko8Q/aLQwCL0w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfXyElUCBWrmiQj
 4g9tQSy/uCMhlw5Dks28UhzsOrXv3BTMdXil0dl1NnewEIRa/7omn4cLFr+h402cKsUO2rpYt3o
 sySZVdkuHJGZYmWs8qqDE86oSgHkeU0=
X-Proofpoint-ORIG-GUID: 1rhlAl5aDLzRwfia67TyZEewLYT8FkJY
X-Proofpoint-GUID: 1rhlAl5aDLzRwfia67TyZEewLYT8FkJY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020036

On 10/31/2026 1:01 AM, Vladimir Zapolskiy wrote:
> Hello Hangxiang.
> 
> On 10/28/26 17:20, Hangxiang Ma wrote:
>> Add support for the v2.4.0 two-phase CSIPHY found on Kaanapali, where
>> the PHY is driven by the standalone phy-qcom-mipi-csi2 DPHY driver
>> rather than by CAMSS. Add the mipi_csi2_dphy_3nm_kaanapali configuration,
>> which reuses the x1e80100 lane sequence, clocks and supplies but selects
>> the v2.4.0 common status offset, adds Kaanapali power domain and register
>> the "qcom,kaanapali-csi2-phy" compatible.
>>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/camss/camss.c | 47 +++++++++++++++++++++ 
>> ++++++++++
>>   1 file changed, 47 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/ 
>> media/platform/qcom/camss/camss.c
>> index a64242c66cf0..b0b63dd3d958 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -38,6 +38,51 @@
>>   static const struct parent_dev_ops vfe_parent_dev_ops;
>> +static const struct camss_subdev_resources csiphy_res_kaanapali[] = {
>> +    /* CSIPHY0 */
>> +    {
>> +        .csiphy = {
>> +            .id = 0,
>> +            .formats = &csiphy_formats_sdm845
>> +        },
>> +    },
> It makes no sense to bloat the code for no good reason, especially if
> these empty tables are to be added for every new supported platform.
> 
> CSIPHYs is not a part of the CAMSS on this platform, hence resources
> shall not be statically allocated for CSIPHYs in the CAMSS driver.
> 
> See also https://lore.kernel.org/linux-arm-msm/20261026224957.1115370-1- 
> vz@kernel.org
> 

ACK. Will include this and refine this series.

---
Best Regards,
Hangxiang
